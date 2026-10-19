import os
#!/usr/local/bin/python3
import json,os,sys,requests,time, datetime,csv
from woocommerce import API

wcapi = API(
    # url="https://www.staging2.lullberry.com",
    url="https://www.staging2.lullberry.com/wp-json",
    consumer_key=os.environ["WC_CONSUMER_KEY"],
    consumer_secret=os.environ["WC_CONSUMER_SECRET"],
    wp_api=True,
    api="wp-json",
    version="acf/v3",
    wp_user="acf",
    wp_pass="qh#gekxRt6zlPYGGt@YBZcp8",
    # Force Basic Authentication as query string true and using under HTTPS
    query_string_auth=True,
    basic_auth=True,
    user_auth=True
)

# API batch
spreadsheetPythonList = {"id": 357,"fields[acf_desc]": "<style>body {background-image: radial-gradient(rgba(255, 255, 255, 0.8) 50%,#b0cdcb), url(https://www.lullberry.com/church);}</style>"}

# for x in spreadsheetPythonList:
#     data = {
#     "update":[x]
#     }    

print(wcapi.post("categories/357", spreadsheetPythonList).json())



# API one by one
# spreadsheetPythonList = [

# ]

# for x in spreadsheetPythonList:
#     data = {
#     "description":x["description"]
#     }    
#     # print(data)
#     print(wcapi.post("products/categories/" + str(x["id"]), data).json())