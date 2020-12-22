Intructions for configuring secrets with my env vars, Sample files can be found in the powershell_scripts folder

Webhook nev
`kubectl create secret generic webhook-secrets --from-env-file=webhook.txt`

backend
`kubectl create secret generic backend-secrets --from-env-file=backend.txt`

frontend
The frontend env vars are baked into the js bundle at image build time

dynnamic auth

with a docker image of kubebud_dynamic_auth this can be achived in a folder with your config.json like so
`docker run -it --rm -v ${pwd}/config.json:/app/config.json kubebud_dynamic_auth npm run config`

then create env file
`kubectl create secret generic dynamic-auth-secrets --from-env-file=dynamic_auth.txt`

email-service
`kubectl create secret generic email-service-secrets --from-env-file=email_service.txt`

-------------------

## Using Terraform (Post creation)

1. Get context for aks
`az aks get-credentials --name $(terraform output aks_name) --resource-group $(terraform output resource_group_name)`

2. Switch to powershell scripts directroy
`cd powershell_scripts`


3. Populate the secret text files that represent .envs (See sample files in powershell_scripts directory and then add secrets with following script)
`./add_secrets.ps1`

4. Create Ingress-nginx controller
`./add_ingress_controller.ps1`

5. Check the ingress-nginx controller public IP, (`kubectl get svc -n ingress-nginx`) update the following script with the ip and desired subdomain then run
`./update_dns_on_public_ip.ps1`

6. Install and update Helm cert-manager in order to use TLS
`./add-helm-cert-manager.ps1`

7. Update the Certificate.yaml and the ingress-service.ymal with new FQDN from step 5 and then Create the rest of the kubernetes objects
`./apply-all.ps1`