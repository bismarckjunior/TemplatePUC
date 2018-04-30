%% -*- coding: utf-8; -*-

%% This is file `TemplatePUC.cls'.
%%
%% Any modified versions of this file must be renamed
%% with new filenames distinct from TemplatePUC.cls.
%% 
%% ----------------------------------------------------------------------------
%% 
%% Bismarck Gomes <bismarck@puc-rio.br>
%%
%% LaTeX document class for PUC thesis, dissertation and proposal.
%%
%% Copyright (C) 2018 Souza Jr, B. G.
%%
%%
%% Based on work of:
%%
%% Thomas Lewiner
%% Marcelo Roberto Jimenez
%% David Pirotte
%%
%% LaTeX document class for typesetting theses of the PUC
%%
%% Copyright (C) 2015, 2017 PUC-Rio
%%
%% ----------------------------------------------------------------------------
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%

\newcommand{\filedate}{2018/04/23}
\newcommand{\fileversion}{0.1.0}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TemplatePUC}%
[\filedate\space v\fileversion\space PUC-Rio template class]


%%%
%%% Style options
%%%

%  booleans
\RequirePackage{ifthen}
\RequirePackage{nth}

% hyphenation
% \RequirePackage{csquotes}
\RequirePackage[brazilian, american]{babel}
% \RequirePackage[brazilian]{babel}

% PhD thesis or MsC dissertation
\newboolean{puc@phd}
\setboolean{puc@phd}{true}
\DeclareOption{msc}{\setboolean{puc@phd}{false}}
\DeclareOption{master}{\setboolean{puc@phd}{false}}
\DeclareOption{phd}{\setboolean{puc@phd}{true}}

% tight or wide page layout
\newboolean{puc@tight}
\setboolean{puc@tight}{false}
\DeclareOption{wide}{\setboolean{puc@tight}{false}}
\DeclareOption{tight}{\setboolean{puc@tight}{true}}

% hyphenation
\newcommand{\llocale}{brazilian}
\newboolean{puc@localebr}
\setboolean{puc@localebr}{true}
\newboolean{puc@localeus}
\setboolean{puc@localeus}{false}

\DeclareOption{american}{%
  \PassOptionsToPackage{american, brazilian}{babel}%
  % \PassOptionsToPackage{brazilian, american}{babel}%
   \setboolean{puc@localeus}{true}%
   \setboolean{puc@localebr}{false}%
   \renewcommand{\llocale}{american}%
}

\DeclareOption{brazilian}{%
   \PassOptionsToPackage{brazilian, american}{babel}%
   \setboolean{puc@localebr}{true}%
   \setboolean{puc@localeus}{false}%
   \renewcommand{\llocale}{brazilian}%
}

% twoside
\newboolean{puc@twoside}
\setboolean{puc@twoside}{false}
\DeclareOption{twoside}{\setboolean{puc@twoside}{true}}
\DeclareOption{oneside}{\setboolean{puc@twoside}{false}}

% proposal
\newboolean{puc@proposal}
\setboolean{puc@proposal}{false}
\DeclareOption{proposal}{\setboolean{puc@proposal}{true}}

% draft for debugging overful boxes
\newboolean{puc@draft}
\setboolean{puc@draft}{false}
\DeclareOption{draft}{\setboolean{puc@draft}{true}}

% header
\newboolean{puc@header}
\setboolean{puc@header}{false}
\DeclareOption{header}{\setboolean{puc@header}{true}}

% translations
\DeclareOption{dissertacao}{\setboolean{puc@phd}{false}}
\DeclareOption{mestrado}{\setboolean{puc@phd}{false}}
\DeclareOption{tese}{\setboolean{puc@phd}{true}}
\DeclareOption{doutorado}{\setboolean{puc@phd}{true}}
\DeclareOption{modelo1}{\setboolean{puc@tight}{false}}
\DeclareOption{modelo2}{\setboolean{puc@tight}{true}}
\DeclareOption{frenteverso}{\setboolean{puc@twoside}{true}}
\DeclareOption{rascunho}{\setboolean{puc@draft}{true}}
\DeclareOption{proposta}{\setboolean{puc@proposal}{true}}
\DeclareOption{cabecalho}{\setboolean{puc@header}{true}}

\ProcessOptions\relax


%%%
%%% Logo
%%%

\IfFileExists{figs/logo/puc.png}{\newcommand{\puc@logo}{figs/logo/puc.png}}{
\IfFileExists{figs/puc.png}{\newcommand{\puc@logo}{figs/puc.png}}{
\newcommand{\puc@logo}{puc.png}}}


%%%
%%% Base style
%%%

\ifthenelse{\boolean{puc@twoside}}{%
  \LoadClass[a4paper,12pt\ifpuc@draft,draft\else\fi]{book}%
  \raggedbottom%
}{%
  \LoadClass[a4paper,12pt\ifpuc@draft,draft\else\fi]{report}%
}


%%%
%%% Required packages
%%%

% fonts and symbols
\RequirePackage{amsfonts}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}             %% OT1 has 127 characters only
\RequirePackage{lmodern}                 %% tex modern font version

% graphics inclusion (in particular the PUC logo)
\RequirePackage[pdftex]{graphicx}

% captalize title
\RequirePackage{stringstrings}

% subfigure loaded here for spacing definition
\RequirePackage[FIGBOTCAP, TABBOTCAP]{subfigure}

% Section titles
\RequirePackage[clearempty, compact]{titlesec}
\RequirePackage[subfigure]{tocloft}

% line spacing
\RequirePackage{setspace}

% header and footer
\RequirePackage{fancyhdr}

% indent first line of sections and chapters
\RequirePackage{indentfirst}

% number of pages
\RequirePackage{lastpage}

% equation style: align, multline, eqnarray
\RequirePackage{amsmath}

% nomenclature
\RequirePackage{nomencl}

% numbering figures and tables
\RequirePackage{chngcntr}

% capitalize words
\RequirePackage{mfirstuc}

% hypen in figures and tables caption
\RequirePackage[labelsep=endash]{caption}
   
% patchcmd command (find and replace code)
% create group in nomenclature
\RequirePackage{etoolbox}  

% cross-references link
\RequirePackage[%
  %backref,%
  pdftex,%
  colorlinks=true,%
  bookmarksopen=true,%
  breaklinks=true,%
  linkcolor=black,% blue
  anchorcolor=black,%
  citecolor=black,% cyan
  urlcolor=black,% red
  bookmarksnumbered=false%
]{hyperref}


%%
%% Page format
%%

\setlength{\parindent}{1cm}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{20pt}
\setlength{\topskip}{0.001cm}
\addtolength{\headheight}{2.5pt}

% Copy of some of the code from the ifmtarg package to save requiring
% ifmtarg
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup


% Set the page output parameters
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}}

%\newcommand{\setpage}[9]{%
\DeclareRobustCommand{\setpage}[9]{%
  \@ifmtarg{#1}{}{\setlength{\textheight}{#1}}%
  \@ifmtarg{#2}{}{\setlength{\textwidth}{#2}}%
  \@ifmtarg{#3}{}{\setlength{\evensidemargin}{#3}}%
  \@ifmtarg{#4}{}{\setlength{\oddsidemargin}{#4}}%
  \@ifmtarg{#5}{}{\setlength{\columnsep}{#5}}%
  \ch@ngetext%
  \@ifmtarg{#6}{}{\setlength{\topmargin}{#6}}%
  \@ifmtarg{#7}{}{\setlength{\headheight}{#7}}%
  \@ifmtarg{#8}{}{\setlength{\headsep}{#8}}%
  \@ifmtarg{#9}{}{\setlength{\footskip}{#9}}%
}

\newcommand{\puc@setallmargins}[5]{%
 % declare length
 \expandafter\newlength\csname puc@topmargin@#1\endcsname%
 \expandafter\newlength\csname puc@bottommargin@#1\endcsname%
 \expandafter\newlength\csname puc@leftmargin@#1\endcsname%
 \expandafter\newlength\csname puc@rightmargin@#1\endcsname%
 \expandafter\newlength\csname puc@textwidth@#1\endcsname%
 \expandafter\newlength\csname puc@oddsidemargin@#1\endcsname%
 \expandafter\newlength\csname puc@evensidemargin@#1\endcsname%
 \expandafter\newlength\csname puc@textheight@#1\endcsname%
 \expandafter\newlength\csname puc@headsep@#1\endcsname%
 %
 % adjust margins
 \expandafter\setlength{\csname puc@topmargin@#1\endcsname}{#2}%
 \expandafter\setlength{\csname puc@bottommargin@#1\endcsname}{#3}%
 \expandafter\setlength{\csname puc@leftmargin@#1\endcsname}{#4}%
 \expandafter\setlength{\csname puc@rightmargin@#1\endcsname}{#5}%
 %
 % converts margins to text size
 \expandafter\setlength{\csname puc@textwidth@#1\endcsname}{\paperwidth}%
 \expandafter\addtolength{\csname puc@textwidth@#1\endcsname}{-\csname puc@leftmargin@#1\endcsname}%
 \expandafter\addtolength{\csname puc@textwidth@#1\endcsname}{-\csname puc@rightmargin@#1\endcsname}%
 %
 \expandafter\setlength{\csname puc@oddsidemargin@#1\endcsname}{\csname puc@leftmargin@#1\endcsname}%
 \expandafter\addtolength{\csname puc@oddsidemargin@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname puc@oddsidemargin@#1\endcsname}{-\hoffset}%
 %
 \ifthenelse{\boolean{puc@twoside}}{%
   \expandafter\setlength{\csname puc@evensidemargin@#1\endcsname}{\csname puc@rightmargin@#1\endcsname}%
 }{%
   \expandafter\setlength{\csname puc@evensidemargin@#1\endcsname}{\csname puc@leftmargin@#1\endcsname}%
 }%
 \expandafter\addtolength{\csname puc@evensidemargin@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname puc@evensidemargin@#1\endcsname}{-\hoffset}%
 %
 \expandafter\setlength{\csname puc@headsep@#1\endcsname}{\csname puc@topmargin@#1\endcsname}%
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\voffset}%
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\topmargin}%
 \expandafter\addtolength{\csname puc@headsep@#1\endcsname}{-\headheight}%
 %
 \expandafter\setlength{\csname puc@textheight@#1\endcsname}{\paperheight}%
 \expandafter\addtolength{\csname puc@textheight@#1\endcsname}{-\csname puc@topmargin@#1\endcsname}%
 \expandafter\addtolength{\csname puc@textheight@#1\endcsname}{-\csname puc@bottommargin@#1\endcsname}%
 %
 % dynamic margin adjustment
 \expandafter\newcommand\csname puc@setmargins@#1\endcsname{%
   \setpage%
     {\csname puc@textheight@#1\endcsname}%
     {\csname puc@textwidth@#1\endcsname}%
     {\csname puc@evensidemargin@#1\endcsname}%
     {\csname puc@oddsidemargin@#1\endcsname}%
     {}{}{}%
     {\csname puc@headsep@#1\endcsname}%
     {}%
  }%
}

% text
\ifthenelse{\boolean{puc@tight}}{%
 \puc@setallmargins{text}{2.5cm}{2.5cm}{3.5cm}{7.0cm}%
 }{%
 \puc@setallmargins{text}{2.5cm}{2.5cm}{3.0cm}{4.0cm}%
}

% cover
\puc@setallmargins{cover}{7.0cm}{3.0cm}{7.0cm}{2.0cm}

% front
\puc@setallmargins{front}{2.5cm}{2.5cm}{6.0cm}{4.0cm}

% dedication
\puc@setallmargins{dedication}{2.5cm}{2.5cm}{3.0cm}{4.0cm}

% margin
\newcommand{\puc@leftmargin}[1]{\noindent\begin{minipage}[top]{\textwidth}#1\end{minipage}}
\newcommand{\puc@rightmargin}[1]{\puc@leftmargin{\begin{flushright}#1\end{flushright}}}


%%%
%%% Line spacing
%%%

\ifthenelse{\boolean{puc@tight}}{}{\onehalfspacing}
\frenchspacing
\clubpenalty=2000
\emergencystretch=20pt
\pretolerance=500
\tolerance=2500
\widowpenalty=2000


%%%
%%% Floats per page
%%%

\renewcommand{\floatpagefraction}{.7}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.3}
\setcounter{totalnumber}{10}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}


%%%
%%% Subfigures
%%%

\renewcommand{\thesubfigure}{(\alph{subfigure})}
% \renewcommand{\@thesubfigure}{(\alph{subfigure})\space}

%%%
%%% Fonts
%%%

\newcommand{\arial}{\sf}


%%%
%%% Titles
%%%

\titleformat{name=\chapter}                %%  command
   [display]                               %% the shape
   {\singlespacing\large\arial\bfseries}   %% the format (whole title)
   {\thechapter}                           %% the label
   {0pt}                                   %% label title sep (space)
   {}                                      %% before (code)
   {}                                      %% after (code)
\titlespacing{\chapter}                    %% command
   {0pt}                                   %% left
   {-1.6em}                                %% before [pagestyle is not empty]
   {84pt}                                  %% after
   %% []                                   %% right

\titleformat{name=\section}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {\thesection}
   {0pt}
   {} 
   {}

\titleformat{name=\section,numberless}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
   {}

\titleformat{name=\subsection}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {\thesubsection}
   {0pt}
   {} 
   {}

\titleformat{name=\subsection,numberless}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
   {}

\titleformat{name=\subsubsection}
   [display]
   {\penalty -3000\singlespacing\normalsize\arial\bfseries}
   {\thesubsubsection}
   {0pt}
   {} 
   {}

\titleformat{name=\subsubsection,numberless}
   [display]
   {\penalty -3000\singlespacing\normalsize\arial\bfseries}
   {\thesubsubsection}
   {0pt}
   {} 
   {}

\titleformat{name=\paragraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {}
   {2\wordsep}
   {}
   {}

\titleformat{name=\subparagraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {}
   {2\wordsep}
   {}
   {}

% bibliography title
\newcommand{\bibtitle}{Referências Bibliográficas}


%%%
%%% Page styles
%%%

\newcommand{\puc@setpagestyle}{%
 \pagestyle{fancy}%
 \fancyhf{}% delete current setting for header and footer
 \fancyfoot{}%
  \ifthenelse{\boolean{puc@twoside}}{%
   \fancyhead[RE]{\arial\footnotesize \thepage}%
   \fancyhead[RO]{\arial\footnotesize \thepage}%
   \ifthenelse{\boolean{puc@header}}{
    \fancyhead[LE]{\arial\footnotesize \nouppercase{\puc@title}}%
    \fancyhead[LO]{\arial\footnotesize \nouppercase{\leftmark}}%
    }{}
  }{
    \fancyhead[R]{\thepage}%
    \ifthenelse{\boolean{puc@header}}{
      \fancyhead[L]{\arial\slshape \nouppercase{\leftmark}}%
    }{}
  }
 \renewcommand{\headrulewidth}{0pt}%
}
\fancypagestyle{empty}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}%
\fancypagestyle{plain}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}%


%%%
%%% Table of contents
%%%

\setcounter{tocdepth}{2}
\setcounter{lofdepth}{1}  % subfigure in lof? 2!
\setcounter{lotdepth}{1}
\setcounter{secnumdepth}{3}

\renewcommand{\cfttoctitlefont}{\large \arial \bfseries}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftloftitlefont}{\large \arial \bfseries}
\setlength{\cftbeforeloftitleskip}{0pt}
\renewcommand{\cftlottitlefont}{\large \arial \bfseries}
\setlength{\cftbeforelottitleskip}{0pt}
\renewcommand{\cftdot}{}
\renewcommand{\cftsecfont}{}
\setlength{\cftbeforesecskip}{\parskip}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftchapnumwidth}{1.9em}
\setlength{\cftsecnumwidth}{2.5em}
\setlength{\cftsubsecnumwidth}{3.1em}
\setlength{\cftsubsubsecnumwidth}{3.7em}
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftsecindent}{0pt}
\renewcommand{\cftsubsecindent}{0pt}
\renewcommand{\cftsubsubsecindent}{0pt}
\renewcommand{\cftchapfont}{\arial}
\renewcommand{\cftsecfont}{\arial}
\renewcommand{\cftsubsecfont}{\arial}
\renewcommand{\cftsubsubsecfont}{\arial}
\renewcommand{\cftfigfont}{\arial}
\renewcommand{\cfttabfont}{\arial}


%%%
%%% New environments
%%%

\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\newtheorem{definition}{Definição}[chapter]
\newtheorem{theorem}[definition]{Teorema}
\newtheorem{proposition}[definition]{Proposição}
\newtheorem{corollary}[definition]{Corolário}
\newenvironment{proof}{\par \noindent \textit{Prova}.}{\hfill $\blacksquare$}


%%%
%%% Define space in environments
%%%

% itemize
% \renewcommand{\labelitemi}{--}
\let\tempItemize\itemize        % Store/copy \itemize in \tempitemize
\def\itemize{
  \tempItemize           
  \addtolength{\itemsep}{-0.5em}
}

% equation
\let\tempEquation\equation
\def\equation{
  \vspace{-0.5em}
  \tempEquation
  \vspace{-1.0em}
}

% eqnarray
\let\tempEqnarray\eqnarray
\def\eqnarray{
  \vspace{-0.5em}
  \tempEqnarray
  \vspace{-1.0em}
}

% multline
\let\tempMultline\multline
\def\multline{
  \vspace{-0.5em}
  \tempMultline
  \vspace{-1.0em}
}

% align
\let\tempAlign\align
\def\align{
  \vspace{-0.5em}
  \tempAlign
  \vspace{-1.0em}
}

% gather
\let\tempGather\gather
\def\gather{
  \vspace{-0.5em}
  \tempGather
  \vspace{-1.0em}
}

% theorem
\let\tempTheorem\theorem
\def\theorem{
  \vspace{-0.4em}
  \tempTheorem
  \vspace{-0.2em}
}

% corollary
\let\tempCorollary\corollary
\def\corollary{
  \vspace{-0.4em}
  \tempCorollary
  \vspace{-0.2em}
}

% definition
\let\tempDefinition\definition
\def\definition{
  \vspace{-0.4em}
  \tempDefinition
  \vspace{-0.2em}
}

% proposition
\let\tempProposition\proposition
\def\proposition{
  \vspace{-0.4em}
  \tempProposition
  \vspace{-0.2em}
}


%%%
%%% Edit footnote
%%%

% change footenote number to non-superscript
\patchcmd{\@makefntext} % cmd
  {\@makefnmark}        % search
  {\@thefnmark~}        % replace
  {}                    % success
  {}                    % failure


%%%
%%% Front matter elements
%%%

\newcommand{\puc@usecolour}{false}
\newcommand{\usecolour}[1]{\renewcommand{\puc@usecolour}{#1}}

\newcommand{\puc@bibliographicdatalabel}{}

\newcommand{\puc@author}{}
\renewcommand{\author}[1]{\renewcommand{\puc@author}{#1}}

\newcommand{\puc@authorR}{}
\newcommand{\authorR}[1]{\renewcommand{\puc@authorR}{#1}}

\newcommand{\puc@advisor}{}
\newcommand{\puc@advisorT}{}
\newcommand{\advisor}[2]{%
  \renewcommand{\puc@advisor}{#1}%
  \renewcommand{\puc@advisorT}{#2}}
\newcommand{\puc@advisorlabel}{}
\newcommand{\puc@advisorlabellc}{}

\newcommand{\puc@advisorR}{}
\newcommand{\advisorR}[1]{\renewcommand{\puc@advisorR}{#1}}

%% the advisor's institution and symbol if not the university itself
\newcommand{\puc@advisorInst}{}
\newcommand{\puc@advisorInstS}{}
\newcommand{\advisorInst}[2]{%
  \renewcommand{\puc@advisorInst}{#1}%
  \renewcommand{\puc@advisorInstS}{#2}}

\newcommand{\puc@coadvisor}{}
\newcommand{\puc@coadvisorT}{}
\newcommand{\coadvisor}[2]{%
  \renewcommand{\puc@coadvisor}{#1}%
  \renewcommand{\puc@coadvisorT}{#2}}
\newcommand{\puc@coadvisorlabel}{}
\newcommand{\puc@coadvisorlabellc}{}

\newcommand{\puc@coadvisorR}{}
\newcommand{\coadvisorR}[1]{\renewcommand{\puc@coadvisorR}{#1}}

\newcommand{\puc@coadvisorInst}{}
\newcommand{\puc@coadvisorInstS}{}
\newcommand{\coadvisorInst}[2]{%
  \renewcommand{\puc@coadvisorInst}{#1}%
  \renewcommand{\puc@coadvisorInstS}{#2}}

\newcommand{\puc@coadvisorII}{}
\newcommand{\puc@coadvisorIIT}{}
\newcommand{\coadvisorII}[2]{%
  \renewcommand{\puc@coadvisorII}{#1}
  \renewcommand{\puc@coadvisorIIT}{#2}}

\newcommand{\puc@coadvisorIIR}{}
\newcommand{\coadvisorIIR}[1]{\renewcommand{\puc@coadvisorIIR}{#1}}

\newcommand{\puc@coadvisorIIInst}{}
\newcommand{\puc@coadvisorIIInstS}{}
\newcommand{\coadvisorIIInst}[2]{%
  \renewcommand{\puc@coadvisorIIInst}{#1}
  \renewcommand{\puc@coadvisorIIInstS}{#2}}

\newcommand{\puc@coadvisorIII}{}
\newcommand{\puc@coadvisorIIIT}{}
\newcommand{\coadvisorIII}[2]{%
  \renewcommand{\puc@coadvisorIII}{#1}
  \renewcommand{\puc@coadvisorIIIT}{#2}}

\newcommand{\puc@coadvisorIIIR}{}
\newcommand{\coadvisorIIIR}[1]{\renewcommand{\puc@coadvisorIIIR}{#1}}

\newcommand{\puc@coadvisorIIIInst}{}
\newcommand{\puc@coadvisorIIIInstS}{}
\newcommand{\coadvisorIIIInst}[2]{%
  \renewcommand{\puc@coadvisorIIIInst}{#1}
  \renewcommand{\puc@coadvisorIIIInstS}{#2}}

\newcommand{\puc@title}{}
\renewcommand{\title}[1]{\renewcommand{\puc@title}{#1}}

\newcommand{\puc@titleus}{}
\newcommand{\titleus}[1]{\renewcommand{\puc@titleus}{#1}}

\newcommand{\puc@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\puc@subtitle}{#1}}

\newcommand{\puc@day}{}
\newcommand{\dd}[1]{\renewcommand{\puc@day}{#1}}

\newcommand{\puc@month}{}
\newcommand{\mm}[1]{\renewcommand{\puc@month}{#1}}

\newcommand{\puc@year}{}
\newcommand{\yyyy}[1]{\renewcommand{\puc@year}{#1}}

\newcommand{\puc@city}{Rio de Janeiro}
\newcommand{\city}[1]{\renewcommand{\puc@city}{#1}}

\newcommand{\puc@department}{}
\newcommand{\department}[1]{\renewcommand{\puc@department}{#1}}

\newcommand{\puc@program}{}
\newcommand{\program}[1]{\renewcommand{\puc@program}{#1}}

\newcommand{\puc@school}{}
\newcommand{\school}[1]{\renewcommand{\puc@school}{#1}}

\newcommand{\puc@university}{Pontifícia Universidade Católica do Rio de Janeiro}
\newcommand{\university}[1]{\renewcommand{\puc@university}{#1}}

\newcommand{\puc@uni}{PUC-Rio}
\newcommand{\uni}[1]{\renewcommand{\puc@uni}{#1}}

\newcommand{\puc@CDD}{}
\newcommand{\CDD}[1]{\renewcommand{\puc@CDD}{#1}}

\newcommand{\jurymember}[4]{}

\newcommand{\puc@schoolheadtitle}{%
  \ifthenelse{\boolean{puc@localebr}}{
  Coordenador Setorial do \puc@school
  }{Vice Dean of Graduate Studies\\
 Centro Técnico Científico}}

\newcommand{\schoolhead}[2]{\jurymember{#1}{#2}%
  {\puc@schoolheadtitle}{\puc@uni}}

\newcommand{\puc@jury}{}
\newcommand{\jury}[1]{\renewcommand{\puc@jury}{#1}}

\newcommand{\puc@resume}{}
\newcommand{\resume}[1]{\renewcommand{\puc@resume}{#1}}

\newboolean{hasdedication}
\setboolean{hasdedication}{false}
\newcommand{\puc@dedication}{}
\newcommand{\dedication}[1]{%
  \renewcommand{\puc@dedication}{#1}%
  \setboolean{hasdedication}{true}%
}

\newboolean{hasacknowledgment}
\setboolean{hasacknowledgment}{false}
\newcommand{\puc@acknowledgment}{}
\newcommand{\acknowledgment}[1]{
  \renewcommand{\puc@acknowledgment}{#1}
  \setboolean{hasacknowledgment}{true}%
}

\newcommand{\catalogprekey}[1]{}
\newcommand{\puc@catalogprekeywords}{}
\newcommand{\catalogprekeywords}[1]{\renewcommand{\puc@catalogprekeywords}{#1}}


\providetoggle{puc@firstkey}
\settoggle{puc@firstkey}{true}

\newcommand{\key}[1]{}
\newcommand{\puc@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\puc@keywords}{#1}}

\newcommand{\puc@keywordsus}{}
\newcommand{\keywordsus}[1]{\renewcommand{\puc@keywordsus}{#1}}

\newboolean{hasabstract}
\setboolean{hasabstract}{false}
\newcommand{\puc@abstract}{}
\ifthenelse{\boolean{puc@twoside}}{%
  \newcommand{\abstract}[1]{
    \renewcommand{\puc@abstract}{#1}
    \setboolean{hasabstract}{true}
  }%
}{%
  \renewcommand{\abstract}[1]{
    \renewcommand{\puc@abstract}{#1}
    \setboolean{hasabstract}{true}
  }%
}

\newboolean{hasabstractus}
\setboolean{hasabstractus}{false}
\newcommand{\puc@abstractus}{}
\newcommand{\abstractus}[1]{
  \renewcommand{\puc@abstractus}{#1}
  \setboolean{hasabstractus}{true}
}%

% \newcommand{\puc@tablesmode}{figtab}
% \newcommand{\tablesmode}[1]{\renewcommand{\puc@tablesmode}{#1}}

\newboolean{hasepigraph}
\setboolean{hasepigraph}{false}
\newcommand{\puc@epigraph}{}
\newcommand{\epigraph}[1]{%
  \renewcommand{\puc@epigraph}{#1}%
  \setboolean{hasepigraph}{true}%
}

\newcommand{\puc@epigraphauthor}{}
\newcommand{\epigraphauthor}[1]{\renewcommand{\puc@epigraphauthor}{#1}}

\newcommand{\puc@epigraphbook}{}
\newcommand{\epigraphbook}[1]{\renewcommand{\puc@epigraphbook}{#1}}

\newcommand{\puc@abreviationstitle}{Lista de Abreviaturas}
\newcommand{\abreviationstitle}[1]{\renewcommand{\puc@abreviationstitle}{#1}}%

\newcommand{\puc@abreviationstitleus}{List of Abreviations}
\newcommand{\abreviationstitleus}[1]{\renewcommand{\puc@abreviationstitleus}{#1}}%


%%%
%%% Translations
%%%

\newcommand{\autor}[1]{\author{#1}}
\newcommand{\autorR}[1]{\authorR{#1}}
\newcommand{\orientador}[2]{\advisor{#1}{#2}}
\newcommand{\orientadorR}[1]{\advisorR{#1}}
\newcommand{\orientadorInst}[1]{\advisorInst{#1}}
\newcommand{\coorientador}[1]{\coadvisor{#1}}
\newcommand{\coorientadorR}[1]{\coadvisorR{#1}}
\newcommand{\coorientadorInst}[1]{\coadvisorInst{#1}}
\newcommand{\coorientadorII}[1]{\coadvisorII{#1}}
\newcommand{\coorientadorIIR}[1]{\coadvisorIIR{#1}}
\newcommand{\coorientadorIIInst}[1]{\coadvisorIIInst{#1}}
\newcommand{\coorientadorIII}[1]{\coadvisorIII{#1}}
\newcommand{\coorientadorIIIR}[1]{\coadvisorIIIR{#1}}
\newcommand{\coorientadorIIIInst}[1]{\coadvisorIIIInst{#1}}
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\titulous}[1]{\titleus{#1}}
\newcommand{\subtitulo}[1]{\subtitle{#1}}
\newcommand{\dia}[1]{\dd{#1}}
\newcommand{\mes}[1]{\mm{#1}}
\newcommand{\ano}[1]{\yyyy{#1}}
\newcommand{\cidade}[1]{\city{#1}}
\newcommand{\departamento}[1]{\department{#1}}
\newcommand{\programa}[1]{\program{#1}}
\newcommand{\centro}[1]{\school{#1}}
\newcommand{\universidade}[1]{\university{#1}}
%\newcommand{\uni}[1]{\uni{#1}}
%\newcommand{\CDD}[1]{\CDD{#1}}
\newcommand{\membrodabanca}[4]{\jurymember{#1}{#2}{#3}{#4}}
\newcommand{\coordenador}[2]{\schoolhead{#1}{#2}}
\newcommand{\banca}[1]{\jury{#1}}
\newcommand{\curriculo}[1]{\resume{#1}}
\newcommand{\dedicatoria}[1]{\dedication{#1}}
\newcommand{\agradecimentos}[1]{\acknowledgment{#1}}
\newcommand{\chaves}[1]{\keywords{#1}}
\newcommand{\chavesus}[1]{\keywordsus{#1}}
\newcommand{\prechaves}[1]{\catalogprekeywords{#1}}
\newcommand{\prechave}[1]{\catalogprekey{#1}}
\newcommand{\chave}[1]{\key{#1}}
\newcommand{\resumo}[1]{\abstract{#1}}
\newcommand{\resumous}[1]{\abstractus{#1}}
% \newcommand{\modotabelas}[1]{\tablesmode{#1}}
\newcommand{\epigrafe}[1]{\epigraph{#1}}
\newcommand{\epigrafeautor}[1]{\epigraphauthor{#1}}
\newcommand{\epigrafelivro}[1]{\epigraphbook{#1}}
\newcommand{\tituloglossario}[1]{\abreviationstitle{#1}}
\newcommand{\listasporcapitulo}[1]{\contentsperchapter{#1}}
\newcommand{\imprimirlista}[1]{\printlist{#1}}
\newcommand{\colorido}[1]{\usecolour{#1}}

%%%
%%% Title
%%%

\newcommand{\puc@thetitle}{%
  \ifthenelse{\boolean{puc@localebr}}{%
  \puc@title
  }{\puc@titleus}%
}%


%%%
%%% Cover
%%%

\newcommand{\puc@showcover}{%
  \puc@setmargins@cover%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \begin{titlepage}%
    \setcounter{page}{0}%
    \renewcommand{\baselinestretch}{1.2}%
    \puc@rightmargin{\LARGE \arial \textbf{\puc@author} \normalsize}%
    \vspace*{\stretch{4}}%
    \par%
    \puc@rightmargin{\LARGE \arial \textbf{\puc@thetitle\relax} \normalsize}%
    \ifthenelse{\equal{\puc@subtitle}{}}{}{%
      \vspace*{\stretch{0.5}}%
      \par%
      \puc@rightmargin{\LARGE \arial \puc@subtitle\relax \normalsize} }%
    \vspace*{\stretch{5}}%
    \par%
    \puc@rightmargin{\Large \arial
      \textbf{\ifthenelse{\boolean{puc@phd}}%
        {TESE DE DOUTORADO}%
        {DISSERTAÇÃO DE MESTRADO}}}%
    \vspace*{\stretch{1.5}}%
    \par%
    \puc@rightmargin{\textbf{DEPARTAMENTO DE \MakeUppercase{\puc@department}}}%
    \vspace*{\stretch{0.5}}%
    \par%
    \renewcommand{\baselinestretch}{1.0}%
    \puc@rightmargin{\Large \arial Programa de Pós-graduação em \puc@program}%
    \vspace*{\stretch{9}}%
    \par%
    \puc@rightmargin{\normalsize \arial \puc@city \\ \puc@month\ de \puc@year}%
  \end{titlepage}%
  \setcounter{page}{1}%
}


%%%
%%% Front page
%%%

\ifthenelse{\boolean{puc@proposal}}{

  \ifthenelse{\boolean{puc@localebr}}{

    \newcommand{\puc@approvedby}{Comissão Examinadora:}

    \newcommand{\puc@presentedcover}{Texto apresentado como requisito 
    parcial do exame de proposta de tese do Programa de  Pós--graduação
    em \puc@program~da \puc@uni.}

  }{

    \newcommand{\puc@approvedby}{Examination Committee:}

    \newcommand{\puc@presentedcover}{Text presented to the Programa de
    Pós--graduação em \puc@program\ of \puc@uni ~in partial fulfillment of
    the requirements of thesis proposal exam.}
  }

  \newcommand{\puc@presentedback}{\puc@presentedcover}

}{

  \ifthenelse{\boolean{puc@localebr}}{
    \newcommand{\puc@approvedby}{Aprovada pela Comissão Examinadora abaixo assinada.}

    \newcommand{\puc@presentedcover}{\ifthenelse{\boolean{puc@phd}}{Tese}{Dissertação} apresentada ao Programa de Pós--graduação em \puc@program~da \puc@uni~ como requisito parcial para obtenção do grau de \ifthenelse{\boolean{puc@phd}}{Doutor}{Mestre} em \puc@program.}

    \newcommand{\puc@presentedback}{\ifthenelse{\boolean{puc@phd}}{Tese}{Dissertação} apresentada como requisito parcial para obtenção do grau de \ifthenelse{\boolean{puc@phd}}{Doutor}{Mestre} pelo Programa de Pós--graduação em \puc@program~da \puc@uni.}

  }{
    \newcommand{\puc@approvedby}{Approved by the undersigned Examination Committee.}

    \newcommand{\puc@presentedcover}{Thesis presented to the Programa de
      Pós--graduação em \puc@program~of \puc@uni ~in partial fulfillment of
      the requirements for the degree of ifthenelse{\boolean{puc@phd}}{Doutor}{Mestre} em \puc@program.}

    \newcommand{\puc@presentedback}{\puc@presentedcover}
  }
}

\newcommand{\puc@showfront}{%
  \puc@setmargins@front%
  \thispagestyle{empty}%
  \ifthenelse{\boolean{puc@localebr}}{%
  \pdfbookmark[0]{\puc@title}{anchor:title}%
  }{\pdfbookmark[0]{\puc@titleus}{anchor:title}}%
  \singlespacing\arial%
  \puc@rightmargin{\includegraphics[height=2.2cm]{\puc@logo}}%
  \vspace*{\stretch{1}}%
  \par%
  \puc@rightmargin{\large \arial \textbf{\puc@author} \normalsize}%
  \vspace*{\stretch{4}}%
  \par%
  \puc@rightmargin{\large \arial \textbf{\puc@thetitle\relax} \normalsize}%
  \ifthenelse{\equal{\puc@subtitle}{}}{}{%
    \vspace*{\stretch{0.5}}%
    \par%
    \puc@rightmargin{\arial \textbf{\puc@subtitle} \relax} }%
  \vspace*{\stretch{5}}%
  \par%
  \puc@rightmargin{\arial \textbf{\ifthenelse{\boolean{puc@phd}}
      {Tese de Doutorado}
      {Dissertação de Mestrado}}}%
  \vspace*{\stretch{1.5}}%
  \par%
  \puc@leftmargin{\arial \puc@presentedcover}%
  \vspace*{\stretch{1}}%
  \par%
  \puc@rightmargin{
    \begin{tabular}{l@{ }l@{}}%
      \puc@advisorlabel:\ & \puc@advisorT\ \puc@advisor%
      \ifthenelse{\equal{\puc@coadvisor}{}}{}{%
        \\ \puc@coadvisorlabel:\ & \puc@coadvisorT\ \puc@coadvisor}%
      \ifthenelse{\equal{\puc@coadvisorII}{}}{}{%
        \\ \puc@coadvisorlabel:\ & \puc@coadvisorIIT\ \puc@coadvisorII}%
      \ifthenelse{\equal{\puc@coadvisorIII}{}}{}{%
        \\ \puc@coadvisorlabel:\ & \puc@coadvisorIIIT\ \puc@coadvisorIII}%
    \end{tabular}}%
  \vspace*{\stretch{6}}%
  \par%
  \puc@rightmargin{\puc@city \\
  \ifthenelse{\boolean{puc@localebr}}{%
  \capitalizetitle{\puc@month}\ de \puc@year%
  }{
  \capitalizetitle{\puc@month}\ \puc@year}%
  }
}


%%%
%%% Jury
%%%

\newcommand{\puc@showjury}{%
  \cleardoublepage%
  \puc@setmargins@front%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \puc@rightmargin{\includegraphics[height=2.2cm]{\puc@logo}}%
  \vspace*{\stretch{0.5}}%
  \par%
  \puc@rightmargin{\large \arial \textbf{\puc@author} \normalsize}%
  \vspace*{\stretch{1}}%
  \par%
  \puc@rightmargin{\large \arial \textbf{\puc@thetitle\relax} \normalsize}%
  \ifthenelse{\equal{\puc@subtitle}{}}{}{%
    \vspace*{\stretch{0.1}}%
    \par%
    \puc@rightmargin{\arial \textbf{\puc@subtitle} \relax} }%
  \vspace*{\stretch{1.5}}%
  \par%
  \puc@leftmargin{\arial \puc@presentedback ~\puc@approvedby}%
  \vspace*{\stretch{1}}%
  \renewcommand{\jurymember}[4]{\ifthenelse{\equal{##1}{}}{}{%
      \puc@rightmargin{\textbf{##2 ##1}\\##3 -- ##4}
      \vspace*{\stretch{1}}\par}}%
  \par%
  \ifthenelse{\equal{\puc@advisorInst}{}}{%
    \jurymember{\puc@advisor}{\puc@advisorT}%
    {\puc@advisorlabel\ \\ Departamento de \puc@department}{\puc@uni}}{%
    \jurymember{\puc@advisor}{\puc@advisorT}%
    {\puc@advisorlabel\ \\ \puc@advisorInst}{\puc@advisorInstS}}
  \ifthenelse{\equal{\puc@coadvisorInst}{}}{%
    \jurymember{\puc@coadvisor}{\puc@coadvisorT}
    {\puc@coadvisorlabel\ \\ Departamento de \puc@department}{\puc@uni}}{%
    \jurymember{\puc@coadvisor}{\puc@coadvisorT}%
    {\puc@coadvisorlabel \\ \puc@coadvisorInst}{\puc@coadvisorInstS}}
  \ifthenelse{\equal{\puc@coadvisorIIInst}{}}{%
    \jurymember{\puc@coadvisorII}{\puc@coadvisorIIT}%
    {\puc@coadvisorlabel \\ Departamento de \puc@department}{\puc@uni}}{%
    \jurymember{\puc@coadvisorII}{\puc@coadvisorIIT}%
    {\puc@coadvisorlabel \\ \puc@coadvisorIIInst}{\puc@coadvisorIIInstS}}
  \ifthenelse{\equal{\puc@coadvisorIIIInst}{}}{%
    \jurymember{\puc@coadvisorIII}{\puc@coadvisorIIIT}%
    {\puc@coadvisorlabel \\ Departamento de \puc@department}{\puc@uni}}{%
    \jurymember{\puc@coadvisorIII}{\puc@coadvisorIIIT}%
    {\puc@coadvisorlabel \\ \puc@coadvisorIIIInst}{\puc@coadvisorIIIInstS}}%
  %-----------------%
    \puc@jury%
  %-----------------%
  \puc@rightmargin{\puc@city, %
    \ifthenelse{\boolean{puc@localebr}}%
    {\puc@day\ de \puc@month\ de \puc@year}%
    {\puc@month\ the \ifthenelse{\equal{\puc@day}{}}{}{\nth{\puc@day}}, \puc@year}%
  }
}


%%%
%%% copyright
%%%

\newcommand{\puc@showcopyrights}{%
  \cleardoublepage%
  \puc@setmargins@front%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \puc@leftmargin{\normalfont \normalsize%
    \ifthenelse{\boolean{puc@localebr}}{%
    Todos os direitos reservados. É proibida a reprodução total ou
      parcial do trabalho sem autorização da universidade, do autor e do
      orientador.%
    }{All rights reserved.}
    }%
  \vspace*{\stretch{2}}%
  \par%
  \puc@rightmargin{\arial \textbf{\puc@author}}%
  \vspace*{\stretch{0.2}}%
  \par%
  \puc@leftmargin{\normalfont \puc@resume}%
  \vspace*{\stretch{2}}%
  \par%
  \puc@rightmargin{\small \arial \puc@bibliographicdatalabel}%
  \par%
  \puc@leftmargin{%
    \hspace{.5mm}%
    \begin{tabular}{|p{0.95\linewidth}|} \hline%
      \noindent \puc@authorR \\ \\ \par%
      \hspace*{.6cm} \puc@thetitle\relax\ / \puc@author;
      \puc@advisorlabellc:
      \puc@advisor\ifthenelse{\equal{\puc@coadvisor}{}}{}{;
      \puc@coadvisorlabellc
      \ifthenelse{\equal{\puc@coadvisorII}{}}{}{es}:
      \puc@coadvisor}\ifthenelse{\equal{\puc@coadvisorII}{}}{}{,
      \puc@coadvisorII}\ifthenelse{\equal{\puc@coadvisorIII}{}}{}{,
      \puc@coadvisorIII}. -- Rio de janeiro: \puc@uni, Departamento de
      \puc@department, \puc@year. \\ \\ \par%
      \hspace*{.6cm} v., \pageref{LastPage} f: il. \ifthenelse{\equal{\puc@usecolour}{false}}{}{color. }; 30 cm \\ \\ \par%
      \hspace*{.6cm} \ifthenelse{\boolean{puc@phd}}{Tese (doutorado)}{Dissertação (mestrado)} - \puc@university, Departamento de \puc@department. \\ \\ \par%
      \hspace*{.6cm} Inclui bibliografia \\ \\ \par%
      \hspace*{.6cm}%
        \newcounter{keycount}\setcounter{keycount}{1}%
        \renewcommand{\catalogprekey}[1]{
          \arabic{keycount}. \makefirstuc{##1} -- Teses.
          \addtocounter{keycount}{1}~
        }      
        \puc@catalogprekeywords%
        \renewcommand{\key}[1]{
          \arabic{keycount}. \makefirstuc{##1}.~
          \addtocounter{keycount}{1}
          \ignorespaces
        }
        \puc@keywords%
        \setcounter{keycount}{1}%
        \renewcommand{\key}[1]{
          \ifthenelse{\equal{##1}{}}{}
          {\Roman{keycount}. ##1.\addtocounter{keycount}{1}\ }
        }%
        \key{\puc@advisorR}%
        \key{\puc@coadvisorR}%
        \key{\puc@coadvisorIIR}%
        \key{\puc@coadvisorIIIR}%
        \key{\puc@university. Departamento de \puc@department}%
        \key{Título}%
      \\%
    \hline \end{tabular}%
    }%

  \newcommand\blfootnote[1]{%
    \let\tempfootrule\footnoterule
    \renewcommand{\footnoterule}{}
    \begingroup
    \renewcommand\thefootnote{}\footnote{##1}%
    \addtocounter{footnote}{-1}%
    \endgroup
  }
  \blfootnote{
    \hspace{-1.5cm}
    \begin{minipage}{\textwidth}
    \begin{flushright}
    \normalsize CDD: \puc@CDD 
    \end{flushright}
    \end{minipage}
  }%
  % \renewcommand{\footnoterule}{\tempfootrule}
}


%%%
%%% Dedication
%%%

\newcommand{\puc@showdedication}{%
  \cleardoublepage%
  \puc@setmargins@dedication%
  \markboth{Dedicatória}{Dedicatória}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \vspace*{\stretch{1}}%
  \puc@rightmargin{%
%-------------%
 \puc@dedication
%-------------%
  }%
}

%%%
%%% Acknowledgment
%%%

\newcommand{\puc@showacknowledgment}{%
  \cleardoublepage%
  \puc@setmargins@dedication%
  \markboth{Agradecimentos}{Agradecimentos}%
  \thispagestyle{empty}%
  \onehalfspacing\normalfont%
  \ifthenelse{\boolean{puc@localebr}}{%
    \noindent \large \arial \textbf{Agradecimentos}%
    }{\noindent \large \arial \textbf{Acknowledgments}}
  \normalfont \normalsize
  \vspace*{\stretch{1}} \par%
  \noindent
  \puc@acknowledgment%
  \vspace*{\stretch{1}} \par%
}

%%%
%%% Abstract (br)
%%%

\newcommand{\puc@showabstract}{%
  \clearpage%
  \ifthenelse{\boolean{puc@localeus}}%
  {\selectlanguage{brazilian}}%
  {}%
  \puc@setmargins@dedication%
  \markboth{Resumo}{Resumo}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%

  \ifthenelse{\boolean{puc@localebr}}%
  {\pdfbookmark[0]{Resumo}{anchor:abstract}}%
  {}

  \noindent \large \arial \textbf{Resumo} \normalfont \normalsize%
  \vspace{\stretch{3}}%
  \par\indent%
  \begin{minipage}{12cm}\singlespacing%
  \puc@authorR; \puc@advisorR\ifthenelse{\equal{\puc@coadvisor}{}}{}{; \puc@coadvisorR}\ifthenelse{\equal{\puc@coadvisorII}{}}{}{; \puc@coadvisorIIR}\ifthenelse{\equal{\puc@coadvisorIII}{}}{}{; \puc@coadvisorIIIR}. \textbf{\puc@title}. \puc@city, \puc@year. \pageref{LastPage}p.   \ifthenelse{\boolean{puc@phd}}{Tese de Doutorado}{Dissertação de Mestrado} -- Departamento de \puc@department, \puc@university.%
  \end{minipage}\onehalfspacing%
  \vspace*{\stretch{1}}%
  \par%
  \noindent%
  \begin{minipage}{13.5cm}%
    % --------%
    \hspace*{.8cm} \puc@abstract%
    % --------%
  \end{minipage}%
  \vspace*{\stretch{3}}%
  \par%
  \noindent \large \arial \textbf{Palavras-chave} \normalfont \normalsize%
  \par%
  \settoggle{puc@firstkey}{true}
  \renewcommand{\key}[1]{%
    \iftoggle{puc@firstkey}%
    {\makefirstuc{##1}}%
    {; ##1}%
    \settoggle{puc@firstkey}{false}%
    \ignorespaces
  }
  \indent \puc@keywords.%
  \vspace*{\stretch{4}}%
  \par%
  % \ifthenelse{\boolean{puc@localeus}}%
  % {\selectlanguage{american}}%
  % {}%
}

%%%
%%% Abstract (us)
%%%

\newcommand{\puc@showabstractus}{%
  \clearpage%
  \ifthenelse{\boolean{puc@localebr}}{%
  \selectlanguage{american}
  }{}%
  \puc@setmargins@dedication%
  \markboth{Abstract}{Abstract}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%

  \ifthenelse{\boolean{puc@localeus}}%
  {\pdfbookmark[0]{Abstract}{anchor:abstract}}%
  {}

  \noindent \large \arial \textbf{Abstract} \normalfont \normalsize%
  \vspace{\stretch{3}}%
  \par\indent%
  \begin{minipage}{12cm}\singlespacing%
  \puc@authorR;
  \puc@advisorR~(Advisor)\ifthenelse{\equal{\puc@coadvisor}{}}{}{;
    \puc@coadvisorR~(Co-Advisor)}\ifthenelse{\equal{\puc@coadvisorII}{}}{}{;
    \puc@coadvisorIIR~(Co-Advisor)}\ifthenelse{\equal{\puc@coadvisorIII}{}}{}{;
    \puc@coadvisorIIIR~(Co-Advisor)}. \textbf{\puc@titleus}. \puc@city,
  \puc@year. \pageref{LastPage}p.   \ifthenelse{\boolean{puc@phd}}{Tese
    de doutorado}{Dissertação de mestrado} -- Departamento de \puc@department, \puc@university.%
  \end{minipage}\onehalfspacing%
  \vspace*{\stretch{1}}%
  \par%
  \noindent\begin{minipage}{13.5cm}%
    % --------%
    \hspace*{.8cm} \puc@abstractus%
    % --------%
  \end{minipage}%
  \vspace*{\stretch{3}}%
  \par%
  \noindent \large \arial \textbf{Keywords} \normalfont \normalsize%
  \par%
  \settoggle{puc@firstkey}{true}
  \renewcommand{\key}[1]{%
    \iftoggle{puc@firstkey}%
    {\makefirstuc{##1}}%
    {; ##1}%
    \settoggle{puc@firstkey}{false}%
    \ignorespaces
  }
  \indent \puc@keywordsus.%
  \vspace*{\stretch{4}}%
  \par%
  % \ifthenelse{\boolean{puc@localebr}}{%
  % \selectlanguage{brazilian}
  % }{}%
}


%%%
%%% Nomenclature
%%%
\newcommand{\listnom}{
   % Build nomenclaturen in temp path

  \immediate\write18{makeindex -s nomencl.ist -o "\jobname.nls" "\jobname.nlo"}
  \immediate\write18{makeindex -s nomencl.ist -o "temp/\jobname.nls" "temp/\jobname.nlo"}

  \makenomenclature

  % right alignment
  \newcommand{\ralign}[1]{%
  \renewcommand{\nomentryend}{\hspace*{\fill}\#1}}

  % create groups
  \ifthenelse{\boolean{puc@localebr}}{%
    \renewcommand\nomgroup[1]{%
      \vspace{1cm}
      \item[\arial\bfseries
      \ifstrequal{##1}{A}{~Alfabeto Latino}{%
      \ifstrequal{##1}{E}{~Alfabeto Grego}{%
      \ifstrequal{##1}{I}{~Subscrito}{%
      \ifstrequal{##1}{O}{~Sobrescrito}{%
      \ifstrequal{##1}{P}{~Operadores}{
      \ifstrequal{##1}{S}{~Acrônimos}{}
      }}}}}%
    ]}

    % edit preamble
    \renewcommand{\nompreamble}{A nomenclatura está dividida em: alfabeto latino, alfabeto grego, subscrito, sobrescrito, operadores e acrônimos, sendo apresentada em ordem alfabética.
    \vspace{-0.5cm}}

  }{

    \renewcommand\nomgroup[1]{%
      \vspace{1cm}
      \item[\arial\bfseries
      \ifstrequal{##1}{A}{~Latin Alphabet}{%
      \ifstrequal{##1}{E}{~Greek alphabet}{%
      \ifstrequal{##1}{I}{~Subscript}{%
      \ifstrequal{##1}{O}{~Superscript}{%
      \ifstrequal{##1}{P}{~Operators}{
      \ifstrequal{##1}{S}{~Acronyms}{}
      }}}}}%
    ]}
  }

  % vertical spacing
  \setlength{\nomitemsep}{-4pt}

  % \clearpage
  \cleardoublepage
  \markboth{\nomname}{\nomname}%
  \thispagestyle{empty}%
  \pdfbookmark[0]{\nomname}{anchor:nomenclature}
  \printnomenclature
}


%%%
%%% Contents
%%%

% contents per chapter (figures and tables)
\newcommand{\contentsperchapter}[1]{
  \ifthenelse{\equal{#1}{true}}{
    \counterwithin{figure}{chapter}
    \renewcommand\cftfignumwidth{4.7em}

    \counterwithin{table}{chapter}
    \renewcommand\cfttabnumwidth{4.7em}
  }{}
}

\newcommand{\firstList}{}%
\newcommand{\secondList}{}%
\newcommand{\thirdList}{}%

\newcommand{\printlist}[3]{%
  % avoid warning message about mapping 'american' language
  \DeclareLanguageMapping{american}{english-abnt}

  \ifstrequal{#1}{fig}{\renewcommand{\firstList}{\listfigures}}{
  \ifstrequal{#1}{tab}{\renewcommand{\firstList}{\listtables}}{
  \ifstrequal{#1}{nom}{\renewcommand{\firstList}{\listnom}}{}}}

  \ifstrequal{#1}{#2}{}{
    \ifstrequal{#2}{fig}{\renewcommand{\secondList}{\listfigures}}{
    \ifstrequal{#2}{tab}{\renewcommand{\secondList}{\listtables}}{
    \ifstrequal{#2}{nom}{\renewcommand{\secondList}{\listnom}}{}}}
  }

  \ifstrequal{#1}{#3}{}{
    \ifstrequal{#2}{#3}{}{
      \ifstrequal{#3}{fig}{\renewcommand{\thirdList}{\listfigures}}{
      \ifstrequal{#3}{tab}{\renewcommand{\thirdList}{\listtables}}{
      \ifstrequal{#3}{nom}{\renewcommand{\thirdList}{\listnom}}{}}}
    }
  }
}

\ifthenelse{\boolean{puc@localebr}}{%
    \renewcommand{\contentsname}{Sumário}%
  \renewcommand{\listfigurename}{Lista de Figuras}%
  \renewcommand{\listtablename}{Lista de Tabelas}%
  \renewcommand{\nomname}{Nomenclatura}
}{%
  \renewcommand{\contentsname}{Table of contents}%
  \renewcommand{\listfigurename}{List of Figures}%
  \renewcommand{\listtablename}{List of Tables}%
  \renewcommand{\nomname}{Nomenclature}
}%

\newcommand{\puc@showcontents}{%
  \cleardoublepage%
  \puc@setmargins@dedication%
  \markboth{\contentsname}{\contentsname}%
  \thispagestyle{empty}%
  \pdfbookmark[0]{\contentsname}{anchor:contents}%
  \singlespacing\normalfont%

  \tableofcontents%

  \firstList
  \secondList
  \thirdList
}


%%%
%%% List of figures
%%%

\newcommand{\puc@figuretext}{Figura}
\newcommand{\puc@figuretextus}{Figure}

\counterwithout{figure}{chapter}
\renewcommand\cftfignumwidth{4.em}
\renewcommand{\cftfigpresnum}{\hspace{-1.3em}\ifthenelse{\boolean{puc@localebr}}{\puc@figuretext}{\puc@figuretextus}~}
\renewcommand{\cftfigaftersnum}{\hfill~--~\hfill}
\renewcommand{\cftbeforefigskip}{0.4em} 

\newcommand{\listfigures}{
  \clearpage%
  \markboth{\listfigurename}{\listfigurename}%
  \thispagestyle{empty}%
  \pdfbookmark[0]{\listfigurename}{anchor:list_figures}
  \listoffigures%
}


%%%
%%% List of tables
%%%

\captionsetup[table]{skip=1pt}
\newcommand{\puc@tabletext}{Tabela}
\newcommand{\puc@tabletextus}{Table}

\counterwithout{table}{chapter}
\renewcommand\cfttabnumwidth{4.em}
\renewcommand{\cfttabpresnum}{\hspace{-1.3em}\ifthenelse{\boolean{puc@localebr}}{\puc@tabletext}{\puc@tabletextus}~}
\renewcommand{\cfttabaftersnum}{\hfill~--~\hfill}
\renewcommand{\cftbeforetabskip}{0.4em}

\newcommand{\listtables}{
  \clearpage%
  \markboth{\listtablename}{\listtablename}%
  \thispagestyle{empty}%
  \pdfbookmark[0]{\listtablename}{anchor:list_tables}
  \listoftables%
}


%%%
%%% Epigraph
%%%

\newcommand{\puc@showepigraph}{%
  \cleardoublepage%
  \puc@setmargins@text%
  \markboth{\contentsname}{\contentsname}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \vspace*{\stretch{1}}\par\indent%
  \hspace*{\stretch{2}}%
  \begin{minipage}[c]{10cm}%
  \it \puc@epigraph%
  \end{minipage}%
  \par\indent
  \hspace*{\stretch{1}}%
  \begin{flushright}%
  \puc@epigraphauthor\ifthenelse{\equal{\puc@epigraphbook}{}}{}{, \textit{\puc@epigraphbook}}%
  \end{flushright}%
  }


%%%
%%% Index (to have the right bookmark in the pdf)
%%%

\renewenvironment{theindex}{%
  \if@twocolumn%
    \@restonecolfalse%
  \else%
    \@restonecoltrue%
  \fi%
  \twocolumn%
  \columnseprule \z@%
  \columnsep 35\p@%
  \chapter*{\indexname}%
  \addcontentsline{toc}{chapter}{\indexname}%
  \markboth{\indexname}{\indexname}
  \parskip\z@ \@plus .3\p@\relax%
  \let\item\@idxitem%
}{%
  \if@restonecol\onecolumn\else\clearpage\fi%
}


%%%
%%% Summary of notations (to have the right bookmark in the pdf)
%%%

% \newcommand{\notationsname}{Sumário das notações}%
\newenvironment{thenotations}{%
  \ifthenelse{\boolean{puc@localebr}}{%
    \chapter*{\puc@abreviationstitle}%
    \markboth{\puc@abreviationstitle}{\puc@abreviationstitle}%
  }{}
  \ifthenelse{\boolean{puc@localeus}}
  {%
    \chapter*{\puc@abreviationstitleus}%
    \markboth{\puc@abreviationstitleus}{\puc@abreviationstitleus}%
  }{}
}{%
}

%%%
%%% Default values
%%%

\city{Rio de Janeiro}
\uni{PUC-Rio}
\universidade{Pontifícia Universidade Católica do Rio de Janeiro}


%%%
%%% All front matter
%%%

\newcommand{\puc@showfrontmatter}{%
  \pagestyle{empty}%
  % cover
  % \puc@showcover%

  % front
  \puc@showfront

  %jury
  \puc@showjury

  % copy rights
  \ifthenelse{\boolean{puc@proposal}}{}{\puc@showcopyrights}
  
  % dedication
  \ifthenelse{\boolean{hasdedication}}{\puc@showdedication}{}

  % acknowledgment
  \ifthenelse{\boolean{hasacknowledgment}}{\puc@showacknowledgment}{}

  % abstract
  \ifthenelse{\boolean{puc@localebr}}{%
    \ifthenelse{\boolean{hasabstract}}{\puc@showabstract}{}
    \ifthenelse{\boolean{hasabstractus}}{\puc@showabstractus}{}
    \selectlanguage{brazilian}%
  }{%
    \ifthenelse{\boolean{hasabstractus}}{\puc@showabstractus}{}
    \ifthenelse{\boolean{hasabstract}}{\puc@showabstract}{}
    % \selectlanguage{american}%
  }

  % contents
  \puc@showcontents%

  % epigraph
  \ifthenelse{\boolean{hasepigraph}}{\puc@showepigraph}{}%
  % 
  \puc@setmargins@text%
  \ifthenelse{\boolean{puc@tight}}{}{\onehalfspacing}%
  \normalfont%
  \puc@setpagestyle%
}


\AtBeginDocument{%
  % Cite (SURNAME, 2018) instead of (Surname, 2018)
  \renewcommand*{\mkbibnamefamily}[1]{#1}% Citação minuscula

  \renewcommand{\key}[1]{#1. }
  \ifthenelse{\boolean{puc@localebr}}{%
  \special{ pdf: docinfo << /Author (\puc@author) /Title (\puc@title)
      /Keywords (\puc@keywords) >> }
  }{\special{ pdf: docinfo << /Author (\puc@author) /Title (\puc@titleus) /Keywords (\puc@keywords) >> }
  }%

   \ifthenelse{\boolean{puc@localebr}}{%
     \renewcommand{\puc@bibliographicdatalabel}{Ficha Catalográfica}%
     \renewcommand{\puc@advisorlabel}{Orientador}%
     \renewcommand{\puc@advisorlabellc}{orientador}%
     \renewcommand{\puc@coadvisorlabel}{Co-orientador}%
     \renewcommand{\puc@coadvisorlabellc}{co-orientador}%
     % \addto\captionsbrazilian{\renewcommand{\bibname}{Referências bibliográficas}}%
   }{%
     \renewcommand{\puc@bibliographicdatalabel}{Bibliographic data}%
     \renewcommand{\puc@advisorlabel}{Advisor}%
     \renewcommand{\puc@advisorlabellc}{advisor}%
     \renewcommand{\puc@coadvisorlabel}{Co-advisor}%
     \renewcommand{\puc@coadvisorlabellc}{co-advisor}%
     \renewcommand{\bibtitle}{References}
   }%
   \makeatletter\puc@showfrontmatter\makeatother%

  % bibliography
  \defbibheading{bibliography}[\bibtitle]{%
  \chapter{#1}%
  \markboth{#1}{#1}}

  % redefine footnote ruler
  \ifthenelse{\boolean{puc@proposal}}{}{
    \renewcommand{\footnoterule}{\tempfootrule}
  }
 }


%% Local Variables:
%% mode: LaTeX
%% End:
\endinput
%%
%% End of file `ThesisPUC.cls'.
