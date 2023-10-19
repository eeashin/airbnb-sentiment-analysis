FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=2.4
ARG jupyterlab_version=2.1.5

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install pymongo && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} && \
    #pip install -q findspark && \
     pip install spark-nlp
RUN pyspark --packages com.johnsnowlabs.nlp:spark-nlp_2.12:5.1.3 
   
ENV JAVA_HOME /usr/local/openjdk-8
# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=