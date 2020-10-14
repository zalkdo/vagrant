now=$(date + "%m_%d_%y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd