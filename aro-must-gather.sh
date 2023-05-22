#!/bin/bash
############################################################################################
#
# Name: aro-must-gather.sh script collector for Cloud Managed OpenShift
# Description: This script performs various operations using the 'oc' command-line tool.
#
# Checks:
#
# - The script should be executed on where it is located.
# - Filesystem should at least have 1GB or it will flag you if you have 500MB or less.
# - Script will check if the oc-cli binary is currently installed on the system.
# - Script will check if the tar, compress or gzip binaries are installed.
#
# Author: Redhat 
# Version: 1.0
#
############################################################################################


#Administrative Script Functions

title_start() {
    banner manual tasks
    echo Starting manual tasks gatherer
    echo 
}

start_date() {
  echo "########################################################################################"
  echo "Script execution started at: $(date)"
}

end_date() {
  echo "########################################################################################"
  echo "Script execution ended at: $(date)"
}

title_end() {
    banner end
    echo End of script execution please attach the two output files $output_file and the ${tar_file}.tar* to the case. 
    echo "Thank you for choosing Redhat Support!"
    echo "########################################################################################"
}

#End of Administrative Script Functions

#Start of functional code block sanity checks.
check_oc_cli() {
  if ! command -v oc &> /dev/null; then
    echo "ERROR: The 'oc' command-line tool is not installed or not in the system's PATH."
    echo "Please install the 'oc' command-line tool and make sure it is accessible."
    exit 1
  fi
}

check_tar() {
  if ! command -v tar &> /dev/null; then
    echo "ERROR: The 'tar' binary is not installed or not in the system's PATH."
    echo "Please double check and make sure it is accessible."
    exit 1
  fi
}

execute_on_current_directory() {
  script_directory=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  current_directory=$(pwd)

  if [[ "$script_directory" != "$current_directory" ]]; then
    echo "Please execute the script on the current directory: $script_directory"
    exit 1
  fi
}

check_disk_space() {
  current_dir=$(pwd)
  free_space=$(df -BM "$current_dir" | awk 'NR==2 {print $4}' | tr -d 'M')
  
  if [[ $free_space -lt 500 ]]; then
    echo "########################################################################################"
    echo "WARNING: Your filesystem has less than 500MB of free space."
    echo "It is advisable to run the 'oc adm must-gather' with at least 1GB of free filesystem."
    echo "########################################################################################"

    read -p "Press Ctrl+C to cancel the script then perform a cleanup so you can meet the requirements or press Enter to proceed at your own risk: " -r -s -t 20 response
    echo
    
    if [[ -z $response ]]; then
      echo "Proceeding with the script despite the risk..."
    else
      echo "Script execution cancelled."
      exit 0
    fi
  else
    echo "########################################################################################"
    echo "Sufficient disk space available. The filesystem has at least 1GB to proceed."
    echo "########################################################################################"
  fi
}

tar_directory() {
  target_directory=$(ls -tlrd must-gather.local.*/ | tail -n1| awk '{print $9}')
  tar_file=`echo $target_directory | cut -f1 -d/`

  if [[ -d $target_directory ]]; then
    echo "Tarring directory: $target_directory"
    tar -cvf ${tar_file}.tar "$target_directory"
    echo "Directory successfully tarred as: $tar_file"
  else
    echo "No directory named 'must-gather.local.random' found."
    echo "Skipping tar operation."
  fi
}

check_compression_tools() {
  if command -v compress &> /dev/null; then
    echo "compress is available on the system."
    compression_tool="compress"
  elif command -v gzip &> /dev/null; then
    echo "gzip is available on the system."
    compression_tool="gzip"
  else
    echo "Neither compress nor gzip is available on the system." 
    echo "Please install one so you can make the must-gather-local file smaller before uploading."
    exit 1
  fi
}

choose_compression_tool() {
  check_compression_tools

  if [[ -n $compression_tool ]]; then
    echo "Using $compression_tool for compression."
    echo "########################################################################################"
  else
    echo "No compression tool available. Skipping compression."
  fi
}

#End of functional code block sanity checks.

#Start of code block for additional manual oc related check functions.

get_pdb() {
  echo "########################################################################################"
  echo "                                  oc get pdb -A"
  echo "########################################################################################"
  oc get pdb -A
  if [[ $? -ne 0 ]]; then
    echo "WARNING: The 'oc get pdb -A' command failed."
  fi
}

top_nodes() {
  echo "########################################################################################"
  echo "                                  oc adm top nodes"
  echo "########################################################################################"
  oc adm top nodes
  if [[ $? -ne 0 ]]; then
    echo "WARNING: The 'oc adm top nodes' command failed."
  fi
}

describe_nodes() {
  echo "########################################################################################"
  echo "                    oc describe node (allocations for worker nodes only)"
  echo "########################################################################################"
  for i in $(oc get nodes | grep worker | grep -v infra | awk '{print $1}'); do
    echo "==== $i ===="
    oc describe node $i 2> /dev/null | grep -A10 Allocated

    if [[ $? -ne 0 ]]; then
      echo "WARNING: The 'oc describe node $i' command failed."
    fi
    echo
  done
}

#End of code block for manual oc related check functions.

#Must gather function

execute_must_gather() {
  oc adm must-gather
  if [[ $? -ne 0 ]]; then
    echo "WARNING: The 'oc adm must-gather' command failed please check!"
  fi
}

#End of Must gather function


#Start
title_start

#Check function if oc cli is installed and check script directory execution
check_oc_cli
execute_on_current_directory

#Initialize output file for manual tasks with name with suffix date
output_file="must-gather-manual-$(date '+%Y%m%d-%H%M').txt"

#Call the functions for the manual tasks and redirect output to the file
{
  start_date
  get_pdb
  top_nodes
  describe_nodes
} | tee "$output_file"

#Execute Check disk space function before beginning the actual must-gather
check_disk_space
execute_must_gather

#Tar and compression functions
check_tar
tar_directory
check_compression_tools
choose_compression_tool
$compression_tool ${tar_file}.tar
ls -lart $output_file ${tar_file}.tar*

#Mark the output file to benchmark the must-gather run results
end_date | tee -a "$output_file"

#End
title_end
