% proposal.cs.pub.ro.cls
% Copyright 2013 Vlad Dogaru, Răzvan Deaconescu
% Heavily inspired by proplic.cs.pub.ro.cls

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
\ProvidesClass{proposal.cs.pub.ro}[2013/09/27]

\let\ExecuteOptions@ltx\ExecuteOptions
\def\ExecuteOptions#1{%
 \ExecuteOptions@ltx{a4paper,12pt,oneside,final}%
}%
\LoadClassWithOptions{article}
\let\ExecuteOptions\ExecuteOptions@ltx

\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[romanian,english]{babel}
\usepackage[top=1.5cm,bottom=1.5cm,left=1.2cm,right=1.2cm]{geometry}
\usepackage{underscore}
\usepackage{hyperref}
% Support for including graphics
\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\usepackage{lastpage}
\pagestyle{empty}

% No indent
\setlength{\parindent}{0pt}

% Use spaces between paragraphs
\usepackage{parskip}

% command for specifying TODOs
\newcommand{\todo}[1]{
  \textbf{TODO:} #1 \par
}

\DeclareOption{diploma}{
  \newcommand{\proposaltype}{Propunere proiect de diplomă}
}
\DeclareOption{research}{
  \newcommand{\proposaltype}{Propunere proiect de cercetare}
}
\DeclareOption{master}{
  \newcommand{\proposaltype}{Propunere proiect de disertație}
}
\DeclareOption{soa}{
  \newcommand{\proposaltype}{Propunere proiect la Sisteme de Operare Avansate}
}
\ProcessOptions

\AtBeginDocument{
  {\LARGE \proposaltype}
}
