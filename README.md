# ARO Must Gather Tool
## This script was made for ARO clusters to capture information needed by CEE

## Description
This script performs various operations using the 'oc' command-line tool and wraps the default 'oc adm must-gather' command.
The script hasn't gone up to CERTIFICATION PROCESS YET so please use at your own risk.

# IMPORTANT NOTE: 
## This site is not official Red Hat documentation and is provided for informational purposes only. These guides may be experimental, proof of concept, or early adoption. Officially supported documentation is available at docs.openshift.com and access.redhat.com.

## Prerequisites
Install the dependencies before using the script.
You can either choose gzip or compress since the script will choose which one to use during the run.

```sh
sudo yum install -y ncompress tar gzip
```
oc-cli tools needs to be installed as well by following this [guide](https://docs.openshift.com/container-platform/4.13/cli_reference/openshift_cli/getting-started-cli.html).

And of course you need to have your terminal connected to your OpenShift cluster :).

## How to install and run
You can run the script by downloading from this repo. 
As you can see from the example below, we haven't completed the prerequisites and the script detected that there's no oc-cli installed so it will not proceed with the collection.

```sh
[cloud_user@3e51134a661c ~]$ git clone https://github.com/jpogs23/aro-tools.git
Cloning into 'aro-tools'...
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), 3.20 KiB | 3.20 MiB/s, done.

[cloud_user@3e51134a661c ~]$ cd aro-tools/
[cloud_user@3e51134a661c aro-tools]$ ls -lart
total 16
drwx------. 20 cloud_user cloud_user 4096 May 22 11:10 ..
-rw-rw-r--.  1 cloud_user cloud_user   11 May 22 11:10 README.md
drwxrwxr-x.  8 cloud_user cloud_user  163 May 22 11:10 .git
-rw-rw-r--.  1 cloud_user cloud_user 7256 May 22 11:10 aro-must-gather.sh
drwxrwxr-x.  3 cloud_user cloud_user   61 May 22 11:10 .

[cloud_user@3e51134a661c aro-tools]$ chmod +x aro-must-gather.sh 

[cloud_user@3e51134a661c aro-tools]$ ./aro-must-gather.sh 
./aro-must-gather.sh: line 23: banner: command not found
Starting manual tasks gatherer

ERROR: The 'oc' command-line tool is not installed or not in the system's PATH.
Please install the 'oc' command-line tool and make sure it is accessible.
[cloud_user@3e51134a661c aro-tools]$ 

```

## Sample actual run Completed ( truncated )
An example of the actual run. 

