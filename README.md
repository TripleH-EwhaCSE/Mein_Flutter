# MeIN

**Our Team**:

팀명: Triple**H** (Kim **H**yeon Jin, Lee **H**a Gyeong, **H**yun Ohjoo)

팀구성:	
- 이하경(이화여대 컴퓨터공학과)
- 김현진(이화여대 컴퓨터공학과)
- 현오주(이화여대 컴퓨터공학과)


**Idea:** 

## **메뉴판 사진 촬영을 통한 AI 한식 검색 어플리케이션**

<img width="658" alt="Untitled" src="https://user-images.githubusercontent.com/52443092/127444688-4ee23a91-5e2f-46bf-b360-896d50186d80.png">
<img width="568" alt="Untitled 1" src="https://user-images.githubusercontent.com/52443092/127444701-b278108c-b981-4259-88c5-397fb005cc80.png">
<img width="629" alt="Untitled 2" src="https://user-images.githubusercontent.com/52443092/127444707-9f6fb619-8a47-45f6-9f40-0fea442b7d2b.png">


**Target Group:**

한식을 맛보고 싶으나 한국어에 서투르고 한식에 대해 잘 알지 못하는 외국인 관광객

외국인 손님과의 소통이 어려운 한식 식당 점주들


**Needs:**

<img width="359" alt="Untitled 3" src="https://user-images.githubusercontent.com/52443092/127444737-90172296-da33-47bf-bea2-fd3256b35e5c.png">

**비건, 알레르기 등의 음식 제한은 외국인들이 한국의 여행을 즐기지 못하는 이유이다.**


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

<img width="652" alt="Untitled 4" src="https://user-images.githubusercontent.com/52443092/127444759-5af29c20-c137-4e51-95a5-2085ad076ed6.png">


**ERD:NoSQL**

<img width="581" alt="Untitled 5" src="https://user-images.githubusercontent.com/52443092/127444778-8fa1e1b8-0d37-4501-9805-a7b0aada394d.png">


**개발 환경 및 version Control :**

<img width="575" alt="Untitled 6" src="https://user-images.githubusercontent.com/52443092/127444835-f2687c70-62a8-4607-9f4d-af0052057c10.png">


## Frontend: Flutter

1. Figma로 와이어프레임을 구성 

2. Material Components(Android)와 Cupertino Components(iOS)로 애플리케이션의 구성요소 설정

    1. Scaffold 
        1. appbar
        2. body 
            1. Stack, Positioned 패키지를 이용한 Widget UI 구현 
            
    2. Widget

3. Class와 Widget 기능 설명

    1. Client Device의 카메라, 갤러리로부터 이미지를 받아오기 위한 Class
        1. State
        2. Future
        3. Widget
      
    2. Flask의 서버와의 REST 통신을 위한 Class
        1. Widget

    3. Firebase로 부터 데이터를 받아오기 위한 Class 
        1. Widget


## 재료 데이터 수집 및 분석

1. 재료 데이터 수집
- '식품의약품안전처'에서 '조리식품의 레시피' API 이용하여 데이터 수집
- '만개의 레시피'에서 Selenium과 BeautifulSoup을 이용하여 크롤링을 통해 데이터 수집

2. 데이터 전처리

    1) 재료 정보에 단위, 수량, 숫자 등 필요없는 부분 제거

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

    <img width="514" alt="Untitled 7" src="https://user-images.githubusercontent.com/52443092/127445092-e372dea4-16dd-482c-855c-bae19c970df1.png">



    3) 이후 제거되지 않은 불용어 사전 제작 후, 불용어 제거
    <img width="540" alt="Untitled 8" src="https://user-images.githubusercontent.com/52443092/127445106-6896d342-623f-49b2-bd75-25d33cfef688.png">

    4) 재료명 일반화 및 단어 통일

    - 구체적인 재료 명이 아닌 비건 또는 알레르기 유발 여부를 일으킬 수 있는 재료를 보여주는 것이 목적이므로 일반화할 수 있는 재료 리스트를 만듦

    - 중복 제거: 한 메뉴에 중복되는 재료가 있는 경우 중복제거

    <img width="480" alt="Untitled 9" src="https://user-images.githubusercontent.com/52443092/127445167-c907132a-56ef-4e3f-a9a4-9ae5b972c392.png">


    5) 전처리 된 최종 데이터
    <img width="1573" alt="Untitled 10" src="https://user-images.githubusercontent.com/52443092/127445231-1b3cdca8-480c-42f1-9623-3fab0da15f77.png">


3. 재료의 비건/알레르기 여부 데이터 생성

    1) 위의 Food_Ingredient 데이터 내의 모든 재료 추출 → 총 280개의 재료 사용

    <img width="168" alt="Untitled 11" src="https://user-images.githubusercontent.com/52443092/127445244-f552b6ff-2448-4a74-9c04-f14836045f3a.png">


    2) 재료 리스트를 기반으로 비건/알레르기 사전 제작

    - 서칭을 통해서 정보 획득 후, boolean 값으로 사전 제작


4. 최종 데이터 파이어베이스에 업로드

[food raw data]

<img width="637" alt="Untitled 12" src="https://user-images.githubusercontent.com/52443092/127445258-626d6e58-962b-4338-935a-ac3ef61114f6.png">

[food ingredient raw data]

<img width="637" alt="Untitled 13" src="https://user-images.githubusercontent.com/52443092/127445266-88d69186-fc52-41fa-a407-75f0b1aca5d8.png">


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
<div style = "display : flex;">
<img width="360" alt="Untitled 13" src="https://user-images.githubusercontent.com/52443092/127445279-730c0ae0-46c7-4079-a872-457abc0b41f7.png">
<img width="360" alt="Untitled 14" src="https://user-images.githubusercontent.com/52443092/127445285-1cde47a3-50c5-4aa6-81ee-b22b71ab6420.png">
</div>
<div style = "display : flex;">
<img width="360" alt="Untitled 15" src="https://user-images.githubusercontent.com/52443092/127445292-d269c844-026a-49bb-a110-d374863bb9da.png">
<img width="360" alt="Untitled 16" src="https://user-images.githubusercontent.com/52443092/127445297-b52209d2-f8f0-4920-a3a5-65dd461a29f0.png">
</div>
