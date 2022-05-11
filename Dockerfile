FROM python:3.8-slim

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN python setup.py build && python setup.py install

VOLUME [ "/data" ]

ENTRYPOINT ["tg-archive"]
CMD ["-c", "/data/config.yml"]