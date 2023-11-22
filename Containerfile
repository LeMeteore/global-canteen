FROM python:3.10-slim

MAINTAINER Nsukami <ptrck@nskm.xyz>
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
WORKDIR /code
COPY . /code
RUN pip install --upgrade pip && pip install --no-cache-dir -r /code/requirements.txt
EXPOSE 5000
ENTRYPOINT ["streamlit", "run", "application.py", "--server.port=5000", "--server.address=0.0.0.0"]
