# HangeulHandwriting Recognition

### capstone design project - start


## Introduction

다양한 폰트와 손글씨 데이터를 가지고, 얼마나 한글 글자를 잘 인식하는지 확인하기 위해서 진행한 테스트 프로젝트이다.

### python and pakage version
```
python3 == 3.8.3
tensorflow_gpu == 2.3.0
numpy == 1.19.5
argparse == 1.1
pandas == 1.2.0
cv2 == 4.5.1
streamlit == 0.74.1
streamlit_drawable_canvas
```
### Training Data
TextRecognitionDataGenerator로 생성한 글자 이미지 100,099장과 AI Hub에서 제공하는 글자 이미지 404,474장을 사용했다.

#### TextRecognitionDataGenerator

Github : https://github.com/Belval/TextRecognitionDataGenerator

font파일과 생성할 글자들을 모은 txt파일이 있으면, 위의 TextRecognitionDataGenerator를 통해서 글자 이미지를 생성할 수 있다.

1. font 추가(.ttf파일)
- 생성에 사용된 font는 기본으로 사용되는 font와 네이버에서 제공되는 손글씨 폰트를 추가했다.

2. 학습용 글자 음절 추가(.txt파일)
- 사용되는 글자는 KS X 1001 완성형에 포함된 현대 한글 2350자를 사용하였다. 

#### AI Hub

Link : https://aihub.or.kr/aidata/133

AI Hub에서 현대 한글 11,172자를 가장 많이 활용하는 폰트 50종을 선정하여 학습용 이미지와 어노테이션을 제공한다. 또한, 손글씨도 제공하는데, 연령층별로 손글씨 작성인력을 확보해 직접 작성 제작한 손글씨 이미지와 어노테이션을 제공한다. 
          
### Model

Clova deep-text-recognition에서 사용한 CNN(VGG)의 구조를 활용하였다. (https://arxiv.org/pdf/1507.05717.pdf)
Github : https://github.com/clovaai/deep-text-recognition-benchmark


### Create dataset

Data는 이미지의 경로와 라벨을 csv파일에 저장하였고, csv파일을 읽어서 Train/Valid Dataset을 생성하였다.
Datatset 생성 과정에서 이미지의 크기를 32px x 32px로 resize하고, pixel값이 [0, 1]의 값을 갖도록 normalization을 적용해주었다. (dataset.py)

### Training and Validation

기본적으로 train.py를 실행하면 default 설정으로 학습이 진행된다. 
epochs, batch_size, 모델 weight save path, data파일 위치 등을 설정할 수 있다.

### Predict

test 이미지를 저장할 폴더를 test_data에 설정하고, 학습된 모델의 weight 저장 위치를 saved_model에 설정한다. test.py를 실행하면, 예측 결과를 프린트한다.

### Using streamlit

```
streamlit run webapp.py
```
위 명령어로 실행하면 Streamlit을 사용해서 웹앱으로 구현을 할 수 있다. 
왼쪽 canvas에 글자를 쓰면, 오른쪽에 모델이 recognition한 이미지가 나타나고, 결과를 보여준다.

