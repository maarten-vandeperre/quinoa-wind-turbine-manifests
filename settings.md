sed -i 's/rhdevelopers/rh_ee_mvandepe/g' tekton/pipeline-cached.yaml
sed -i 's/redhat-developer-demos/maarten-vandeperre/g' tekton/pipeline-cached.yaml


oc apply -f tekton/app-source-pvc.yaml;
oc apply -f tekton/build-cache-pvc.yaml;
oc apply -f tekton/git-update-deployment.yaml;
oc apply -f tekton/maven-task-cached.yaml;
oc apply -f tekton/pipeline-cached.yaml;
oc apply -f tekton/triggerbinding.yaml;
oc apply -f tekton/triggertemplate-cached.yaml;
oc apply -f tekton/eventlistener.yaml;
oc apply -f tekton/el-route.yaml;


oc apply -fhttps://raw.githubusercontent.com/tnozicka/openshift-acme/master/deploy/single-namespace/{role,serviceaccount,issuer-letsencrypt-live,deployment}.yaml
oc create rolebinding openshift-acme --role=openshift-acme --serviceaccount="$( oc project -q ):openshift-acme" --dry-run -o yaml | oc apply -f -


* rerun pipeline
* on start pipeline: persistent volume claim -> app source
* helm chart https://github.com/openshift-helm-charts/charts/tree/main/charts/community/infinispan/infinispan/0.3.2



https://quinoa-wind-turbine-demo.apps.ocp4-bm.redhat.arrowlabs.be/dashboard

DevelopersBLZ!


With shaking

- digest: sha256:72e08a36473cfc6a5717213bf450c15a1d524074f74dd7e453eeb9bbef0f538d
  name: quay.io/rh_ee_mvandepe/quinoa-wind-turbine
- digest: sha256:8f223fc920a4916414a88a83d07ce4c09d9a10e0a95798234b08ed807e0cc0f0
  name: quay.io/rhdevelopers/quinoa-wind-turbine

without shaking

- digest: sha256:4d1ba99581736ad86c51830e2b55f855fedb07bf6f3f975ae9bc71dedf3c9cac
  name: quay.io/rh_ee_mvandepe/quinoa-wind-turbine
- digest: sha256:8f223fc920a4916414a88a83d07ce4c09d9a10e0a95798234b08ed807e0cc0f0
  name: quay.io/rhdevelopers/quinoa-wind-turbine