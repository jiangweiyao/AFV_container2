FROM continuumio/miniconda3

# Install the conda environment
COPY environment.yml /
RUN conda env update --file environment.yml && conda clean -a

RUN echo "Make sure libraries are installed:"
RUN python -c "import fiona"
RUN python -c "import tabula"
RUN python -c "import pyarrow"


# Dump the details of the installed packages to a file for posterity
RUN conda env export --name base > base.yml


