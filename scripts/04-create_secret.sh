oc create secret tls oramysql021-cert --cert=_wildcard.apps.demos.oramysql02.com+1.pem --key=ingresskey.pem -n openshift-ingress
oc create secret tls oramysql021-cert --cert=_wildcard.apps.demos.oramysql02.com+1.pem --key=ingresskey.pem -n openshift-config

