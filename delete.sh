source ./deploy.parameters.sh

echo "Delete "$RGAD" ?"
az group delete --name $RGAD

echo "Delete "$RG" ?"
az group delete --name $RG