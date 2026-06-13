FROM python:3.12-slim


WORKDIR /app



COPY . .



RUN pip install -r requirements.txt



RUN chmod +x scripts/*.sh



ENTRYPOINT [

"bash",

"scripts/audit.sh"

]
