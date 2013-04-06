\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtek}


\LoadClass[12pt]{scrartcl}

\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{datetime}
\RequirePackage{calc}

\RequirePackage[unicode]{hyperref}

\RequirePackage[includeheadfoot, top=2.0cm, bottom=3cm]{geometry}

% Remove the numbers from all the headings (\section, \subsection, etc.)
\setcounter{secnumdepth}{-1}
\addtokomafont{disposition}{\rmfamily}


\hypersetup{
  colorlinks=true
}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}

\pagestyle{fancy}


\renewcommand{\dateseparator}{-}

\fancyhf{}
\newcommand{\headleft}{%
\raisebox{-3mm}{\includegraphics[width=14mm]{dteklogo}}\hspace{1mm}
\parbox[b]{5cm}{Datateknologsektionen\\
Chalmers studentkår}%
}

\settototalheight\headheight{\headleft}
\addtolength\headheight{0.4pt}
\lhead{\headleft}

\rhead{Sidan \thepage\ av \pageref{LastPage}\\\yyyymmdddate\@date}
\renewcommand{\headrule}{
\nointerlineskip
\hskip 14mm\hrulefill
}

\endinput