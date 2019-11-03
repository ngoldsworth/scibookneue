\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-screen}
\LoadClass{memoir}

\RequirePackage[% Page Setup
	%showframe,
	paperheight=10.5in,
	paperwidth=16.8in,
	marginparwidth=5in,
	marginparsep=3em,
	left=3.5in,
	right=6in,
	bottom=.5in,
	top=1in,
]{geometry}

\RequirePackage{xcolor}
	\definecolor{accol}{rgb}{1,0,0} % Defining the accent color (red by default)

\RequirePackage{titlesec}
% stolen from https://tex.stackexchange.com/questions/302658/section-headings-in-a-separate-column
% and modified
     %% SECTIONS STYLING
     \titleformat{\section}[leftmargin]
	{\filleft\LARGE\sffamily\bfseries}
	{\hfill\thesection}
	  {0pt}
	  {\newline\filleft}
	\titlespacing*{\section}
	  {6cm}
	  {2ex plus .2ex minus .2ex}
	  {2em} % Determines the spacing between the "left margin column" and body type

     %% SUBSECTIONS STYLING
     \titleformat{\subsection}[leftmargin]
	{\vspace{1em}\filleft\large\bfseries\sffamily}% The vspace here keeps short subsections' titles from overlapping
	{\hfill\thesubsection}
	  {0pt}
	  {\newline\filleft}
	\titlespacing*{\subsection}
	  {6cm}
	  {2ex plus .2ex minus .2ex}
	  {2em} % Determines the spacing between the "left margin column" and body type

\RequirePackage{amsmath}
\RequirePackage[amsmath]{ntheorem}
	% Define new theorem-style
	\setlength{\labelsep}{2em}
	\makeatletter
	\newtheoremstyle{marginlab}
	{\item[\theorem@headerfont \llap{##1 ##2}]}%
	{\item[\theorem@headerfont \llap{##1 ##2}| ##3\theorem@separator\hskip\labelsep]}%
	\makeatother

	% Definitions:
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{\gamma}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{}
	\newtheorem{margindef}{\color{accol}{Definition}}
	\numberwithin{margindef}{section}

	% Theorems
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{{\color{accol}\hrule\smallskip}}
	\theorempostwork{{\color{accol}\hrule\smallskip}}
	\theoremseparator{:}
	\newtheorem{marginthm}{\color{accol}{Theorem}}
	\numberwithin{marginthm}{section}
