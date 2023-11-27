import requests
import mmh3
import base64

res = requests.get('https://iawg.gov/wp-content/themes/iawg-wp-theme/images/favicon.ico')
favicon = base64.encodebytes(res.content)
mmh3_hash = mmh3.hash(favicon)
print(mmh3_hash)
