%%
%% This is file `wipb.cls`.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{wipb}[2009/07/31 v1.3 LaTeX document class (MZ)]

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{mbook}%
}
\ExecuteOptions{magisterska,a4paper,12pt,oneside}
\ProcessOptions %\relax

\LoadClass[oneside,12pt]{mbook}
\RequirePackage[OT4,plmath]{polski}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage[colorlinks,plainpages=false,
 pdfpagelabels,
 naturalnames=true,
  dvips]{hyperref}
\RequirePackage[tableposition=top]{caption}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage[ruled]{algorithm2e}%algorytmy
\RequirePackage{tikz}
\RequirePackage{indentfirst}
\RequirePackage{t1enc}
\RequirePackage{times}

\pagestyle{headings}
\parindent=1cm
\linespread{1.5}

%definicje odstepow
\hoffset -1 in
\textwidth 15.5 cm
\voffset -1 in
\textheight 23.5 cm
\oddsidemargin = 3.5cm
\evensidemargin = 3.5cm
\topmargin = 1.5 cm

\def\typpracy#1{\gdef\@typpracy{#1}}
\def\temat#1{
\gdef\@temat{#1}
\title{#1}
}
\def\autor#1{\gdef\@autor{#1} \author{#1}}
\def\promotor#1{\gdef\@promotor{#1}}
\def\indeks#1{\gdef\@indeks{#1}}
\def\studia#1{\gdef\@studia{#1}}
\def\rokakademicki#1{\gdef\@rokakademicki{#1}}
\def\profil#1{\gdef\@profil{#1}}
\def\kierunekstudiow#1{\gdef\@kierunekstudiow{#1}}
\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\def\zakres#1{\gdef\@zakres{#1}}
\newcounter{@zak}

\newcommand{\mcolumns}[4]{
\multicolumn{#1}{#2}{\parbox{#3\textwidth}{#4}}
}

\newcommand{\mpbox}[1]{
\parbox{.3\textwidth}{\centering #1}
}

\newcommand{\biblioteka}[1]
{\pagebreak
\pagestyle{empty}
~\\ \vspace{2cm}
\begin{center}
{\Large    \textsc{Oświadczenie}}
\end{center}
\vspace{2cm}
Ja, \@autor, \ifthenelse{\equal{nie}{#1}}{nie wyrażam zgody}{wyrażam zgodę} na udostępnienie mojej pracy dyplomowej,  pt: ,,\@temat'' w Bibliotece Politechniki Białostockiej.
\vspace{2cm}
\begin{flushright}
\mpbox{...................................\\
\today
{\scriptsize \\[-1em] czytelny podpis}}\hspace{1cm}~
\end{flushright}
}

\def\clearheadinfo{\gdef\@autor{Brak autora}%
                  \gdef\@temat{Brak Tytułu}%
                  \gdef\@institute{Brak Katedry}%
}

\renewenvironment{titlepage}{%
%%%%%%%%%strona tytulowa%%%%%%%%%%
    \cleardoublepage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{empty}%
  }%
  {\if@restonecol\twocolumn \else \newpage \fi}


\clearheadinfo
\renewcommand\maketitle{%
  \begin{titlepage}
    \linespread{1.0}
    \begin{center}
      {\Large\textbf{POLITECHNIKA BIAŁOSTOCKA}\par}
      \vspace{\stretch{.3}}
      {\Large\textbf{WYDZIAŁ INFORMATYKI}\par}
      \vspace{\stretch{1}}
      {\LARGE PRACA DYPLOMOWA \@typpracy\par}
      \vspace{\stretch{2}}
      {\Large TEMAT: \@temat\par}
      \begin{flushright}
          \vspace{\stretch{2}}
          {\Large\textsc{Wykonawca: \@autor} \par}
      \end{flushright}
      \begin{flushleft}
          \vspace{\stretch{1}}
          {\Large OPIEKUN PRACY DYPLOMOWEJ: \@promotor \par}
      \end{flushleft}
      \vspace{\stretch{2}}
      {\large\textbf{BIAŁYSTOK \number\year\ ROK}\par}
   \end{center}
   \end{titlepage}
   \if@twoside
      {\pagestyle{empty}
      \cleardoublepage}
  \else
  \fi
  %\setcounter{page}\@ne

%%%%%%%metryczka%%%%%%%%%
\pagestyle{empty}
\begin{center}
    {\large\bfseries Karta dyplomowa}\\%[1em]
  \begin{tabular}{|p{.3\textwidth}|p{.3\textwidth}|p{.3\textwidth}|}
    \hline
      \multirow{2}{.3\textwidth}{\mpbox{Politechnika Białostocka\\Wydział Informatyki}}&\multirow{3}{.3\textwidth}{\raisebox{-5.5em}{\mpbox{Studia \@studia\\\@profil}}}&\hspace{0mm}\mpbox{ Numer albumu studenta:\@indeks}\\[7mm]
    \cline{3-3}
      & &Rok akademicki \@rokakademicki\\
    \cline{3-3}
      \raisebox{-3em}{\mpbox{}}&&\hspace{0mm}\mpbox{Kierunek studiów: \@kierunekstudiow\\Specjalność: \@specjalnosc}\\[14mm]
    \hline
      \multicolumn{3}{|c|}{\raisebox{-1em}{\textbf{\@autor}}}\\[1em]
      \multicolumn{3}{|l|}{\parbox[c][3em][c]{.8\textwidth}{\textbf{TEMAT PRACY DYPLOMOWEJ: \@temat}}}\\[2mm]
      \multicolumn{3}{|l|}{Zakres pracy:}\\[1mm]
      \multicolumn{3}{|l|}{\hspace{1em}\parbox{.8\textwidth}{\@zakres}}\\[5em]
      \multicolumn{3}{|l}{\textbf{Słowa kluczowe (max 5):}}\\[5em]
      \multicolumn{3}{|r|}{\scriptsize\parbox{.6\textwidth}{\centering .................................................................................\\\footnotesize \scriptsize{imiona i nazwisko, stopień opiekuna pracy dyplomowej i podpis}}}\\[1.5em]
    \hline
    \end{tabular}
\end{center}
}

%% spolszczenia
\renewcommand{\listalgorithmcfname}{Spis algorytmów}%
\renewcommand{\algorithmcfname}{Algorytm}%
\renewcommand{\algocf@typo}{}%
\renewcommand{\@algocf@procname}{Procedura}
\renewcommand{\@algocf@funcname}{Funkcja}
\renewcommand{\lstlistlistingname}{Spis listingów}%Nagłówek spisu listingów
\renewcommand{\lstlistingname}{Listing} %Nagłówek listingu

\endinput
