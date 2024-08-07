FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime



## Install your dependencies here using apt install, etc.

## OPENCV
RUN apt-get update && apt-get install -y python3-opencv 

RUN pip install -U openmim  
RUN mim install "mmengine==0.10.4"
RUN mim install "mmcv==2.0.1" 
RUN mim install "mmdet==3.1.0"

## DO NOT EDIT these 3 lines.
RUN mkdir /challenge
COPY ./ /challenge
WORKDIR /challenge

## Include the following line if you have a requirements.txt file.
RUN pip install -r requirements.txt && pip install -r TeamCode/requirements.txt

ENV EXPECTEDDEVICE=gpu