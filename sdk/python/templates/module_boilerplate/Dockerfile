FROM python:3.10-slim
COPY agent.py /app/agent.py
RUN pip install --no-cache-dir pyyaml
ENTRYPOINT ["python","/app/agent.py"]
