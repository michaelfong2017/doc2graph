FROM michaelfong2017/cuda11.8-conda:latest

RUN conda install -y python=3.9

RUN conda install -y -c dglteam/label/cu118 dgl
RUN conda install -y pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 pytorch-cuda=11.8 -c pytorch -c nvidia

WORKDIR /doc2graph
COPY . .

RUN pip install setuptools-git-versioning && pip install -e .
RUN pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.3.0/en_core_web_lg-3.3.0.tar.gz

CMD [ "/bin/bash" ]
