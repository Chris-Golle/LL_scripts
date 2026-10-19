import os
# python3 /Volumes/GoogleDrive/My\ Drive/Lullberry/Prod\ 1\ -\ Strengths/Scripts\ 2/woo-update-product.py
#!/usr/local/bin/python3
import ast
import ujson as json
from woocommerce import API
wcapi = API(
    url="https://www.lullberry.com",
    consumer_key=os.environ["WC_CONSUMER_KEY"],
    consumer_secret=os.environ["WC_CONSUMER_SECRET"],
    wp_api=True,
    version="wc/v3",
    timeout=120,
    # Force Basic Authentication as query string true and using under HTTPS
    query_string_auth=True
)

# SOME PRODUCTS
ids = []

# ALL PRODUCTS
if len(ids) == 0:
    products = wcapi.get("products")
    total_pages = int(products.headers['X-WP-TotalPages'])
    print(str(total_pages) + ' pages')
    for i in range(1, total_pages+1):
        products = wcapi.get("products?&page="+str(i)).json()
        for product in products:
            ids.append(product['id'])

# US EU CA
update_top = [0,0,0]
# US
update_w_tee = [0]
# US-EU CA AU-MX JP
update_tee = [0,0,0,0]
# bags
update_bag = [1]

def default_attributes(default_color, default_size):
    return [{
        "id": "1",
        "name": "Color",
        "option": default_color,
    },
        {
        "id": "2",
        "name": "size",
        "option": default_size,
    }
    ]

count = len(ids)
counter = 0
print(ids, count, 'items')

