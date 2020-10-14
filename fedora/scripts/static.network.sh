echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/systemd/network/static.network
[Match]
Name=eth0
[Network]
Address=192.168.137.130/24
Gateway=192.168.137.1
DNS=8.8.8.8
EOF

# Be sure NOT to execute "systemctl restart systemd-networkd" here, so the changes take
# effect on reboot instead of immediately, which would disconnect the provisioner.