sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@kube-master
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@kube-node01
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@kube-node02