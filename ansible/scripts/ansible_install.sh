echo "apt updating......."
sudo apt update -y
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible

echo "ansible installing......"
sudo apt install ansible -y