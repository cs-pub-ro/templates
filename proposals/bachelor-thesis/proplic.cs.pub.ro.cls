% proplic.cs.pub.ro.cls
% Copyright 2010 Vlad Dogaru

% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Vlad Dogaru.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proplic.cs.pub.ro}[2010/09/23]

\let\ExecuteOptions@ltx\ExecuteOptions
\def\ExecuteOptions#1{%
 \ExecuteOptions@ltx{a4paper,12pt,oneside,final}%
}%
\LoadClassWithOptions{article}
\let\ExecuteOptions\ExecuteOptions@ltx

\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[romanian,english]{babel}
\usepackage[top=0.59in,bottom=2.98in,left=0.79in,right=0.79in]{geometry}
\usepackage{underscore}
\usepackage{hyperref}
% Support for including graphics
\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\usepackage{lastpage}
% Header and footer
\usepackage{fancyhdr}
\fancyhf{}
\setlength{\headheight}{48pt}
\setlength{\voffset}{1in}
\setlength{\footskip}{1in}
\lhead{\includegraphics[scale=0.1]{img/cs}}
\chead{}
\rhead{\includegraphics[scale=0.5]{img/upb}}
\lfoot{Versiunea \@version}
\cfoot{}
\rfoot{Pagina \thepage/\pageref{LastPage}}
\pagestyle{fancy}


% No indent
\setlength{\parindent}{0pt}

% command for specifying TODOs
\newcommand{\todo}[1]{
  \textbf{TODO:} #1 \par
}

% Subtitle: usually contains year and semester
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
% Project title as it will appear on the thesis
\newcommand{\projecttitle}[1]{\def\@projecttitle{#1}}
% Proposition version; usually in the form 1.0/23.09.2010
\newcommand{\version}[1]{\def\@version{#1}}

\renewcommand{\maketitle}{%
  \enskip
  \begin{center}%
    {\Huge \bfseries \@title \par}%
    {\large \@subtitle \par}%
  \end{center}%
  \enskip \enskip \enskip%
  \begin{center}%
    {\huge \bfseries \@projecttitle \par}%
  \end{center}%
  \enskip%
}
