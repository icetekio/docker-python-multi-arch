FROM python:3.8
RUN pip install Flask==1.1.2
EXPOSE 8080
ADD app.py /app.py
# Never run the built in server for anything other then tests.
# It is considered a bad practice and a huge risk.
CMD ["python", "app.py"]
