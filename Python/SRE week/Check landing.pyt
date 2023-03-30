import requests

url_string = "https://c338andrewhdev.computerlab.online/"
response = requests.get(url_string, verify=False)

print(response.content)