```sh
[xxxxxx@jp-machine test_mg ]$ ls -lart
total 885344
-rwxr-xr-x. 1 xxxxxx xxxxxx      7256 May 21 23:43 aro-must-gather.sh
drwxrwxr-x. 7 xxxxxx xxxxxx       125 May 22 00:14 ..
drwxrwxr-x. 3 xxxxxx xxxxxx       174 May 22 00:20 must-gather.local.6840621770613724147
-rw-rw-r--. 1 xxxxxx xxxxxx 210108159 May 22 00:20 must-gather.local.6840621770613724147.tar.Z
-rw-rw-r--. 1 xxxxxx xxxxxx      5819 May 22 00:20 must-gather-manual-20230522-0014.txt
drwxrwxr-x. 3 xxxxxx xxxxxx       174 May 22 14:38 must-gather.local.6364959399232345923
-rw-rw-r--. 1 xxxxxx xxxxxx 231116931 May 22 14:38 must-gather.local.6364959399232345923.tar.Z
-rw-rw-r--. 1 xxxxxx xxxxxx      5819 May 22 14:38 must-gather-manual-20230522-1433.txt
drwxrwxr-x. 3 xxxxxx xxxxxx       174 May 22 15:11 must-gather.local.5820856935880256062
-rw-rw-r--. 1 xxxxxx xxxxxx 230226429 May 22 15:12 must-gather.local.5820856935880256062.tar.Z
-rw-rw-r--. 1 xxxxxx xxxxxx      5819 May 22 15:12 must-gather-manual-20230522-1508.txt
drwxrwxr-x. 3 xxxxxx xxxxxx       174 May 22 20:20 must-gather.local.3957495381829211660
-rw-rw-r--. 1 xxxxxx xxxxxx 235088801 May 22 20:20 must-gather.local.3957495381829211660.tar.Z
drwxrwxr-x. 6 xxxxxx xxxxxx      4096 May 22 20:20 .
-rw-rw-r--. 1 xxxxxx xxxxxx      5819 May 22 20:20 must-gather-manual-20230522-2014.txt

[XXXXXXXX@jp-machine test_mg ]$ ./aro-must-gather.sh 

#     #     #     #     #  #     #     #     #        
##   ##    # #    ##    #  #     #    # #    #        
# # # #   #   #   # #   #  #     #   #   #   #        
#  #  #  #     #  #  #  #  #     #  #     #  #        
#     #  #######  #   # #  #     #  #######  #        
#     #  #     #  #    ##  #     #  #     #  #        
#     #  #     #  #     #   #####   #     #  #######  


#######     #      #####   #    #   #####   
   #       # #    #     #  #   #   #     #  
   #      #   #   #        #  #    #        
   #     #     #   #####   ###      #####   
   #     #######        #  #  #          #  
   #     #     #  #     #  #   #   #     #  
   #     #     #   #####   #    #   #####   

Starting manual tasks gatherer

########################################################################################
Script execution started at: Sun May 21 22:36:03 NZST 2023
########################################################################################
                                  oc get pdb -A
########################################################################################
NAMESPACE                              NAME                                   MIN AVAILABLE   MAX UNAVAILABLE   ALLOWED DISRUPTIONS   AGE
openshift-apiserver                    openshift-apiserver-pdb                N/A             1                 1                     3d20h
openshift-cluster-csi-drivers          azure-disk-csi-driver-controller-pdb   N/A             1                 1                     3d20h
openshift-cluster-storage-operator     csi-snapshot-controller-pdb            N/A             1                 1                     3d20h
openshift-cluster-storage-operator     csi-snapshot-webhook-pdb               N/A             1                 1                     3d20h
openshift-etcd                         etcd-quorum-guard                      N/A             1                 1                     3d20h
openshift-image-registry               image-registry                         1               N/A               1                     3d20h
openshift-ingress                      router-default                         N/A             50%               1                     3d20h
openshift-kube-apiserver               kube-apiserver-guard-pdb               2               N/A               1                     3d20h
openshift-kube-controller-manager      kube-controller-manager-guard-pdb      2               N/A               1                     3d20h
openshift-kube-scheduler               openshift-kube-scheduler-guard-pdb     2               N/A               1                     3d20h
openshift-monitoring                   alertmanager-main                      N/A             1                 1                     3d20h
openshift-monitoring                   prometheus-adapter                     1               N/A               1                     3d20h
openshift-monitoring                   prometheus-k8s                         1               N/A               1                     3d20h
openshift-monitoring                   thanos-querier-pdb                     1               N/A               1                     3d20h
openshift-oauth-apiserver              oauth-apiserver-pdb                    N/A             1                 1                     3d20h
openshift-operator-lifecycle-manager   packageserver-pdb                      N/A             1                 1                     3d20h
########################################################################################
                                  oc adm top nodes
########################################################################################
NAME                                     CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
XXXXXXXX-66wlp-master-0               1339m        17%    10676Mi         34%       
XXXXXXXX-66wlp-master-1               937m         12%    8794Mi          28%       
XXXXXXXX-66wlp-master-2               874m         11%    8503Mi          27%       
XXXXXXXX-66wlp-worker-eastus1-89l72   548m         15%    4386Mi          32%       
XXXXXXXX-66wlp-worker-eastus2-2vfmf   532m         15%    4416Mi          32%       
XXXXXXXX-66wlp-worker-eastus3-5kbtj   148m         4%     1683Mi          12%       
########################################################################################
                    oc describe node (allocations for worker nodes only)
########################################################################################
==== XXXXXXXX-66wlp-worker-eastus1-89l72 ====
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource                       Requests      Limits
  --------                       --------      ------
  cpu                            800m (22%)    650m (18%)
  memory                         3265Mi (24%)  1500Mi (11%)
  ephemeral-storage              0 (0%)        0 (0%)
  hugepages-1Gi                  0 (0%)        0 (0%)
  hugepages-2Mi                  0 (0%)        0 (0%)
  attachable-volumes-azure-disk  0             0
Events:                          <none>

==== XXXXXXXX-66wlp-worker-eastus2-2vfmf ====
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource                       Requests      Limits
  --------                       --------      ------
  cpu                            811m (23%)    650m (18%)
  memory                         3388Mi (25%)  1500Mi (11%)
  ephemeral-storage              0 (0%)        0 (0%)
  hugepages-1Gi                  0 (0%)        0 (0%)
  hugepages-2Mi                  0 (0%)        0 (0%)
  attachable-volumes-azure-disk  0             0
Events:                          <none>

==== XXXXXXXX-66wlp-worker-eastus3-5kbtj ====
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource                       Requests     Limits
  --------                       --------     ------
  cpu                            469m (13%)   650m (18%)
  memory                         1298Mi (9%)  1500Mi (11%)
  ephemeral-storage              0 (0%)       0 (0%)
  hugepages-1Gi                  0 (0%)       0 (0%)
  hugepages-2Mi                  0 (0%)       0 (0%)
  attachable-volumes-azure-disk  0            0
Events:                          <none>

########################################################################################
Sufficient disk space available. The filesystem has at least 1GB to proceed.
Starting 'oc adm must-gather' command at Sun May 21 22:36:12 NZST 2023
########################################################################################
[must-gather      ] OUT Using must-gather plug-in image: quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1
When opening a support case, bugzilla, or issue please include the following summary data along with any other requested information:
ClusterID: XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
ClusterVersion: Stable at "4.10.40"
ClusterOperators:
	All healthy and stable


[must-gather      ] OUT namespace/openshift-must-gather-jkf42 created
[must-gather      ] OUT clusterrolebinding.rbac.authorization.k8s.io/must-gather-p46q7 created
[must-gather      ] OUT pod for plug-in image quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1 created
[must-gather-6pv7b] POD 2023-05-21T10:36:27.269356296Z Gathering data for ns/openshift-cluster-version...
[must-gather-6pv7b] POD 2023-05-21T10:36:28.975386004Z W0521 10:36:28.975328      23 util.go:119] the server doesn't have a resource type egressfirewalls, skipping the inspection
[must-gather-6pv7b] POD 2023-05-21T10:36:29.104603111Z Gathering data for ns/default...
[must-gather-6pv7b] POD 2023-05-21T10:36:29.334722393Z W0521 10:36:29.334669      23 util.go:119] the server doesn't have a resource type egressfirewalls, skipping the inspection
[must-gather-6pv7b] POD 2023-05-21T10:36:29.471386757Z Gathering data for ns/openshift...
[must-gather-6pv7b] POD 2023-05-21T10:36:29.959669537Z W0521 10:36:29.959615      23 util.go:119] the server doesn't have a resource type egressfirewalls, skipping the inspection
[must-gather-6pv7b] POD 2023-05-21T10:36:30.091674315Z Gathering data for ns/kube-system...

<truncated>


termination.log.gz
must-gather.local.3957495381829211660/quay-io-openshift-release-dev-ocp-v4-0-art-dev-sha256-3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1/static-pods/kube-apiserver/jingsun0517-66wlp-master-1-termination.log.gz
must-gather.local.3957495381829211660/quay-io-openshift-release-dev-ocp-v4-0-art-dev-sha256-3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1/static-pods/kube-apiserver/jingsun0517-66wlp-master-2-termination.log.gz
must-gather.local.3957495381829211660/quay-io-openshift-release-dev-ocp-v4-0-art-dev-sha256-3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1/web_hooks/
must-gather.local.3957495381829211660/quay-io-openshift-release-dev-ocp-v4-0-art-dev-sha256-3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1/web_hooks/mutatingwebhookconfigurations.yaml
must-gather.local.3957495381829211660/quay-io-openshift-release-dev-ocp-v4-0-art-dev-sha256-3e6fd20863d0fd15a45340dffc1fa3812b4775e1b8d55a522a8e6e66453901c1/web_hooks/validatingwebhookconfigurations.yaml
must-gather.local.3957495381829211660/event-filter.html
Directory successfully tarred as: must-gather.local.3957495381829211660
compress is available on the system.
compress is available on the system.
Using compress for compression.
########################################################################################
-rw-rw-r--. 1 xxxxxx xxxxxx      5673 May 22 20:14 must-gather-manual-20230522-2014.txt
-rw-rw-r--. 1 xxxxxx xxxxxx 235088801 May 22 20:20 must-gather.local.3957495381829211660.tar.Z
########################################################################################
Script execution ended at: Mon May 22 20:20:51 NZST 2023

#######  #     #  ######   
#        ##    #  #     #  
#        # #   #  #     #  
#####    #  #  #  #     #  
#        #   # #  #     #  
#        #    ##  #     #  
#######  #     #  ######   

End of script execution please attach the two output files must-gather-manual-20230522-2014.txt and the must-gather.local.3957495381829211660.tar.Z to the case.
Thank you for choosing Redhat Support!
########################################################################################
```

