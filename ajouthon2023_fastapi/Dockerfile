FROM python:3.11.2

EXPOSE 35241
COPY ./backend /opt/project/backend
COPY requirements.txt /opt/project/

WORKDIR /opt/project/
RUN pip install --no-cache-dir --upgrade -r requirements.txt

WORKDIR /opt/project/backend
CMD python3 -X faulthandler main.py