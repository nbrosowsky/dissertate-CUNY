% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "DissertateCUNY.cls",
%     version         = "1.0",
%     date            = "14 12 2018",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     note            = "Based on 'Dissertate' by Jordan Suchow and 'DissertateUSU' by Tyson Barrett,
%                        For support, email 'nbrosowsky@gradcenter.cuny.edu',
%     docstring       = "Class for a dissertation at City University of New York."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DissertateCUNY}[2018/12/14 v1.0 DissertateCUNY Class]
\LoadClass[12pt, oneside, letterpaper]{book}



%%%%%%%%%%%%%%%%%
%%   Options   %%
%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}

%{{{ Line-spacing control
\RequirePackage{setspace}
\newcommand{\singlespaced}{\singlespacing}
\newcommand{\doublespaced}{\doublespacing}
\newcommand{\triplespaced}{\setstretch {2.6}}
%}}}

% Text layout.
\usepackage{ragged2e}
\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\usepackage{parskip}
\setlength{\parindent}{1cm}
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\usepackage{indentfirst}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\RequirePackage[labelfont={bf,small,singlespacing},
                textfont={small,singlespacing},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\RequirePackage{microtype}

\usepackage{placeins} %% floatbarrier command
\usepackage{chngcntr}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Headings & Headers         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\RequirePackage{titling}
\RequirePackage{lastpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      Appendix                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page number in upper right corner %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
\fancyhf{}                        % clear all header and footer fields
\fancyhead[R]{\thepage}           % page number in upper right corner
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: TABLE of CONTENTS -auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \normalfont}
\newcommand{\hsp}{\hspace{10pt}}

\renewcommand*{\tableofcontents}{
    \singlespaced
    \chapter*{ \begin{center} \textnormal{CONTENTS}  \end{center}}
    \hfill Page\\ 
    \@starttoc{toc}   
    \newpage
    \doublespaced
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: List of FIGURES -auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{{{ List of Figures
% LoF should be single-spaced within entries and double-spaced between entries 
\renewcommand*{\listoffigures}{
    \singlespaced
    \chapter*{\begin{center} \textnormal{LIST OF FIGURES} \end{center}}
    \addcontentsline{toc}{chapter}{LIST OF FIGURES}
    \noindent Figure \hfill Page\\   
    \@starttoc{lof}     
    \newpage
    \doublespaced
}
% Ensure double-spacing between entries
\renewcommand*\l@figure{\par\addvspace{\bigskipamount}\pagebreak[2]
 \@dottedtocline{1}{1.5em}{2.3em}}
%}}}


% Tables

\usepackage{multirow}
\usepackage{booktabs}
\usepackage{threeparttable}
\usepackage{array}
\newcolumntype{x}[1]{%
>{\centering\arraybackslash}m{#1}}%

% Allow for long captions and float captions on opposite page of figures
% \usepackage[rightFloats, CaptionBefore]{fltpage}

% Don't let floats cross subsections
% \usepackage[section,subsection]{extraplaceins}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: List of TABLES - auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{{{ List of Tables
% LoT should be single-spaced within entries and double-spaced between entries
\renewcommand*{\listoftables}{
    \singlespaced
    \chapter*{ \begin{center} \textnormal{LIST OF TABLES}  \end{center}}
    \addcontentsline{toc}{chapter}{LIST OF TABLES}
    \noindent Table \hfill Page\\  
    \@starttoc{lot}     
    \newpage
    \doublespaced
}
% Ensure double-spacing between entries
\renewcommand*\l@table{\par\addvspace{\bigskipamount}\pagebreak[2]
 \@dottedtocline{1}{1.5em}{2.3em}}
%}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: SECTION HEADINGS- auto fill %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\setthesection}{\roman{chapter}.\roman{section}}
\usepackage{quotchap}
\parskip 0pt


\usepackage{titlesec, blindtext, color}

\titleformat{\chapter}[display]
{\vspace{-60pt}\center}   %% spacing of chapter headings
{{CHAPTER \thechapter}}
{10pt}
{}

\titleformat{\section}[display]
{\normalfont\normalsize\bfseries\center}
{}
{0pt}
{{}}

\titleformat{\subsection}[display]
{\normalfont\normalsize\bfseries}
{}
{0pt}
{{}}

\titleformat{\subsubsection}[runin]
{\normalfont\normalsize\bfseries\itshape}
{}
{0pt}
{{}}
\titlespacing*{\subsubsection}{\parindent}{1ex}{0.5em}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \textsc{#1}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Floats: Figures & Tables          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\captionsetup{justification=raggedright}   
\setlength{\textfloatsep}{30pt plus 1.0pt minus 2.0pt}  
\setlength{\intextsep}{30pt plus 1.0pt minus 2.0pt}     
\setlength{\floatsep }{30pt plus 1.0pt minus 2.0pt}     


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: Title Page - info filled above    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
    \begin{titlepage}
        \begin{center}

        ~\vspace{2in}
        
        \doublespaced
        \textsc{\MakeUppercase{\@title}} \\[0.5in]
        by \\[0.5in]
        \textsc{\MakeUppercase{\@author}} 

        \vspace{\fill}
        \doublespaced
        A dissertation submitted to the Graduate Faculty in \field in partial fulfillment of the requirements for the degree of \degree, The City University of New York.\\[0.25in]
        \yeardegree

        \end{center}

    \end{titlepage}
    
    \pagenumbering{roman}
    \setcounter{page}{2}
	\clearpage
}


\newcommand{\approvalpage}{
\newpage
	\begin{center}
    \singlespaced
	\@title\\
    \doublespaced
	by\\
	\@author \\ 
    \vspace{50pt}
	\singlespaced
        This manuscript has been read and accepted for the Graduate Faculty in \field in satisfaction of the dissertation requirement for the degree of \degree.\\ 
    \end{center}
	\vspace{50pt}
	\noindent\begin{tabular}{ll}
    \makebox[2.8in]{\hrulefill} & \makebox[2.8in]{\hrulefill}\\    
    Date                     & \chairperson \\
                             & Chair of Examining Committee \\
    & \\
    & \\
    & \\
    & \\
    \makebox[2.8in]{\hrulefill} & \makebox[2.8in]{\hrulefill}\\    
    Date                    & \EO \\
                            & Executive Officer \\
    \end{tabular}
    
    \vspace{50pt}
    
    \begin{center}
    \doublespaced
        Supervisory Committee \\
        \committeeone \\
        \committeetwo \\
        \committeethree \\
    \end{center}
    
    \vspace{\fill}
    \begin{center}
        \textsc{THE CITY UNIVERSITY OF NEW YORK}
    \end{center}

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: Copy Right - info filled above    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\copyrightpage}{
    \phantom{}\vspace{\fill}
    \begin{center}
        \doublespaced
        \copyright~\yeardegree\\
            \textsc{\MakeUppercase{\@author}}\\
            All Rights Reserved\\
        \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LAYOUT: Abstract - info filled above    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\abstractpage}{
\newpage
    \pagestyle{fancy}
    \fancyhead[L]{Abstract}
    \fancyhead[R]{\thepage}
    \fancyfoot[C]{}
    \chapter*{ABSTRACT}
    \addcontentsline{toc}{section}{Abstract}

   \doublespacing
   \begin{center}
        \@title \\
        \vspace{12pt}
        by \\
        \vspace{12pt}
        \@author \\
    \end{center}

\vspace{12pt}

\singlespacing
\noindent Advisor: \advisor \\

\vspace{12pt}

\doublespacing
\abstract \\
}
