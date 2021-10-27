# Bioinformática Aplicada à Imunologia
## Análise de Repertório (AIRR-Seq)

## Pré-requisitos:
- [Conda](https://docs.conda.io/en/latest/): Conda consiste em um sistema de administração de pacotes e ambientes, de codigo aberto, que possibilita a instalação e fácil execução de pacotes de softwares e suas respectivas dependências. 
- [MiXCR](https://mixcr.readthedocs.io/en/master/): O pacote de software MiXCR é uma ferramenta rápida e precisa para análise de sequenciamento de receptores de linfócitos B e T.
- [VDJviz](https://vdjviz.cdr3.net/): VDJviz é um visualizador browser de caracteristicas e parâmetros de dados de AIRR-Seq. 
## Instalação Conda:
As instruções básicas para instalação e executação de ambientes conda pode ser encontradas [aqui](https://www.digitalocean.com/community/tutorials/how-to-install-the-anaconda-python-distribution-on-ubuntu-20-04). Todavia, os comandos e etapas básicas serão descritas a seguir:
- Abra o terminal e digite:
```sh
cd 
cd/tmp
curl https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh --output anaconda.sh
```
- Ainda dentro do diretório ```/tmp```digite:
```sh
bash anaconda.sh 
```
Aperte ```ENTER``` ou ```yes``` toda vez que for requerido.
- Para ativar a instalação escreva:
```sh
source ~/.bashrc
```
Após o comando, sera criado automaticamente um ambiente ```(base)``` 

## Criacao do ambiente
- Deverá ser criado um abiente específico onde as ferramentas necessárias serão instaladas:
```sh
cd # Voltar para o diretório '''/home/username'''
conda activate --name {nome_ambiente} python=3 -y
```
- Para entrar no ambiente:
```sh
conda activate {nome_ambiente}
```
- Para instalar os softwares necessários:
```sh
conda install -c bioconda mixcr sra-tools 
```
