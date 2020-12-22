#Create Kubernetes secrets

kubectl create secret generic webhook-secrets --from-env-file=webhook.txt
kubectl create secret generic backend-secrets --from-env-file=backend.txt
kubectl create secret generic dynamic-auth-secrets --from-env-file=dynamic_auth.txt
kubectl create secret generic email-service-secrets --from-env-file=email_service.txt