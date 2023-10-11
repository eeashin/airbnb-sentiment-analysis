FROM jupyter/pyspark-notebook:latest

# Switch to the root user to install packages
USER root

# Install pymongo using pip
RUN pip install pymongo sparknlp
RUN pip install --upgrade 'jupyter-server<2.0.0'
# Change back to the default user (jovyan)
USER jovyan