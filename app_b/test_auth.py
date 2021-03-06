import requests
headers = {'User-Agent': 'Mozilla/5.0', 'Authorization': 'mytoken'}
payload = {'token':'mytoken'}

session = requests.Session() # session is good for cookies, connection-pooling and config
#result = session.get('http://localhost:5001/hello',headers=headers,data=payload, timeout=3)
#result = session.post('http://localhost:5001/auth', headers=headers, data=payload, timeout=3)
result = session.post('http://localhost:5001/auth', data=payload, timeout=3)
#result = session.post('https://httpbin.org/post', headers=headers, data=payload, )

print(result.url)
print(result.status_code)
print(result.text)
print(result.content)
print(dir(result))
print(result.request.body)
print(result.request.headers)


if result.status_code == 200:
    print(f"Response [{result.status_code}]:  {result.text}")
else:
    print("ERROR:")
    print(f"Response [{result.status_code}]: {result.reason}")

