#Update the public ip that is used to access aks cluster
#We will use the ingress-controller service outbound IP and a custom subdomain

#Script PreReq
#AzureCLI


# Public IP address of your ingress controller
$IP="<IP_HERE>" 

# Name to associate with public IP address 
$DNSNAME="fgr-kubernetes-demo-terraform-2"

$NAME=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[name]" --output tsv)

$RG=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[resourceGroup]" --output tsv)

echo $IP
echo $DNSNAME
echo $NAME
echo $RG

az network public-ip update -n $NAME -g $RG --dns-name  $DNSNAME

# # Display the FQDN 
$FQDN=$(az network public-ip show  -n $NAME -g $RG --query "[dnsSettings.fqdn]" --output tsv)

echo ""
echo "FQDN: $FQDN"