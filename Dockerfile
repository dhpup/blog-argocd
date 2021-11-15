FROM python:3.8.2-alpine3.11
ENV CONDUIT_SECRET='something-really-secret'
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
ENV HONEYCOMB_WRITEKEY='1252c1ce92b00ad574131fa6e873366d'

COPY . /app

WORKDIR /app

RUN pip install --editable .
RUN pip install honeycomb-beeline

RUN flask init-db

# Unit tests
# RUN pip install pytest && pytest

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0" ]