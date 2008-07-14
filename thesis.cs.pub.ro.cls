\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis.cs.pub.ro}[2008/07/14]

\LoadClassWithOptions{report}  % build on standard article
\ExecuteOptions{a4paper,oneside}
\ProcessOptions\relax    % set margins for a4paper if specified

\usepackage[top=3cm, bottom=3cm, left=35mm, right=2cm]{geometry}
\usepackage{hyperref}


\newcommand{\includechapter}[1]{\input{src/chapter-#1/index}}
\newcommand{\includesection}[2]{\input{src/chapter-#1/#2}}

\newcommand{\enableparagraphspacing}{\setlength{\parskip}{2ex plus 0.5ex minus 0.2ex}}

% No indent
\setlength{\parindent}{0pt}

% Helvetica by default
\renewcommand{\rmdefault}{phv}
