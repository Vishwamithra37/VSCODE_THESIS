openstack server create \
--flavor m1.small \
--image bionic \
--security-group g1 \
--nic net-id=bootcamp_network \
--key-name tpair \
--volume 52ef82a0-9de0-4d48-818c-bf9529cb3319 \
--wait \
vm1