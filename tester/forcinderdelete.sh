openstack volume list -f json | jq -r '.[] | .ID' | while read line;
do
cinder reset-state $line --state available; 
openstack volume --force delete $line; done
# | xargs -I {} openstack volume delete {}
# for r in 1 2 3 4 5 6
# do
#     echo "Forcing delete of cinder volume $r"
#     cinder delete $r
# done