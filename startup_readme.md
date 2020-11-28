


Intructions for configuring secrets with my env vars

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



