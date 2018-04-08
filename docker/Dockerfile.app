FROM python:3
ADD app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD app /app
ENTRYPOINT ["python","/app/manage.py","runserver","80"]