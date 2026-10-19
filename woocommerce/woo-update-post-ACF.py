import os
#ACF Code given by postman, works with taxonomy ACF
import requests

url = "https://www.staging2.lullberry.com/wp-json/acf/v3/tags/357?fields[acf_desc]=wpi"

payload  = {}
headers = {
  'Authorization': 'Basic YWNmOnFoI2dla3hSdDZ6bFBZR0d0QFlCWmNwOA=='
}

response = requests.request("PUT", url, headers=headers, data = payload)

print(response.text.encode('utf8'))

#ACF Code given by postman, works with posts ACF
# import requests

# url = "https://www.staging2.lullberry.com/wp-json/acf/v3/posts/23586?fields[acftst]=wpi"

# payload  = {}
# headers = {
#   'Authorization': 'Basic YWNmOnFoI2dla3hSdDZ6bFBZR0d0QFlCWmNwOA=='
# }

# response = requests.request("PUT", url, headers=headers, data = payload)

# print(response.text.encode('utf8'))

# ACF not working
# from wordpress import API
# wpapi = API(
#     url="https://www.staging2.lullberry.com",
#     api="wp-json",
#     version='acf/v3',
#     wp_user="acf",
#     wp_pass="qh#gekxRt6zlPYGGt@YBZcp8",
#     consumer_key=os.environ["WC_CONSUMER_KEY"],
#     consumer_secret=os.environ["WC_CONSUMER_SECRET"],
#     basic_auth = True,
#     user_auth = True,
# )

# data = {"fields[acftst]":"d1"}
# print(wpapi.put("posts/23586", data).json())

# WP (needs added 2 lines in htaccess otherwise headers are not passed)
# from wordpress import API
# wpapi = API(
#     url="https://www.staging2.lullberry.com",
#     api="wp-json",
#     version='wp/v2',
#     wp_user="acf",
#     wp_pass="qh#gekxRt6zlPYGGt@YBZcp8",
#     consumer_key=os.environ["WC_CONSUMER_KEY"],
#     consumer_secret=os.environ["WC_CONSUMER_SECRET"],
#     basic_auth = True,
#     user_auth = True,
# )

# data = {"title": "d1"}
# print(wpapi.put("posts/23586", data).json())


# WC
# from woocommerce import API
# wcapi = API(
#     url="https://www.lullberry.com",
#     consumer_key=os.environ["WC_CONSUMER_KEY"],
#     consumer_secret=os.environ["WC_CONSUMER_SECRET"],
#     wp_api=True,
#     version="wc/v3",
#     query_string_auth=True
# )

# data = {"description": "dd1"}
# print(wcapi.put("products/categories/357", data).json())