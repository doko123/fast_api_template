FROM python:3.7 as builder

LABEL maintainer="Dominika Kowalczyk <dominika15kowalczyk@gmail.com>"


######################
# Install Dependencies
######################
COPY /requirements.txt /req/
RUN pip3 install -U pip
RUN pip3 install fastapi uvicorn
RUN cd /req && pip3 install --no-cache-dir -r requirements.txt



######################
# Install Application
######################
COPY ./app /app


######################
# Set Application Environment Variables
######################

ENV PYTHONPATH=/app \
    DYNACONF_SETTINGS=settings


# Expose ports
EXPOSE 8000

WORKDIR /app

# Execute the app
CMD ["uvicorn", "--host", "0.0.0.0", "main:app", "--reload"]