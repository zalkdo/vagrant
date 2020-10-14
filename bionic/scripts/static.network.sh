echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/netplan/01-netcfg.yaml
network:
    version: 2
    ethernets:
        eth0:
            addresses: [192.168.137.120/24]
            gateway4: 192.168.137.1
            dhcp4: no
            optional: true
            nameservers:
                addresses: [8.8.8.8]
EOF

# Be sure NOT to execute "netplan apply" here, so the changes take
# effect on reboot instead of immediately, which would disconnect the provisioner.