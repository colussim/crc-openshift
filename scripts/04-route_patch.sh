export BASE_DOMAIN="demos.oramysql02.com"
oc patch -p "{\"spec\": {\"host\": \"default-route-openshift-image-registry.$BASE_DOMAIN\"}}" route default-route -n openshift-image-registry --type=merge

