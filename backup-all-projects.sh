#!/bin/bash
for project in $(kubectl get namespaces | cut -d" " -f 1 | grep -v NAME)
do 
mkdir $project && oc project $project
  for object in secrets cm deployments dc bc svc route 
   do oc get -o yaml --export $object > ./$project/$object.yaml
   done


 done

