#!/bin/bash
GCOLOR=$(head -n 1 latest.txt)
echo "Current Color is $GCOLOR"
if [[ "$GCOLOR" == "blue" ]]
then
IMAGENAME=$(grep "image" ./deployment/green/deploymentgreen.yaml)
sed -i 's/blue/green/g' latest.txt
sed -i "s|$IMAGENAME|$1|g" ./deployment/green/deploymentgreen.yaml
sed -i "s|"bluebg.jpg"|"greenbg.jpg"|g" ./$HOME/blue-green/html/index.html
echo "Next Deployment will be Green"
else
IMAGENAME=$(grep "image" ./deployment/blue/deploymentblue.yaml)
sed -i 's/green/blue/g' latest.txt
sed -i "s|$IMAGENAME|$1|g" ./deployment/blue/deploymentblue.yaml
sed -i "s|"greenbg.jpg"|"bluebg.jpg"|g" ./$HOME/blue-green/html/index.html
echo "Next Deployment will be Blue"
fi
