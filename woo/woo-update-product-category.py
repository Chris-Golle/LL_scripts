import os
#!/usr/local/bin/python3
# python3 /Volumes/GoogleDrive/My\ Drive/Lullberry/Products/Strengths/Scripts\ 2/woo-update-product-category.py
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
{"id": 390,"description": "<p>The quality of <span>joy</span> belongs to the <span>vitality</span> family.</p><div><span>Do you</span>easily let your body decide?<br/><span>Have you</span>found the happy baby inside you?</div><div>You may have found one of your superpowers:</div><div><span>vitality</span><br/>from Latin vīta which means <span>life</span><br/>(noun) the impulse to celebrate being alive<figure><blockquote><p>I think we like to complicate things when it is really quite simple. Find what it is that makes you happy and who it is that makes you happy and you’re set. Promise.</p><br/><cite>Anonymous</cite></blockquote></figure></div><div>If this is not one of your strengths,<br/>here's some inspiration:</div><div><pre>this thing you had in mind, go for it!</pre><pre>your body wants to move: feel how!</pre><pre>when joyful, hug someone who isn't</pre><pre>for an hour everyday, stop adulting</pre><pre>spread your light: be on fire!</pre><pre>sing!</pre><pre>and never hesitate to use this talent: it grows when you use it!</pre></div>"},
]

for x in spreadsheetPythonList:
    data = {
    "update":[x]
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