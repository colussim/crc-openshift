#!/bin/bash

function wait_for_clusteroperators() {
  while true; do
    local clusteroperators_status
    clusteroperators_status=$(oc get clusteroperators)
    if [[ $? != 0 ]]; then
      echo "API Server not reachable"
      sleep 2s
    fi
    echo "$clusteroperators_status" | tail -n +2 | awk '{print $3}' | grep False &>/dev/null
    local ret1=$?
    echo "$clusteroperators_status" | tail -n +2 | awk '{print $4}' | grep True &>/dev/null
    local ret2=$?
    echo "$clusteroperators_status" | tail -n +2 | awk '{print $5}' | grep True &>/dev/null
    local ret3=$?
    if [[ $ret1 != 0 ]] && [[ $ret2 != 0 ]] && [[ $ret3 != 0 ]]; then
      break
    fi
    echo "Waiting for the clusteroperators to be ready"
    sleep 10s
  done
}

BASE_DOMAIN="demos.oramysql02.com"


wait_for_clusteroperators

USERNAME=$(crc console -ojson | jq -r '.clusterConfig.adminCredentials.username')
PASSWORD=$(crc console -ojson | jq -r '.clusterConfig.adminCredentials.password')

echo ""

echo "The server is accessible via web console at:"
echo "  https://console-openshift-console.apps.${BASE_DOMAIN}"

echo ""

echo "Log in as administrator: "
echo "  USERNAME: ${USERNAME}"
echo "  PASSWORD: ${PASSWORD}"

echo ""



echo "Use the 'oc' command line interface:"
echo "  $ oc login -u ${USERNAME} -p ${PASSWORD} https://api.${BASE_DOMAIN}:6443"
