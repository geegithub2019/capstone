
# Step 2
# Run the Docker Hub container with kubernetes
#kubectl apply -f ./green/deployment.yml
#kubectl apply -f ./green/service.yml

kubectl create deployment greenimage --image=geepee2017/greenimage


