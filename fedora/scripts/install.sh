echo "dnf updating......."
sudo dnf update

echo "docker installing......"
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo usermod -aG docker vagrant

echo "k3s installing......."
curl -sfL https://get.k3s.io | sh -
sudo cp -i /etc/rancher/k3s/k3s.yaml ~/.kube
mv ~/.kube/k3s.yaml ~/.kube/config-k3s
export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config:$KUBECONFIG

echo "k3s restart......."
sudo systemctl daemon-reload
sudo systemctl restart k3s