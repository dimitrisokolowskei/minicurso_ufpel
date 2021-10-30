#!/bin/bash

source /srv/conda/etc/profile.d/conda.sh

conda create --name R python=3.9 -y
conda activate R

conda install mamba -n base -c conda-forge -y

conda update -n base conda -y
conda update --all -y

mamba create -n R -c conda-forge r-base -y

mamba install -c conda-forge r-essentials -y

conda config --add channels bioconda
conda config --add channels conda-forge

conda install pandas numpy -y

conda install -c bioconda sra-tools -y
conda install -c bioconda entrez-direct -y
conda install -c bioconda fastqc -y
conda install -c bioconda fastp -y
conda install -c bioconda quast -y
conda install -c bioconda htseq -y
conda install -c bioconda seqtk -y
conda install -c bioconda samtools -y
conda install -c bioconda r-xml -y

R -e "install.packages('BiocManager',repos='https://cran.ma.imperial.ac.uk/')"

R -e "install.packages('IRkernel')"
R -e "IRkernel::installspec()"

R -e "BiocManager::install(c('limma','edgeR','Glimma','org.Mm.eg.db', 'statmod'))"

pip3 install IPython
