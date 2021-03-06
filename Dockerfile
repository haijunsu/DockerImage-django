FROM python:3.8

MAINTAINER Haijun (Navy) Su <navysu@gmail.com>

RUN mkdir -p /storage/wwwroot
WORKDIR /storage/wwwroot

COPY requirements.txt /storage/wwwroot
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -u 1000 djangoUser
USER djangoUser

EXPOSE 8000

ENTRYPOINT  ["python", "/storage/wwwroot/web/manage.py", "runserver", "--noreload", "0.0.0.0:8000"]
