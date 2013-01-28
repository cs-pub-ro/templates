% 2013, Razvan Deaconescu, razvan.deaconescu@cs.pub.ro
%
% cse-form.cls - class for Computer Science and Engineering Department forms

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cse-form}[2013/01/28]

\LoadClassWithOptions{article}

\usepackage[paper=a4paper, top=2cm, bottom=1cm, left=1.5cm, right=1.5cm]{geometry}

\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[romanian,english]{babel}
\usepackage{hyperref}	  % use \url{http://$URL} or \href{http://$URL}{Name}
\usepackage{underscore}	  % underscores need not be escaped
\usepackage{parskip}

% Support for including graphics
\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

% Use fancy header.
\usepackage{fancyhdr}
\setlength{\headheight}{20mm}

\lhead{Universitatea POLITEHNICA din București,\\
  Facultatea de Automatică și Calculatoare,\\
Departamentul de Calculatoare}
\rhead{\includegraphics{sigla-cs}}
\fancyfoot{}

\pagestyle{fancyplain}

% Fix verbatim environment: smaller text size
\let\oldverbatim=\verbatim
\renewenvironment{verbatim}{
  \begin{small}
  \begin{oldverbatim}
  %\vspace*{1em}
}%
{%
  %\vspace*{1em}
  \end{oldverbatim}
  \end{small}
}
