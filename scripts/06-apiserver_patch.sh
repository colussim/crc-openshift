export BASE_DOMAIN="demos.oramysql02.com"
oc patch apiserver cluster --type=merge -p "{\"spec\":{\"servingCerts\": {\"namedCertificates\":[{\"names\":[\"api.${BASE_DOMAIN}\"],\"servingCertificate\": {\"name\": \"oramysql021-cert\"}}]}}}"
