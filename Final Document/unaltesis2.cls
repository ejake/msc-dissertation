% unaltesis2.cls
% Copyright 2010 Juan David Cruz G—mez
% Intelligent Systems Research Lab
% Document class for UNAL Theses
% This class is based on the work of H. Diaz 2004
% This class has the parameters defined in the document DBN-SI-008.pdf
%  from SINAB
% TODOs:
% - Que funcione en InglŽs
% - Que se pueda activar la fuente Arial 12pt


\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
\ProvidesClass{unaltesis2} [2010/02/13 v1.0 Document Class for U Nacional's Theses]
\RequirePackage[spanish,english]{babel}
\newif \ifTipo@proyecto \Tipo@proyectofalse
\newif \ifExisteCotutor \ExisteCotutorfalse
\newif \ifTituloEnIngles \TituloEnInglesfalse
\def\TipoDeTrabajo#1{\gdef\@TipoDeTrabajo{#1}}
\DeclareOption{tesis}{\Tipo@proyectofalse %
	\TipoDeTrabajo{Tesis}}
\DeclareOption{mono}{\Tipo@proyectofalse%
	\TipoDeTrabajo{Monograf\'{\i}a}}
\DeclareOption{proyecto}{\Tipo@proyectotrue %
	\TipoDeTrabajo{Proyecto}}
\DeclareOption{trabajo}{\Tipo@proyectotrue %
	\TipoDeTrabajo{Trabajo Final}}
\DeclareOption{pasantia}{\Tipo@proyectotrue %
	\TipoDeTrabajo{Informe de Pasant\'{\i}a}}
\DeclareOption{cursos}{\Tipo@proyectotrue %
	\TipoDeTrabajo{Informe Sobre Cursos}}
\ExecuteOptions{letterpaper}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsbook}}
\ProcessOptions\relax
\LoadClass[oneside,12pt]{amsbook}
\AtBeginDocument{
	\RequirePackage[T1]{fontenc}
	\RequirePackage{amsthm}
	\selectlanguage{english}
	\numberwithin{section}{chapter}
	\numberwithin{equation}{section}
	\numberwithin{figure}{section}
	\numberwithin{table}{section}
}
%Margins

\setlength{\oddsidemargin}{40mm}
\addtolength{\oddsidemargin}{-1in} 

\setlength{\evensidemargin}{0mm}    %% Right margin = 20 mm
\setlength{\textwidth}{156mm}
\setlength{\topmargin}{-30pt}   %% 
\setlength{\headsep}{1cm}      %% Space between page # and text
\setlength{\textheight}{219mm}    %% 
\setlength{\footskip}{37pt}     %% Space from bottom of text to foot

%
% We want roman page numbers in the frontmatter, and arabic afterward.
% use \mainmatter to separate them.
%
\renewcommand{\mainmatter}{\clearpage\pagenumbering{arabic}}

\def\thetipodetesis{\ClassError{UNthesis}%
 {\protect\tipodetesis\space no definido}%
 {Por favor lea el manual.}}
  
  
\setcounter{tocdepth}{2}

% Contents lines for figures/tables aren't indented 
\def\l@figure{\@tocline{0}{3pt plus2pt}{0pt}{2.5pc}{}}
\def\l@table{\@tocline{0}{3pt plus2pt}{0pt}{2.5pc}{}}

% Changes the way to put the section titles.
\renewcommand\section{\@startsection{section}{1}%
  {\z@}{.7\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\bfseries}}
  
% Changes the way to start a new subsection
\renewcommand\subsection{\@startsection{subsection}{2}%
  {\z@}{.7\linespacing\@plus.7\linespacing}{.5\linespacing}%
  {\normalfont\bfseries}}
  
\renewcommand\subsubsection{\@startsection{subsubsection}{3}%
 {\z@}{.7\linespacing\@plus.7\linespacing}{.5\linespacing}%
  {\normalfont\itshape}}


%%%%%%%%%%%%%%%%
\addto\captionsspanish{\def\contentsname{Contenido}}
\addto\captionsspanish{\def\listfigurename{Lista de Figuras}}
\addto\captionsspanish{\def\listtablename{Lista de Tablas}}
\addto\captionsspanish{\def\bibname{Bibliograf\'{i}a}}
\addto\captionsspanish{\def\indexname{\'{I}ndice}}
\addto\captionsspanish{\def\figurename{Figura}}
\addto\captionsspanish{\def\tablename{Tabla}}
\addto\captionsspanish{\def\chaptername{Cap\'{i}tulo}}
\addto\captionsspanish{\def\appendixname{Ap'{e}ndice}}
\addto\captionsspanish{\def\partname{Parte}}
\addto\captionsspanish{\def\abstractname{Resumen}}
\addto\captionsspanish{\def\acknowledgename{Agradecimientos}}

\renewcommand{\maketitle}{
	\begingroup
		\thispagestyle{empty}
		\setcounter{page}{1}
   			\begin{center}
   				\large
   				\noindent
      				\mbox{}
      				\vspace*{2cm}
      					\begin{minipage}{\textwidth}
      						\centering
      							{\bfseries{\MakeUppercase{\@titulo}}\par
      								\vspace{3cm}
      								\MakeUppercase{\@author}\par
      								\vspace{0.5cm}
      									{ID: \@codigoautor}\par}
      					\end{minipage}
      					\vfill
      					\begin{minipage}{\textwidth}
      						\centering
      							\ifTipo@proyecto
      								{\@TipoDeTrabajo} presentado como requisito parcial para obtener el  t\'{\i}tulo de \\
    							\else
      								Thesis presented as a partial requirement for the degree of\\
    							\fi
    							\vspace{0.25cm} 
   							\MakeUppercase{\@grado} \par
							\vspace{0.25cm}
							\MakeUppercase{\@programa}
					\end{minipage}
					\vfill
					Advisor:\\
					\MakeUppercase{\@tutor}\\
					{\@titulotutor}\\
					\ifExisteCotutor
						\vspace{3mm}
						Codirector:\\
						\MakeUppercase{\@cotutor}\\
						{\@titulocotutor}\\
					\fi
					\vfill
					\MakeUppercase{NATIONAL UNIVERSITY OF COLOMBIA} \par
					SCHOOL OF \MakeUppercase{\@facultad}\par
					DEPARTAMENT OF \MakeUppercase{\@departamento}\par 
					\MakeUppercase{\@sede}\par
					{\@anogrado} \\
    					\vspace*{.2in}
    					\mbox{}   
			\end{center}
	\endgroup
   \cleardoublepage
}

\def\PaginaDeAprobacion{
	\thispagestyle{empty}
	\mbox{}
	\vspace*{\@espacioArriba}
	\begin{flushright}
		\begin{minipage}{8cm}
			\noindent
				\ifTipo@proyecto
				      	Aprobado 
				\else
				      	Approved
    				\fi
			by the School of {\@facultad} in fulfillment of the requirements to grant the title of %
				{\bfseries {\@grado} --- {\@programa}}  
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		\vspace{\@espacioparaaprobacion}
		\rule{7cm}{0.2pt}\\
		{\@tutor}\\ {\small Advisor 	
			\ifTipo@proyecto
      				del 
			\else
				of the Thesis
			\fi
			}%
			\\[4mm]
			\ifExisteCotutor
				\vspace{\@espacioparaaprobacion}
				\rule{7cm}{0.2pt}\\
				{\@cotutor}\\ {\small Codirector}%
				\\
			\fi
			\ifnum \@numerodejurados > 0
				\vspace{\@espacioparaaprobacion}
				\rule{7cm}{0.2pt}\\
				{\@juradoa}\\ {\small Member of the Jury}\\
			\fi
			\ifnum \@numerodejurados > 1
				\vspace{\@espacioparaaprobacion}
				\rule{7cm}{0.2pt}\\
				{\@juradob}\\ {\small Member of the Jury}\\%
			\fi
			\ifnum \@numerodejurados > 2
				\vspace{\@espacioparaaprobacion}
				\rule{7cm}{0.2pt}\\
				{\@juradoc}\\ {\small Member of the Jury}\\%
			\fi
			\ifnum \@numerodejurados > 3
				\vspace{\@espacioparaaprobacion}
				\rule{7cm}{0.2pt}\\
				{\@juradod}\\ {\small Member of the Jury}\\%
			\fi
			\vfill
			{National University of Colombia} \\
			{\@sede}, {\@mesgrado} of {\@anogrado}
	\end{center}
	\vspace{\@espacioparaaprobacion}\null
	\cleardoublepage
}




\newcommand{\Autor}[1]{\gdef\@author{#1}}
\newcommand{\CodigoAutor}[1]{\gdef\@codigoautor{#1}}
\CodigoAutor{} %default 
\newcommand{\Titulo}[1]{\gdef\@titulo{#1}}

\newcommand{\Title}[1]{\gdef\@title{#1}\TituloEnInglestrue}

\newcommand{\AnoGrado}[1]{\gdef\@anogrado{#1}}
\AnoGrado{} %default

\newcommand{\MesGrado}[1]{\gdef\@mesgrado{#1}}
\MesGrado{} %default

\newcommand{\Grado}[1]{\gdef\@grado{#1}}

\newcommand{\Facultad}[1]{\gdef\@facultad{#1}}

\newcommand{\Departamento}[1]{\gdef\@departamento{#1}}
\Departamento{} %default

\newcommand{\Sede}[1]{\gdef\@sede{#1}}
\Sede{} %default

\newcommand{\Tutor}[1]{\gdef\@tutor{#1}}
\Tutor{} %default

\newcommand{\TituloTutor}[1]{\gdef\@titulotutor{#1}}
\TituloTutor{}

\newcommand{\CoTutor}[1]{\gdef\@cotutor{#1}\ExisteCotutortrue}
\newcommand{\TituloCoTutor}[1]{\gdef\@titulocotutor{#1}}

\def\@numerodejurados{0}
\def\NumeroDeJurados#1{\gdef\@numerodejurados{#1}}
\def\JuradoA#1{\gdef\@juradoa{#1}}
\def\JuradoB#1{\gdef\@juradob{#1}}
\def\JuradoC#1{\gdef\@juradoc{#1}}
\def\JuradoD#1{\gdef\@juradod{#1}}
\def\@espacioArriba{2.5cm}
\def\@espacioparaaprobacion{1in}
\ifnum\@numerodejurados > 1
	\gdef\@espacioparaaprobacion{.65in}
	\gdef\@espacioArriba{1cm}
\fi
\ifnum \@numerodejurados > 3
	\gdef\@espacioArriba{0cm}
	\gdef\@espacioparaaprobacion{.5in}
\else
	\ifExisteCotutor
		\gdef\@espacioArriba{0cm}
		\gdef\@espacioparaaprobacion{.48in}
	\else
		\gdef\@espacioArriba{0cm}
	\fi
\fi
\def\Programa#1{\gdef\@programa{#1}}
  
\newenvironment{resumen}%
{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}%
		{\bfseries ABSTRACT\par}%
		\vspace{.5in}%
		{\MakeUppercase{\@titulo}\par}%
		\vspace{.1in}%
		{by\par}%
		\vspace{.1in}%
		{\MakeUppercase{\@author}\par}%
		{\@grado} in {\@programa}\par%
		\vspace{.1in}%
		NATIONAL UNIVERSITY OF COLOMBIA \par%
		\vspace{.1in}%
		Advisor: {\@tutor}%
		\vspace{.1in}%
	\end{center}%
}
{\par\vfil\null}

\renewenvironment{abstract}
{
	\cleardoublepage
	\selectlanguage{english}
	\thispagestyle{empty}
	\begin{center}
		{\bfseries ABSTRACT}\par
		\vspace{.5in}
		\MakeUppercase{\@title}\par
		\vspace{.1in}
		by\par
		\vspace{.1in}
		\MakeUppercase{\@author}\par
		{\@grado} in {\@programa}\par
		\vspace{.1in}
		NATIONAL UNIVERSITY OF COLOMBIA \par
		\vspace{.1in}
		Advisor: {\@tutor}
		\vspace{.1in}
	\end{center}
}
{\par\vfil\null}

\newenvironment{Dedicatoria}
{
	\cleardoublepage
	\vspace*{1cm}
	\begin{center}
		{\bfseries DEDICATION\\[3cm]}
		\end{center}
	\begin{flushright}
}
{	\end{flushright}
	\newpage
}

\renewenvironment{dedicatory}
{
	\cleardoublepage
	\vspace*{1cm}
	\begin{center}
		{\bfseries DEDICATION\\[3cm]}
	\end{center}
	\begin{flushright}
}
%	Aqui va la dedicatoria
{	\end{flushright}
	\newpage
}

\newenvironment{Reconocimientos}
{	
	\cleardoublepage
	\vspace*{1cm}
	\begin{center} 
		{\bfseries ACKNOWLEDGMENTS\\[3cm]} 
	\end{center}
}

\renewenvironment{thanks}
{
	\cleardoublepage
	\vspace*{1cm}
	\begin{center} 
		{\bfseries ACKNOWLEDGMENTS\\[3cm]} 
	\end{center}
}

{\newpage}
\newcommand{\Preliminares}
  {\pagestyle{plain}\setcounter{page}{1}
  	\renewcommand{\thepage}{\roman{page}}}

\newcommand\CuerpoDeLaTesis
	{\mainmatter}
	\newcommand\FinalDeLaTesis
	{\backmatter}
\endinput
