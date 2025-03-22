%% homework.cls  Copyright (C) 2020  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to
%% redistribute it under certain conditions; read
%% file COPYING for more details.

% Put in /usr/local/texlive/texmf-local/tex/latex/local
% And then re-index, see: https://tex.stackexchange.com/q/1137/215221
% Latex documentation: https://en.wikibooks.org/wiki/LaTeX
% 'em' is the horizontal space unit and 'ex' is the vertical

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2023/01/01 Homework]
\def\hw@ptsize{12pt} % https://tex.stackexchange.com/a/634138/215221
\DeclareOption{10pt}{\def\hw@ptsize{10pt}}
\DeclareOption{11pt}{\def\hw@ptsize{11pt}}
\DeclareOption{12pt}{\def\hw@ptsize{12pt}}
\def\hw@side{oneside}
\DeclareOption{oneside}{\def\hw@side{oneside}}
\DeclareOption{twoside}{\def\hw@side{twoside}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax
\PassOptionsToPackage{approx}{numerica}
\LoadClass[\hw@ptsize, \hw@side]{amsart}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{lmodern, enumitem, needspace} % needspace for dynamic line breaking
\RequirePackage{ifthen, titlesec, framed, textcomp, gensymb}
\RequirePackage{siunitx, setspace}
\RequirePackage{physics, numerica}
\RequirePackage{hwsymb, hwlst, hwcmd} % tashfeen's
\RequirePackage{hyperref} % for pdf bookmarks, other information and org-mode
\RequirePackage{tikz, amsmath, etoolbox, atveryend}

\AtBeginEnvironment{align}{\setcounter{equation}{0}}
\AtBeginEnvironment{gather}{\setcounter{equation}{0}}

\listxadd{\questionslist}{}
% Quality Control checker
\newcounter{questions}
\setcounter{questions}{0}
\newcounter{listcountercounter}
\newcommand{\listcount}[1]{
	\setcounter{listcountercounter}{0}
	\renewcommand{\do}[1]{\stepcounter{listcountercounter}}
	\dolistloop{#1}
	\arabic{listcountercounter}
}
\def \questioncheckershouldrun{1}
\newcommand{\skipquestioncheck}{ \def \questioncheckershouldrun{0} }
\AtEndDocument{
    \ifnum\questioncheckershouldrun=1\relax%
	\ifdef{\questionslist}{
	\texttt{\small \color{red} \listcount{\questionslist}/\arabic{questions} questions
	\renewcommand{\do}[1]{#1 }
	(\dolistloop{\questionslist})
	remain unchecked.
}}{}
  \fi
}



\hypersetup {
  pdfstartview=FitH,
  colorlinks=true
}

\gdef\@author{\empty}
\gdef\@class{\empty}
\gdef\@honor{On my honor I have neither given nor received unauthorized assistance on this assignment.}
\gdef\@colorseed{0}
\newcommand{\class}[1]{\gdef\@class{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\honor}[1]{\gdef\@honor{#1}}
\newcommand{\colorseed}[1]{\gdef\@colorseed{#1}}


\def\styleColor{style_color!60}

\titleformat{name=\section}[block]{\bf\large\filcenter}{\thesection}{1em}{}
\titleformat{name=\section,numberless}[block]{\color{black!80}\bf\slshape\large}{}{0.1em}{}[\color{\styleColor}\vspace{-\baselineskip + 4.5pt}\rule{.25\linewidth}{0.3pt}\vspace{-4pt}]
\titleformat{name=\subsection,numberless}[block]{\bf\normalsize\filcenter}{}{0.1em}{\underline}
\titleformat{name=\subsubsection,numberless}[block]{\normalfont\normalsize\filcenter}{}{0.1em}{}

\AtBeginDocument{
  \hypersetup {
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@class}
  }

}


\ExplSyntaxOn
\cs_new_eq:NN \setrandomseed \sys_gset_rand_seed:n
\ExplSyntaxOff
\renewcommand{\maketitle} {%
\setrandomseed{\@colorseed}
\definecolor{style_color}{HSB}{\fpeval{randint(0,240)},240,240}
  \noindent
  \begin{minipage}{0.80\textwidth}
  \noindent\ifthenelse{\equal{\@author}{\empty}}{}{\@author\par}%
  \noindent\ifthenelse{\equal{\@honor}{\empty}}{}{\@honor\par}%
\end{minipage}
\noindent
\begin{minipage}{.19\textwidth}
  \raggedleft
  \noindent\@date\par
  \noindent\ifthenelse{\equal{\@date}{\today}}{C: \today\par}{}
  \noindent\ifthenelse{\equal{\@class}{\empty}}{}{\@class\par}%
\end{minipage}
\ifthenelse{\equal{\@title}{\empty}}{}{\\\vspace{\medskipamount}}%
  \begin{center}\unskip%
    \textbf{\ifthenelse{\equal{\@title}{\empty}}{
    \\{\vspace{-\baselineskip +1.5pt}\color{\styleColor}\rule{0.98\textwidth}{1pt}\vspace{3pt - \baselineskip}}\\
}{\@title\vspace{-5pt}\\}}%
  \end{center}%
  \addvspace{1.9\bigskipamount}%
}

