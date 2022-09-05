FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ARG SERIAL_DEVICE

CMD [ "python", "./__main__.py", SERIAL_DEVICE ] 