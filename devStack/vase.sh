#Works only in Virtual BOX. Specs: 6GB RAM, 2 Cores, 40 GB HDD, 2 NICs. Provide the ip of the controller. Using OSI ubuntu 20.04.
sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
sudo su - stack
git clone https://opendev.org/openstack/devstack
chmod 777 devstack
cd devstack
git checkout stable/wallaby
cp samples/local.conf .
HOST_IP=$1
echo "HOST_IP=${HOST_IP}" >> local.conf
sudo apt purge python3-simplejson
sudo apt purge python3-pyasn1-modules

# Basically, there are two security groups, one for the interface and one for the VM. These by default do not allow traffic inside, therefore 
# for the ssh/rdp to work from the outside to the inside, it is cumpulsory to create a new security group with opening all ports and protocols.
# pip install pyasn1-modules
# sudo nano /proc/sys/net/ipv4/conf/enp0s3/forwarding
# sudo iptables -t nat -A PREROUTING -p tcp -i enp0s3 --dport 4111 -j DNAT --to-destination 172.24.4.85:22

# systemctl restart "devstacl@*"