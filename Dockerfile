ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    python3 \
    py3-pip

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy data for add-on
COPY . /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]