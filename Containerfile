ARG COMPUTE_API=cpuonly

FROM docker.io/pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime as cuda
FROM docker.io/rocm/pytorch:rocm6.0_ubuntu20.04_py3.9_pytorch_staging_base as rocm
FROM docker.io/library/python:3.9 as cpuonly

FROM ${COMPUTE_API}
COPY . /app
RUN pip install -r /app/requirements.txt

ENTRYPOINT python3 /app/main.py --listen

