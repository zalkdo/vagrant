echo "apt updating......."
sudo apt-get update -y

echo "docker installing......"
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker vagrant

echo "k3s installing......."
curl -sfL https://get.k3s.io | sh -
sudo cp -i -r /etc/rancher/k3s ~/.kube
sudo mv ~/.kube/k3s.yaml ~/.kube/config-k3s
sudo chmod 775 config-k3s
export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config:$KUBECONFIG

echo "k3s restart......."
sudo systemctl daemon-reload
sudo systemctl restart k3s