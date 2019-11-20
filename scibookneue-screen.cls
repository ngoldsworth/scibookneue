\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-screen}
\LoadClass[oneside]{memoir}

% Declare we're the printed scibookneue 
\newcommand{\@sbn@class}{memoir} % The base LaTeX class
\newcommand{\@sbn@pkgname}{scibookneue-screen}


%% Load elements common to both
\input{scibookneue-common.def}

\RequirePackage[% Page Setup
	%showframe,
	paperheight=10.5in,
	paperwidth=16.8in,
	marginparwidth=5in,
	marginparsep=3em,
	left=3.5in,
	right=6in,
	bottom=.75in,
	top=1in,
]{geometry}

% Color management.
% Define a default accent color and default color for links
\RequirePackage{xcolor}
	\definecolor{accent}{rgb}{1,0,0} % Defining the accent color (red by default)
	\definecolor{lnkcol}{rgb}{.5,0,0} % Defining a links color, that will be used later for any clickable links. Should be (ideally) a darker version of `accent`, as to not be a strain to the readers' eyes. 

% Titles and 
\RequirePackage[pagestyles]{titlesec}
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

     %% CHAPTERS STYLING
	\titleformat{\chapter}[display]%
	{\color{black}\Huge\sffamily\bfseries}% format
	{Chapter \thechapter \hskip 12pt\\}%
	{10pt}% horizontal sep
	{}% before


     %% PAGE STYLES
	% Defining headers, footers, pagenumbers, etc.	
	\newpagestyle{main}{
	    \widenhead*{6cm}{3cm}
	    \setfoot[\footnotesize{\thepage\quad$\vert$\quad Section \thesection: \sectiontitle}][][]
		    {\footnotesize{\thepage\quad$\vert$\quad Section \thesection: \sectiontitle}}{}{}
	}
	\pagestyle{main}
	\assignpagestyle{\chapter}{empty}




% Cross Reference Linking
% The `hyperref package` nicely creates in-document links not only to local files and webpages,
% but also accross the document. 
\usepackage[
	setpagesize=false,
	colorlinks=true,
	linkcolor=lnkcol, % Use the `lnkcol` defined above.
	urlcolor=accent,
	bookmarksopen=true
]{hyperref}

% For improved intra-document referencing, use the Cleveref package
\RequirePackage{cleveref}

\RequirePackage{amsmath}
\RequirePackage[amsmath]{ntheorem}
	% Define new theorem-style
	\setlength{\labelsep}{2em}
	\makeatletter
	\newtheoremstyle{marginlab}
	{\item[\theorem@headerfont \llap{##1 ##2}]}%
	{\item[\theorem@headerfont \llap{##1 ##2}| ##3\theorem@separator\hskip\labelsep]}%
	\makeatother

	% Define new non-numbered theorem-style
	\makeatletter
	\newtheoremstyle{nonumbermarginlab}
	{\item[\theorem@headerfont \llap{##1}]}%
	{\item[\theorem@headerfont \llap{##1}| ##3\theorem@separator\hskip\labelsep]}%
	\makeatother

	% Definitions:
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{\gamma}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{}
	\newtheorem{mdef}{\color{accent}{Definition}}
	\crefname{mdef}{definition}{definintions}
	\numberwithin{mdef}{section}

	% Theorems
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{{\color{accent}\smallskip\hrule\smallskip}}
	\theorempostwork{{\color{accent}\smallskip\hrule\smallskip}}
	\theoremseparator{:}
	\newtheorem{mthm}{\color{accent}{Theorem}}
	\crefname{mthm}{theorem}{theorems}
	\numberwithin{mthm}{chapter}
	
	% Proof
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{}
	\newtheorem*{mproof}{\color{accent}{\itshape Proof}}


% MARGIN FLOATS.
% The goal of the scibookneue-screen class is to produce a textbook as a PDF 
% designed for screens. Part of this is to put tables, figures, graphs, plots,
% code, etc.. somewhere other than in the main body, unless absolutely necessary. 
% The following float environments are responsible for this behavior

% Use the `placeins` package, which provides the \FloatBarrier command,
% forcing LaTeX to place floats before proceeding. 
% This helps keep the float numbers in sequence
\RequirePackage{placeins}

% Begin the general float environment

\newsavebox{\@sbn@margin@floatbox}
\newenvironment{@sbn@margin@float}[2][-1.2ex]%
   {\FloatBarrier% process all floats before here, to maintain correct sequence.
    \begin{lrbox}{\@sbn@margin@floatbox}%
    \begin{minipage}{\marginparwidth}% creates a ``minipage'' that fits nicely in the margin
    \@sbn@caption@font%
    \hbox{}\vspace*{#1}%
    \@sbn@caption@justification%  Use the desired justification
    \@sbn@margin@par%
    \nodindent%
   }
   {\end{minipage}
   \end{lrbox}
   \marginpar{\usebox{\@sbn@margin@floatbox}}
   }

% Now, define a margin FIGURE. This figure will have the same name as the default figure
% in the scibookneue-print class. The reasoning for this, is that authors should be free to switch
% between the print and screen layouts easily.

\newenvironment{sbnfigure}[1][-1.2ex]%
 {\begin{@sbn@margin@float}[#1]{figure}}
 {\end{@sbn@margin@float}}


% Now, define a margin TABLE. This figure will have the same name as the default table
% in the scibookneue-print class. The reasoning for this, is that authors should be free to switch
% between the print and screen layouts easily.

\newenvironment{sbntable}[1][-1.2ex]%
 {\begin{@sbn@margin@float}[#1]{table}}
 {\end{@sbn@margin@float}}
  
