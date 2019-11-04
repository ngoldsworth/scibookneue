\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-print}
\LoadClass{memoir}

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
	{\item[\theorem@headerfont \llap{\color{accol}{##1 ##2}}\hskip\labelsep]}%
	{\item[\theorem@headerfont \llap{\color{accol}{##1 ##2}}\hskip\labelsep (##3)\theorem@separator]}%
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
	\numberwithin{mdef}{chapter}

	% Theorems
	\theoremstyle{marginlab}
	\theoremheaderfont{\normalfont\bfseries}
	\theorempreskip{0cm}
	\theorempostskip{0cm}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{{\color{accol}\smallskip\hrule\smallskip}}
	\theorempostwork{{\color{accol}\smallskip\hrule\smallskip}}
	%\theoremprework{}
	%\theorempostwork{}
	\theoremseparator{:}
	\newtheorem{mthm}{\color{accol}{Theorem}}
	\numberwithin{mthm}{chapter}

	% Proof
	\theoremstyle{marginlab}
	\theorembodyfont{\normalfont}
	\theoremsymbol{}
	\theoremprework{}
	\theorempostwork{}
	\theoremseparator{}
	\newtheorem*{mproof}{\color{accol}{\itshape Proof}}


\RequirePackage[pagestyles]{titlesec}
	% titlesec used to format the page headers, footers, and sectioning titles
	
     %% PAGE STYLES
	% defining headers, footers, pagenumbers etc
	\newpagestyle{main}{
	    \sethead[\footnotesize{\thepage\quad$\vert$\quad Chapter \thechapter: \chaptertitle}][][]
		    {}{}{\footnotesize{Section \thesection: \sectiontitle \quad$\vert$\quad\thepage}}
	}
	\pagestyle{main}
	\assignpagestyle{\chapter}{empty}

	% Chapters
	\titleformat{\chapter}%
	{\color{black}\Huge\sffamily\bfseries}% format
	{\llap{% label
	    \thechapter\hskip 9pt}}%
	{0pt}% horizontal sep
	{}% before


	\titleformat{\section}%
	{\Large\sffamily\bfseries}% format
	{\llap{% label
	    \thesection\hskip 9pt}}%
	{0pt}% horizontal sep
	{}% before
