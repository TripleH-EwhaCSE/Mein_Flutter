# MeIN

**Our Team**:

팀명: Triple**H** (Kim **H**yeon Jin, Lee **H**a Gyeong, **H**yun Ohjoo)

팀구성:	

- 이하경(이화여대 컴퓨터공학과)
- 김현진(이화여대 컴퓨터공학과)
- 현오주(이화여대 컴퓨터공학과)

**Idea:** 

## **메뉴판 사진 촬영을 통한 AI 한식 검색 어플리케이션**

한국어 읽고 쓰기의 어려움으로 한식을 검색할 수 없는 외국인을 위하여 사진 촬영을 통해 검색을 하고, 나아가 한식 리뷰를 분석하여 한식에 대한 직관적인 설명을 해준다.

**Vision:**

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled.png)

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%201.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%201.png)

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%202.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%202.png)

**Target Group:**

한식을 맛보고 싶으나 한국어에 서투르고 한식에 대해 잘 알지 못하는 외국인 관광객

외국인 손님과의 소통이 어려운 한식 식당 점주들

**Needs:**

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%203.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%203.png)

**비건, 알레르기 등의 음식 제한은 외국인들이 한국의 여행을 즐기지 못하는 이유이다.**

“강릉: 서울과 편도 2시간 거리, 다양한 토속 음식, 푸른 바다와 숲”- 외국인 메뉴판 없음. 

외국인 소통이 불가한 식당 주인들이 많음- 완벽한 관광도시 ↔ 외국인 제공관광에는 불친절한 강릉!

∴ 이미지 검색과 음식 데이터 분석으로 개인에게 필요한 강릉의 정보

**PoC:**

## **[Feature 1] 타이핑 없이 검색을?!**

**메뉴판 사진 촬영을 통한 이미지 검색**

- 메뉴판 사진에서 글자를 인식하는 AI 모델을 사용
- 한국어 인식 후 번역 API를 통한 영어 번역한 결과를 overlay하여 제공
- Overlay된 영어 버튼을 누르면 해당 음식의 정보를 볼 수 있음
- 한국어로 검색을 할 수 없는 외국인을 위한 기능

## **[Feature 2] 음식 정보의 모든 것!**

**음식 재료 / 비건 여부, 알레르기 유발 여부 정보 제공**

- 만개의 레시피 등의 사이트의 레시피 크롤링과 레시피 API을 통해 음식 정보 수집
- 음식 별 재료 분석을 통하여 특정 재료가 그 음식에 들어갈 확률, 비건 여부, 알레르기 유발 여부 정보 제공
- 외국인을 위해 번역된 정보를 제공

 

## **[Feature 3] 이 음식이 어떻다고?!**

**리뷰 분석 → 외국인의 한식 맛 표현에 대한 키워드 3개 뽑아서 보여줌**

- 같은 음식을 먹었을 때, 한국인이 느끼는 음식 맛 또는 맛 표현과 외국인이 느끼는 것에 차이가 있음
- 예로, 외국인의 입장에서 매운 정도는 한국인이 느끼는 매운 정도와 차이가 있음
- 외국인이 작성한 리뷰 분석을 통해 특정 음식의 특징을 그들의 입맛 반영하여 키워드로 제공
- 초기 데이터 부족으로 Yelp의 리뷰 데이터 분석을 통해 키워드 추출, 이후 사용자 리뷰 데이터 분석을 접목할 예정

**화면 Flow :**

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%204.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%204.png)

**ERD:NoSQL**

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%205.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%205.png)

**개발 환경 및 version Control :**

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%206.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%206.png)

- 도커 개발 환경 구축
- UI/UX : Figma
- Mobile application: Flutter
- Python(Pytorch/ Tensorflow)를 이용한 딥러닝/데이터 크롤러 개발
- NLPK와 Python을 통한 자연어 처리 및 분석
- Postman을 이용한 API 테스팅
- DB: FireBase & Django
- API server: GCP
- Git, GitHub을 이용한 버전 컨트롤

Tech Stack

DevOps: Docker, Nginx

Front-end: Flutter

Back-end: Flask, GUnicorn, Django

Database: MySQL, Firebase, GCS

AI: Tensorflow, Pytorch, Colab, OpenCV

Data Analysis: Colab, NLPK, KoNLPy, Selenium, Beautifulsoup

UI/UX: Figma

API Server: GCP

Git, GitHub을 이용한 버전 컨트롤

