# TemplatePUC
Este projeto destina-se a facilitar e corrigir o template original fornecido pela universidade PUC-Rio: *ModelPUC.cls*, que pode ser obtido através do site [CCPG](http://www.puc-rio.br/ensinopesq/ccpg/apresentacao_ted.html).

Dentre as diferenças entre o modelo original e o desenvolvido estão:

* Novo modelo: proposta de tese;
* Opção de omissão de cabeçalho com o nome dos capítulos;
* Correção do texto na capa e contra capa;
* Novo formato de referências bibliográficas;
* Opção de colocar a logo da PUC na pasta figs;
* Correção das palavras-chave na ficha catalográfica;
* Alteração dos espaçamentos entre equações;
* Possibilidade de nomenclatura setorizada;
* Gerenciamento das listas de figuras, tabelas e nomenclatura;
* Modificação da ordenação das subfiguras;
* Figuras e tabelas utilizando separador por "-" ao invés de ":";
* Numeração contínua de figuras e tabelas com possibilidade de numeração por capítulos por comando especificado;
* No sumário apenas capítulos e seções. Sem subfiguras na lista de figuras;
* Notas de rodapé sem numeração elevada;
* Cidade e universidade inicializada automaticamente;


## 1. Instalação
O funcionamento do template resume-se à instalação do [Tex Live](https://www.tug.org/texlive/acquire-netinstall.html). Feita a instalação, basta colocar o arquivo *TemplatePUC.cls* no diretório atual ou no diretório do Latex e atualizá-lo.

No Windows, coloque o arquivo *TemplatePUC.cls* na pasta:

> C:\texlive\2017\texmf-dist\tex\latex\templatePUC

Abrir o terminal do Tex Live (C:\texlive\2017\tlpkg\installer\tl-cmd.bat) e digitar:

> texhash


## 2. Instruções de Uso
As instruções de como utilizar o template está descrita no arquivo [instrucoes_uso.pdf](doc/InstrucoesUso/instrucoes_uso.pdf).

## 3. Exemplos
Os exemplos podem ser encontrados na pasta [*examples*](examples/). Se o arquivo *TemplatePUC.cls* não foi inserido nos arquivos do sistema, este deve ser copiado para a pasta do exemplo.

## 4. Compilação
Para a compilação recomenda-se o uso do Sublime Text, mas por conveniência será apresentado uma forma de compilar utilizando o TeX Live também.

### 4.1. TeX Live
No TeXworks basta inicializar o arquivo principal.

### 4.2. Sublime Text
No [Sublime Text](https://www.sublimetext.com/) existe o pacote [LatexTools](https://packagecontrol.io/packages/LaTeXTools), no qual basta abrir o arquivo *tex* e compilar com o comando (Ctrl+B).

Com o Sublime Text instalado siga os passos:
1. Instalar o package contol: Ctrl+Shift+P, "Install package", Enter
2. Abrir o package contol: Ctrl+Shift+P, "Install package", Enter
3. Instalar o pacote: "LatexTools"
4. Abrir arquivo tex e compilar com Ctrl+B.

É possível verificar se o latex está corretamente instalado fazendo:
Preferences > Package Settings > LatexTools > Check System.

Uma melhoria que pode ser feita é alterar algumas configurações do pacote LatexTools, para isso faça:
1. Preferences > Package Settings > LatexTools > Settings-User
2. No item "keep_focus", troque "true" para "false". Assim, após gerar o arquivo o foco será trocado para o arquivo pdf gerado.
3. No item "aux_directory", troque "" por "temp". Assim, os arquivos auxiliares serão gerados na pasta temp.
4. No item "output_directory", troque "" por "temp". Assim, os arquivos temporários serão gerados na pasta temp.

Alguns snippets foram criados para o desenvolvimento do documento utilizando o Sublime Text. Para ter acesso, basta copiar a pasta [Snippets](sublime_text/snippets) para dentro da pasta User do Sublime Text. Para encontrar a pasta User, basta ir em Preferences > Browse Packages... > User. Os possíveis snippets são:
* *\equation*: inserir equação simples
* *\align*: inserir equação alinhada
* *\multline*: inserir equação multilinha
* *\eqnarray*: inserir um equação organizada
* *\chapter*: inicializar um capítulo
* *\section*: inicializar uma seção
* *\subsection*: inicializar uma subseção
* *\subsubsection*: inicializar uma subsubseção
* *\figure*: inserir uma figura

## 5. Licença
A licença adotada foi a mesma do documento base, ou seja, GNU Free Documentation License, cuja cópia pode ser encontrada no arquivo [*LICENSING*](LICENSING).