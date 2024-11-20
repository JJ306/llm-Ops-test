# # Use an official Python runtime as a parent image
# FROM python:3.8.10-slim-buster

# #COPY trained_models /trained_models
# COPY chat_test_api.py .
# COPY requirements.txt .
# RUN pip install --upgrade pip && pip install -r requirements.txt

# # Expose the port that FastAPI will run on
# EXPOSE 80

# # Command to run the FastAPI app
# #CMD ["uvicorn", "chat_test_api:app", "--host", "0.0.0.0", "--port", "8000"]
# # CMD gunicorn --bind 0.0.0.0:80 chat_test_api:app -k uvicorn.workers.UvicornWorker
# CMD ["uvicorn", "chat_test_api:app", "--host", "0.0.0.0", "--port", "80"]


FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8
# Copy requirements file
COPY ./requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY ./chat_test_api.py .

ENV SCRIPT_NAME=/server

# Expose port 80
EXPOSE 80

# Start the server on port 80
CMD ["uvicorn", "chat_test_api:app", "--host", "0.0.0.0", "--port", "80"]