[Tech Stack](https://www.notion.so/ded5596d046e49e08dc1f1741be7cae4)

## Frontend: Flutter

1. Figma로 와이어프레임을 구성 
2. Material Components(Android)와 Cupertino Components(iOS)로 애플리케이션의 구성요소 설정
    1. Scaffold 
        1. appbar
        2. body 
            1. Stack, Positioned 패키지를 이용한 Widget UI 구현 
    2. Widget
3. Class와 Widget 기능 설명

    [Flutter Class & Widget](https://www.notion.so/a9ef46a2b25347d9abff3e91f6878535)

    1. Client Device의 카메라, 갤러리로부터 이미지를 받아오기 위한 Class
        1. State
        2. Future
        3. Widget
    2. Flask의 서버와의 REST 통신을 위한 Class
        1. Widget
    3. Firebase로 부터 데이터를 받아오기 위한 Class 
        1. Widget
4. 

## 재료 데이터 수집 및 분석

1. 재료 데이터 수집
- '식품의약품안전처'에서 '조리식품의 레시피' API 이용하여 데이터 수집
- '만개의 레시피'에서 Selenium과 BeautifulSoup을 이용하여 크롤링을 통해 데이터 수집

    여러 데이터 정보 중 음식 이름, 사진, 재료명을 추출하여 수집

    —> 총 약 10,000개의 데이터 수집

    —> 이 중 약 1400개의 데이터를 실험적으로 추출하여 분석

1. 데이터 전처리

    1) 재료 정보에 단위, 수량, 숫자 등 필요없는 부분 제거

    ex) 흑미밥\n쌀 90g, 검은 쌀 10g\n닭가슴살 삶기\n닭가슴살 40g(1/3개),...  

    위와 같이 데이터가 수집됨 → 한글만 남기고 제거(숫자, 영어, 특수문자 제거)

    - code

        ```python
        #재료 데이터에서 한글만 남기고 제거(숫자, 영어, 특수문자 제거)
        num=0
        for i in df_final['RCP_PARTS_DTLS'] :
            df_final['RCP_PARTS_DTLS'][num]=re.sub(pattern='[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\n, ]',repl='',string=i)
            #[^a-zA-Z,] 은 알파벳과 ',' 그리고 공백을 제외하고 모두 지우겠다는 의미.
            num+=1

        df_final["RCP_PARTS_DTLS"] = df_final["RCP_PARTS_DTLS"].str.replace(pat=r'[^\wA-Za-z0-9]', repl=r',', regex=True)
        ```

    2)  nltk와 KoNLPy를 사용하여 재료 정보를 한 단어씩 tokenizing 하여 명사만 추출

    - code

        ```python
        #재료 토큰
        from nltk.tokenize import word_tokenize
        from konlpy.tag import Okt  
        okt=Okt() 

        #재료 토크나이징 후 명사만 추출
        for i in range(len(df2['RCP_PARTS_DTLS'])):
          print(okt.nouns(df2['RCP_PARTS_DTLS'][i]))
        ```

    ![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%207.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%207.png)

    3) 이후 제거되지 않은 불용어 사전 제작 후, 불용어 제거

    ![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%208.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%208.png)

4) 재료명 일반화 및 단어 통일

- 구체적인 재료 명이 아닌 비건 또는 알레르기 유발 여부를 일으킬 수 있는 재료를 보여주는 것이 목적이므로 일반화할 수 있는 재료 리스트를 만듦
    - ex) 저염간장, 진간장, 국간장, 몽고간장 → 간장
    - ex) 홍파프리카, 청파프리카, 빨간파프리카, 노란파프리카 → 파프리카
    - ex) 흑미, 백미, 현미 → 쌀
    - ex) 닭가슴살, 닭다리살, 닭안심 → 닭고기

        등으로 재료명 사전 제작 후 치환

- 중복 제거: 한 메뉴에 중복되는 재료가 있는 경우 중복제거

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%209.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%209.png)

 

5) 전처리 된 최종 데이터

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2010.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2010.png)

1. 재료의 비건/알레르기 여부 데이터 생성

    1) 위의 Food_Ingredient 데이터 내의 모든 재료 추출 → 총 280개의 재료 사용

    ![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2011.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2011.png)

    2) 재료 리스트를 기반으로 비건/알레르기 사전 제작

    - 서칭을 통해서 정보 획득 후, boolean 값으로 사전 제작

2. 최종 데이터 파이어베이스에 업로드

[food raw data]

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2012.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2012.png)

[food ingredient raw data]

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2013.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2013.png)

1. 이후 목표
    - 현재 한국관광공사X카카오 관광 API 공모전에 선발되어 Tmap 네비게이션 데이터를 활용할 수 있음
    - 이 데이터는 지역별 식음료 검색 순위 top100에 대한 정보도 포함하여, 이를 기준으로 검색을 용이하게 만들 예정
    - 크롤링한 데이터를 더 활용하여, 정확한 비율을 제공할 예정

## 데이터 정리

1. 크롤링한 데이터가 너무 방대하고 음식 데이터와 재료 데이터가 따로 저장되어있는 문제 발생
2. 장고를 이용하여 파이어 베이스의 데이터를 로드하고, 음식에 들어 있는 재료 별로 비건 여부, 알레르기 여부 등을 재료 데이터에서 찾아 합쳐줌
3. 번역 - 음식 재료와 음식 명을 번역해 주었음 
    - Kakao i 번역 api 사용 → 인증 과정에서 계속 오류 발생
    - Papago 번역 api 로 해결
4. 데이터가 방대하다 보니 Too many request, time out 등의 에러가 발생
    - Django의 Background-tasks Library를 사용하여 리퀘스트 작업을 백그라운드로 끊어서 보내줌
    - SQLite를 이용하여 Background-tasks 저장, 주기적으로 리로드
5. 결과 화면

## Flutter 음식 재료 정보 및 알레르기 정보 제공

1. Firebase 연동으로 정보 추출
2. 각 음식이 들어갈 확률을 차트로 표시
3. Flutter 에서 리뷰 작성 시 Firebase로 전송 후, 플러터에서 바로 확인 가능
4. 결과 화면

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2014.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2014.png)

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2015.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2015.png)

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2016.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2016.png)

![MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2017.png](MeIN%209ed2f289c8dc451db9b7c8307132936c/Untitled%2017.png)

- Postman을 이용한 API 테스팅
- DB: FireBase & Django
- API server: GCP
- Git, GitHub을 이용한 버전 컨트롤
- Postman을 이용한 API 테스팅
- DB: FireBase & Django
- API server: GCP
- Git, GitHub을 이용한 버전 컨트롤
