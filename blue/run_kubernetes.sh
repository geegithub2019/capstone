kubectl create deployment my-bluekubeproj-app --image=geepee2017/blueimage:latest
kubectl get pods
kubectl expose deployment my-kubeproj-app --type="NodePort" --port=8000 --target-port=80
# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f ./blue-controller.json