for key in ids:
    counter += 1
    # print(wcapi.get("products/" + str(key)).json()['attributes'])
    product = wcapi.get("products/" + str(key)).json()
    garment_name = product['name'].split('for ')[0]
    garment_name = garment_name.replace("A tee", "t shirts").replace("A top", "women's tops").replace(
        "A women's tee", "women's t shirts").replace("An eco bag", "eco tote bag")
    # APPENDED PRODUCT NAME GOES HERE
    product_name_append = " with inspiring secret note"
    product_name_append_bag = " with inspiring secret note"
    # the second spit below uses the first word from product_name_append above
    product_name_without_append = product['name'].split(' with')[0]
    print(product_name_without_append)
    strength_name = product_name_without_append.split('for ')[1]
    prodfilename = strength_name.replace(" ", "-").lower()
    # print(json.dumps(product))
    # exit()
    rank_math_primary_cat = next(
        item for item in product['categories'] if item["name"] == strength_name)['id']

    # TOPS
    def prepare_tops():
        short_description_tops = "<p>This very soft tee is a simple reminder to grow your new talent: " + strength_name + \
            ".</p><p>The ensō circle, a minimalist symbol of strength and elegance in Japanese zen calligraphy, contains a secret supportive message readable only by you, in the mirror.</p>"

        def description_tops():
            return "<p>Wearing " + strength_name + " is a beautiful invitation with a special meaning. You and this talent will grow together.</p><p>The message in the zen circle below is visible only by you when you stand in front of a mirror. Supportive and uplifting, this is an experience that, with patience, is literally life-changing.</p><figure class='flipping'><img class='centered-img' src='https://www.lullberry.com/wp-content/uploads/" + prodfilename + "-dpinkenso.png'></figure><br/><br/><p>Before this tee reaches you, six actions have been taken to be gentle to the Earth. See them on the page <i>Lullberry and the planet</i>.</p><p>• <b>Note:</b> please open the size guide and make sure that your body and this tee will be best friends.<br/>• Made of 50% polyester, 25% cotton and 25% rayon<br />• Made with high quality 32 singles pre-laundered cotton<br />• Very soft active feel with raw edge seams</p><br/>Made in central America or in the US and printed in the US or in Europe.</p><p>&nbsp;</p><p>Caring for your tee:</p><p><img src='https://www.lullberry.com/wp-content/uploads/01-wash-cold.svg' /> Machine wash cold, inside-out, gentle cycle with mild detergent and similar colors. Use non-chlorine bleach if necessary, no softeners.</p><p><img src='https://www.lullberry.com/wp-content/uploads/02-thumble-low.svg' /> Tumble dry low, or hang-dry for longest life.</p><p><img src='https://www.lullberry.com/wp-content/uploads/03-iron-cool.svg' /> Cool iron inside-out if necessary. Do not iron decoration.</p><p><img src='https://www.lullberry.com/wp-content/uploads/04-no-dry-clean.svg' /> No dry cleaning.</p>"

        # changing size guide pics, literal_eval makes a dictionary out of the json string, json.dumps changes ' into '' and we prevent creation of \/ with escape_forward_slashes
        pf_advanced_size_chart = ast.literal_eval(next(item for item in product['meta_data'] if item["key"] == 'pf_advanced_size_chart')['value'])
        pf_advanced_size_chart["modelMeasurements"].update({"imageId": 149011})
        pf_advanced_size_chart["productMeasurements"].update({"imageId": 149012})
        pf_advanced_size_chart={"locale":"en_US","availableSizes":["XS","S","M","L","XL"],"modelMeasurements":{"description":"<p>Measurements are provided by suppliers.</p>\n<p>Product measurements may vary by up to 2\" (5 cm).</p>","imageDescription":"<p><strong><strong>A Length</strong></strong></p>\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\n<p><strong>B Chest</strong></p>\n<p dir=\"ltr\">Measure yourself around the fullest part of your chest. Keep the tape measure horizontal.</p>","modelDescription":"","sizeTableDescription":"Product measurements may vary by up to 2\" (5 cm).","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"XS":[26.125],"S":[26.75],"M":[27.375],"L":[28],"XL":[28.625]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"XS":[66.358],"S":[67.945],"M":[69.533],"L":[71.12],"XL":[72.708]}},{"unit":"inch","unitName":"Inches","title":"Chest","sizes":{"XS":[29,31],"S":[32,33],"M":[34,35],"L":[35,37],"XL":[38,39]}},{"unit":"centimeter","unitName":"Centimeters","title":"Chest","sizes":{"XS":[73.66,78.74],"S":[81.28,83.82],"M":[86.36,88.9],"L":[88.9,93.98],"XL":[96.52,99.06]}}],"imageId":149011},"productMeasurements":{"description":"<p dir=\"ltr\">Measurements are provided by our suppliers. Product measurements may vary by up to 2\" (5 cm).</p>\n<p dir=\"ltr\">Pro tip! Measure one of your products at home and compare with the measurements you see in this guide.</p>","imageDescription":"A Length\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\nB Width\n<p dir=\"ltr\">Place the end of the tape at the seam under the sleeve and pull the tape measure across the shirt to the seam under the opposite sleeve.</p>","sizeTableDescription":"Product measurements may vary by up to 2\" (5 cm).","internationalSizeTableDescription":"","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"XS":[26.125],"S":[26.75],"M":[27.375],"L":[28],"XL":[28.625]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"XS":[66.358],"S":[67.945],"M":[69.533],"L":[71.12],"XL":[72.708]}},{"unit":"inch","unitName":"Inches","title":"Width","sizes":{"XS":[15.25],"S":[16.25],"M":[17.25],"L":[18.25],"XL":[19.25]}},{"unit":"centimeter","unitName":"Centimeters","title":"Width","sizes":{"XS":[38.735],"S":[41.275],"M":[43.815],"L":[46.355],"XL":[48.895]}}],"internationalSizeTableRows":[],"imageId":149012}}
        meta_data = [
        {
            "key": "pf_advanced_size_chart",
            "value": json.dumps(pf_advanced_size_chart, escape_forward_slashes=False),
        },
        {
            "key": "rank_math_primary_product_cat",
            "value": rank_math_primary_cat,
        },
        {
            "key": "rank_math_focus_keyword",
            "value": strength_name + ",talent,zen," + garment_name,
        },
        ]

        global data_tops_US
        data_tops_US = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tops,
            "description": description_tops(),
            "default_attributes": default_attributes('heather-white', 'xs'),
            "meta_data": meta_data,
        }
        global data_tops_EU
        data_tops_EU = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tops,
            "description": description_tops(),
            "default_attributes": default_attributes('indigo', 'm'),
            "meta_data": meta_data,
        }
        global data_tops_CA
        data_tops_CA = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tops,
            "description": description_tops(),
            "default_attributes": default_attributes('heather-white', 's'),
            "meta_data": meta_data,
        }

    # TEES
    def prepare_tees():
        short_description_tees = "<p>Soft and with a touch of stretch, this tee is a gentle reminder to grow your new talent: " + strength_name + \
            ".</p><p>The ensō circle, a minimalist symbol of strength and elegance in Japanese zen calligraphy, contains a secret supportive message readable only by you, in the mirror.</p>"

        def description_tees(materials):
            return "<p>Wearing " + strength_name + " is a beautiful invitation with a special meaning. You and this talent will grow together.</p><p>The message in the zen circle below is visible only by you when you stand in front of a mirror. Supportive and uplifting, this is an experience that, with patience, is literally life-changing.</p><figure class='flipping'><img class='centered-img' src='https://www.lullberry.com/wp-content/uploads/" + prodfilename + "-enso.png'></figure><br/><br/><p>Before this tee reaches you, six actions have been taken to be gentle to the Earth. See them on the page <i>Lullberry and the planet</i>.</p><p>• <b>Note:</b> please open the size guide and make sure that your body and this tee will be best friends.<br/>" + materials + "• Made with high quality 30 singles pre-shrunk cotton<br />• Side-seamed with shoulder-to-shoulder taping</p><br/>Made in central America or in the US and printed in the US or in Europe.</p><p>&nbsp;</p><p>Caring for your tee:</p><p><img src='https://www.lullberry.com/wp-content/uploads/01-wash-cold.svg' /> Machine wash cold, inside-out, gentle cycle with mild detergent and similar colors. Use non-chlorine bleach if necessary, no softeners.</p><p><img src='https://www.lullberry.com/wp-content/uploads/02-thumble-low.svg' /> Tumble dry low, or hang-dry for longest life.</p><p><img src='https://www.lullberry.com/wp-content/uploads/03-iron-cool.svg' /> Cool iron inside-out if necessary. Do not iron decoration.</p><p><img src='https://www.lullberry.com/wp-content/uploads/04-no-dry-clean.svg' /> No dry cleaning.</p>"

        # changing size guide pictures, literal_eval recognizes a dictionary out of the json string, json.dumps changes ' into ''
        pf_advanced_size_chart = ast.literal_eval(next(item for item in product['meta_data'] if item["key"] == 'pf_advanced_size_chart')['value'])
        pf_advanced_size_chart["modelMeasurements"].update({"imageId": 148489})
        pf_advanced_size_chart["productMeasurements"].update({"imageId": 148490})
        pf_advanced_size_chart={"locale":"en_US","availableSizes":["XS","S","M","L","XL","2XL","3XL","4XL","5XL"],"modelMeasurements":{"description":"<p>Measurements are provided by suppliers.</p>\n<p>Product measurements may vary by up to 2&Prime;&nbsp;(5 cm).</p>","imageDescription":"<p><strong><strong>A Length</strong></strong></p>\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\n<p><strong>B Chest</strong></p>\n<p dir=\"ltr\">Measure yourself around the fullest part of your chest. Keep the tape measure horizontal.</p>","modelDescription":"","sizeTableDescription":"Product measurements may vary by up to 2\u2033 (5 cm).","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"XS":[27],"S":[28],"M":[29],"L":[30],"XL":[31],"2XL":[32],"3XL":[33],"4XL":[34],"5XL":[35]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"XS":[68.58],"S":[71.12],"M":[73.66],"L":[76.2],"XL":[78.74],"2XL":[81.28],"3XL":[83.82],"4XL":[86.36],"5XL":[88.9]}},{"unit":"inch","unitName":"Inches","title":"Chest","sizes":{"XS":[31,34],"S":[34,37],"M":[38,41],"L":[42,45],"XL":[46,49],"2XL":[50,53],"3XL":[54,57],"4XL":[58,61],"5XL":[62,65]}},{"unit":"centimeter","unitName":"Centimeters","title":"Chest","sizes":{"XS":[78.74,86.36],"S":[86.36,93.98],"M":[96.52,104.14],"L":[106.68,114.3],"XL":[116.84,124.46],"2XL":[127,134.62],"3XL":[137.16,144.78],"4XL":[147.32,154.94],"5XL":[157.48,165.1]}}],"imageId":148489},"productMeasurements":{"description":"<p dir=\"ltr\">Measurements are provided by our suppliers. Product measurements may vary by up to 2\" (5 cm).</p>\n<p dir=\"ltr\">Pro tip! Measure one of your products at home and compare with the measurements you see in this guide.</p>","imageDescription":"A Length\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\nB Width\n<p dir=\"ltr\">Place the end of the tape at the seam under the sleeve and pull the tape measure across the shirt to the seam under the opposite sleeve.</p>","sizeTableDescription":"Product measurements may vary by up to 2\" (5 cm).","internationalSizeTableDescription":"","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"XS":[27],"S":[28],"M":[29],"L":[30],"XL":[31],"2XL":[32],"3XL":[33],"4XL":[34],"5XL":[35]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"XS":[68.58],"S":[71.12],"M":[73.66],"L":[76.2],"XL":[78.74],"2XL":[81.28],"3XL":[83.82],"4XL":[86.36],"5XL":[88.9]}},{"unit":"inch","unitName":"Inches","title":"Width","sizes":{"XS":[16.5],"S":[18],"M":[20],"L":[22],"XL":[24],"2XL":[26],"3XL":[28],"4XL":[30],"5XL":[32]}},{"unit":"centimeter","unitName":"Centimeters","title":"Width","sizes":{"XS":[41.91],"S":[45.72],"M":[50.8],"L":[55.88],"XL":[60.96],"2XL":[66.04],"3XL":[71.12],"4XL":[76.2],"5XL":[81.28]}}],"internationalSizeTableRows":[],"imageId":148490}}
        meta_data = [
        {
            "key": "pf_advanced_size_chart",
            "value": json.dumps(pf_advanced_size_chart, escape_forward_slashes=False),
        },
        {
            "key": "rank_math_primary_product_cat",
            "value": rank_math_primary_cat,
        },
        {
            "key": "rank_math_focus_keyword",
            "value": strength_name + ",talent,zen," + garment_name,
        },
        ]

        global data_tees_US_EU
        data_tees_US_EU = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tees,
            "description": description_tees("• The athletic heather color is 90% combed ring-spun cotton and 10% polyester<br />• The heather prism color is 99% combed ring-spun cotton and 1% polyester<br />• The white color is 100% combed ring-spun cotton<br />"),
            "default_attributes": default_attributes('heather-deep-teal', 's'),
            "meta_data": meta_data,
        }
        global data_tees_CA
        data_tees_CA = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tees,
            "description": description_tees("• The athletic heather color is 90% combed ring-spun cotton and 10% polyester<br />• The white color is 100% combed ring-spun cotton<br />"),
            "default_attributes": default_attributes('heather-deep-teal', 's'),
            "meta_data": meta_data,
        }
        # • The heather midnight navy color is made of 52% combed ring-spun cotton and 48% polyester<br />
        global data_tees_AU_MX
        data_tees_AU_MX = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tees,
            "description": description_tees("• The athletic heather color is 90% combed ring-spun cotton and 10% polyester<br />• The white color is 100% combed ring-spun cotton<br />"),
            "default_attributes": default_attributes('heather-deep-teal', 's'),
            "meta_data": meta_data,
        }
        global data_tees_JP
        data_tees_JP = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_tees,
            "description": description_tees("• The white color is 100% combed ring-spun cotton<br />"),
            "default_attributes": default_attributes('white', 's'),
            "meta_data": meta_data,
        }

    # WTEES
    def prepare_wtees():
        short_description_wtees = "<p>This eco-friendly tee will delight you with its softness, and will be a gentle reminder to grow your new talent: " + strength_name + ".</p><p>The ensō circle, a minimalist symbol of strength and elegance in Japanese zen calligraphy, contains a secret supportive message readable only by you, in the mirror. Check the size guide and consider ordering one or two sizes up: size L will fit someone who wears a Lullberry tank top size S.</p>"

        description_wtees = "<p>Wearing " + strength_name + " is a beautiful invitation with a special meaning. You and this talent will grow together.</p><p>The message in the zen circle below is visible only by you when you stand in front of a mirror. Supportive and uplifting, this is an experience that, with patience, is literally life-changing.</p><figure class='flipping'><img class='centered-img' src='https://www.lullberry.com/wp-content/uploads/" + prodfilename + "-dpinkenso.png'></figure><br/><br/><p>Before this tee reaches you, six actions have been taken to be gentle to the Earth. See them on the page <i>Lullberry and the planet</i>.</p><p>• <b>Note:</b> please open the size guide and make sure that your body and this tee will be best friends. Compared to your usual size you may want to order one or two sizes up.<br/>• Breathable fabric made of 50% polyester, 25% cotton and 25% rayon<br />• Made with high quality 40 singles pre-laundered cotton<br />• Ribbed crew neck with set-in sleeves</p><br/>Made in central America or in the US and printed in the US or in Europe.</p><p>&nbsp;</p><p>Caring for your tee:</p><p><img src='https://www.lullberry.com/wp-content/uploads/01-wash-cold.svg' /> Machine wash cold, inside-out, gentle cycle with mild detergent and similar colors. Use non-chlorine bleach if necessary, no softeners.</p><p><img src='https://www.lullberry.com/wp-content/uploads/02-thumble-low.svg' /> Tumble dry low, or hang-dry for longest life.</p><p><img src='https://www.lullberry.com/wp-content/uploads/03-iron-cool.svg' /> Cool iron inside-out if necessary. Do not iron decoration.</p><p><img src='https://www.lullberry.com/wp-content/uploads/04-no-dry-clean.svg' /> No dry cleaning.</p>"

        # changing size guide pictures, literal_eval recognizes a dictionary out of the json string, json.dumps changes ' into ''
        pf_advanced_size_chart = ast.literal_eval(next(item for item in product['meta_data'] if item["key"] == 'pf_advanced_size_chart')['value'])
        pf_advanced_size_chart["modelMeasurements"].update({"imageId": 152708})
        pf_advanced_size_chart["productMeasurements"].update({"imageId": 152709})
        pf_advanced_size_chart={"locale":"en_US","availableSizes":["S","M","L","XL","2XL"],"modelMeasurements":{"description":"<p>Measurements are provided by suppliers.</p>\n<p>Product measurements may vary by up to 2&Prime; (5 cm).</p>","imageDescription":"<p><strong><strong>A Length</strong></strong></p>\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\n<p><strong>B Chest</strong></p>\n<p dir=\"ltr\">Measure yourself around the fullest part of your chest. Keep the tape measure horizontal.</p>","modelDescription":"","sizeTableDescription":"Product measurements may vary by up to 2\u2033 (5 cm).","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"S":[26],"M":[26.5],"L":[27.125],"XL":[27.75],"2XL":[28.375]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"S":[66.04],"M":[67.31],"L":[68.898],"XL":[70.485],"2XL":[72.073]}},{"unit":"inch","unitName":"Inches","title":"Chest","sizes":{"S":[31,32],"M":[33,34],"L":[35,36],"XL":[36,37],"2XL":[38,39]}},{"unit":"centimeter","unitName":"Centimeters","title":"Chest","sizes":{"S":[78.74,81.28],"M":[83.82,86.36],"L":[88.9,91.44],"XL":[91.44,93.98],"2XL":[96.52,99.06]}}],"imageId":152708},"productMeasurements":{"description":"<p dir=\"ltr\">Measurements are provided by our suppliers. Product measurements may vary by up to 2\" (5 cm).</p>\n<p dir=\"ltr\">Pro tip! Measure one of your products at home and compare with the measurements you see in this guide.</p>","imageDescription":"A Length\n<p dir=\"ltr\">Place the end of the tape beside the collar at the top of the tee (Highest Point Shoulder). Pull the tape measure to the bottom of the shirt.</p>\nB Width\n<p dir=\"ltr\">Place the end of the tape at the seam under the sleeve and pull the tape measure across the shirt to the seam under the opposite sleeve.</p>","sizeTableDescription":"Product measurements may vary by up to 2\" (5 cm).","internationalSizeTableDescription":"","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"Length","sizes":{"S":[26],"M":[26.5],"L":[27.125],"XL":[27.75],"2XL":[28.375]}},{"unit":"centimeter","unitName":"Centimeters","title":"Length","sizes":{"S":[66.04],"M":[67.31],"L":[68.898],"XL":[70.485],"2XL":[72.073]}},{"unit":"inch","unitName":"Inches","title":"Width","sizes":{"S":[15.75],"M":[16.5],"L":[17.5],"XL":[18.5],"2XL":[19.5]}},{"unit":"centimeter","unitName":"Centimeters","title":"Width","sizes":{"S":[40.005],"M":[41.91],"L":[44.45],"XL":[46.99],"2XL":[49.53]}}],"internationalSizeTableRows":[],"imageId":152709}}

        meta_data = [
        {
            "key": "pf_advanced_size_chart",
            "value": json.dumps(pf_advanced_size_chart, escape_forward_slashes=False),
        },
        {
            "key": "rank_math_primary_product_cat",
            "value": rank_math_primary_cat,
        },
        {
            "key": "rank_math_focus_keyword",
            "value": strength_name + ",talent,zen," + garment_name,
        },
        ]

        global data_wtees_US
        data_wtees_US = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_wtees,
            "description": description_wtees,
            "default_attributes": default_attributes('navy-triblend', 's'),
            "meta_data": meta_data,
        }
        global data_wtees_EU
        data_wtees_EU = {
            "name": product_name_without_append + product_name_append,
            "short_description": short_description_wtees,
            "description": description_wtees,
            "default_attributes": default_attributes('charcoal-black-triblend', 's'),
            "meta_data": meta_data,
        }

    # BAGS
    def prepare_bags():
        short_description_bags = "<p>This eco tote bag and its durable fabric will accompany you for a long time on your errands small and big, and will be a gentle reminder to grow your new talent: " + \
            strength_name + ".</p><p>The ensō circle, a minimalist symbol of strength and elegance in Japanese zen calligraphy, contains a secret supportive message.</p>"

        description_bags = "<p>Bringing " + strength_name + " along with you is a beautiful invitation with a special meaning. You and this talent will grow together.</p><p>The supportive and uplifting message in the zen circle below can offer you a little nudge that, with patience, is literally life-changing.</p><figure><img class='centered-img' src='https://www.lullberry.com/wp-content/uploads/" + prodfilename + "-enso.png'></figure><br/><br/><p>Before this eco bag reaches you, many actions have been taken to be gentle to the Earth. See them on the page <i>Lullberry and the planet</i>.</p><img class='centered-img' src='https://www.lullberry.com/wp-content/uploads/eco-bag.jpg'><p>• Made of 100% certified organic cotton farmed using organic compost.<br />• The fabric is made without any synthetic substances or genetic modifications.<br />• Dimensions: 16″ × 14 ½″ × 5″ (40.6 cm × 35.6 cm × 12.7 cm)<br />• Maximum weight you can carry with this eco bag: 30 lbs (13.6 kg)</p><br/>The parts are made in Vietnam and assembled in the US or in Europe.</p><p>&nbsp;</p><p>Caring for your eco bag:</p><p><img src='https://www.lullberry.com/wp-content/uploads/01-wash-cold.svg' /> Machine wash cold, inside-out, gentle cycle with mild detergent and similar colors. Use non-chlorine bleach if necessary, no softeners.</p><p><img src='https://www.lullberry.com/wp-content/uploads/02-thumble-low.svg' /> Tumble dry low, or hang-dry for longest life.</p><p><img src='https://www.lullberry.com/wp-content/uploads/03-iron-cool.svg' /> Cool iron inside-out if necessary. Do not iron decoration.</p><p><img src='https://www.lullberry.com/wp-content/uploads/04-no-dry-clean.svg' /> No dry cleaning.</p>"

        # changing size guide pictures, literal_eval recognizes a dictionary out of the json string, json.dumps changes ' into ''
        pf_advanced_size_chart = ast.literal_eval('{"locale":"en_US","availableSizes":["One Size"],"modelMeasurements":{"description":"","imageDescription":"","modelDescription":"","sizeTableDescription":"","sizeTableRows":[{"unit":"inch","unitName":"Inches","title":"A","sizes":{"One Size":[14.5]}},{"unit":"centimeter","unitName":"Centimeters","title":"A","sizes":{"One Size":[36.83]}},{"unit":"inch","unitName":"Inches","title":"B","sizes":{"One Size":[16]}},{"unit":"centimeter","unitName":"Centimeters","title":"B","sizes":{"One Size":[40.64]}},{"unit":"inch","unitName":"Inches","title":"C","sizes":{"One Size":[24.5]}},{"unit":"centimeter","unitName":"Centimeters","title":"C","sizes":{"One Size":[62.23]}},{"unit":"inch","unitName":"Inches","title":"D","sizes":{"One Size":[1]}},{"unit":"centimeter","unitName":"Centimeters","title":"D","sizes":{"One Size":[2.54]}}],"imageId":150819}}')

        # ast.literal can't handle  "imageId": null, so we rewrite this, and later we drop this whole unused section
        # pf_advanced_size_chart = ast.literal_eval(next(item for item in product['meta_data'] if item["key"] == 'pf_advanced_size_chart')['value'].replace("null",""))
        # del pf_advanced_size_chart["productMeasurements"]
        # pf_advanced_size_chart["modelMeasurements"].update({"imageId": 150819})
        # pf_advanced_size_chart=

        meta_data = [
        {
            "key": "pf_advanced_size_chart",
            "value": json.dumps(pf_advanced_size_chart, escape_forward_slashes=False),
        },
        {
            "key": "rank_math_primary_product_cat",
            "value": rank_math_primary_cat,
        },
        {
            "key": "rank_math_focus_keyword",
            "value": strength_name + ",talent,zen," + garment_name,
        },
        ]

        global data_bags
        data_bags = {
            "name": product_name_without_append + product_name_append_bag,
            "short_description": short_description_bags,
            "description": description_bags,
            "default_attributes": [{"id": "1",
                                    "name": "Color",
                                    "option": "black"}],
            "meta_data": meta_data,
        }

    print(counter, 'of', count, strength_name, 'cat:', rank_math_primary_cat)

    categories = wcapi.get("products/" + str(key)).json()['categories']
    is_top = 0
    is_wtee = 0
    is_tee = 0
    is_bag = 0
    is_us = 0
    is_eu = 0
    is_ca = 0
    is_au = 0
    is_jp = 0
    for category in categories:
        if 'z-Ladies tank top' in category.values():
            is_top = 1
        elif 'z-Ladies tee' in category.values():
            is_wtee = 1
        elif 'z-Unisex tshirt' in category.values():
            is_tee = 1
        elif 'z-bag' in category.values():
            is_bag = 1

        if 'USA' in category.values():
            is_us = 1
        elif 'Europe' in category.values():
            is_eu = 1
        elif 'Canada' in category.values():
            is_ca = 1
        elif 'Australia-NZ' in category.values():
            is_au = 1
        elif 'Japan' in category.values():
            is_jp = 1

    if update_tee[0] and is_tee and is_us:
        prepare_tees()
        wcapi.put("products/" + str(key), data_tees_US_EU).json()
        print('updated ' + str(key) + ' z-Unisex tshirt - US and EU')
    if update_tee[1] and is_tee and is_ca:
        prepare_tees()
        wcapi.put("products/" + str(key), data_tees_CA).json()
        print('updated ' + str(key) + ' z-Unisex tshirt - CA')
    if update_tee[2] and is_tee and is_au:
        prepare_tees()
        wcapi.put("products/" + str(key), data_tees_AU_MX).json()
        print('updated ' + str(key) + ' z-Unisex tshirt - AU and MX')
    if update_tee[3] and is_tee and is_jp:
        prepare_tees()
        wcapi.put("products/" + str(key), data_tees_JP).json()
        print('updated ' + str(key) + ' z-Unisex tshirt - JP')

    if update_top[0] and is_top and is_us:
        prepare_tops()
        wcapi.put("products/" + str(key), data_tops_US).json()
        print('updated ' + str(key) + ' z-Ladies tank top - US')
    if update_top[1] and is_top and is_eu:
        prepare_tops()
        wcapi.put("products/" + str(key), data_tops_EU).json()
        print('updated ' + str(key) + ' z-Ladies tank top - EU')
    if update_top[2] and is_top and is_ca:
        prepare_tops()
        wcapi.put("products/" + str(key), data_tops_CA).json()
        print('updated ' + str(key) + ' z-Ladies tank top - CA')

    if update_w_tee[0] and is_wtee and is_us:
        prepare_wtees()
        wcapi.put("products/" + str(key), data_wtees_US).json()
        print('updated ' + str(key) + ' z-Ladies tee - US')
    if update_w_tee[0] and is_wtee and is_eu:
        prepare_wtees()
        wcapi.put("products/" + str(key), data_wtees_EU).json()
        print('updated ' + str(key) + ' z-Ladies tee - EU')

    if update_bag[0] and is_bag:
        prepare_bags()
        wcapi.put("products/" + str(key), data_bags).json()
        print('updated ' + str(key) + ' z-bag')
