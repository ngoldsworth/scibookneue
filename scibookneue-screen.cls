\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scibookneue-screen}
\LoadClass{memoir}


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

