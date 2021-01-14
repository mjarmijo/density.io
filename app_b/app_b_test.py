import requests
headers = {'User-Agent': 'Mozilla/5.0'}
payload = {'token':'mytoken'}

session = requests.Session()
result = session.post('http://0.0.0.0:5001/auth"',headers=headers,data=payload)
print(result.form)
print(result.status_code)
print(result.text)
print(dir(result))

'''
if response.status_code == 200:
    print(f"Response [{response.status_code}]:  {response.text}")
else:
    print("ERROR:")
    print(f"Response [{response.status_code}]: {response.reason}")

'''