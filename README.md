# Bioinformática Aplicada à Imunologia
## Análise de Repertório (AIRR-Seq)

## Pré-requisitos:
- [Conda](https://docs.conda.io/en/latest/): Conda consiste em um sistema de administração de pacotes e ambientes, de codigo aberto, que possibilita a instalação e fácil execução de pacotes de softwares e suas respectivas dependências. 
- [MiXCR](https://mixcr.readthedocs.io/en/master/): O pacote de software MiXCR é uma ferramenta rápida e precisa para análise de sequenciamento de receptores de linfócitos B e T.
- [VDJviz](https://vdjviz.cdr3.net/): VDJviz é um visualizador browser de caracteristicas e parâmetros de dados de AIRR-Seq. 
## Instalação Conda:
As instruções para instalação e executação de ambientes conda pode ser encontradas [aqui](https://www.digitalocean.com/community/tutorials/how-to-install-the-anaconda-python-distribution-on-ubuntu-20-04). Todavia, os comandos e etapas básicas serão descritas a seguir:
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
Após o comando, será criado automaticamente um ambiente ```(base)``` 

## Criação do ambiente para análises
- Deverá ser criado um abiente específico, onde as ferramentas serão instaladas:
```sh
cd # Voltar para o diretório ```/home/username```
mkdir airr_seq # Criação de um diretório específico
cd airr_seq # Entrar no diretório recém criado
conda activate --name {nome_ambiente} python=3 -y # Cria o ambiente
```
- Para entrar no ambiente:
```sh
conda activate {nome_ambiente}
```
- Para instalar os softwares necessários:
```sh
conda install -c imperial-college-research-computing mixcr -y
conda install -c bioconda sra-tools -y
```
## Coleta dos dados 
Os dados a serem analisados são oriundos do trabalho de [GALSON et al., 2020](https://www.frontiersin.org/articles/10.3389/fimmu.2020.605170/full). O banco de dados SRA do NCBI será acessado para coletar os dados de sequenciamento. O número de acesso do projeto é ```SRX8505845``` e será analisado a amostra ```SRR11961719```. A amostra em questão é de um homem, infectado com SARS-CoV-2, de 37.2 anos de idade e caucasiano. Encotrava-se em recuperação após ser internado em UTI e apresenta melhora no quadro clínico. O download da amostra é descrita a seguir:
```sh
fasterq-dump --split-files SRR11961719 
```


