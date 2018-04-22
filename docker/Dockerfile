FROM python:3
RUN apt-get update && apt-get install -f -y postgresql-client
ADD app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD app /app
ADD docker/run.sh /app
RUN chmod +x /app/run.sh
CMD [ "/bin/bash", "/app/run.sh"]