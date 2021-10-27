# Bioinformatica Aplicada a Imunologia
## Analise de Repertorio (AIRR-Seq)

## Pre-requisitos:
- [Conda](https://docs.conda.io/en/latest/): Conda consiste em um sistema de administracao de pacotes e ambientes, de codigo aberto, que possibilita a instalacao e facil execucao de pacotes de softwares e suas respectivas dependencias. 
- [MiXCR](https://mixcr.readthedocs.io/en/master/): O pacote de software MiXCR e uma ferramenta rapida e precisa para analise de sequenciamento de receptores de linfocitos B e T.
- [VDJviz](https://vdjviz.cdr3.net/): VDJviz e um visualizador browser de caracteristicas e parametros de dados de AIRR-Seq. 
## Instalacao Conda:
As instrucoes basicas para instalacao e executacao de ambiente conda pode ser encontrada [aqui](https://www.digitalocean.com/community/tutorials/how-to-install-the-anaconda-python-distribution-on-ubuntu-20-04). Todavia, os comandos e etapas basicas serao descritas a seguir:
- Abra o terminal e digite:
```sh
cd 
cd/tmp
curl https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh --output anaconda.sh
```
- Ainda dentro do diretorio ```/tmp```digite:
```sh
bash anaconda.sh 
```
Aperte ```ENTER``` ou ```yes``` toda vez que for requerido.
- Para ativar a instalacao escreva:
```sh
source ~/.bashrc
```
Apos o comando, sera criado automaticamente um ambiente ```(base)``` 

## Criacao do ambiente
- Devera ser criado um abiente especifico onde as ferramentas necessarias serao instaladas:
```sh
conda activate --name {nome_ambiente} python=3
```
- Para entrar no ambiente:
```sh
conda activate {nome_ambiente}
```
- Para instalar os softwares necessarios:
```sh
conda install -c bioconda mixcr sra-tools 
```
