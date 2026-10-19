import os
#!/usr/local/bin/python3
# python3 /Users/chrisgolle/Google\ Drive/Lullberry/Products/Strengths/Scripts/woo-add-product-category.py
import json
from woocommerce import API

wcapi = API(
    url="https://www.lullberry.com",
    consumer_key=os.environ["WC_CONSUMER_KEY"],
    consumer_secret=os.environ["WC_CONSUMER_SECRET"],
    wp_api=True,
    version="wc/v3",
    # Force Basic Authentication as query string true and using under HTTPS
    query_string_auth=True
)

# API batch
spreadsheetPythonList = [
{"name": "I am calm","parent": 798,},
{"name": "I am patient","parent": 798,},
{"name": "I am peaceful","parent": 798,},
]

for x in spreadsheetPythonList:
    data = {
    "create":[x]
    }    
    print(wcapi.post("products/categories/batch", data).json())



# API one by one
# spreadsheetPythonList = [

# ]

# for x in spreadsheetPythonList:
#     data = {
#     "description":x["description"]
#     }    
#     # print(data)
#     print(wcapi.post("products/categories/" + str(x["id"]), data).json())