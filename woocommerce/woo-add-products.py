import os
#!/usr/local/bin/python3
# python3 /Volumes/Macintosh\ HD/Users/chris/My\ Drive\ \(chrisg77@gmail.com\)/Lullberry/Prod\ 1\ -\ Strengths/Scripts\ 2/woo-add-products.py
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
spreadsheetPythonList = {
    "create": [
        {
            "name": "A women's tee for calm",
            "type": "simple",
            "regular_price": "99",
            "categories": [
                {
                    "id": 356
                },
                {
                    "id": 904
                },
                                {
                    "id": 696
                },
                                {
                    "id": 697
                }
            ],
            "images": [
                {
                    "src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg"
                },
                {
                    "src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg"
                }
            ]
        }
    ]
}

# for x in spreadsheetPythonList:
#     data = {
#     "create":[x]
#     }    
print(wcapi.post("products/batch", spreadsheetPythonList).json())