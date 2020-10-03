% Imperial College London letterhead class
% LdC Foulkes January 2003

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{impletter}[2003/15/01 Imperial College Letter]

\RequirePackage{graphics}
\RequirePackage{epstopdf}
\RequirePackage{fancyhdr}
\LoadClass[a4paper]{article}

% Blank paper
\DeclareOption{blank}{%
	\pagestyle{fancy}
	\lhead{%
	\resizebox{52.5mm}{!}{\includegraphics{graphics/Imperial_Color1.pdf}}}%
	\renewcommand\headrulewidth{0pt}
	\lfoot{%
	\vspace*{10.5mm}
	\hspace*{-1.8mm}
	\fontsize{9}{11pt}\usefont{OT1}{cmss}{m}{n}
	Imperial College of Science, Technology and Medicine}%
	\cfoot{}
}%
% Personalised letterhead paper
\DeclareOption{headed}{%
	\pagestyle{empty}
}%
% Logo only paper
\DeclareOption{logo}{%
	\pagestyle{empty}
}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{openbib}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% Use the \pagestyle{empty} option as the default if nothing is given.
\ExecuteOptions{headed}
\ProcessOptions\relax

% Set the appropriate font type, font size, and lengths
\renewcommand{\normalsize}{\fontsize{12}{16pt}\usefont{OT1}{cmss}{m}{n}}
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
\setlength{\voffset}{-25.4mm}
\setlength{\topmargin}{9mm}
\setlength{\evensidemargin}{-1pt}
\setlength{\oddsidemargin}{-1pt}
\setlength{\textheight}{220mm}
\setlength{\textwidth}{160mm}
\setlength{\headheight}{15.5mm}
\setlength{\headsep}{23mm}
\setlength{\footskip}{10.6mm}
\setlength{\parindent}{0mm}
\setlength{\parskip}{3mm}

% TeX parameters to account for odd formatting of headers
\hbadness=10000 % Ignore underfull boxes
\hfuzz=28mm % Allow over the margin text - needed for sender details

% Define date in european format
\def\today{\number\day\space\ifcase\month\or
 January\or February \or March\or April\or May\or June\or
 July\or August\or September\or October\or November\or December\fi
 \space\number\year}

%\informal is like ragged right, but allows hyphen breaks and does not
%produce such extreme differences in line lengths.

\def\informal{\rightskip\z@ plus\tw@ em\dimen@\the\fontdimen4\the
\font\spaceskip\the\fontdimen\tw@\the\font minus .6\dimen@\xspaceskip
\spaceskip\multiply\xspaceskip\thr@@\divide\xspaceskip\tw@
\hyphenpenalty\@medpenalty\exhyphenpenalty\@highpenalty\let\informal\relax}

% Header for personalised letterhead consists of a table with
% one paragraph box
\newcommand{\header}[2]{
 \begin{tabular}{@{}p{95mm}}
  % left box with date, address and salutation
  \vspace*{-3.5mm}
  \begin{minipage}[t]{95mm}
  \fontsize{12}{16pt}\usefont{OT1}{cmss}{m}{n}

  \today\\	% date at 51mm

  \vspace*{1mm}
  #1 % addressee at 63mm

  \vspace*{8mm}
  #2 % salutation at 105

  \end{minipage}
 \end{tabular}
}

% Header for logo and blank paper consists of a table with two paragraph boxes.
\newcommand{\headers}[6]{
 \begin{tabular}{@{}p{95mm}@{}p{90mm}}
  % left box with date, address and salutation
  \vspace*{-3.5mm}
  \begin{minipage}[t]{95mm}
  \fontsize{12}{16pt}\usefont{OT1}{cmss}{m}{n}

  \today\\	% date at 51mm

  \vspace*{1mm}
  #1 % addressee at 63mm

  \vspace*{8mm}
  #2 % salutation at 105

  \end{minipage}

  &
  % right box with college details of sender
  \begin{minipage}[t]{90mm}
  \vspace*{-41.3mm}
  \fontsize{9}{11pt}\usefont{OT1}{cmss}{m}{n}
  #3
  \vspace*{4mm}\\
  \fontsize{11}{11pt}\usefont{OT1}{cmss}{m}{n}
  \textbf{#4}
  \fontsize{7}{11pt}\usefont{OT1}{cmss}{m}{n}
  #5
  \fontsize{9}{11pt}\usefont{OT1}{cmss}{m}{n}
  #6
  \end{minipage}
 \end{tabular}
}

% Command to add the closing and sender's name
\newcommand{\close}[2]{
\begin{minipage}[t]{100mm}
#1

\vspace{18mm}

#2
\end{minipage}
}

% Added flexibility to keep vertical formatting constant
\raggedbottom
