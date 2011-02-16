% Vlad Dogaru, 2010-2011.
% ddvlad@rosedu.org
% exam.cs.pub.ro.cls - class for USO, SO, PSO, SOA etc exams.
% This work is available under the LaTeX Project Public License version 1.3.
% Copyright notice: you must keep the original author(s)/copyright
% information in the files

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exam.cs.pub.ro}[2011/02/16]

\LoadClass[a4paper,10pt,oneside,final]{article}

% Specify course name as a class option.
\DeclareOption{so}{
  \def\@course{Sisteme de Operare}
  \def\@courselogo{img/so}
  \def\@courselogoscale{0.05}
}
\DeclareOption{uso}{
  \def\@course{Utilizarea Sistemelor de Operare}
  \def\@courselogo{img/uso}
  \def\@courselogoscale{0.05}
}
\DeclareOption{so2}{
  \def\@course{Sisteme de Operare 2}
  \def\@courselogo{img/so}
  \def\@courselogoscale{0.05}
}
\DeclareOption{soa}{
  \def\@course{Sisteme de Operare Avansate}
  \def\@courselogo{img/soa}
  \def\@courselogoscale{0.05}
}
% Use this option if the layout should be two sets per page.
\DeclareOption{twosetsperpage}{\def\@twosets{true}}
% Use this to leave room for answers between the questions.
\DeclareOption{answerspace}{\def\@answerspace{true}}

\ProcessOptions

\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[english,romanian]{babel}

\usepackage[top=1cm,bottom=1cm,left=1cm,right=1cm]{geometry}
\usepackage{underscore}
\usepackage{comment}
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

% University logo.
\def\@unilogo{img/cs}
\def\@unilogoscale{0.15}

\let\oldverbatim=\verbatim
\renewenvironment{verbatim}{
  \begin{small}
  \begin{oldverbatim}
}
{
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

% Date of the exam
\renewcommand{\date}[1]{\def\@date{#1}}
% Time for the exam, preferably in the form "Timp de lucru: x minute"
\renewcommand{\time}[1]{\def\@time{#1}}
% Note that appears on top of the sheet. "Toate raspunsurile trebuie
% motivate" or something like that.
\newcommand{\note}[1]{\def\@note{#1}}
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
        {
          \item \input{\@questiondir/\arabic{questionctr}}
          \ifdefined\@answerspace
            \\[2cm]
          \else
            \relax
          \fi
        }
    \item \input{\@questiondir/\arabic{questionctr}}
    \ifdefined\@answerspace
      \\[2cm]
    \else
      \relax
    \fi
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
%\def\@twosets{false}
\newcommand\makecontent{
  \ifdefined\@twosets
    \begin{landscape}
      \begin{minipage}[h]{0.45\paperheight}
        \content
      \end{minipage}
      \qquad
      \begin{minipage}[h]{0.45\paperheight}
        \content
      \end{minipage}
    \end{landscape}
  \else
      \content
  \fi
  \pagebreak
  \ifdefined\@twosets
    \begin{landscape}
      \begin{minipage}[h]{0.45\paperheight}
        \@declaration
      \end{minipage}
      \qquad
      \begin{minipage}[h]{0.45\paperheight}
        \@declaration
      \end{minipage}
    \end{landscape}
  \else
    \@declaration
  \fi
}
