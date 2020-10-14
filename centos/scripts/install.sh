echo "yum updating......."
sudo yum update

echo "ssh PasswordAuthentication enable"
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "docker installing......"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker vagrant

echo "k3s installing......."
curl -sfL https://get.k3s.io | sh -
sudo cp -i /etc/rancher/k3s/k3s.yaml ~/.kube
mv ~/.kube/k3s.yaml ~/.kube/config-k3s
export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config:$KUBECONFIG

echo "k3s restart......."
sudo systemctl daemon-reload
sudo systemctl restart k3s