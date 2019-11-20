\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-print}
\LoadClass[oneside]{memoir}

% Declare we're the printed scibookneue 
\newcommand{\@sbn@class}{memoir} % The base LaTeX class
\newcommand{\@sbn@pkgname}{scibookneue-print}

%% Load elements common to both
\input{scibookneue-common.def}

\RequirePackage[
	%showframe,
	paperheight=9in,
	paperwidth=7.2in,
	top=.75in,
	bottom=.75in,
	textwidth=4.625in,
	right=.75in,
]{geometry}

\RequirePackage{pstricks}
\RequirePackage[
	amsthm,
	thmmarks,
	noconfig,
	amsmath,
	framed
]{ntheorem}
	% Define a separation between the margin label and the content its labeling
	\setlength{\labelsep}{1em}
	\makeatletter
	% Make a new theoremstyle that puts a red label in th eleft margin
	\newtheoremstyle{marginlab}
	{\item[\theorem@headerfont \llap{\color{accent}{##1 ##2}}\hskip\labelsep]}%
	{\item[\theorem@headerfont \llap{\color{accent}{##1 ##2}}\hskip\labelsep (##3)\theorem@separator]}%
	\makeatother

	% Define new non-numbered theorem-style
	\makeatletter
	\newtheoremstyle{nonumbermarginlab}
	{\item[\theorem@headerfont \llap{##1}]}%
	{\item[\theorem@headerfont \llap{##1}| ##3\theorem@separator\hskip\labelsep]}%
	\makeatother


	% THEOREM-TYPE ENVIRONEMNTS
	% Produce a theorem-like environment for each of the desired left-hand margin labels
	% Included here are Definintions, Theorems (and their proofs), Lemmas (and their proofs),
	% Conjectures, Corallaries (and their proofs), and Examples
	% Definitions:
	\theoremstyle{marginlab}
	\theoremheaderfont{\normalfont}
	\theorempreskip{0cm}
	\theorempostskip{0cm}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{:}
	\newtheorem{mdef}{{Definition}}
	\crefname{mdef}{definition}{definintions}
	\numberwithin{mdef}{chapter}

	% Theorems
	\theoremstyle{marginlab}
	\theoremheaderfont{\normalfont\bfseries}
	\theorempreskip{0cm}
	\theorempostskip{0cm}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{{\color{accent}\smallskip\hrule\smallskip}}
	\theorempostwork{{\color{accent}\smallskip\hrule\smallskip}}
	%\theoremprework{}
	%\theorempostwork{}
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


\RequirePackage[pagestyles]{titlesec}
	% titlesec used to format the page headers, footers, and sectioning titles
	
     %% PAGE STYLES
	% defining headers, footers, pagenumbers etc
	\newpagestyle{main}{ \sethead[\footnotesize{\thepage\quad$\vert$\quad Chapter \thechapter: \chaptertitle}][][]
		    {}{}{\footnotesize{Section \thesection: \sectiontitle \quad$\vert$\quad\thepage}}
	}
	\pagestyle{main}
	\assignpagestyle{\chapter}{empty}

     %% TITLE FORMATS
	% Chapters
	\titleformat{\chapter}%
	{\color{black}\Huge\sffamily\bfseries}% format
	{\llap{% label
	    \thechapter\hskip 12pt}}%
	{0pt}% horizontal sep
	{}% before


	\titleformat{\section}%
	{\Large\sffamily\bfseries}% format
	{\llap{% label
	    \thesection\hskip 9pt}}%
	{0pt}% horizontal sep
	{}% before

% Cross Reference Linking
% The `hyperref package` nicely creates in-document links not only to local files and webpages,
% but also accross the document. 
\usepackage[
	colorlinks=true,
	linkcolor=black, % In a print book, don't need the links to be colored. 
			 % Print books aren't clickable, yet.
	urlcolor=accent,
	bookmarksopen=true
]{hyperref}


