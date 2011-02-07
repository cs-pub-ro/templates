% Vlad Dogaru, 2010-2011.
% ddvlad@rosedu.org
% exam.cs.pub.ro.cls - class for SO, PSO, SOA etc exams. It can probably
% be adapted for USO as well.
% This work is available under the LaTeX Project Public License version
% 1.3.
% Copyright notice: you must keep the original author(s)/copyright
% information in the files

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{so-exam.cs.pub.ro}[2010/11/01]

\let\ExecuteOptions@ltx\ExecuteOptions
\def\ExecuteOptions#1{%
 \ExecuteOptions@ltx{a4paper,10pt,oneside,final}%
}%
\LoadClassWithOptions{article}
\let\ExecuteOptions\ExecuteOptions@ltx

\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[english,romanian]{babel}

\usepackage[top=1cm,bottom=1cm,left=1cm,right=1cm]{geometry}
\usepackage{underscore}
\usepackage{comment}
\usepackage{ifthen}
\usepackage{forloop}
\usepackage{array}
\usepackage{pdflscape}
% The follwing two are used by highlight
\usepackage{color}
\usepackage{alltt}

\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

\newcounter{questionctr}
\newcounter{colctr}
\newcounter{rowctr}

\setlength{\parskip}{0pt}

\let\oldverbatim=\verbatim
\renewenvironment{verbatim}{
  \begin{small}
  \begin{oldverbatim}
}%
{%
  \end{oldverbatim}
  \end{small}
}

\newcounter{myenum}
\renewenvironment{enumerate}{%
  \begin{list}{\textbf{\arabic{myenum}.}}%
    {\setlength{\leftmargin}{0pt}}%
     \setlength{\labelwidth}{0pt}
     \setlength{\itemindent}{0.5em}
     \setlength{\labelsep}{0.5em}
     \usecounter{myenum}}%
  {\end{list}}

% No page numbers.
\pagestyle{empty}

\setlength{\parindent}{0pt}
\newcommand{\todo}[1]{
  \textbf{TODO:} #1 \par
}

% Course the exam is in
\newcommand{\course}[1]{\def\@course{#1}}
% Date of the exam
\renewcommand{\date}[1]{\def\@date{#1}}
% Time for the exam, preferably in the form "Timp de lucru: x minute"
\renewcommand{\time}[1]{\def\@time{#1}}
% Note that appears on top of the sheet. "Toate raspunsurile trebuie
% motivate" or something like that.
\newcommand{\note}[1]{\def\@note{#1}}
% Use this if the layout should be two sets per page.
\newcommand{\twosetsperpage}{\def\@twosets{true}}
% Define question directory and number of questions.
\newcommand{\questions}[2]{
  \def\@questiondir{#1}
  \def\@numquestions{#2}
}
% Set number of rows and columns of the grading space. Rows go first.
\newcommand{\gradingcount}[2]{%
  \def\@gradingrows{#1}%
  \def\@gradingcols{#2}%
}
% Use this command to set the course logo and scale. Scale is second.
% Note that this is unused at the time for lack of space.
\newcommand{\courselogo}[2]{%
  \def\@courselogo{#1}%
  \def\@courselogoscale{#2}
}
% Use this command to set the Univeristy logo and scale. Scale is second.
% Note that this is unused at the time for lack of space.
\newcommand{\unilogo}[2]{%
  \def\@unilogo{#1}%
  \def\@unilogoscale{#2}%
}

\renewcommand{\maketitle}{%
  \begin{center}%
    {\large \bfseries \@course \par}%
    {\@date \par}%
    {\@time \par}%
    {\@note \par}%
  \end{center}%
}

% Command to include all of the questions.
% Parameters are directory where questions are located and number of
% questions.
\newcommand\thequestions{
  \begin{enumerate}
    \forloop{questionctr}{1}
        {\value{questionctr} < \@numquestions}
        {\item \input{\@questiondir/\arabic{questionctr}}}
    \item \input{\@questiondir/\arabic{questionctr}}
  \end{enumerate}
}

% Signing space
\newcommand\signingspace{
  \textbf{Nume și grupă:} \\[0.5em]
}

% Question grading space
\newcommand\gradingspace{
  \renewcommand{\arraystretch}{2}
  \begin{tabular}{|*{\@gradingcols}{m{1cm}|}}
    \hline
    \forloop{rowctr}{1}{\value{rowctr} < \@gradingrows}{
        \forloop{colctr}{1}{\value{colctr} < \@gradingcols}{&} \\
        \hline
    }
    \forloop{colctr}{1}{\value{colctr} < \@gradingcols}{&} \\
    \hline
  \end{tabular}
  \renewcommand{\arraystretch}{1}
}

% Header which includes the logos for course and university
\newcommand\header{
  \includegraphics[scale=\@courselogoscale]{\@courselogo}
  \hfill
  \includegraphics[scale=\@unilogoscale]{\@unilogo}
  \\
}

% Main content. This appears either once or twice, controlled by
% \twosetsperpage.
\newcommand\content{
  \header \enskip
  \signingspace
  \begin{minipage}{0.5\columnwidth}
    \maketitle
  \end{minipage}
  \begin{minipage}{0.5\columnwidth}
    \begin{flushright}
      \gradingspace
    \end{flushright}
  \end{minipage}

  \thequestions
}

% Non-copy-declaration
\def\@declaration{
  \centering
  \begin{minipage}[h]{0.8\columnwidth}
    {\Large
    \vspace{5cm}
    {În conformitate cu ghidul de etică al Catedrei de Calculatoare,
    declar că nu am copiat la această lucrare. De asemenea, nu am ajutat
    și nu voi ajuta pe nimeni să copieze la această lucrare.}

    \vspace{2cm}

    \textbf{Semnătura:..................}
    } \\
  \end{minipage}

}

% This should take care of everything you need.
% Define @twosets to false if not previously defined.
\def\@twosets{false}
\newcommand\makecontent{
  \ifthenelse{\equal{\@twosets}{true}}
    {\begin{landscape}
      \begin{minipage}[h]{0.45\paperheight}
        \content
      \end{minipage}
      \qquad
      \begin{minipage}[h]{0.45\paperheight}
        \content
      \end{minipage}
    \end{landscape}
    }
    {\content}
  \pagebreak
  \ifthenelse{\equal{\@twosets}{true}}
    {\begin{landscape}
      \begin{minipage}[h]{0.45\paperheight}
        \@declaration
      \end{minipage}
      \qquad
      \begin{minipage}[h]{0.45\paperheight}
        \@declaration
      \end{minipage}
    \end{landscape}
    }
    {\@declaration}
}
