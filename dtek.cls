\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtek}[2013/04/07 Datateknologsektionen Chalmers]


\LoadClass[12pt]{scrartcl}

\RequirePackage[quiet]{fontspec}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[swedish, iso]{isodate}
\RequirePackage{calc}

\RequirePackage[unicode]{hyperref}

\RequirePackage[includeheadfoot, top=2.0cm, bottom=3cm]{geometry}

% Remove the numbers from all the headings (\section, \subsection, etc.)
%\setcounter{secnumdepth}{-1}
\addtokomafont{disposition}{\rmfamily}


\definecolor{links}{HTML}{0000FF}
\hypersetup{
  colorlinks,
  urlcolor=links
}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}

\pagestyle{fancy}

\fancyhf{}
\newcommand{\headleft}{%
\raisebox{-3mm}{\includegraphics[width=14mm]{dteklogo}}\hspace{1mm}
\parbox[b]{5cm}{Datateknologsektionen\\
Chalmers studentkår}%
}

\settototalheight\headheight{\headleft}
\addtolength\headheight{0.4pt}
\lhead{\headleft}

\rhead{Sidan \thepage\ av \pageref{LastPage}\\\@date}
\renewcommand{\headrule}{
\nointerlineskip
\hskip 14mm\hrulefill
}

\endinput