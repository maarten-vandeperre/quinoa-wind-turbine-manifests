#!/bin/sh
oc apply -f tekton/app-source-pvc.yaml;
oc apply -f tekton/build-cache-pvc.yaml;
oc apply -f tekton/git-update-deployment.yaml;
oc apply -f tekton/maven-task-cached.yaml;
oc apply -f tekton/pipeline-cached.yaml;
oc apply -f tekton/triggerbinding.yaml;
oc apply -f tekton/triggertemplate-cached.yaml;
oc apply -f tekton/eventlistener.yaml;
oc apply -f tekton/el-route.yaml;