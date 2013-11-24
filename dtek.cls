\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtek}[2013/04/07 Datateknologsektionen Chalmers]

\newif\ifprotokoll
\protokollfalse
\DeclareOption{protokoll}{\protokolltrue}

\newif\iftwojust
\twojustfalse
\DeclareOption{twojust}{\twojusttrue}

\newif\ifincludeaddress
\includeaddressfalse
\DeclareOption{includeaddress}{\includeaddresstrue}

\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage[quiet]{fontspec}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[swedish, iso]{isodate}
\RequirePackage{calc}
\RequirePackage[unicode]{hyperref}
\RequirePackage[includeheadfoot, top=2.0cm, bottom=4cm]{geometry}
\RequirePackage{xparse}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}

\NewDocumentCommand\funktionar{ommm}{%
\IfNoValueTF {#1}
  {}
  {\global\expandafter\def\csname #1\endcsname{#3}}
  #2 & #3 & #4\\
 }

\DeclareDocumentCommand \motesnummer {m}{%
  \DeclareDocumentCommand \@motesnummer {}{#1}
}
\DeclareDocumentCommand \verksamhetsar {m}{%
  \DeclareDocumentCommand \@verksamhetsar {}{#1}
}
\DeclareDocumentCommand \start {m}{%
  \DeclareDocumentCommand \@start {}{#1}
}
\DeclareDocumentCommand \plats {m}{%
  \DeclareDocumentCommand \@plats {}{#1}
}

\DeclareDocumentEnvironment {funktionarer}{}{%
  Närvarande:
  
  \begin{tabular}{l l l}
    \itshape Funktion & \itshape Namn & \itshape E-mail\\
}{%
  \end{tabular}
}

\DeclareDocumentCommand \maketitle {}{%
  {\centering \bf{\LARGE{\@title}}\par}
  {\centering \@date\par}
  \vspace{1cm}
}

% Set up headers

\pagestyle{fancy}
\fancyhf{}

\newcommand{\headleft}{%
  \raisebox{-3mm}{\includegraphics[width=16mm]{dteklogo}}\hspace{1mm}
  \parbox[b]{10cm}{%
    \textbf{Datateknologsektionen}\\
    Chalmers studentkår\\
    \@title
  }
}
\newcommand{\headright}{%
  Sidan \thepage\ av \pageref{LastPage}\\
  \@date
  \ifprotokoll
    \\ Mötesnr. \@motesnummer\ - \@verksamhetsar
  \fi
}

% Calculate header height
\settototalheight\headheight{\headleft}
\addtolength\headheight{1.0pt}

\lhead{\headleft}
\rhead{\headright}

\renewcommand{\headrule}{
  \nointerlineskip
  \hskip 16mm\hrulefill
}

\DeclareDocumentCommand \makesign {m} {%
  \parbox{0.47\textwidth}{%
    \vspace{2cm}
    \rule{0.47\textwidth}{0.5pt}\\
    #1
  }
}

\ifincludeaddress
  \renewcommand{\footrulewidth}{\headrulewidth}

  \lfoot{%
    \flushleft Datateknologsektionen\\
    Rännvägen 8\\
    412 96 Göteborg
  }
  
  \rfoot{%
    \begin{flushright}
      \href{mailto:styret@dtek.se}{styret@dtek.se}\\
      \href{http://dtek.se}{www.dtek.se}
    \end{flushright}
  }
\fi

\ifprotokoll
  \DeclareDocumentCommand \maketitle {}{%
    {\centering \bf{\LARGE{\@title\ \@date}}\par}
    
    Kl: \@start\\
    Mötesnummer: \@motesnummer\ - \@verksamhetsar\\
    Plats: \@plats
  }

  \DeclareDocumentCommand \makesigns {m m o o}{%
    \parbox{\textwidth}{%
      \makesign{Sekreterare #1}
      
      \makesign{Mötesordförande #2}

      \IfValueTF{#3}{%
        \makesign{Justerare #3}
      }{}

      \IfValueTF{#4}{%
        \makesign{Justerare #4}
      }{}
    }
  }

  \cfoot{%
    \vspace{0.55cm}
    \parbox{26pt}{%
      \centering
      \rule{25pt}{0.5pt}\\
      Sekr.
    }
    \hspace{1pt}
    \parbox{26pt}{%
      \centering
      \rule{25pt}{0.5pt}\\
      Ordf.
    }
    \hspace{1pt}
    \iftwojust
      \parbox{54pt}{%
        \centering
        \rule{25pt}{0.5pt}\hspace{4pt}\rule{25pt}{0.5pt}\\
        Justerare
      }
    \else
      \parbox{26pt}{%
        \centering
        \rule{25pt}{0.5pt}\\
        Just.
      }
    \fi
  }
\fi

\endinput
