source ./deploy.parameters.sh

if [ $(az group exists --name $RG) = false ]; then
    az group create --name $RG --location $REGION
fi

az group deployment create --resource-group $RG --template-file ./VNets/VNets.json --parameters ./VNets/VNets.parameters.json --handle-extended-json-format 