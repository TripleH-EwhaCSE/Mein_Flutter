# kakao ocr + translation
# -- coding: utf-8 --
from flask import Flask, request, jsonify

test = Flask(__name__)
test.config['JSON_AS_ASCII'] = False

import json
import cv2
import requests
import sys

from kakaotrans import Translator #https://github.com/monologg/kakaotrans

import numpy as np
from PIL import Image
import urllib.request

#from google.cloud import storage

LIMIT_PX = 1024
LIMIT_BYTE = 1024 * 1024
LIMIT_BOX = 40

#kako api key
rest_api_key = 'e4413c2fd1563978272bb92df92acb6f'

def kakao_ocr_resize(image):
    """
    ocr detect/recognize api helper
    ocr api의 제약사항이 넘어서는 이미지는 요청 이전에 전처리가 필요.

    pixel 제약사항 초과: resize
    용량 제약사항 초과  : 다른 포맷으로 압축, 이미지 분할 등의 처리 필요. (예제에서 제공하지 않음)

    :param image_path: 이미지파일 경로
    :return:
    """
    #image = cv2.imread(image_path)
    height, width, _ = image.shape
    print(image.shape)

    if LIMIT_PX < height or LIMIT_PX < width:
        ratio = float(LIMIT_PX) / max(height, width)
        image = cv2.resize(image, None, fx=ratio, fy=ratio)
        height, width, _ = height, width, _ = image.shape

        # api 사용전에 이미지가 resize된 경우, recognize시 resize된 결과를 사용해야함.
        # image_path = "{}_resized.jpg".format(image_path)
        # cv2.imwrite(image_path, image)

        # return image_path
    return None


def kakao_ocr(image, appkey: str):
    """
    OCR api request example
    :param image_path: 이미지파일 경로
    :param appkey: 카카오 앱 REST API 키
    """
    print(image.shape)
    API_URL = 'https://dapi.kakao.com/v2/vision/text/ocr'

    headers = {'Authorization': 'KakaoAK {}'.format(appkey)}

    #image = cv2.imread(image)
    jpeg_image = cv2.imencode(".jpg", image)[1]
    data = jpeg_image.tobytes()

    return requests.post(API_URL, headers=headers, files={"image": data})

def lan_detection(material_list:list):
    url = "https://dapi.kakao.com/v3/translation/language/detect"
    for i in range(len(material_list)):
        queryString = {
            "query": material_list[i]
        }
        header = {"Authorization": "KakaoAK e4413c2fd1563978272bb92df92acb6f"}
        r = requests.get(url, headers=header, params=queryString)

        # resoponse 딕셔너리로 변환
        r_dic = r.json()

        # 딕셔너리에 있는 "language_info" 값 추출
        language_info = r_dic["language_info"]

        # language_info의 첫번째 결과 추출
        language_info_first = language_info[0]

        lan_list = []

        # "code" 값 추출
        lan_list.append(language_info_first["code"])

        return lan_list

def translation(material_list:list):
    translator = Translator()
    material_list_kor = material_list['kor']
    material_result_list = material_list['eng']
    for i in range(len(material_list_kor)):
        material_result_list.append(translator.translate(material_list_kor[i], src='kr', tgt='en'))

    #print(material_result_list)
    
def url_to_image(url):
    #res = requests.get(url)
    res = urllib.request.urlopen(url)
    image = np.asarray(bytearray(res.read()), dtype="uint8")
    image = cv2.imdecode(image, cv2.IMREAD_COLOR)
    return image

trans = {"kor":[],"eng":[],"coordi":[]}
final_print = {"result":[],"size":[]}

@test.route("/result",methods =['GET','POST'])
def result():
    #image_path = 'test.jpeg'
    
    #get image name from flutter
    imagename = request.get_json()
    filename = str(imagename['imagename'])
    image_path_url = "https://storage.googleapis.com/mein-bucket-1/" + filename
    image = url_to_image(image_path_url)
    
    resize_img = kakao_ocr_resize(image)
    if resize_img is not None:
        image = resize_img
        print("원본 대신 리사이즈된 이미지를 사용합니다.")

    output = kakao_ocr(image, rest_api_key).json()
    #print("[OCR] output:\n{}\n".format(json.dumps(output, sort_keys=True, indent=2, ensure_ascii=False)))
    
    final = {"result":[],"size":[]}
    print(final)
    trans = {"kor":[],"eng":[],"coordi":[]}

    result = {"coordi":[],"content":[]}
    #global trans
    #trans = {"kor":[],"eng":[],"coordi":[]}
    outputdata = json.dumps(
        output, ensure_ascii=False, sort_keys=True, indent=2)
    outputdata = json.loads(outputdata)
    for i in range(len(outputdata['result'])):
            trans["kor"].append(outputdata['result'][i]['recognition_words'][0])
             #print(outputdata['result'][i]['recognition_words'][0])

            for k in outputdata['result'][i]['boxes']:
                result['coordi'].append(k)
                #trans["coordi"].append(k)
            trans["coordi"].append(outputdata['result'][i]['boxes'])
            for j in outputdata['result'][i]['recognition_words'][0]:
                result['content'].append(j)
    #print(result)
    #print(type(result["coordi"]))
    #print(result["coordi"][0])
    #print(result["content"][0])

    translation(trans)
    #print(trans)
    # print(trans["kor"])
    #return trans
    #global final
    
    for l in range(len(trans["eng"])):
        # print(trans["kor"][l])
        # print(trans["eng"][l])
        # print(trans["coordi"][l])
        # final["result"].append(trans["kor"][l])
        # final["result"].append(trans["eng"][l])
        # final["result"].append(trans["coordi"][l])
        #
        final["result"].append([])
        final["result"][l].append(trans["kor"][l])
        final["result"][l].append(trans["eng"][l])
        final["result"][l].append(trans["coordi"][l])
        
    height, width, _ = image.shape
    final["size"].append(width)
    final["size"].append(height)

    print(final)
    #print(type(final))
    global final_print
    final_print = final.copy()
    
    return final

@test.route("/")
def main():
    #return "MeIN OCR Result Flask Server"
    global final_print
    #print(final_print)   
    return final_print


if __name__ == "__main__":
    #main()
    #test.run(host='0.0.0.0', port=5000)
    test.run(host='0.0.0.0', port=8000)