source ./deploy.parameters.sh

if [ $(az group exists --name $RGAD) = false ]; then
    az group create --name $RGAD --location $REGION
fi

az group deployment create --resource-group $RGAD --template-file ./DCs/DCs.json --parameters ./DCs/DCs.parameters.json --parameters NetworkResourceGroup=$RG  --handle-extended-json-format 