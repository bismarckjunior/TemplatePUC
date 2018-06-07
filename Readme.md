# TemplatePUC
Este projeto destina-se a facilitar e corrigir o template original fornecido pela universidade PUC-Rio: *ModelPUC.cls*, que pode ser obtido através do site [CCPG].

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
O funcionamento do template resume-se à instalação do [Tex Live]. Feita a instalação, basta colocar o arquivo *TemplatePUC.cls* no diretório atual ou no diretório do LaTeX e atualizá-lo.

### 1.1. Windows

#### 1.1.1. Instalação Simples
No Windows, baixe e execute *install-tl-windows.exe*. Após a instalação, coloque o arquivo *TemplatePUC.cls* na pasta:

> C:\texlive\2017\texmf-dist\tex\latex\TemplatePUC

Abra o terminal do Tex Live (procurando no menu iniciar ou indo em C:\texlive\2017\tlpkg\installer\tl-cmd.bat) e digite:

> texhash

Caso haja uma nova versão do arquivo *TemplatePUC.cls* basta realizar o download e substiuí-lo.

#### 1.1.2. Instalação com Git

No Windows, baixe e execute *install-tl-windows.exe*. Após a instalação, abra o terminal git e digite:

> cd C:/texlive/2017/texmf-dist/tex/latex/TemplatePUC
> git clone https://github.com/bismarckjunior/TemplatePUC.git

Abra o terminal do Tex Live (procurando no menu iniciar ou indo em C:\texlive\2017\tlpkg\installer\tl-cmd.bat) e digite:

> texhash

Caso haja uma nova versão do projeto, basta realizar um pull para receber a atualização. Para isso, abra o terminal git e digite:

> cd C:/texlive/2017/texmf-dist/tex/latex/TemplatePUC
> git pull

### 1.2. Linux

No Linux, baixe o arquivo *install-tl-unx.tar.gz* e descompacte com o comando:

> tar -xzf install-tl-unx.tar.gz

Abra na pasta descompactada e inicie a instalação:

> cd install-tl-??????/
> sudo ./install-tl

Na instalação, opte pela opção [i] e pressione enter.

Adicione o caminho do TeX Live ao path do sistema, abrindo o arquivo *environment* com o comando:

> sudo gedit /etc/environment

Adicione o caminho do TeX Live no final da variável PATH, ou seja, trocando:

> PATH="/usr/local/sbin:/usr [...] :/usr/local/games:"

por:

> PATH="/usr/local/sbin:usr [...] :/usr/local/games:/usr/local/texlive/2018/bin/x86_64-linux/"

#### 1.2.1. Instalação Simples

Para adicionar o *TemplatePUC* ao sistema, crie uma pasta dentro do texlive:

> sudo mkdir /usr/local/texlive/texmf-local/tex/latex/local/TemplatePUC

Copie o arquivo *TemplatePUC.cls* para a pasta criada:

> sudo cp TemplatePUC.cls /usr/local/texlive/texmf-local/tex/latex/local/TemplatePUC

Atualize o TexLive:

> sudo /usr/local/texlive/2018/bin/x86_64-linux/texhash

Finalmente, encerre a sessão atual ou reinicialize o sistema.

Caso haja uma nova versão do arquivo *TemplatePUC.cls* basta realizar o download e substiuí-lo.

#### 1.2.2. Instalação com Git

Para adicionar o *TemplatePUC* ao sistema, digite no terminal:

> cd /usr/local/texlive/texmf-local/tex/latex/local/
> sudo git clone https://github.com/bismarckjunior/TemplatePUC.git
> sudo chown -R user TemplatePUC
> sudo /usr/local/texlive/2018/bin/x86_64-linux/texhash

Caso haja uma nova versão do projeto, basta realizar um pull para receber a atualização. Para isso, abra um terminal na pasta e digite:

> git pull

## 2. Instruções de Uso
As instruções de como utilizar o template está descrita no arquivo [instrucoes_uso.pdf](doc/InstrucoesUso/instrucoes_uso.pdf).

## 3. Exemplos
Os exemplos podem ser encontrados na pasta [*examples*](examples/). Se o arquivo *TemplatePUC.cls* não foi inserido nos arquivos do sistema, este deve ser copiado para a pasta do exemplo.

## 4. Compilação
Para a compilação recomenda-se o uso do Sublime Text, mas por conveniência será apresentado uma forma de compilar utilizando o TeX Live também.

### 4.1. TeX Live
No TeXworks basta inicializar o arquivo principal.

### 4.2. Sublime Text
No [Sublime Text] existe o pacote [LaTeXTools], no qual basta abrir o arquivo *tex* e compilar com o comando (Ctrl+B).

Com o Sublime Text instalado siga os passos:
1. Instalar o package contol: Ctrl+Shift+P, "Install Package Control", Enter
2. Abrir o package contol: Ctrl+Shift+P, "Package Control: Install Package", Enter
3. Instalar o pacote: "LaTeXTools"
4. Abrir arquivo tex
5. Compilar com Ctrl+Shift+B, optando pela opção "LaTeX - PdfLaTeX".
6. Compliar com Ctrl+B

É possível verificar se o LaTeX está corretamente instalado fazendo:
Preferences > Package Settings > LaTeXTools > Check System.

Uma melhoria que pode ser feita é alterar algumas configurações do pacote LaTeXTools, para isso faça:
1. Preferences > Package Settings > LaTeXTools > Settings-User
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
O template criado, TemplatePUC, foi baseado no modelo desenvolvido para PUC-Rio por: Thomas Lewiner, Marcelo Roberto Jimenez e David Pirotte, possuindo o Copyright (C) 2015, 2017 PUC-Rio. Esse modelo utiliza a licença de cópia GNU Free Documentation License que se encontra no arquivo [*LICENSING*](LICENSING).


[CCPG]: http://www.puc-rio.br/ensinopesq/ccpg/apresentacao_ted.html
[Tex Live]: https://www.tug.org/texlive/acquire-netinstall.html
[Sublime Text]: https://www.sublimetext.com/
[LaTeXTools]: https://packagecontrol.io/packages/LaTeXTools