## Sample Errors
Sample errors that you might encounter.

1. You are not connected to your cluster. Before the script execution you need to have a terminal that is connected to your openshift cluster.

```sh
[xxxxxx@jp-machine test_mg ]$ ./aro-must-gather.sh 


Starting manual tasks gatherer

########################################################################################
Script execution started at: Mon May 22 23:34:08 NZST 2023
########################################################################################
                                  oc get pdb -A
########################################################################################
Error from server (Forbidden): poddisruptionbudgets.policy is forbidden: User "system:anonymous" cannot list resource "poddisruptionbudgets" in API group "policy" at the cluster scope
WARNING: The 'oc get pdb -A' command failed.
########################################################################################
                                  oc adm top nodes
########################################################################################
error: Metrics API not available
WARNING: The 'oc adm top nodes' command failed.
########################################################################################
                    oc describe node (allocations for worker nodes only)
########################################################################################
Error from server (Forbidden): nodes is forbidden: User "system:anonymous" cannot list resource "nodes" in API group "" at the cluster scope
########################################################################################
Sufficient disk space available. The filesystem has at least 1GB to proceed.
########################################################################################
```

2. Your filesystem has only 500MB or less space. 
You need to perform cleanup or move the script to a different filesystem and execute from their if that filesystem has enough space.
```sh
==== XXXXXXX-66wlp-worker-eastus2-2vfmf ====
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource                       Requests      Limits
  --------                       --------      ------
  cpu                            811m (23%)    650m (18%)
  memory                         3388Mi (25%)  1500Mi (11%)
  ephemeral-storage              0 (0%)        0 (0%)
  hugepages-1Gi                  0 (0%)        0 (0%)
  hugepages-2Mi                  0 (0%)        0 (0%)
  attachable-volumes-azure-disk  0             0
Events:

==== XXXXXXX-66wlp-worker-eastus3-5kbtj ====
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource                       Requests     Limits
  --------                       --------     ------
  cpu                            469m (13%)   650m (18%)
  memory                         1298Mi (9%)  1500Mi (11%)
  ephemeral-storage              0 (0%)       0 (0%)
  hugepages-1Gi                  0 (0%)       0 (0%)
  hugepages-2Mi                  0 (0%)       0 (0%)
  attachable-volumes-azure-disk  0            0
Events:

########################################################################################
WARNING: Your filesystem has less than 500MB of free space.
It is advisable to run the 'oc adm must-gather' with at least 1GB of free filesystem.
########################################################################################
Press Ctrl+C to cancel the script then perform a cleanup so you can meet the requirements or press Enter to proceed at your own risk: 

```
3. The script was run on a different directory where it was installed.
```sh
[xxxxxx@jp-machine openshift ]$ pwd
/home/xxxxxx/openshift
[xxxxxx@jp-machine openshift ]$ ./test_mg/aro-must-gather.sh 

#     #     #     #     #  #     #     #     #        
##   ##    # #    ##    #  #     #    # #    #        
# # # #   #   #   # #   #  #     #   #   #   #        
#  #  #  #     #  #  #  #  #     #  #     #  #        
#     #  #######  #   # #  #     #  #######  #        
#     #  #     #  #    ##  #     #  #     #  #        
#     #  #     #  #     #   #####   #     #  #######  


#######     #      #####   #    #   #####   
   #       # #    #     #  #   #   #     #  
   #      #   #   #        #  #    #        
   #     #     #   #####   ###      #####   
   #     #######        #  #  #          #  
   #     #     #  #     #  #   #   #     #  
   #     #     #   #####   #    #   #####   

Starting manual tasks gatherer

Please execute the script on the current directory: /home/xxxxxx/openshift/test_mg
```

4. Banner command not found. 
   The script will still proceed even without the banner binary.
   To get around this you need to install that rpm package.
   
```sh
[cloud_user@3e51134a661c aro-tools]$ ./aro-must-gather.sh 
./aro-must-gather.sh: line 23: banner: command not found
Starting manual tasks gatherer
```


## License
This tool is free to use. 
