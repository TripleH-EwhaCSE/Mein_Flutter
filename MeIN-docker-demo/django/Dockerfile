# Django 최상위 루트에서 작성
FROM python:3.8
# 컨테이너 내에서 코드가 실행될 경로 설정
WORKDIR /app
# requirements.txt에 명시된 필요한 packages 설치
COPY ./django/requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Project를 /usr/src/app으로 복사
COPY . .
