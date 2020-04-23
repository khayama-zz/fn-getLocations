#!/bin/bash
read ARGS
IBMCLOUD_API_KEY=`echo "$ARGS" | jq -r '."IBMCLOUD_API_KEY"'`
ibmcloud login -a cloud.ibm.com -r jp-tok -g Default --apikey $IBMCLOUD_API_KEY
LOCATIONS=`ibmcloud sl call-api Location getViewablePopsAndDataCenters --mask "longName,name,locationAddress[locationId,address1,address2,city,country,isActive,postalCode,state,type[keyName]]" | jq -r`
echo "{ \"locations\": $LOCATIONS }"
