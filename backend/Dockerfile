# syntax=docker/dockerfile:1.4
FROM python:3.13-alpine
WORKDIR /code

COPY requirements.txt /code
RUN pip3 install -r requirements.txt
COPY . /code
RUN [ "${APP_ENV}" == "prod" ] \
&& rm /code/config_dev.py \
|| mv /code/config_dev.py /code/config.py  

ENTRYPOINT ["python3"]
CMD ["app.py"]
