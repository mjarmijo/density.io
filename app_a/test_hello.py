import requests

response = requests.get("http://localhost:5000/hello")

if response.status_code == 200:
    print(f"Response [{response.status_code}]:  {response.text}")
else:
    print("ERROR:")
    print(f"Response [{response.status_code}]: {response.reason}")

