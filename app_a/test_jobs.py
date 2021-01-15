import requests

headers = {'User-Agent': 'Mozilla/5.0', 'Authorization': 'mytoken'}
payload = {'token':'mytoken'}

session = requests.Session() # session is good for cookies, connection-pooling and config
#response = session.get('http://localhost:5000/hello',headers=headers,data=payload, timeout=3)
response = session.post('http://localhost:5000/jobs', headers=headers, data=payload, timeout=3)
#response = session.post('https://httpbin.org/post', headers=headers, timeout=3)

#print(response.url)
#print(response.status_code)
#print(response.text)
#print(response.content)
#print(dir(response))
#print(response.request)

if response.status_code == 200:
    print(f"Response [{response.status_code}]:  {response.text}")
else:
    print("ERROR:")
    print(f"Response [{response.status_code}]: {response.reason}")

