# Bioinformática Aplicada à Imunologia
![](img/minicurso.png)
## Análise de Repertório (AIRR-Seq)
Sequenciamento de repertório de receptores de imunidade adaptativa (do inglês, *Adaptive Immune Receptor Repertoire Sequencing*, AIRR-Seq) emprega tecnologias de sequenciamento de alto rendimento (do inglês, *High Throughput Sequencing*, HTS) para estudar e compreender aspectos e dinâmicas de respostas adaptativa frente à diferentes estímulos antigênicos. Nessa etapa do minicurso, focaremos no AIRR-Seq de BCR/anticorpos.

## Informações Gerais
- Acesso ao Google Drive [aqui](https://drive.google.com/drive/folders/1oAg514MXdfBF8yA-0093998vkIrcn_zR?usp=sharing).
## *Softwares* Necessários:
- [Conda](https://docs.conda.io/en/latest/): Conda consiste em um sistema de administração de pacotes e ambientes, de codigo aberto, que possibilita a instalação e fácil execução de pacotes de *softwares* e suas respectivas dependências. 
- [MiXCR](https://mixcr.readthedocs.io/en/master/): MiXCR é uma ferramenta rápida e precisa para análise de sequenciamento de receptores de linfócitos B e T.
- [SRA Toolkit](https://github.com/ncbi/sra-tools): O SRA toolkit é uma coleção de ferramentas para acesso, coleta e processamento do banco de dados *Sequencing Read Archives* (SRA).
- [Seqtk](https://github.com/lh3/seqtk): O seqtk é uma ferramenta para processamento de sequencias em formato FASTA ou FASTQ.  
- [VDJviz](https://vdjviz.cdr3.net/): VDJviz é um visualizador *browser*  de dados de AIRR-Seq. 
## Jupyter Lab:
O JupyterLab consiste em um ambiente de desenvolvimento integrado (IDE) *web*. A partir do JupyterLab pode-se executar interfaces apropriadas para condução de *workflows* em areas como ciências de dados e computação científica. Para fins de minicurso, iremos utilizar o JupyterLab para condução das análises práticas de AIRR-Seq. Para se ter acesso ao ambiente para condução das análises clique [aqui](https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/HEAD?urlpath=lab/tree/demo).   

## Criação do ambiente Conda
- Deverá ser criado um ambiente específico, onde as ferramentas serão instaladas:
```sh
mkdir airr_seq # Criar um diretório específico
cd airr_seq # Entra no diretório recém criado
conda activate --name {nome_ambiente} python=3 -y # Cria o ambiente
```
- Para entrar no ambiente:
```sh
conda activate {nome_ambiente}
```
- Para instalar os *softwares* necessários:
```sh
conda install -c imperial-college-research-computing mixcr -y
conda install -c bioconda sra-tools seqtk -y
```
## Coleta dos dados 
Os dados a serem analisados são oriundos do trabalho de [GALSON et al., 2020](https://www.frontiersin.org/articles/10.3389/fimmu.2020.605170/full). O banco de dados [SRA](https://www.ncbi.nlm.nih.gov/sra) do NCBI será acessado para coleta dos dados de sequenciamento. O número de acesso do projeto é ```SRX8505845``` e será analisado apenas a amostra ```SRR11961719``` para fins de exemplificação. A amostra em questão é de um homem, infectado com SARS-CoV-2, de 37.2 anos de idade e caucasiano. Encontrava-se em recuperação após ser internado em UTI e apresentava melhora no quadro clínico. 
- O *download* da amostra é descrita a seguir:
```sh
fastq-dump --split-files SRR11961719 
```
- Uma vez baixado, se obterá apenas um subconjunto de 10000 *reads* dessa amostra total:
```sh
seqtk sample -s100 SRR11961719_1.fastq 10000 > SRR11961719_subreads_1.fastq
seqtk sample -s100 SRR11961719_2.fastq 10000 > SRR11961719_subreads_2.fastq
```
- A coleta de apenas um porção aleatória da amostra em questão tem dois propósitos principais:
1. Viabilizar as análises dos dados em um tempo razoável para fins de minicurso.
2. A ferramenta de visualização, VDJviz, impõe um volume de dados máximo para se carregar na plataforma.

## Execução da análise
Para analisar a amostra recém obtida, será executado o *software* MiXCR. Dentro do diretório criado anteriormente, onde a amostra encontra-se, execute na linha de comando:
```sh
mixcr analyze amplicon --species hs \
        --starting-material rna \
        --5-end v-primers \
        --3-end j-primers \
        --adapters adapters-present \
        --receptor-type IGH \
       SRR11961719_subreads_1.fastq SRR11961719_subreads_2.fastq analysis
```
Diversos arquivos serão gerados. Todavia, o arquivo de interesse será ```analysis.clonotype.IGH.txt```.  
## Visualização dos dados
O arquivo ```analysis.clonotype.IGH.txt``` será visualizado utilizando a ferramenta [VDJviz](https://vdjviz.cdr3.net/). 
- ATENÇÃO:
O VDJviz é uma ferramente de demonstração (demo). Na prática, uma fez com que o cadastro seja feito, cada aluno terá acesso à ferramenta algumas poucas vezes. Por isso, certifique-se de que o arquivo ```analysis.clonotype.IGH.txt``` seja obtido adequadamente antes de se realizar o cadastro no VDJviz. Peço desculpas quanto à essa questão, todavia essa ferramenta *web* foi a mais simples e acessível que pudemos encontrar para visualizar os dados obtidos anteriormente. Instalar o VDJviz como servidor local pode ser feito e mais informações são encontrada [aqui](https://github.com/antigenomics/vdjviz). 

## Análise de expressão diferencial com RNA-seq
A partir do sequênciamento de RNA utilizando sequenciadores de próxima geração (NGS), como o Illumina, podemos fazer diversas análises relacionadas com a expressão gênica, que poderão fornecer informações sobre o estado e a dinâmica das células. Em imunologia pode servir de base para entender os mecanismos da resposta imune. Nessa etapa do minicurso veremos um pouco como são feitas as análises de RNA-seq no programa R.

## Preparação do ambiente no Jupyter
- No terminal do jupyter digite:
```sh
git clone https://github.com/dimitrisokolowskei/minicurso_ufpel.git # Baixar repositório
chmod u+x minicurso_ufpl/prep_jupyter.sh # Tornar arquivo executácel
.minicurso_ufpl/prep_jupyter.sh # Executar arquivo     
```
                
## Exemplos de análises
Poderão ser encontrados no arquivo do Drive.
