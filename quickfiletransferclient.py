import requests

r1=requests.post('http://192.168.2.106:5000/naybar.vdi', data={})
# Save the returned file to disk.
with open('naybar.vdi', 'wb') as f:
    f.write(r1.content)
    f.close()