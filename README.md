backup and restore all openshift projects: 

first login to openshift with openshift cli tool (oc)   

oc login https://OPENSHIFT_ADDRESS --token=YOUR_TOKEN   




##### backup ############################

for backup all projects run iran/backup-all-projects.sh or de/backup-all-projects.sh 

******** backup-all-projects.sh **********
```
#!/bin/bash  
for project in $(kubectl get namespaces | cut -d" " -f 1 | grep -v NAME)  
do  
mkdir $project && oc project $project  
  for object in secrets cm deployments dc bc svc route   
     do oc get -o yaml --export $object > ./$project/$object.yaml  
      done  
 done
 ```
 
*****************************************

###### restore ##########################

to restore data go to each project/folder you want and do like this
```

oc project test or (oc new-project test)

cd ./test

for object in secrets cm deployments dc bc svc route ; do  oc create -f $object.yaml ; done
```
