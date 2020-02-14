source ./deploy.parameters.sh

if [ $(az group exists --name $RG) = false ]; then
    az group create --name $RG --location $REGION
fi

az group deployment create --resource-group $RG --template-file ./VNets/VNets.json --parameters ./VNets/VNets.parameters.json --handle-extended-json-format 

if [ $(az group exists --name $RGAD) = false ]; then
    az group create --name $RGAD --location $REGION
fi

az group deployment create --resource-group $RGAD --template-file ./DCs/DCs.json --parameters ./DCs/DCs.parameters.json --parameters NetworkResourceGroup=$RG  --handle-extended-json-format 