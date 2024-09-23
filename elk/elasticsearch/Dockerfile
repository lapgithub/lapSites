FROM elasticsearch:7.14.1

WORKDIR  /usr/share/elasticsearch/plugins

COPY analysis-smartcn-7.14.1.zip ./
COPY elasticsearch-analysis-ik-7.14.1.zip ./

# 官方中文分词 smartcn
RUN unzip analysis-smartcn-7.14.1.zip -d smartcn && rm -f analysis-smartcn-7.14.1.zip
# ik中文分词 ik_max_word  ik_smart
RUN unzip elasticsearch-analysis-ik-7.14.1.zip -d ik && rm -f elasticsearch-analysis-ik-7.14.1.zip



