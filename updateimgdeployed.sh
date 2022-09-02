#!/bin/bash
GCOLOR=$(head -n 1 latest.txt)
echo "Current Color is $GCOLOR"
if [[ "$GCOLOR" == "blue" ]]
then
IMAGENAME=$(grep "image" ./deployment/green/deploymentgreen.yaml)
sed -i 's/blue/green/g' latest.txt
sed -i "s|$IMAGENAME|$1|g" ./deployment/green/deploymentgreen.yaml
echo "Next Deployment will be Green"
else
IMAGENAME=$(grep "image" ./deployment/blue/deploymentblue.yaml)
sed -i 's/green/blue/g' latest.txt
sed -i "s|$IMAGENAME|$1|g" ./deployment/blue/deploymentblue.yaml
echo "Next Deployment will be Blue"
fi
