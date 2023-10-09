FROM michaelfong2017/cuda11.8-conda:latest

RUN conda install -y python=3.9

RUN conda install -y -c dglteam/label/cu118 dgl
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

RUN pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.3.0/en_core_web_lg-3.3.0.tar.gz

WORKDIR /doc2graph

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt update && apt install -y tesseract-ocr

COPY . .

RUN pip install setuptools-git-versioning && pip install -e .

CMD [ "/bin/bash" ]
