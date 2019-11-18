\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-screen}
\LoadClass[oneside]{memoir}

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

\RequirePackage{xcolor}
	\definecolor{accol}{rgb}{1,0,0} % Defining the accent color (red by default)
	\definecolor{lnkcol}{rgb}{.5,0,0} % Defining a links color, that will be used later for any clickable links. Should be (ideally) a darker version of `accol`, as to not be a strain to the readers' eyes. 

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
	urlcolor=accol,
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
	\newtheorem{mdef}{\color{accol}{Definition}}
	\crefname{mdef}{definition}{definintions}
	\numberwithin{mdef}{section}

	% Theorems
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{{\color{accol}\smallskip\hrule\smallskip}}
	\theorempostwork{{\color{accol}\smallskip\hrule\smallskip}}
	\theoremseparator{:}
	\newtheorem{mthm}{\color{accol}{Theorem}}
	\crefname{mthm}{theorem}{theorems}
	\numberwithin{mthm}{chapter}
	
	% Proof
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{}
	\newtheorem*{mproof}{\color{accol}{\itshape Proof}}



