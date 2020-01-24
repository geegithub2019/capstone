curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get install -y docker-
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
sudo apt-mark hold docker-ce
sudo systemctl status docker
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00
sudo apt-mark hold kubelet kubeadm kubectl
exit
pwd
mkdir dockerimagess
cd dockerimagess/
cd /tmp/
git clone https://github.com/nginxinc/NGINX-Demos.git
ls
cd NGINX-Demos/
ls
cp -R nginx-hello ~/dockerimagess/
cd ~/dockerimagess/
ls
cd nginx-hello/
ls
docker build -t hello-world .
docker ls image
docker ls images
docker images ls
docker image ls
docker tag hello-world:latest 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
aws ecr get-login --no-include-email --region us-west-2
aws configure
aws ecr get-login --no-include-email --region us-west-2
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
docker image ls
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/udacity:latest
aws ecr get-login --no-include-email --region us-west-2
docker tag hello-world:latest 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
aws configure
aws ecr get-login --no-include-email --region us-west-2
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
aws configure
aws ecr get-login --no-include-email --region us-west-2
aws cli
aws ls
ls
docker build -t hello-world .
docker tag hello-world:latest 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
ls -al
cd ~
ls
ls -al
cd .aws/
ls
cat credentials 
cat config 
eval $(aws ecr get-login --no-include-email | sed ‘s|https://||’)
cd ..
cd ~
cd dockerimagess/
ls
cd nginx-hello/
ls
eval $(aws ecr get-login --no-include-email | sed ‘s|https://||’)
docker image ls
docker push 548148095658.dkr.ecr.us-west-2.amazonaws.com/hello-world:latest
aws ecr create-repository --repository-name hello-repository --region region
ping 8.8.8.8
nslookup yahoo.com
exi
exit
ssh -i "proj7.pem" ubuntu@10.4.3.21
vi proj7.pem
chmod 400 proj7.pem 
ssh -i "proj7.pem" ubuntu@10.4.2.185
jx install --provider=kubernetes --on-premise
jx install
sudo apt update -y
apt install -y
apt install default-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y
systemctl jenkins status
systemctl status jenkins
netstat -plant
systemctl status jenkins
systemctl restart jenkins
systemctl status jenkins
ps -ef 
top
reboot
apt install default-jdk -y
systemctl jenkins status
systemctl status jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
