FROM python:3.11-slim-buster

WORKDIR /code

COPY ./app_requirements.txt /code/requirements.txt

COPY app_requirements.txt .
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:web_api", "--host", "0.0.0.0", "--port", "80"]