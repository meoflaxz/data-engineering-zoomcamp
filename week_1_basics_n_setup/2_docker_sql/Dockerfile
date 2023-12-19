FROM python:3.9.1

RUN pip install pandas


WORKDIR /app
COPY pipeline.py pipeline.py

RUN apt-get update && apt-get install dos2unix -y
RUN dos2unix pipeline.py



ENTRYPOINT [ "bash", "pipeline.py" ]