\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{impression}[2012/07/22 A class for constructing resumes and CVs]

\RequirePackage{url}

%%% Opening Options
\newcommand{\@ptsize}{}
%\@titlepagefalse

\DeclareOption{letterpaper}%
	{\setlength\paperheight{11in}\setlength\paperwidth{8.5in}}
	
\DeclareOption{oneside}%
	{\@twosidefalse\@mparswitchfalse}

\DeclareOption{10pt}%
	{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}%
	{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}%
	{\renewcommand{\@ptsize}{2}}

\DeclareOption{draft}%
	{\setlength{\overfullrule}{5pt}}
\DeclareOption{final}%
	{\setlength{\overfullrule}{0pt}}

\ExecuteOptions{letterpaper,oneside,11pt,final}
\ProcessOptions
\input{size1\@ptsize.clo}

%%% Document Options
\global\let\@name\@empty
\global\let\@phone\@empty
\global\let\@address\@empty
\global\let\@email\@empty
\global\let\@website\@empty

\newcommand{\name}%
	[1]{\renewcommand{\@name}{#1}}
\newcommand{\phone}%
	[1]{\renewcommand{\@phone}{#1}}
\newcommand{\address}%
	[1]{\renewcommand{\@address}{#1}}
\newcommand{\email}%
	[1]{\renewcommand{\@email}{#1}}
\newcommand{\website}%
	[1]{\renewcommand{\@website}{#1}}

%%%
\newcommand{\maketitle}{}

\newcommand{\section}{}

% T  A  D	post
% T  A -D	position
% T -A  D	event
% T -A -D	topic
%-T  A  D	member
%-T  A -D	affiliation
%-T -A  D	dated
%-T -A -D	entry (do we REALLY want this? (it encourages unstructured data))

\newenvironment{post}        [4]{}{}
\newenvironment{position}    [2]{}{}
\newenvironment{event}       [3]{}{}
\newenvironment{topic}       [1]{}{}
\newenvironment{member}      [3]{}{}
\newenvironment{affiliation} [1]{}{}
\newenvironment{dated}       [2]{}{}
\newenvironment{entry}          {}{}

%\newcommand{\post}[4]{\begin{post}{#1}{#2}{#3}{#4}\end{post}}
%\newcommand{\position}[2]{\begin{position}{#1}{#2}\end{position}}
%\newcommand{\event}[3]{\begin{event}{#1}{#2}{#3}\end{event}}
%\newcommand{\topic}[1]{\begin{topic}{#1}\end{topic}}
%\newcommand{\member}[3]{\begin{member}{#1}{#2}{#3}\end{member}}
%\newcommand{\affiliation}[1]{\begin{affiliation}{#1}\end{affiliation}}
%\newcommand{\dated}[2]{\begin{dated}{#1}{#2}\end{dated}}
%\newcommand{\entry}{\begin{entry}\end{entry}}

%%%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

%%%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
        
%%%
\renewenvironment{itemize}{
	\begin{list}{--}{
		\setlength{\itemsep}{0pt}\setlength{\topsep}{0pt}
		\setlength{\leftmargin}{1.5em}\setlength\parsep{2pt}
		\setlength\labelsep{.125in}
	}
}
{
	\end{list}
}

\newenvironment{description}[1]{
	\begin{list}{}{
		\setlength\labelwidth{#1}
		\setlength\leftmargin{#1}\setlength\parsep{2pt}
		\setlength\labelsep{.125in}\setlength\itemsep{0in}
		\setlength{\topsep}{0pt}\setlength{\partopsep}{-5pt}
	}
}{
	\end{list}
}


%%%
\setlength\leftmargini   {2.50em}
\setlength\leftmarginii  {2.20em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.70em}
\setlength\leftmarginv   {1.00em}
\setlength\leftmarginvi  {1.00em}

\leftmargin\leftmargini

\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}



\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


\def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
  
  
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty