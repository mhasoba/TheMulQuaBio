<div class="maketitle">

![PICT](SilBioComp1x.png) ![PICT](SilBioComp2x.png)
![PICT](SilBioComp3x.png) ![PICT](SilBioComp4x.png)
![PICT](SilBioComp5x.png) ![PICT](SilBioComp6x.png)
Introduction to Biological Computing\
AKA “The Multilingual Quantitative Biologist”\
Department of Life Sciences (Silwood Park Campus)\
Imperial College London {#introduction-to-biological-computing-aka-the-multilingual-quantitative-biologist-department-of-life-sciences-silwood-park-campus-imperial-college-london .titleHead}
--------------------------------------------------

<div class="author">

<span class="ptmr8t-x-x-120">Samraat Pawar
(s.pawar@imperial.ac.uk)</span>\
<span class="ptmr8t-x-x-120">(</span><span class="ptmri8t-x-x-120">with
inputs from many others!</span><span class="ptmr8t-x-x-120">) </span>

</div>

\
<div class="date">

<span class="ptmr8t-x-x-120">February 2, 2018</span>

</div>

![PICT](SilBioComp7x.png) ![PICT](SilBioComp8x.png)

</div>

![PICT](SilBioComp9x.png) ![PICT](SilBioComp10x.png)

[](){#x1-1000}Contents {#contents .likechapterHead}
----------------------

<div class="tableofcontents">

<span class="chapterToc">0 [Introduction](#x1-20000){#QQ2-1-2}</span>\
 <span class="sectionToc">0.1 [About this
document](#x1-30000.1){#QQ2-1-3}</span>\
 <span class="sectionToc">0.2 [The goals of this
course](#x1-40000.2){#QQ2-1-5}</span>\
 <span class="sectionToc">0.3 [Some guidelines, conventions and
rules](#x1-50000.3){#QQ2-1-6}</span>\
  <span class="subsectionToc">0.3.1 [Beware the dark
forces](#x1-60000.3.1){#QQ2-1-7}</span>\
  <span class="subsectionToc">0.3.2 [Keep your workﬂow
organized](#x1-70000.3.2){#QQ2-1-8}</span>\
  <span class="subsectionToc">0.3.3 [Conventions used in this
document](#x1-80000.3.3){#QQ2-1-9}</span>\
  <span class="subsectionToc">0.3.4 [To IDE or not to
IDE?](#x1-90000.3.4){#QQ2-1-11}</span>\
  <span class="subsectionToc">0.3.5
[Assessment](#x1-100000.3.5){#QQ2-1-12}</span>\
<span class="chapterToc">1 [Introduction to UNIX and
Linux](#x1-140001){#QQ2-1-16}</span>\
 <span class="sectionToc">1.1 [What is
UNIX?](#x1-150001.1){#QQ2-1-17}</span>\
 <span class="sectionToc">1.2 [Why
UNIX?](#x1-160001.2){#QQ2-1-18}</span>\
 <span class="sectionToc">1.3 [UNIX directory
structure](#x1-170001.3){#QQ2-1-19}</span>\
 <span class="sectionToc">1.4 [Meet the UNIX
shell](#x1-180001.4){#QQ2-1-20}</span>\
 <span class="sectionToc">1.5 [<span class="pcrr8t-x-x-109">sudo</span>,
and installing/removing software](#x1-190001.5){#QQ2-1-21}</span>\
 <span class="sectionToc">1.6 [Basic UNIX
commands](#x1-200001.6){#QQ2-1-22}</span>\
 <span class="sectionToc">1.7 [Building your coursework directory
structure](#x1-210001.7){#QQ2-1-23}</span>\
 <span class="sectionToc">1.8 [Command
arguments](#x1-220001.8){#QQ2-1-24}</span>\
 <span class="sectionToc">1.9 [Redirection and
pipes](#x1-230001.9){#QQ2-1-25}</span>\
 <span class="sectionToc">1.10
[Wildcards](#x1-240001.10){#QQ2-1-26}</span>\
 <span class="sectionToc">1.11 [Using <span
class="pcrr8t-x-x-109">grep</span>](#x1-250001.11){#QQ2-1-27}</span>\
 <span class="sectionToc">1.12 [Finding ﬁles with <span
class="pcrr8t-x-x-109">find</span>](#x1-260001.12){#QQ2-1-28}</span>\
 <span class="sectionToc">1.13 [Practical: Make sure the basics
work](#x1-270001.13){#QQ2-1-29}</span>\
 <span class="sectionToc">1.14 [Readings &
Resources](#x1-280001.14){#QQ2-1-30}</span>\
<span class="chapterToc">2 [Advanced UNIX: Shell
scripting](#x1-290002){#QQ2-1-31}</span>\
 <span class="sectionToc">2.1 [Shell scripting: What and
Why](#x1-300002.1){#QQ2-1-32}</span>\
 <span class="sectionToc">2.2 [Scripting:
How](#x1-310002.2){#QQ2-1-33}</span> ![PICT](SilBioComp11x.png)
![PICT](SilBioComp12x.png)\
 <span class="sectionToc">2.3 [Your ﬁrst shell
script](#x1-320002.3){#QQ2-1-34}</span>\
 <span class="sectionToc">2.4 [A useful shell-scripting
example](#x1-330002.4){#QQ2-1-36}</span>\
 <span class="sectionToc">2.5 [Variables in shell
scripting](#x1-340002.5){#QQ2-1-38}</span>\
 <span class="sectionToc">2.6 [Some more
Examples](#x1-350002.6){#QQ2-1-41}</span>\
 <span class="sectionToc">2.7
[Practical](#x1-360002.7){#QQ2-1-44}</span>\
 <span class="sectionToc">2.8 [Readings &
Resources](#x1-370002.8){#QQ2-1-45}</span>\
<span class="chapterToc">3 [Version control with
Git](#x1-380003){#QQ2-1-46}</span>\
 <span class="sectionToc">3.1 [What is Version
Control?](#x1-390003.1){#QQ2-1-47}</span>\
 <span class="sectionToc">3.2 [Why Version
Control?](#x1-400003.2){#QQ2-1-49}</span>\
 <span class="sectionToc">3.3 [git](#x1-410003.3){#QQ2-1-50}</span>\
 <span class="sectionToc">3.4 [Your ﬁrst
repository](#x1-420003.4){#QQ2-1-51}</span>\
 <span class="sectionToc">3.5 [<span class="pcrr8t-x-x-109">git
</span>commands](#x1-430003.5){#QQ2-1-52}</span>\
  <span class="subsectionToc">3.5.1 [<span class="pcrr8t-x-x-109">git
</span>command structure](#x1-440003.5.1){#QQ2-1-53}</span>\
 <span class="sectionToc">3.6 [Ignoring
Files](#x1-450003.6){#QQ2-1-54}</span>\
  <span class="subsectionToc">3.6.1 [Dealing with binary
ﬁles](#x1-460003.6.1){#QQ2-1-55}</span>\
  <span class="subsectionToc">3.6.2 [Dealing with large
ﬁles](#x1-470003.6.2){#QQ2-1-56}</span>\
 <span class="sectionToc">3.7 [Removing
ﬁles](#x1-480003.7){#QQ2-1-57}</span>\
 <span class="sectionToc">3.8 [Accessing history of the
repository](#x1-490003.8){#QQ2-1-58}</span>\
 <span class="sectionToc">3.9 [Reverting to a previous
version](#x1-500003.9){#QQ2-1-59}</span>\
 <span class="sectionToc">3.10
[Branching](#x1-510003.10){#QQ2-1-60}</span>\
 <span class="sectionToc">3.11 [Running git commands on a diﬀerent
directory](#x1-520003.11){#QQ2-1-61}</span>\
 <span class="sectionToc">3.12 [Running git commands on multiple
repositories at once](#x1-530003.12){#QQ2-1-62}</span>\
  <span class="subsectionToc">3.12.1
[Practical](#x1-540003.12.1){#QQ2-1-63}</span>\
 <span class="sectionToc">3.13 [Practical
wrap-up](#x1-550003.13){#QQ2-1-64}</span>\
 <span class="sectionToc">3.14 [Readings &
Resources](#x1-560003.14){#QQ2-1-65}</span>\
<span class="chapterToc">4 [Using <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> for scientiﬁc
documents](#x1-570004){#QQ2-1-66}</span>\
 <span class="sectionToc">4.1 [What’s <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>?](#x1-580004.1){#QQ2-1-67}</span>\
 <span class="sectionToc">4.2 [Why <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>?](#x1-590004.2){#QQ2-1-68}</span>\
  <span class="subsectionToc">4.2.1 [Limitations of <span
class="LATEX">L<span class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>](#x1-600004.2.1){#QQ2-1-69}</span>\
 <span class="sectionToc">4.3 [Installing <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>](#x1-610004.3){#QQ2-1-70}</span>\
 <span class="sectionToc">4.4 [A ﬁrst <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> example](#x1-620004.4){#QQ2-1-71}</span>\
  <span class="subsectionToc">4.4.1 [A bash script to compile <span
class="LATEX">L<span class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>](#x1-630004.4.1){#QQ2-1-74}</span>\
 <span class="sectionToc">4.5 [A brief <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> tour](#x1-640004.5){#QQ2-1-76}</span>
![PICT](SilBioComp13x.png) ![PICT](SilBioComp14x.png)\
 <span class="sectionToc">4.6 [<span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> templates](#x1-650004.6){#QQ2-1-77}</span>\
 <span class="sectionToc">4.7 [Typesetting
math](#x1-660004.7){#QQ2-1-79}</span>\
 <span class="sectionToc">4.8 [A few more
tips](#x1-670004.8){#QQ2-1-80}</span>\
  <span class="subsectionToc">4.8.1
[Practical](#x1-680004.8.1){#QQ2-1-81}</span>\
 <span class="sectionToc">4.9
[Practical](#x1-690004.9){#QQ2-1-82}</span>\
 <span class="sectionToc">4.10 [Readings &
Resources](#x1-700004.10){#QQ2-1-83}</span>\
<span class="chapterToc">5 [Basic Biological Computing in
Python](#x1-710005){#QQ2-1-84}</span>\
 <span class="sectionToc">5.1 [Outline of the <span
class="pcrr8t-x-x-109">python
</span>module](#x1-720005.1){#QQ2-1-85}</span>\
 <span class="sectionToc">5.2 [Why <span
class="pcrr8t-x-x-109">python</span>?](#x1-730005.2){#QQ2-1-87}</span>\
  <span class="subsectionToc">5.2.1 [The Zen of
python](#x1-740005.2.1){#QQ2-1-89}</span>\
 <span class="sectionToc">5.3 [Installing <span
class="pcrr8t-x-x-109">python</span>](#x1-750005.3){#QQ2-1-90}</span>\
 <span class="sectionToc">5.4 [Getting started with <span
class="pcrr8t-x-x-109">python</span>](#x1-760005.4){#QQ2-1-91}</span>\
  <span class="subsectionToc">5.4.1 [<span
class="pcrr8t-x-x-109">ipython</span>](#x1-770005.4.1){#QQ2-1-92}</span>\
  <span class="subsectionToc">5.4.2 [Magic
commands](#x1-780005.4.2){#QQ2-1-93}</span>\
  <span class="subsectionToc">5.4.3 [Determining an object’s
type](#x1-790005.4.3){#QQ2-1-94}</span>\
 <span class="sectionToc">5.5 [Python
variables](#x1-800005.5){#QQ2-1-95}</span>\
  <span class="subsectionToc">5.5.1 [<span class="pcrr8t-x-x-109">python
</span>operators](#x1-810005.5.1){#QQ2-1-96}</span>\
  <span class="subsectionToc">5.5.2 [Assigning and manipulating
variables](#x1-820005.5.2){#QQ2-1-97}</span>\
 <span class="sectionToc">5.6 [<span class="pcrr8t-x-x-109">python
</span>data types and data structures](#x1-830005.6){#QQ2-1-98}</span>\
  <span class="subsectionToc">5.6.1
[Lists](#x1-840005.6.1){#QQ2-1-99}</span>\
  <span class="subsectionToc">5.6.2
[Tuples](#x1-850005.6.2){#QQ2-1-100}</span>\
  <span class="subsectionToc">5.6.3
[Sets](#x1-860005.6.3){#QQ2-1-101}</span>\
  <span class="subsectionToc">5.6.4
[Dictionaries](#x1-870005.6.4){#QQ2-1-102}</span>\
  <span class="subsectionToc">5.6.5 [Copying mutable
objects](#x1-880005.6.5){#QQ2-1-103}</span>\
  <span class="subsectionToc">5.6.6 [<span class="pcrr8t-x-x-109">python
</span>with strings](#x1-890005.6.6){#QQ2-1-105}</span>\
 <span class="sectionToc">5.7 [Writing <span
class="pcrr8t-x-x-109">python
</span>code](#x1-900005.7){#QQ2-1-107}</span>\
 <span class="sectionToc">5.8 [<span class="pcrr8t-x-x-109">python
</span>Input/Output](#x1-910005.8){#QQ2-1-108}</span>\
  <span class="subsectionToc">5.8.1 [Writing <span
class="pcrr8t-x-x-109">python </span>functions (or
modules)](#x1-920005.8.1){#QQ2-1-111}</span>\
  <span class="subsectionToc">5.8.2 [Components of the <span
class="pcrr8t-x-x-109">python
</span>function](#x1-940005.8.2){#QQ2-1-114}</span>\
  <span class="subsectionToc">5.8.3 [Variable
scope](#x1-1010005.8.3){#QQ2-1-123}</span>\
 <span class="sectionToc">5.9 [Control
statements](#x1-1020005.9){#QQ2-1-125}</span>\
  <span class="subsectionToc">5.9.1 [Control ﬂow
exercises](#x1-1030005.9.1){#QQ2-1-127}</span>\
 <span class="sectionToc">5.10
[Loops](#x1-1040005.10){#QQ2-1-129}</span> ![PICT](SilBioComp15x.png)
![PICT](SilBioComp16x.png)\
  <span class="subsectionToc">5.10.1 [List
comprehensions](#x1-1050005.10.1){#QQ2-1-132}</span>\
 <span class="sectionToc">5.11
[Practicals](#x1-1060005.11){#QQ2-1-134}</span>\
 <span class="sectionToc">5.12 [Functions, Modules, and code
compartmentalization](#x1-1070005.12){#QQ2-1-135}</span>\
  <span class="subsectionToc">5.12.1 [Importing
Modules](#x1-1080005.12.1){#QQ2-1-136}</span>\
 <span class="sectionToc">5.13 [Python
packages](#x1-1090005.13){#QQ2-1-137}</span>\
 <span class="sectionToc">5.14
[Practicals](#x1-1100005.14){#QQ2-1-138}</span>\
 <span class="sectionToc">5.15 [Errors in your <span
class="pcrr8t-x-x-109">python
</span>code](#x1-1120005.15){#QQ2-1-140}</span>\
  <span class="subsectionToc">5.15.1 [Unit
testing](#x1-1130005.15.1){#QQ2-1-141}</span>\
  <span class="subsectionToc">5.15.2
[Debugging](#x1-1150005.15.2){#QQ2-1-144}</span>\
  <span class="subsectionToc">5.15.3 [Paranoid programming: debugging
with breakpoints](#x1-1160005.15.3){#QQ2-1-146}</span>\
 <span class="sectionToc">5.16
[Practicals](#x1-1170005.16){#QQ2-1-147}</span>\
 <span class="sectionToc">5.17 [Practicals
wrap-up](#x1-1190005.17){#QQ2-1-149}</span>\
 <span class="sectionToc">5.18 [Readings and
Resources](#x1-1200005.18){#QQ2-1-150}</span>\
<span class="chapterToc">6 [Advanced Biological Computing in
Python](#x1-1210006){#QQ2-1-151}</span>\
 <span class="sectionToc">6.1 [Numerical computing in <span
class="pcrr8t-x-x-109">python</span>](#x1-1220006.1){#QQ2-1-152}</span>\
  <span class="subsectionToc">6.1.1 [Indexing and accessing
arrays](#x1-1230006.1.1){#QQ2-1-154}</span>\
  <span class="subsectionToc">6.1.2 [Manipulating
arrays](#x1-1240006.1.2){#QQ2-1-155}</span>\
  <span class="subsectionToc">6.1.3 [Pre-allocating
arrays](#x1-1270006.1.3){#QQ2-1-158}</span>\
  <span class="subsectionToc">6.1.4 [<span class="pcrr8t-x-x-109">scipy
</span>matrices](#x1-1280006.1.4){#QQ2-1-159}</span>\
  <span class="subsectionToc">6.1.5 [Two useful <span
class="pcrr8t-x-x-109">scipy
</span>sub-packages](#x1-1300006.1.5){#QQ2-1-161}</span>\
 <span class="sectionToc">6.2 [The need for speed: Proﬁling in
Python](#x1-1330006.2){#QQ2-1-164}</span>\
  <span class="subsectionToc">6.2.1
[Proﬁling](#x1-1340006.2.1){#QQ2-1-165}</span>\
  <span class="subsectionToc">6.2.2 [Quick proﬁling with <span
class="pcrr8t-x-x-109">timeit</span>](#x1-1350006.2.2){#QQ2-1-168}</span>\
 <span class="sectionToc">6.3
[Practicals](#x1-1360006.3){#QQ2-1-170}</span>\
 <span class="sectionToc">6.4 [Networks in <span
class="pcrr8t-x-x-109">python </span>(and
R)](#x1-1380006.4){#QQ2-1-172}</span>\
 <span class="sectionToc">6.5
[Practicals](#x1-1390006.5){#QQ2-1-174}</span>\
 <span class="sectionToc">6.6 [Regular expressions in <span
class="pcrr8t-x-x-109">python</span>](#x1-1400006.6){#QQ2-1-175}</span>\
  <span class="subsectionToc">6.6.1 [Metacharacters vs. regular
characters](#x1-1410006.6.1){#QQ2-1-176}</span>\
  <span class="subsectionToc">6.6.2 [regex
elements](#x1-1420006.6.2){#QQ2-1-177}</span>\
  <span class="subsectionToc">6.6.3 [regex in <span
class="pcrr8t-x-x-109">python</span>](#x1-1430006.6.3){#QQ2-1-178}</span>\
  <span class="subsectionToc">6.6.4 [Some
RegExercises](#x1-1440006.6.4){#QQ2-1-182}</span>\
  <span class="subsectionToc">6.6.5 [Important <span
class="pcrr8t-x-x-109">re
</span>functions](#x1-1450006.6.5){#QQ2-1-183}</span>\
 <span class="sectionToc">6.7
[Practicals](#x1-1460006.7){#QQ2-1-184}</span>
![PICT](SilBioComp17x.png) ![PICT](SilBioComp18x.png)\
 <span class="sectionToc">6.8 [Databases and <span
class="pcrr8t-x-x-109">python</span>](#x1-1480006.8){#QQ2-1-186}</span>\
  <span class="subsectionToc">6.8.1 [Relational
databases](#x1-1490006.8.1){#QQ2-1-187}</span>\
  <span class="subsectionToc">6.8.2
[SQLite](#x1-1500006.8.2){#QQ2-1-188}</span>\
  <span class="subsectionToc">6.8.3 [SQLite with
python](#x1-1510006.8.3){#QQ2-1-189}</span>\
 <span class="sectionToc">6.9 [Using <span class="pcrr8t-x-x-109">python
</span>to build workﬂows](#x1-1520006.9){#QQ2-1-192}</span>\
  <span class="subsectionToc">6.9.1 [Using <span
class="pcrr8t-x-x-109">subprocess</span>](#x1-1530006.9.1){#QQ2-1-193}</span>\
  <span class="subsectionToc">6.9.2 [Running <span
class="pcrr8t-x-x-109">R</span>](#x1-1540006.9.2){#QQ2-1-194}</span>\
 <span class="sectionToc">6.10
[Practicals](#x1-1550006.10){#QQ2-1-195}</span>\
 <span class="sectionToc">6.11 [Practicals
wrap-up](#x1-1580006.11){#QQ2-1-198}</span>\
 <span class="sectionToc">6.12 [Readings and
Resources](#x1-1590006.12){#QQ2-1-199}</span>\
<span class="chapterToc">7 [Introduction to
R](#x1-1600007){#QQ2-1-200}</span>\
 <span class="sectionToc">7.1 [Outline of the the R
module](#x1-1610007.1){#QQ2-1-201}</span>\
 <span class="sectionToc">7.2 [What is <span
class="pcrr8t-x-x-109">R</span>?](#x1-1620007.2){#QQ2-1-202}</span>\
 <span class="sectionToc">7.3 [Why <span
class="pcrr8t-x-x-109">R</span>?](#x1-1630007.3){#QQ2-1-203}</span>\
  <span class="subsectionToc">7.3.1 [Would you ever need anything other
than R?](#x1-1640007.3.1){#QQ2-1-204}</span>\
 <span class="sectionToc">7.4 [Installing <span
class="pcrr8t-x-x-109">R</span>](#x1-1650007.4){#QQ2-1-205}</span>\
 <span class="sectionToc">7.5 [Getting
started](#x1-1660007.5){#QQ2-1-206}</span>\
  <span class="subsectionToc">7.5.1 [Gooey
IDEs!](#x1-1670007.5.1){#QQ2-1-207}</span>\
 <span class="sectionToc">7.6 [Some <span class="pcrr8t-x-x-109">R
</span>Basics](#x1-1680007.6){#QQ2-1-208}</span>\
  <span class="subsectionToc">7.6.1 [Useful R
commands](#x1-1690007.6.1){#QQ2-1-209}</span>\
  <span class="subsectionToc">7.6.2 [R
Warm-up](#x1-1700007.6.2){#QQ2-1-210}</span>\
  <span class="subsectionToc">7.6.3 [Variable names and
Tabbing](#x1-1710007.6.3){#QQ2-1-211}</span>\
  <span class="subsectionToc">7.6.4
[Operators](#x1-1720007.6.4){#QQ2-1-212}</span>\
  <span class="subsectionToc">7.6.5 [When things go
wrong](#x1-1730007.6.5){#QQ2-1-213}</span>\
  <span class="subsectionToc">7.6.6 [Types of
parentheses](#x1-1740007.6.6){#QQ2-1-214}</span>\
 <span class="sectionToc">7.7 [Variable
Types](#x1-1750007.7){#QQ2-1-215}</span>\
  <span class="subsectionToc">7.7.1 [Type Conversion and Special
Values](#x1-1760007.7.1){#QQ2-1-216}</span>\
 <span class="sectionToc">7.8 [Data Structure
types](#x1-1770007.8){#QQ2-1-217}</span>\
  <span class="subsectionToc">7.8.1
[Vectors](#x1-1780007.8.1){#QQ2-1-218}</span>\
  <span class="subsectionToc">7.8.2 [Matrices and
arrays](#x1-1790007.8.2){#QQ2-1-219}</span>\
  <span class="subsectionToc">7.8.3 [Data
frames](#x1-1800007.8.3){#QQ2-1-220}</span>\
  <span class="subsectionToc">7.8.4
[Lists](#x1-1810007.8.4){#QQ2-1-221}</span>\
 <span class="sectionToc">7.9 [Creating and manipulating data
structures](#x1-1820007.9){#QQ2-1-222}</span> ![PICT](SilBioComp19x.png)
![PICT](SilBioComp20x.png)\
  <span class="subsectionToc">7.9.1 [Creating
Sequences](#x1-1830007.9.1){#QQ2-1-223}</span>\
  <span class="subsectionToc">7.9.2 [Acessing parts of data stuctures –
Indices and Indexing](#x1-1840007.9.2){#QQ2-1-224}</span>\
  <span class="subsectionToc">7.9.3
[Recycling](#x1-1850007.9.3){#QQ2-1-225}</span>\
  <span class="subsectionToc">7.9.4 [Basic vector-matrix
operations](#x1-1860007.9.4){#QQ2-1-226}</span>\
  <span class="subsectionToc">7.9.5 [Strings and
Pasting](#x1-1870007.9.5){#QQ2-1-227}</span>\
 <span class="sectionToc">7.10 [Your analysis
workﬂow](#x1-1880007.10){#QQ2-1-228}</span>\
  <span class="subsectionToc">7.10.1 [The R Workspace and Working
Directory](#x1-1890007.10.1){#QQ2-1-229}</span>\
 <span class="sectionToc">7.11 [Importing and Exporting
Data](#x1-1900007.11){#QQ2-1-230}</span>\
  <span class="subsectionToc">7.11.1 [Relative
paths!](#x1-1910007.11.1){#QQ2-1-231}</span>\
  <span class="subsectionToc">7.11.2 [Writing out to and saving
ﬁles](#x1-1920007.11.2){#QQ2-1-232}</span>\
 <span class="sectionToc">7.12 [Writing R
code](#x1-1930007.12){#QQ2-1-233}</span>

</div>

![PICT](SilBioComp21x.png) ![PICT](SilBioComp22x.png)
![PICT](SilBioComp23x.png) ![PICT](SilBioComp24x.png)

![PICT](SilBioComp25x.png) ![PICT](SilBioComp26x.png)

<span class="titlemark">Chapter 0</span>\
[](){#x1-20000}Introduction {#chapter0-introduction .chapterHead}
-----------------------------------------

<div class="epigraph">

It is hard for me to say conﬁdently that, after ﬁfty more years of
explosive growth of computer science, there will still be a lot of
fascinating unsolved problems at peoples’ ﬁngertips, that it won’t be
pretty much working on reﬁnements of well-explored things. Maybe all of
the simple stuﬀ and the really great stuﬀ has been discovered. It may
not be true, but I can’t predict an unending growth. I can’t be as
conﬁdent about computer science as I can about biology. Biology easily
has 500 years of exciting problems to work on, it’s at that level.

------------------------------------------------------------------------

<div class="episource">

<span class="ptmri8t-x-x-109">— Donald Knuth</span>

</div>

</div>

### <span class="titlemark">0.1 </span> [](){#x1-30000.1}About this document {#about-this-document .sectionHead}

These document contains the content of modules on Biological Computing
taught in various courses at the Department of Life Sciences, Imperial
College London. These courses include Year 1&2 Computational
Biostatistics modules at the South Kensington Campus, the MSc/MRes on
Computational Methods in Ecology and Evolution (CMEE Masters) at Silwood
Park, and the Quantitative Methods in Ecology and Evolution Centre for
Doctoral Training (QMEE CDT).

Diﬀerent subsets of this document will be covered in diﬀerent courses.
Please look up your respective course guidebooks/handbooks to determine
when the modules covered in these notes are scheduled in your course.
You will be given instructions about which sections are covered in your
course.

This document is accompanied by data and code on which you can practice
your skills in your own time and during the practical sessions. These
materials are available (and will be updated regularly) at: [<span
class="pcrr8t-x-x-109">https://bitbucket.org/mhasoba/silbiocompmasterepo</span>](https://bitbucket.org/mhasoba/silbiocompmasterepo){.url}.
I use git for hosting this course’s materials because I want to
version-control this course’s content, which is constantly evolving to
keep up with changing programming/computing technologies. That is, I am
treating this course as any computing project that needs to be regularly
updated and improved. Changes to the notes and content will also be made
based upon students’ feedback. Blackboard is just not set up to handle
dynamic updating and version control of this sort! You will see tips
like this in the following chapters that you should pay special
attention to:

SVG-Viewer needed.

![PICT](SilBioComp27x.png) ![PICT](SilBioComp28x.png)

<div class="wrapfig-c">

[](){#x1-3001r1} ![PIC](Graphics/programming.png)\
<div class="caption">

<span class="id">Figure 1: </span><span class="content"> But not every
task needs to be converted to a computer program — you will learn to
decide when to and when not to write a computer program!
<http://xkcd.com/974/></span>

</div>

</div>

It is important that you work through the exercises and problems in each
chapter/section. This document does not tell you every single thing you
need to know to perform the exercises in it. In programming and
computing, you learn faster by trying to solve problems (including
computer crashes!) on your own, often by liberally googling the problem!

You will be provided guidelines for what makes good or eﬃcient solutions
to the computing exercises. Later, when you have submitted your
exercises and practicals, you will be provided solutions.

Also, every time a mysterious, geeky-sounding term like “relative path”
or “version control” appears, please google it!

### <span class="titlemark">0.2 </span> [](){#x1-40000.2}The goals of this course {#the-goals-of-this-course .sectionHead}

The goal of this course is to teach you to become (or at least show you
the path towards becoming) a competent quantitative biologist. A large
part of this involves learning computer programming. Why do biologists
need to write write computer programs? Here are some (hopefully
compelling to you!) reasons:

-   Short of ﬁeldwork, programs can do anything (that can be speciﬁed).
    In fact, even ﬁeldwork, if you could one day program a robot to do
    it for you <span
    class="footnote-mark">[^1^](SilBioComp2.html#fn1x2)</span>[](){#x1-4001f1}!
-   As such, no software is typically available to perform exactly the
    analysis you are planning. You should be unhappy if you are trying
    to shoehorn your data into methods that don’t quite seem right.
-   Biological problems and datasets are some of the most complicated
    imaginable. Programming permits success despite complexity through
    precise speciﬁcation and modularization of complicated analyses.
    ![PICT](SilBioComp29x.png) ![PICT](SilBioComp30x.png)
-   Modularity – programming allows you to break up your complex
    analysis in smaller pieces, yet keep all the pieces in a single,
    functional analysis.
-   Reproducibility – you (or someone else) can just re-run the code to
    reproduce your analysis. This is also the key to maintaining
    scientiﬁc accountability, integrity, and accuracy.
-   Organised thinking – writing code requires you to do this!
-   Career prospects – good, scientiﬁc coders are in short supply in all
    ﬁelds, but most deﬁnitely in biology!

There are several hundred programming languages currently available –
which ones should a biologist choose? Ideally, a quantitative biologist
would like to know:

 1. 
:   A fast, compiled (or semi-compiled) ‘procedural’ language like C

 2. 
:   A modern, easy-to-write, interpreted (or semi-compiled) language
    that is still quite fast, like python

 3. 
:   A mathematical/statistical software with programming and graphing
    capabilities like R

And all these because one language doesn’t ﬁt all purposes. Therefore
you will learn a few diﬀerent languages in this course — hopefully, just
the right number! Among the languages you will learn here — python, R,
and C are three of the most popular currently (see
[https://www.tiobe.com/tiobe-\_index/](https://www.tiobe.com/tiobe-index/){.url}
and [https://goo.gl/vyrqr1](%20https://goo.gl/vyrqr1){.url}, and for
some very good reasons.

Our goal is to teach you not just programming, but also good computing
practices. In this course, you will write plenty of code, deal with
diﬀerent data ﬁles, and produce text and graphic outputs. You will learn
to keep your project and coursework organized in logical, eﬃcient,
error-free and reproducible workﬂows (that’s a mouthful, but an
important mouthful).

### <span class="titlemark">0.3 </span> [](){#x1-50000.3}Some guidelines, conventions and rules {#some-guidelines-conventions-and-rules .sectionHead}

#### <span class="titlemark">0.3.1 </span> [](){#x1-60000.3.1}Beware the dark forces {#beware-the-dark-forces .subsectionHead}

![PICT](SilBioComp31x.png) ![PICT](SilBioComp32x.png)

You will NOT be using spreadsheet software (e.g., Excel) in these
classes. There are times when you will feel the pull of the dark side
(ahem!), and imagine a more “comfortable” world where you are
mouse-clicking your way happily though Excel-based data manipulations
and analyses. NO! You will be doing yourself a disservice. On the
long-ish run you will be much better oﬀ visualizing and manipulating
data on your computer using a programming language like R. This is
something you will learn, young padawan!

#### <span class="titlemark">0.3.2 </span> [](){#x1-70000.3.2}Keep your workﬂow organized {#keep-your-workﬂow-organized .subsectionHead}

In the following chapters, you will practice many examples where you are
required to write large blocks of code. Please get into the habit of
writing code into text ﬁles with an appropriate extension (e.g., \*.R
for R code, \*.py for python code, etc.). Furthermore, please keep all
your code ﬁles organized in one or more directories (e.g., named Code!).
Similarly, some of these scripts will take data ﬁles as inputs, and
output some results in the form of text or graphics. Please keep these
inputs and outputs organized as well, in separate directories (e.g.,
named Data and Results) respectively. Your demonstrators and I will help
you get set up and abide by this “workﬂow”.

#### <span class="titlemark">0.3.3 </span> [](){#x1-80000.3.3}Conventions used in this document {#conventions-used-in-this-document .subsectionHead}

Throughout this document, directory paths will be speciﬁed in UNIX (Mac,
Linux) style, using $\slash$ instead of the \\ used in Windows. Also, in
general, we will be using relative paths throughout the exercises and
practicals (more on this later, but google it!).

You will ﬁnd all command line/console arguments, code snippets and
output in coloured boxes like this:

<div id="listing-1" class="lstlisting">

<span class="label">[](){#x1-8001r1}</span>\$ ls \
<span class="label">[](){#x1-8002r2}</span>\$

</div>

The speciﬁc prompt (\$ in this case, belonging to the UNIX terminal)
will vary with the programming language/console (\$ for UNIX, $> > >$
for Python, &gt; for R, etc.).

You will type the commands/code that you see in such boxes into the
relevant command line (or copy-paste, but not recommended!). I have
aimed to make the content of this module computer platform (Mac, Linux
or PC) independent. Also note that:\

![PICT](SilBioComp33x.png) ![PICT](SilBioComp34x.png)

-   Lines marked with a star like this will be speciﬁc instructions for
    you to follow

<div class="wrapfig-c">

[](){#x1-8003r2} ![PIC](Graphics/workflow.png)\
<div class="caption">

<span class="id">Figure 2: </span><span class="content"> Logical
workﬂows are important, but don’t get married to yours!
<http://xkcd.com/1172/></span>

</div>

</div>

#### <span class="titlemark">0.3.4 </span> [](){#x1-90000.3.4}To IDE or not to IDE? {#to-ide-or-not-to-ide .subsectionHead}

As you embark on your journey to becoming a competent prectioner of
biological computing, you will be faced with a hamletian question: “To
IDE or not to IDE”. OK, maybe not that dramatic or hamletian...

An interactive Development Environment (IDE) is a text editor with
frills that can make life easy by auto-formatting code, running code
though the terminal or command line, allowing a graphic view of the
workspace (your active functions, variables, etc.), graphic debugging
and proﬁling (you will see these delightful things later), and allowing
integrated version control (e.g., using git). You will beneﬁt a lot of
you use a code editor that can also oﬀer an IDE (e.g., emacs, vim,
geany, atom). At the very least, your IDE should oﬀer:

-   Auto-indentation
-   Automatic code wrapping (e.g., keeping lines $<$80 characters long)
-   Syntax highlighting (e.g., commands vs. variables)
-   Code folding (fold large blocks of code, say an entire function
    or loop)
-   Keyboard control of commenting/uncommenting, code wrapping, etc.
-   Embedded terminal / shell / commandline console
-   Sending commands to terminal / shell

And if you end up using multiple programming languages, you will want an
IDE that can handle them. For example, RStudio cannot handle more than a
ﬁxed set of 2-3 languages. I use geany, which has many plugins that make
multi-language (multilingual?) code development much easier. I would
also recommend vim or emacs, which have a steeper learning curve, but
are very powerful once you have mastered them. There are also some new
and (increasingly popular) kids on the block: atom and vstudio code.

![PICT](SilBioComp35x.png) ![PICT](SilBioComp36x.png)

#### <span class="titlemark">0.3.5 </span> [](){#x1-100000.3.5}Assessment {#assessment .subsectionHead}

##### [](){#x1-110000.3.5}Undergraduates {#undergraduates .subsubsectionHead}

Assessment will be through a computer-based test. You be expected to be
able to apply the concepts you have learnt to address questions by using
appropriate R input and interpreting R output.

##### [](){#x1-120000.3.5}Masters students {#masters-students .subsubsectionHead}

We will assess both your practical computing work itself (including any
writeups), and whether you are following good programming and workﬂow
practices, on a weekly basis. This will be done using scripts — yes we
will assess your scripts using scripts! A python script will check
whether your weekly (and version-controlled) directories are neat and
organized in a logical workﬂow, and whether all the scripts run
correctly with the expected inputs and outputs, starting from Week 1
(Chapter [1](#x1-140001)). Speciﬁcally, as an example towards learning
good workﬂow practices, you will keep all your coursework code, data
inputs and results outputs organized in separate directories named Code,
Data, Results (or equivalent) respectively.

The assessment script will then record a log ﬁle that summarizes all the
issues found in your workﬂows, which will be emailed to you by the
middle of the week (usually on the wednesday) subsequent to the one you
submitted your weekly practical work in.

Note that practicals in the weeks/modules not in these notes (e.g., GIS,
Genomics, Population Genetics) will also be included in the assessment.
The basic rules you must follow, irrespective of a Week’s content are:

 1. 
:   All code/scripts go to a Code directory

 2. 
:   All data go to a Data directory

 3. 
:   All results go to a Results directory, but the Results directory
    should be empty when you submit your week’s work, as it will be
    populated automatically when the assessment script runs.

 4. 
:   If you have ﬁles that don’t ﬁt in these categories, put them
    additional, meaningfully named directories (e.g, “Writeup”).
    ![PICT](SilBioComp37x.png) ![PICT](SilBioComp38x.png)

 5. 
:   No single ﬁle should be greater than 100 mb, either data
    or script/code. If a script needs a data ﬁle, but the example data
    ﬁle is &gt;100 mb, reduce it to a minimum working dataset and upload
    that, keeping the main data ﬁle(s) under .gitignore (more on
    this soon!). Keep the main data backed up of course <span
    class="footnote-mark">[^2^](SilBioComp3.html#fn2x2)</span>[](){#x1-12006f2}.

 6. 
:   Most importantly, all python, R, bash, and <span
    class="LATEX">L<span class="A">A</span><span class="TEX">T<span
    class="E">E</span>X</span></span>scripts should run OK, taking in
    data and spitting out the results as necessary (these are the
    scripts the assessment code will try to run)

When necessary, more speciﬁc, module-speciﬁc details on weekly
coursework and assessment will be given when the module starts.

The computing coursework marking criteria are given in the Appendix ??.

##### [](){#x1-130000.3.5}The ﬁnal assessment of weekly coursework {#the-ﬁnal-assessment-of-weekly-coursework .subsubsectionHead}

A written summary assessment of your overall performance with your marks
will be sent after the end of the 9 weeks.

The weekly assessments are to help you spot general, as well as
programming language-speciﬁc issues with your computing coursework on a
regular basis. You may and should ﬁx bugs and other problems that
feedback logs bring to your attention. I will have a look at how much
you addressed the issues in the ﬁnal assessment. The ﬁnal assessment
will be necessarily a more subjective than the weekly assessments as we
are looking to give you an overall picture of how you did and what you
can improve on. To give you an idea about the criteria for the overall
assessment, a set of summative marking criteria are also given in
Appendix ?? titled “MARKING CRITERIA for EXAMS and ESSAYS and
COURSEWORK”.

<div class="center">

Alright, full steam ahead then!

</div>

![PICT](SilBioComp39x.png) ![PICT](SilBioComp40x.png)

![PICT](SilBioComp41x.png) ![PICT](SilBioComp42x.png)

<span class="titlemark">Chapter 1</span>\
[](){#x1-140001}Introduction to UNIX and Linux {#chapter1-introduction-to-unix-and-linux .chapterHead}
----------------------------------------------

### <span class="titlemark">1.1 </span> [](){#x1-150001.1}What is UNIX? {#what-is-unix .sectionHead}

UNIX is a machine-independent operating system (OS) developed in the
1970s by AT&T programmers (notably Brian Kernighan and Dennis Ritchie,
fathers of C) for programmers (you!). It is multi-user and
network-oriented by design, uses plain text ﬁles for storing data (no
proprietary ﬁle formats), and has a strictly hierarchical directory
structure (more on this below). This makes it an ideal environment for
developing your code and storing your data.

Linux and Mac OS are Unix-like (or UN\*X or \*nix) operating systems
that have evolved from UNIX. Ubuntu is a Linux distribution.

### <span class="titlemark">1.2 </span> [](){#x1-160001.2}Why UNIX? {#why-unix .sectionHead}

Here are some good reasons:

-   It was designed for developing code and storing data — an ideal
    native habitat for programming languages like Python and R!
-   Robust, stable, secure (very few UNIX viruses and malware — I have
    never encountered one!)
-   Free and open source!
-   Scores of small programs available to perform simple tasks – can be
    combined easily
-   Easy to automate tasks (e.g., using shell scripts)
-   Multi-user (multiple users can log in concurrently use computer)
-   Multi-tasking (can perform many tasks at the same time)
-   Network-ready (easy to communicate between computers)
-   UNIX has been around since the early 1970’s and will likely be
    around at the end of your career (the hard work you are putting into
    learning UNIX will pay oﬀ over a lifetime!)
-   Amazing support — a large body of tutorials and support web sites
    are readily available online.
-   Basically all resources for High-Performance Computing (computer
    clusters, large ![PICT](SilBioComp43x.png)
    ![PICT](SilBioComp44x.png) workstations, etc.) run a UNIX or Linux
    operating system.

See <http://whylinuxisbetter.net/> (I would have chosen a more subtle
domain name though!) to aid your brain-washing (cleaning?).

Also, if you like history:
[https://www.howtogeek.com/182649/htg-\_explains-\_what-\_is-\_unix](https://www.howtogeek.com/182649/htg-explains-what-is-unix){.url}

SVG-Viewer needed.

### <span class="titlemark">1.3 </span> [](){#x1-170001.3}UNIX directory structure {#unix-directory-structure .sectionHead}

<div class="center">

![PIC](Graphics/unix-tree.png)\
[https://pathanruet.files.wordpress.com/2012/05/unix-\_tree.png](%20https://pathanruet.files.wordpress.com/2012/05/unix-tree.png){.url}

</div>

The UNIX directory (same as “Folder”) structure is hierarchical, with a
single tree starting from the “root” /. This is quite unlike Windows or
MS-DOS, where there are separate trees for disk partitions, removable
media, network, etc. The key UNIX directories are:

<div class="tabular">

/

Is the “root” directory

/bin

Contains basic programs

/etc

Contains conﬁguration ﬁles

/dev

Contains ﬁles connecting to devices (keyboard, mouse, screen, etc.)

/home

Your home directory – this is where you will usually work

/tmp

Contains Temporary ﬁles

</div>

This hierarchical directory structure makes navigating your computer
from the terminal/shell (coming up next!) or encoding this navigation in
your computer programs easier.

![PICT](SilBioComp45x.png) ![PICT](SilBioComp46x.png)

SVG-Viewer needed.

### <span class="titlemark">1.4 </span> [](){#x1-180001.4}Meet the UNIX shell {#meet-the-unix-shell .sectionHead}

The shell (or terminal) is a text command processor to interface with
the Operating System’s “kernel”. We will use the popular (yes, it’s
popular!) bash shell.

-   To launch bash shell, do Ctrl + Alt + t (or use Meta key) — try
    it now.

OK, so you have met the shell. Note that:

-   The shell automatically starts in your home directory
    /home/yourname/, also called $\sim$ (important to remember!)
-   Use the Tab key – very handy (try ls with TabTab)
-   You can navigate commands you previously typed using the up/down
    arrows

Other useful keyboard shortcuts are:

<div class="tabular">

Ctrl + A

Go to the beginning of the line

Ctrl + E

Go to the end of the line

Ctrl + L

Clear the screen

Ctrl + U

Clear the line before cursor position

Ctrl + K

Clear the line after the cursor

Ctrl + C

Kill whatever you are running

Ctrl + D

Exit the current shell

Ctrl + right arrow

Move cursor forward one word

Ctrl + left arrow

Move cursor backward one word

</div>

![PICT](SilBioComp47x.png) ![PICT](SilBioComp48x.png)

### <span class="titlemark">1.5 </span> [](){#x1-190001.5}sudo, and installing/removing software {#sudo-and-installingremoving-software .sectionHead}

You can install software in your /home directory. In UNIX you originally
had to login as root (administrator). But in Ubuntu, it is suﬃcient to
add sudo (super user do) in front of a command:

<div id="listing-2" class="lstlisting">

<span
class="label">[](){#x1-19001r1}</span>sudo apt-get install geany geany-plugins geany-plugin-latex \
<span class="label">[](){#x1-19002r2}</span>geany-plugin-addons

</div>

You can install anything that is in the Ubuntu “repository”. Let’s try
installing something else — a weather indicator that I think really
works very well.

But here you have to ﬁrst install the repository:

<div id="listing-3" class="lstlisting">

<span
class="label">[](){#x1-19003r1}</span>\$ sudo add-apt-repository ppa:atareao/atareao

</div>

This will ask you to ﬁrst approve the additon of this repository. Then
update the repository packages,

<div id="listing-4" class="lstlisting">

<span class="label">[](){#x1-19004r1}</span>\$ sudo apt-get update

</div>

And then install,

<div id="listing-5" class="lstlisting">

<span
class="label">[](){#x1-19005r1}</span>\$ sudo apt-get install my-weather-indicator

</div>

<div class="center">

![PIC](Graphics/sandwich.png)\
http://xkcd.com/149/

</div>

You can also easily remove software by, well, using the remove command!
You will ﬁnd that commands names are quite intuitive, as they should be.
If you think a command with a certain name should exist, it very often
does!

<div id="listing-6" class="lstlisting">

<span
class="label">[](){#x1-19006r1}</span>\$ sudo apt-get remove indicator-messages
![PICT](SilBioComp49x.png) ![PICT](SilBioComp50x.png)

</div>

This will get rid of the evolution mail indicator — very unlikely that
you will use evolution!

### <span class="titlemark">1.6 </span> [](){#x1-200001.6}Basic UNIX commands {#basic-unix-commands .sectionHead}

<div class="tabular">

  ---------------------- ---------------------------------------------------------
  man \[COMMAND\]        Show help page of a command.
  whoami                 Display your user-name.
  pwd                    Show the current directory.
  ls                     List the ﬁles in the directory.
  cd \[DIRNAME\]         Change directory.
  cd ..                  Move one directory up.
  cd /                   Go to the root directory.
  cd $\sim$ or just cd   Go to the home directory.
  cp \[FROM\] \[TO\]     Copy a ﬁle or directory non-recursively (what’s this?).
  mv \[FROM\] \[TO\]     Move or rename a ﬁle or directory.
  touch \[FILENAME\]     Create an empty ﬁle.
  echo “My string”       Print a string (here, “My string”).
  rm \[TOREMOVE\]        Remove a ﬁle or directory non-recursively.
  mkdir \[DIRNAME\]      Create a directory.
  rmdir \[DIRNAME\]      Remove an empty directory.
  wc \[FILENAME\]        Count the number of lines and words in a ﬁle.
  sort \[FILENAME\]      Sort the lines of a ﬁle and print result.
  uniq                   Shows only unique elements of a list.
  cat \[FILENAME\]       Print the ﬁle on the screen.
  less \[FILENAME\]      Progressively print a ﬁle on the screen (“q” to exit).
  head \[FILENAME\]      Print the ﬁrst few lines of a ﬁle.
  tail \[FILENAME\]      Print the last few lines of a ﬁle.
  history                Show the last commands you typed.
  date                   Print current date.
  file \[FILENAME\]      Determine the type of a ﬁle.
  passwd                 Change user password.
  chmod \[FILENAME\]     Change ﬁle permissions.
  ---------------------- ---------------------------------------------------------

</div>

### <span class="titlemark">1.7 </span> [](){#x1-210001.7}Building your coursework directory structure {#building-your-coursework-directory-structure .sectionHead}

It is time to start building your CMEE coursework directory structure.
Please follow these rules:

-   Do all your work in CMEECourseWork, located in a suitable place in
    your /home (make mama proud, keep your home organized!)
-   Each week’s coursework should be in its respective directory:
    CMEECourseWork/Week1, CMEECourseWork/Week2, etc
-   Each week’s directory will contain directories called Code, Data,
    etc (later) ![PICT](SilBioComp51x.png) ![PICT](SilBioComp52x.png)
-   You will bring CMEECourseWork and all it’s contents under version
    control using Git (later)

SVG-Viewer needed.

-   OK, mkdir your CMEECourseWork directory now.

Starting by creating CMEECourseWork). Then,

<div id="listing-7" class="lstlisting">

<span class="label">[](){#x1-21001r1}</span>\$ mkdir Week1 \
<span class="label">[](){#x1-21002r2}</span>\$ cd Week1 \
<span class="label">[](){#x1-21003r3}</span>\$ mkdir sandbox \
<span class="label">[](){#x1-21004r4}</span>\$ cd Sandbox \
<span
class="label">[](){#x1-21005r5}</span>bash: cd: Sandbox: No such file or directory \
<span class="label">[](){#x1-21006r6}</span>\$ cd .. \
<span class="label">[](){#x1-21007r7}</span>\$ rm sandbox \
<span
class="label">[](){#x1-21008r8}</span>rm: cannot remove ‘sandbox/‘: Is a directory \
<span
class="label">[](){#x1-21009r9}</span>\$ mv sandbox Sandbox \# OR, \~rm -r sandbox\~ (careful with the -r option!)

</div>

Note the hash mark \# above — anything after a \# is ignored (so you can
use it for commenting).

<div id="listing-8" class="lstlisting">

<span class="label">[](){#x1-21010r1}</span>\$ cd Sandbox \
<span class="label">[](){#x1-21011r2}</span>\$ pwd \
<span class="label">[](){#x1-21012r3}</span>\$ ls \
<span
class="label">[](){#x1-21013r4}</span>\$ touch TestFile \# OR, \~touch TestFile.txt\~ \
<span class="label">[](){#x1-21014r5}</span>\$ ls \
<span class="label">[](){#x1-21015r6}</span>\$ mv TestFile TestFile2 \
<span class="label">[](){#x1-21016r7}</span>\$ rm TestFile2

</div>

You could have made your project directories and subdirectories in one
swoop by using the -p option of mkdir:

<div id="listing-9" class="lstlisting">

<span
class="label">[](){#x1-21017r1}</span>\$ mkdir -p CMEECourseWork/Week1/{Data,Code,Sandbox}

</div>

![PICT](SilBioComp53x.png) ![PICT](SilBioComp54x.png)

### <span class="titlemark">1.8 </span> [](){#x1-220001.8}Command arguments {#command-arguments .sectionHead}

Most UNIX commands accept arguments that modify their behavior. E.g., ls
-l (ls “minus”l) lists the ﬁles in longer format. Some useful arguments:

<div class="tabular">

cp -r \[DIR1\] \[DIR2\]

Copy a directory recursively (i.e., including all the sub-directories
and ﬁles).

rm -i \[FILENAME\]

Remove a ﬁle, but asks ﬁrst (for safety).

rm -r \[DIR\]

Remove a directory recursively (i.e., including all the sub-directories
and ﬁles).

ls -a

List all ﬁles, including hidden ones.

ls -h

List all ﬁles, with human-readable sizes (Mb, Gb).

ls -l

List all ﬁles, long format.

ls -S

List all ﬁles, order by size.

ls -t

List all ﬁles, order by modiﬁcation time.

ls -1

List all ﬁles, one ﬁle per line.

mkdir -p Dir1/Dir2/Dir3

Create the directory Dir3 and Dir1 and Dir2 if they do not already
exist.

sort -n

Sort all the lines, but use numeric values instead of dictionary (i.e.,
11 follows 2).

</div>

You can also combine command arguments. Try:

<div id="listing-10" class="lstlisting">

<span
class="label">[](){#x1-22001r1}</span>\$ ls -1t \#combines -l and -t

</div>

### <span class="titlemark">1.9 </span> [](){#x1-230001.9}Redirection and pipes {#redirection-and-pipes .sectionHead}

Output of programs can also be “redirected” to a ﬁle:

<div class="tabular">

&gt;

Redirect output from a command to a ﬁle on disk. If the ﬁle already
exists, it will be overwritten.

$> >$

Append the output from a command to a ﬁle on disk. If the ﬁle does not
exist, it will be created.

</div>

Examples (make sure you are in Week1/Sandbox):

<div id="listing-11" class="lstlisting">

<span
class="label">[](){#x1-23001r1}</span>\$ echo \~My first line.\~ &gt; test.txt \
<span class="label">[](){#x1-23002r2}</span>\$ cat test.txt \
<span
class="label">[](){#x1-23003r3}</span>\$ echo \~My second line\~ &gt;&gt; test.txt \
<span
class="label">[](){#x1-23004r4}</span>\$ ls / &gt;&gt; ListRootDir.txt \
<span
class="label">[](){#x1-23005r5}</span>\$ cat ListRootDir.txt \#Isn’t that cool?!

</div>

![PICT](SilBioComp55x.png) ![PICT](SilBioComp56x.png)

We can also concatenate commands using “pipes” with “$|$” e.g., to count
how many ﬁles are in root (/) directory:

<div id="listing-12" class="lstlisting">

<span
class="label">[](){#x1-23006r1}</span>\$ ls / | wc -l \# what does this do? Look up \~man wc\~

</div>

Or try

<div id="listing-13" class="lstlisting">

<span
class="label">[](){#x1-23007r1}</span>\$ ls -lt | head -5 \#what does this do?

</div>

### <span class="titlemark">1.10 </span> [](){#x1-240001.10}Wildcards {#wildcards .sectionHead}

We can use wildcards to ﬁnd ﬁles based on their names (again, in
Week1/Sandbox !):

<div id="listing-14" class="lstlisting">

<span class="label">[](){#x1-24001r1}</span>\$ mkdir TestWild \
<span class="label">[](){#x1-24002r2}</span>\$ cd TestWild \
<span class="label">[](){#x1-24003r3}</span>\$ touch File1txt \
<span class="label">[](){#x1-24004r4}</span>\$ touch File2.txt \
<span class="label">[](){#x1-24005r5}</span>\$ touch File3.txt \
<span class="label">[](){#x1-24006r6}</span>\$ touch File4.txt \
<span class="label">[](){#x1-24007r7}</span>\$ touch File1.csv \
<span class="label">[](){#x1-24008r8}</span>\$ touch File2.csv \
<span class="label">[](){#x1-24009r9}</span>\$ touch File3.csv \
<span class="label">[](){#x1-24010r10}</span>\$ touch File4.csv \
<span class="label">[](){#x1-24011r11}</span>\$ touch Anotherfile.csv \
<span class="label">[](){#x1-24012r12}</span>\$ touch Anotherfile.txt \
<span class="label">[](){#x1-24013r13}</span>\$ ls \
<span class="label">[](){#x1-24014r14}</span>\$ ls | wc -l

</div>

We will use the following wildcards:

<div class="tabular">

?

Any single character, except a leading dot (hidden ﬁles).

\*

Zero or more characters, except a leading dot (hidden ﬁles).

\[A-Z\]

Deﬁne a class of characters (e.g., upper-case letters).

</div>

Now let’s try to ﬁnd the ﬁles using wildcards:

<div id="listing-15" class="lstlisting">

<span class="label">[](){#x1-24015r1}</span>\$ ls \* \
<span class="label">[](){#x1-24016r2}</span>\$ ls File\* \
<span class="label">[](){#x1-24017r3}</span>\$ ls \*.txt \
<span class="label">[](){#x1-24018r4}</span>\$ ls File?.txt \
<span class="label">[](){#x1-24019r5}</span>\$ ls File\[1-2\].txt \
<span class="label">[](){#x1-24020r6}</span>\$ ls File\[!3\].\*

</div>

![PICT](SilBioComp57x.png) ![PICT](SilBioComp58x.png)

### <span class="titlemark">1.11 </span> [](){#x1-250001.11}Using grep {#using-grep .sectionHead}

grep is a command that matches strings in a ﬁle (why is this useful?).
It is based on regular expressions (more on this later). Let’s explore
some basic usage of grep. For a test ﬁle let’s download a list of
protected species from the UN website (to Sandbox):

<div id="listing-16" class="lstlisting">

<span
class="label">[](){#x1-25001r1}</span>\$ wget http://www.cep.unep.org/pubs/legislation/spawannxs.txt \#Cool! \
<span
class="label">[](){#x1-25002r2}</span>\$ head -n 50 spawannxs.txt \#You will see \~head\~ in R as well

</div>

Now,

<div id="listing-17" class="lstlisting">

<span
class="label">[](){#x1-25003r1}</span>\$ mkdir ../Data \#Note the relative path \~../\~ \
<span
class="label">[](){#x1-25004r2}</span>\$ mv spawannxs.txt ../Data/ \
<span class="label">[](){#x1-25005r3}</span>\$ cd ../Data \
<span class="label">[](){#x1-25006r4}</span>\$ head -n 50 spawannxs.txt

</div>

Note that now you have a Data directory.

OK, what about falcons?

<div id="listing-18" class="lstlisting">

<span
class="label">[](){#x1-25007r1}</span>\$ grep Falco spawannxs.txt \
<span
class="label">[](){#x1-25008r2}</span>FalconidaeFalco    femoralis septentrionalis \
<span
class="label">[](){#x1-25009r3}</span>FalconidaeFalco    peregrinus \
<span
class="label">[](){#x1-25010r4}</span>FalconidaePolyborus  plancus \
<span
class="label">[](){#x1-25011r5}</span>FalconidaeFalco    columbarius

</div>

Using -i make the matching case-insensitive:

<div id="listing-19" class="lstlisting">

<span
class="label">[](){#x1-25012r1}</span>\$ grep -i Falco spawannxs.txt \
<span class="label">[](){#x1-25013r2}</span>Order:FALCONIFORMES \
<span
class="label">[](){#x1-25014r3}</span>FalconidaeFalco    femoralis septentrionalis \
<span
class="label">[](){#x1-25015r4}</span>FalconidaeFalco    peregrinus \
<span
class="label">[](){#x1-25016r5}</span>FalconidaePolyborus  plancus \
<span class="label">[](){#x1-25017r6}</span>Order:FALCONIFORMES \
<span class="label">[](){#x1-25018r7}</span>Order:FALCONIFORMES \
<span class="label">[](){#x1-25019r8}</span>Order:FALCONIFORMES \
<span
class="label">[](){#x1-25020r9}</span>FalconidaeFalco    columbarius

</div>

Now let’s ﬁnd the beautiful “Ara” macaws:

<div class="center">

![PIC](Graphics/Ara_ararauna.jpg)

</div>

![PICT](SilBioComp59x.png) ![PICT](SilBioComp60x.png)

But this poses a problem (what is the problem?):

<div id="listing-20" class="lstlisting">

<span
class="label">[](){#x1-25021r1}</span>\$ grep -i ara spawannxs.txt \
<span
class="label">[](){#x1-25022r2}</span>FlacourtiaceaeBanaras  vanderbiltii \
<span class="label">[](){#x1-25023r3}</span>Order:CHARADRIIFORMES \
<span
class="label">[](){#x1-25024r4}</span>Charadriidae  Charadriusmelodus \
<span
class="label">[](){#x1-25025r5}</span>PsittacidaeAmazona  arausica \
<span class="label">[](){#x1-25026r6}</span>PsittacidaeAra  macao \
<span
class="label">[](){#x1-25027r7}</span>Dasyproctidae  Dasyproctaguamara \
<span
class="label">[](){#x1-25028r8}</span>Palmae  Syagrus (= Rhyticocos)amara \
<span class="label">[](){#x1-25029r9}</span>PsittacidaeAra  ararauna \
<span
class="label">[](){#x1-25030r10}</span>PsittacidaeAra  chloroptera \
<span
class="label">[](){#x1-25031r11}</span>PsittacidaeArao    manilata \
<span class="label">[](){#x1-25032r12}</span>MustelidaeEira    barbara \
<span class="label">[](){#x1-25033r13}</span>Order:CHARADRIIFORMES

</div>

We can solve this by specifying -w to match only full words:

<div id="listing-21" class="lstlisting">

<span
class="label">[](){#x1-25034r1}</span>\$ grep -i -w ara spawannxs.txt \
<span class="label">[](){#x1-25035r2}</span>PsittacidaeAra  macao \
<span class="label">[](){#x1-25036r3}</span>PsittacidaeAra  ararauna \
<span class="label">[](){#x1-25037r4}</span>PsittacidaeAra  chloroptera

</div>

And also show line(s) after the one that was matched, we can use -A x,
where x is number of lines to use:

<div id="listing-22" class="lstlisting">

<span
class="label">[](){#x1-25038r1}</span>\$ grep -i -w -A 1 ara spawannxs.txt \
<span class="label">[](){#x1-25039r2}</span>PsittacidaeAra  macao \
<span class="label">[](){#x1-25040r3}</span> \
<span class="label">[](){#x1-25041r4}</span>-- \
<span class="label">[](){#x1-25042r5}</span>PsittacidaeAra  ararauna \
<span
class="label">[](){#x1-25043r6}</span>PsittacidaeAra  chloroptera \
<span class="label">[](){#x1-25044r7}</span>PsittacidaeArao    manilata

</div>

Similarly, -B shows the lines before:

<div id="listing-23" class="lstlisting">

<span
class="label">[](){#x1-25045r1}</span>\$ grep -i -w -B 1 ara spawannxs.txt \
<span
class="label">[](){#x1-25046r2}</span>PsittacidaeAmazona  vittata \
<span class="label">[](){#x1-25047r3}</span>PsittacidaeAra  macao \
<span class="label">[](){#x1-25048r4}</span>-- \
<span
class="label">[](){#x1-25049r5}</span>PsittacidaeAmazona  ochrocephala \
<span class="label">[](){#x1-25050r6}</span>PsittacidaeAra  ararauna \
<span class="label">[](){#x1-25051r7}</span>PsittacidaeAra  chloroptera

</div>

Use -n to show the line number of the match:

<div id="listing-24" class="lstlisting">

<span
class="label">[](){#x1-25052r1}</span>\$ grep -i -w -n ara spawannxs.txt \
<span class="label">[](){#x1-25053r2}</span>216:PsittacidaeAra  macao \
<span
class="label">[](){#x1-25054r3}</span>461:PsittacidaeAra  ararauna \
<span
class="label">[](){#x1-25055r4}</span>462:PsittacidaeAra  chloroptera

</div>

To print all the lines that do not match a pattern, use -v:

![PICT](SilBioComp61x.png) ![PICT](SilBioComp62x.png)

<div id="listing-25" class="lstlisting">

<span
class="label">[](){#x1-25056r1}</span>\$ grep -i -w -v ara spawannxs.txt

</div>

To match one of several strings, use grep
“string1$\left. \smallsetminus \right|$string2” file. grep can be used
on multiple ﬁles, all ﬁles, using wildcards for ﬁlenames, etc – explore
as and when you need.

### <span class="titlemark">1.12 </span> [](){#x1-260001.12}Finding ﬁles with find {#finding-ﬁles-with-find .sectionHead}

Its’s easy to ﬁnd ﬁles in UNIX using find! Let’s test it (make sure you
are in Sandbox, not Data!)

<div id="listing-26" class="lstlisting">

<span class="label">[](){#x1-26001r1}</span>\$ mkdir TestFind \
<span class="label">[](){#x1-26002r2}</span>\$ cd TestFind \
<span
class="label">[](){#x1-26003r3}</span>\$ mkdir -p Dir1/Dir11/Dir111 \#what does -p do? \
<span class="label">[](){#x1-26004r4}</span>\$ mkdir Dir2 \
<span class="label">[](){#x1-26005r5}</span>\$ mkdir Dir3 \
<span class="label">[](){#x1-26006r6}</span>\$ touch Dir1/File1.txt \
<span class="label">[](){#x1-26007r7}</span>\$ touch Dir1/File1.csv \
<span class="label">[](){#x1-26008r8}</span>\$ touch Dir1/File1.tex \
<span class="label">[](){#x1-26009r9}</span>\$ touch Dir2/File2.txt \
<span class="label">[](){#x1-26010r10}</span>\$ touch Dir2/file2.csv \
<span class="label">[](){#x1-26011r11}</span>\$ touch Dir2/File2.tex \
<span
class="label">[](){#x1-26012r12}</span>\$ touch Dir1/Dir11/Dir111/File111.txt \
<span class="label">[](){#x1-26013r13}</span>\$ touch Dir3/File3.txt

</div>

Now ﬁnd particular ﬁles:

<div id="listing-27" class="lstlisting">

<span
class="label">[](){#x1-26014r1}</span>\$ find . -name \~File1.txt\~ \
<span class="label">[](){#x1-26015r2}</span>./Dir1/File1.txt

</div>

Using -iname ignores case, and you can use wildcards:

<div id="listing-28" class="lstlisting">

<span
class="label">[](){#x1-26016r1}</span>\$ find . -iname \~fi\*.txt\~ \
<span class="label">[](){#x1-26017r2}</span>./Dir1/File1.txt \
<span
class="label">[](){#x1-26018r3}</span>./Dir1/Dir11/Dir111/File111.txt \
<span class="label">[](){#x1-26019r4}</span>./Dir3/File3.txt \
<span class="label">[](){#x1-26020r5}</span>./Dir2/File2.txt

</div>

You can limit the search to exclude sub-directories:

<div id="listing-29" class="lstlisting">

<span
class="label">[](){#x1-26021r1}</span>\$ find . -maxdepth 2 -name \~\*.txt\~ \
<span class="label">[](){#x1-26022r2}</span>./Dir1/File1.txt \
<span class="label">[](){#x1-26023r3}</span>./Dir3/File3.txt \
<span class="label">[](){#x1-26024r4}</span>./Dir2/File2.txt
![PICT](SilBioComp63x.png) ![PICT](SilBioComp64x.png)

</div>

You can exclude certain ﬁles:

<div id="listing-30" class="lstlisting">

<span
class="label">[](){#x1-26025r1}</span>\$ find . -maxdepth 2 -not -name \~\*.txt\~ \
<span class="label">[](){#x1-26026r2}</span>. \
<span class="label">[](){#x1-26027r3}</span>./Dir1 \
<span class="label">[](){#x1-26028r4}</span>./Dir1/File1.tex \
<span class="label">[](){#x1-26029r5}</span>./Dir1/File1.csv \
<span class="label">[](){#x1-26030r6}</span>./Dir1/Dir11 \
<span class="label">[](){#x1-26031r7}</span>./Dir3 \
<span class="label">[](){#x1-26032r8}</span>./Dir2 \
<span class="label">[](){#x1-26033r9}</span>./Dir2/File2.tex \
<span class="label">[](){#x1-26034r10}</span>./Dir2/File2.csv

</div>

To ﬁnd only directories:

<div id="listing-31" class="lstlisting">

<span class="label">[](){#x1-26035r1}</span>\$ find . -type d \
<span class="label">[](){#x1-26036r2}</span>. \
<span class="label">[](){#x1-26037r3}</span>./Dir1 \
<span class="label">[](){#x1-26038r4}</span>./Dir1/Dir11 \
<span class="label">[](){#x1-26039r5}</span>./Dir1/Dir11/Dir111 \
<span class="label">[](){#x1-26040r6}</span>./Dir3 \
<span class="label">[](){#x1-26041r7}</span>./Dir2

</div>

SVG-Viewer needed.

![PICT](SilBioComp65x.png) ![PICT](SilBioComp66x.png)
![PICT](SilBioComp67x.png) ![PICT](SilBioComp68x.png)

SVG-Viewer needed.

### <span class="titlemark">1.13 </span> [](){#x1-270001.13}Practical: Make sure the basics work {#practical-make-sure-the-basics-work .sectionHead}

 1. 

:   Some instructions:

    Review (especially if you got lost along the way) and make sure you
    can run and understand all the commands and get the expected outputs
    we have covered today.

    Make sure you have your directory organized with Data and Sandbox
    with the necessary ﬁles, under CMEECourseWork/Week1.

    Along with the completeness of the practicals/exercises themselves,
    you will be marked on the basis of how complete and well-organized
    your directory structure and content is – in all coming weeks
    as well.

 2. 

:   Here is a more complicated bash command using two pipes you are not
    expected to include the answer to this one as part of your weekly
    submission:

    <div id="listing-36" class="lstlisting">

    <span
    class="label">[](){#x1-27003r1}</span>\$ find . -type f -exec ls -s {} \\; | sort -n | head -10
    ![PICT](SilBioComp69x.png) ![PICT](SilBioComp70x.png)

    </div>

    What does this command do (Hint: try it on the test directories and
    ﬁles we created in Sandbox)?

    Note that along with the man command, you can use the internet to
    get help on practically everything about UNIX!

 3. 

:   In the directory /Data/fasta you ﬁnd some FASTA ﬁles. These ﬁles
    have an header starting with $>$ followed by the name of the
    sequence and other metadata. Starting from the second line, we have
    the sequence data. Write a ﬁle called UnixPrac1.txt with UNIX shell
    commands that do the following (number each command with a hashed
    comment like so – \# 1, \# 2, etc):

     (a) 
    :   Count how many lines are in each ﬁle

     (b) 
    :   Print everything starting from the second line for the E. coli
        genome

     (c) 
    :   Count the sequence length of this genome

     (d) 
    :   Count the matches of a particular sequence, “ATGC” in the genome
        of E. coli (hint: Start by removing the ﬁrst line and removing
        newline characters)

     (e) 
    :   Compute the AT/GC ratio

    Save UnixPrac1.txt in the Code directory. Please make sure that each
    command calls the data from the Data directory! Do not write any of
    the above as shell scripts (that’s not been covered yet; see Chapter
    [2](#x1-290002)) — each one should be a single line solution made of
    (potentially piped together) UNIX commands.

    Please put (judicious) comments in any of your script ﬁles. But you
    won’t be penalized if you haven’t put in comments in the ﬁrst week
    in practicals. From the ﬁrst Python week (Chapter [5](#x1-710005))
    onwards, you will be penalizeed if you don’t properly document and
    comment code (more on this next week), even if you weren’t
    explicitly asked to.

![PICT](SilBioComp71x.png) ![PICT](SilBioComp72x.png)

### <span class="titlemark">1.14 </span> [](){#x1-280001.14}Readings & Resources {#readings-resources .sectionHead}

IC library gives you with access to several e- and paper books on UNIX,
some speciﬁc to Ubuntu. Browse or search and ﬁnd a good intro book.

-   Lots of UNIX tutorials out there. Try
    [http://software-\_carpentry.org/lessons.html](http://software-carpentry.org/lessons.html){.url}
    (Chapter “shell”).
-   Some good UNIX usage habits:
    [http://www.ibm.com/developerworks/aix/library/au-\_badunixhabits.html](http://www.ibm.com/developerworks/aix/library/au-badunixhabits.html){.url}
-   List of UNIX commands along with man page:
    <http://archive.oreilly.com/linux/cmd/>

![PICT](SilBioComp73x.png) ![PICT](SilBioComp74x.png)

<span class="titlemark">Chapter 2</span>\
[](){#x1-290002}Advanced UNIX: Shell scripting {#chapter2-advanced-unix-shell-scripting .chapterHead}
----------------------------------------------

### <span class="titlemark">2.1 </span> [](){#x1-300002.1}Shell scripting: What and Why {#shell-scripting-what-and-why .sectionHead}

Instead of typing all the UNIX commands we need to perform one after the
other, we can save them all in a ﬁle (a “script”) and execute them all
at once.

The bash shell we are using provides a proper syntax that can be used to
build complex command sequences and scripts.

Scripts can be used to automate repetitive tasks, to do simple data
manipulation or to perform maintenance of your computer (e.g., backup).
Indeed, most data manipulation can be handled by scripts without the
need of writing a proper program.

### <span class="titlemark">2.2 </span> [](){#x1-310002.2}Scripting: How {#scripting-how .sectionHead}

There are two ways of running a script, say myscript.sh:

 1. 

:   The ﬁrst is to call the interpreter bash to run the ﬁle (try this,
    but won’t work as you don’t have a myscript.sh script !)

    <div id="listing-37" class="lstlisting">

    <span
    class="label">[](){#x1-31002r1}</span>\$ bash myscript.sh \# OR sh myscript.sh

    </div>

    (A script that does something speciﬁc in a given project)

 2. 

:   OR, make the script executable and execute it:

    <div id="listing-38" class="lstlisting">

    <span
    class="label">[](){#x1-31004r1}</span>\$ chmod +x myscript.sh \
    <span class="label">[](){#x1-31005r2}</span>\$ myscript.sh

    </div>

    (A script that does something generic, and is likely to be reused
    again and again – can you think of examples?)

The generic scripts of type (2) can be saved in username/bin/ and made
executable (the .sh extension not needed)

![PICT](SilBioComp75x.png) ![PICT](SilBioComp76x.png)

<div id="listing-39" class="lstlisting">

<span class="label">[](){#x1-31006r1}</span>\$ mkdir ∼/bin \
<span
class="label">[](){#x1-31007r2}</span>\$ PATH=\$PATH:\$HOME/bin \#Tell UNIX to look in /home/bin for commands

</div>

### <span class="titlemark">2.3 </span> [](){#x1-320002.3}Your ﬁrst shell script {#your-ﬁrst-shell-script .sectionHead}

Let’s write our ﬁrst shell script! For starters,

-   Write and save boilerplate.sh in CMEECourseWork/Week1/Code, and add
    the following script to it (type it in a code editor like geany):

<div class="lstinputlisting">

[](){#x1-32001}  \
<span class="label">[](){#x1-32002r1}</span>\#!/bin/bash \
<span
class="label">[](){#x1-32003r2}</span>\# Author: Your Name your.login@imperial.ac.uk \
<span class="label">[](){#x1-32004r3}</span>\# Script: boilerplate.sh \
<span
class="label">[](){#x1-32005r4}</span>\# Desc: simple boilerplate for shell scripts \
<span class="label">[](){#x1-32006r5}</span>\# Arguments: none \
<span class="label">[](){#x1-32007r6}</span>\# Date: Oct 2015 \
<span class="label">[](){#x1-32008r7}</span> \
<span
class="label">[](){#x1-32009r8}</span>echo -e \~\\nThis is a shell script! \\n\~ \#what does -e do? \
<span class="label">[](){#x1-32010r9}</span> \
<span class="label">[](){#x1-32011r10}</span>\#exit

</div>

The ﬁrst line is a “shebang” (or sha-bang or hashbang or pound-bang or
hash-exclam or hash-pling! – Wikipedia). It can also can be written as
\#!/bin/sh. It tells the bash iterpreter that this is a bash script and
that it should be interpreted and run as such. The hash marks in the
following lines tell the interpreter that it should ignore the lines
following them (that’s how you put in script documentation (who wrote
the script and when, what the script does, etc.) and comments on
particular line of script.

SVG-Viewer needed.

![PICT](SilBioComp77x.png) ![PICT](SilBioComp78x.png)
![PICT](SilBioComp79x.png) ![PICT](SilBioComp80x.png)

SVG-Viewer needed.

Now run your boilerplate shell script by typing in the terminal:

<div id="listing-41" class="lstlisting">

<span class="label">[](){#x1-32015r1}</span>\$ bash boilerplate.sh

</div>

### <span class="titlemark">2.4 </span> [](){#x1-330002.4}A useful shell-scripting example {#a-useful-shell-scripting-example .sectionHead}

Let’s write a shell script to transform comma-separated ﬁles (csv) to
tab-separated ﬁles and vice-versa. This can be handy — for example, in
certain computer languages, it is much easier to read tab or space
separated ﬁles than csv (e.g., C)

To do this, in the bash we can use tr, which deletes or substitute
characters. Here are some examples.

<div id="listing-42" class="lstlisting">

<span
class="label">[](){#x1-33001r1}</span>\$ echo \~Remove    excess      spaces.\~ | tr -s \~\\b\~ \~ \~ \
<span class="label">[](){#x1-33002r2}</span>Remove excess spaces. \
<span
class="label">[](){#x1-33003r3}</span>\$ echo \~remove all the as\~ | tr -d \~a\~ \
<span class="label">[](){#x1-33004r4}</span>remove ll the s \
<span
class="label">[](){#x1-33005r5}</span>\$ echo \~set to uppercase\~ | tr \[:lower:\] \[:upper:\] \
<span class="label">[](){#x1-33006r6}</span>SET TO UPPERCASE \
<span
class="label">[](){#x1-33007r7}</span>\$ echo \~10.00 only numbers 1.33\~ | tr -d \[:alpha:\] | tr -s \~ \~ \~,\~ \
<span class="label">[](){#x1-33008r8}</span>10.00,1.33

</div>

Now write a shell script to substitute all tabs with commas called
tabtocsv.sh in Week1/Code:

<div class="lstinputlisting">

[](){#x1-33011}  \
<span class="label">[](){#x1-33012r1}</span>\#!/bin/bash \
<span
class="label">[](){#x1-33013r2}</span>\# Author: Your name you.login@imperial.ac.uk \
<span class="label">[](){#x1-33014r3}</span>\# Script: tabtocsv.sh \
<span
class="label">[](){#x1-33015r4}</span>\# Desc: substitute the tabs in the files with commas \
<span
class="label">[](){#x1-33016r5}</span>\#       saves the output into a .csv file \
<span
class="label">[](){#x1-33017r6}</span>\# Arguments: 1-&gt; tab delimited file \
<span class="label">[](){#x1-33018r7}</span>\# Date: Oct 2015 \
<span class="label">[](){#x1-33019r8}</span> \
<span
class="label">[](){#x1-33020r9}</span>echo \~Creating a comma delimited version of \$1 ...\~ \
<span class="label">[](){#x1-33021r10}</span> \
<span
class="label">[](){#x1-33022r11}</span>cat \$1 | tr -s \~\\t\~ \~,\~ &gt;&gt; \$1.csv \
<span class="label">[](){#x1-33023r12}</span> \
<span class="label">[](){#x1-33024r13}</span>echo \~Done!\~ \
<span class="label">[](){#x1-33025r14}</span> \
<span class="label">[](){#x1-33026r15}</span>exit

</div>

Now test it (note where the output ﬁle gets saved)

<div id="listing-43" class="lstlisting">

<span
class="label">[](){#x1-33027r1}</span>echo -e \~test \\t\\t test\~ &gt;&gt; ../SandBox/test.txt \
<span
class="label">[](){#x1-33028r2}</span>bash tabtocsv.sh ../SandBox/test.txt

</div>

![PICT](SilBioComp81x.png) ![PICT](SilBioComp82x.png)

### <span class="titlemark">2.5 </span> [](){#x1-340002.5}Variables in shell scripting {#variables-in-shell-scripting .sectionHead}

There are three ways to assign values to variables (note lack of
spaces!):

 1. 
:   Explicit declaration: MYVAR=myvalue

 2. 
:   Reading from the user: read MYVAR

 3. 
:   Command substitution: MYVAR=\$( (ls | wc -l) )

Here are some examples of assignments (try it out save as
Week1/Code/variables.sh):

<div class="lstinputlisting">

[](){#x1-34004}  \
<span class="label">[](){#x1-34005r1}</span>\#!/bin/bash \
<span
class="label">[](){#x1-34006r2}</span>\# Shows the use of variables \
<span class="label">[](){#x1-34007r3}</span>MyVar=’some string’ \
<span
class="label">[](){#x1-34008r4}</span>echo ’the current value of the variable is’ \$MyVar \
<span
class="label">[](){#x1-34009r5}</span>echo ’Please enter a new string’ \
<span class="label">[](){#x1-34010r6}</span>read MyVar \
<span
class="label">[](){#x1-34011r7}</span>echo ’the current value of the variable is’ \$MyVar \
<span
class="label">[](){#x1-34012r8}</span>\#\# Reading multiple values \
<span
class="label">[](){#x1-34013r9}</span>echo ’Enter two numbers separated by space(s)’ \
<span class="label">[](){#x1-34014r10}</span>read a b \
<span
class="label">[](){#x1-34015r11}</span>echo ’you entered’ \$a ’and’ \$b ’. Their sum is:’ \
<span class="label">[](){#x1-34016r12}</span>mysum=‘expr \$a + \$b‘ \
<span class="label">[](){#x1-34017r13}</span>echo \$mysum

</div>

And also (save as Week1/Code/MyExampleScript.sh):

<div class="lstinputlisting">

[](){#x1-34018}  \
<span class="label">[](){#x1-34019r1}</span>\#!/bin/bash \
<span class="label">[](){#x1-34020r2}</span> \
<span class="label">[](){#x1-34021r3}</span>msg1=\~Hello\~ \
<span class="label">[](){#x1-34022r4}</span>msg2=\$USER \
<span class="label">[](){#x1-34023r5}</span>echo \~\$msg1 \$msg2\~ \
<span class="label">[](){#x1-34024r6}</span> \
<span class="label">[](){#x1-34025r7}</span>echo \~Hello \$USER\~ \
<span class="label">[](){#x1-34026r8}</span>echo

</div>

### <span class="titlemark">2.6 </span> [](){#x1-350002.6}Some more Examples {#some-more-examples .sectionHead}

Here are a few more illustrative examples (test each one out, save in
Week1/Code/ with the given name):

CountLines.sh:

<div class="lstinputlisting">

[](){#x1-35001}  \
<span class="label">[](){#x1-35002r1}</span>\#!/bin/bash \
<span class="label">[](){#x1-35003r2}</span>NumLines=‘wc -l &lt; \$1‘ \
<span
class="label">[](){#x1-35004r3}</span>echo \~The file \$1 has \$NumLines lines\~ \
<span class="label">[](){#x1-35005r4}</span>echo

</div>

ConcatenateTwoFiles.sh:

<div class="lstinputlisting">

![PICT](SilBioComp83x.png) ![PICT](SilBioComp84x.png) [](){#x1-35006}  \
<span class="label">[](){#x1-35007r1}</span>\#!/bin/bash \
<span class="label">[](){#x1-35008r2}</span>cat \$1 &gt; \$3 \
<span class="label">[](){#x1-35009r3}</span>cat \$2 &gt;&gt; \$3 \
<span class="label">[](){#x1-35010r4}</span>echo \~Merged File is\~ \
<span class="label">[](){#x1-35011r5}</span>cat \$3

</div>

### <span class="titlemark">2.7 </span> [](){#x1-360002.7}Practical {#practical .sectionHead}

 1. 

:   Some instructions:

    Along with the completeness of the practicals/exercises themselves,
    you will be marked on the basis of how complete and well-organized
    your directory structure and content is.

    Review (especially if you got lost along the way) and make sure all
    your shell scripts are functional: boilerplate.sh,
    ConcatenateTwoFiles.sh, CountLines.sh,\
    MyExampleScript.sh, tabtocsv.sh, variables.sh

    Don’t worry about how some of these scripts will run on my computer
    without explicit inputs (e.g., ConcatenateTwoFiles.sh needs two
    input ﬁles) — I will run them with my own test ﬁles.

    Make sure you have your weekly directory organized with Data,
    Sandbox, Code with the necessary ﬁles, under CMEECourseWork/Week1.
    All scripts should run on any other Unix/Linux machine — for
    example, always call data from the Data directory using
    relative paths.

    Make sure there is a readme ﬁle in every week’s directory. This ﬁle
    should give an overview of the weekly directory contents, listing
    all the scripts and what they do. This is diﬀerent from the readme
    for your overall git repository, of which Week 1 is a part. You will
    write a similar readmefor each subsequent weekly submission.

    Don’t put any scripts that are part of the submission in your
    home/bin directory! You can put a copy there, but a working version
    should be in your repository.

 2. 

:   Finally, a small exercise: write a csvtospace.sh shell script that
    takes a comma separated values and converts it to a space separated
    values ﬁle. However, it must not change the input ﬁle — it should
    save it as a diﬀerently named ﬁle.

    Save the script in CMEECourseWork/Week1/Code, and run it on the csv
    data ﬁles that are in Temperatures in the master repository’s
    Data directory.

    Don’t modify anything (or refer to anything) in your local copy of
    the master repository. All changes you make in the master repository
    will be lost. Copy whatever you need from the master repository to
    your own repository.

    ![PICT](SilBioComp85x.png) ![PICT](SilBioComp86x.png)

<div class="center">

Commit and push everything by next Wednesday 5 PM.

</div>

This includes UnixPrac1.txt! Check the updated instructions from Chapter
[1](#x1-140001) on this practical.

### <span class="titlemark">2.8 </span> [](){#x1-370002.8}Readings & Resources {#readings-resources-1 .sectionHead}

-   Plenty of shell scripting resources and tutorials out there; in
    particular, look up
    [http://www.tutorialspoint.com/unix/unix-\_using-\_variables.htm](http://www.tutorialspoint.com/unix/unix-using-variables.htm){.url}

![PICT](SilBioComp87x.png) ![PICT](SilBioComp88x.png)

![PICT](SilBioComp89x.png) ![PICT](SilBioComp90x.png)

<span class="titlemark">Chapter 3</span>\
[](){#x1-380003}Version control with Git {#chapter3-version-control-with-git .chapterHead}
-----------------------------------------

### <span class="titlemark">3.1 </span> [](){#x1-390003.1}What is Version Control? {#what-is-version-control .sectionHead}

Version control, also known as revision control or source control, is
the management and tracking of changes to documents, computer programs,
large web sites, and other collections of information in an automated
way.

Any project (collections of ﬁles in directories) under version control
has changes and additions/deletions to its ﬁles and directories recorded
and archived over time so that you can recall speciﬁc versions later.
With version control of biological computing projects, you can:

-   record of all changes made to a set of ﬁles and directories,
    including text (usually ASCII) data ﬁles, so that you can access any
    previous version of the ﬁles
-   branch (and merge) new projects
-   “roll back” data, code, documents that are in plain text format
    (other ﬁle formats can also be versioned; see section on binary
    ﬁles below).

Note also that version control (usually git) is in fact the technology
embedded in the versioning of various word processor and spreadsheet
applications (e.g., Google Docs, Sheets, Overleaf).

------------------------------------------------------------------------

<div class="figure">

![PICT](SilBioComp91x.png) ![PICT](SilBioComp92x.png) [](){#x1-39001r1}
![PICT](SilBioComp93x.png) ![PICT](SilBioComp94x.png)
![PIC](Graphics/VC.png)\

<div class="caption">

<span class="id">Figure 3.1: </span><span class="content">A general idea
of how version control works.</span>

</div>

![PICT](SilBioComp95x.png) ![PICT](SilBioComp96x.png)

</div>

------------------------------------------------------------------------

### <span class="titlemark">3.2 </span> [](){#x1-400003.2}Why Version Control? {#why-version-control .sectionHead}

![PIC](Graphics/cvs.png)\
maktoons.blogspot.com/2009/06/if-dont-use-version-control-system.html

Or here’s another one:
<http://www.phdcomics.com/comics/archive/phd101212s.gif>

### <span class="titlemark">3.3 </span> [](){#x1-410003.3}git {#git .sectionHead}

We will use git, developed by Linus Torvalds, the “Linu” in Linux. In
git each user stores a complete local copy of the project, including the
history and all versions. So you do not rely as much on a centralized
(remote) server. We will use bitbucket.org – it gives you unlimited free
private repositories if you register with an academic email! First,
install and conﬁgure git:

<div id="listing-44" class="lstlisting">

<span
class="label">[](){#x1-41001r1}</span>\$ sudo apt-get install git \
<span
class="label">[](){#x1-41002r2}</span>\$ git config --global user.name \~Your Name\~ \
<span
class="label">[](){#x1-41003r3}</span>\$ git config --global user.email \~your.login@imperial.ac.uk\~ \
<span class="label">[](){#x1-41004r4}</span>\$ git config --list

</div>

### <span class="titlemark">3.4 </span> [](){#x1-420003.4}Your ﬁrst repository {#your-ﬁrst-repository .sectionHead}

Time to bring your CMEECourseWork under version control:

<div id="listing-45" class="lstlisting">

<span class="label">[](){#x1-42001r1}</span>\$ cd CMEECourseWork \
<span class="label">[](){#x1-42002r2}</span>\$ git init \
<span
class="label">[](){#x1-42003r3}</span>\$ echo \~My CMEE 2016-17 Coursework Repository\~ &gt; README.txt \
<span class="label">[](){#x1-42004r4}</span>\$ git config --list \
<span class="label">[](){#x1-42005r5}</span>\$ ls -al \
<span
class="label">[](){#x1-42006r6}</span>\$ git add README.txt \#Staging \
<span class="label">[](){#x1-42007r7}</span>\$ git status \
<span
class="label">[](){#x1-42008r8}</span>\$ git commit -m \~Added README file.\~ \#you can use -am too \
<span
class="label">[](){#x1-42009r9}</span>\$ git status \#what does it say now? \
<span class="label">[](){#x1-42010r10}</span>\$ git add -A \
<span class="label">[](){#x1-42011r11}</span>\$ git status

</div>

Nothing has been sent to a remote server yet (see section
[3.5.1](#x1-440003.5.1))! So let’s go to your git service (bitbucket or
github) and setup:

![PICT](SilBioComp97x.png) ![PICT](SilBioComp98x.png)

-   Login to your bitbucket or github account
-   Set up your ssh based access

    bitbucket:
    [https://confluence.atlassian.com/bitbucket/set-\_up-\_ssh-\_for-\_git-\_728138079.html](https://confluence.atlassian.com/bitbucket/set-up-ssh-for-git-728138079.html){.url}

    github:
    [https://help.github.com/articles/connecting-\_to-\_github-\_with-\_ssh](https://help.github.com/articles/connecting-to-github-with-ssh){.url}

-   Then create repository there with name CMEECourseWork
-   Then grab the repository url and use git remote add origin https...

    bitbucket:
    [https://confluence.atlassian.com/bitbucket/set-\_up-\_a-\_repository-\_877174034.html](https://confluence.atlassian.com/bitbucket/set-up-a-repository-877174034.html){.url}

    github:
    [https://help.github.com/articles/adding-\_an-\_existing-\_project-\_to-\_github-\_using-\_the-\_command-\_line/](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/){.url}

You are done. Now let’s learn to use git!

### <span class="titlemark">3.5 </span> [](){#x1-430003.5}git commands {#git-commands .sectionHead}

Here are some basic git commands:

<div class="tabular">

git init

Initialize a new repository

git clone

Download a repository from a remote server

git status

Show the current status

git diff

Show diﬀerences between commits

git blame

Blame somebody for the changes!

git log

Show commit history

git commit

Commit changes to current branch

git branch

Show branches

git branch name

Create new branch

git checkout name

Switch to a diﬀerent commit/branch

git pull

Upload from remote repository

git push

Send changes to remote repository

</div>

#### <span class="titlemark">3.5.1 </span> [](){#x1-440003.5.1}git command structure {#git-command-structure .subsectionHead}

Here is a graphical outline of the git command structure. Note that only
when you push or fetch do you need an internet connection, as before
that you are only archiving in a local (hidden) repository.

![PICT](SilBioComp99x.png) ![PICT](SilBioComp100x.png)

<div class="center">

![PIC](Graphics/git.png)

</div>

Keep in mind, the main mantra is, “commit often, comment always”!

<div class="center">

![PIC](Graphics/git_xkcd.png)

</div>

### <span class="titlemark">3.6 </span> [](){#x1-450003.6}Ignoring Files {#ignoring-files .sectionHead}

You will have some ﬁles you don’t want to track (log ﬁles, temporary
ﬁles, executables, etc). You can ignore entire classes of ﬁles with
.gitignore (be in your CMEECourseWork!):

<div id="listing-46" class="lstlisting">

<span
class="label">[](){#x1-45001r1}</span>\$ echo -e \~\*∼ \\n\*.tmp\~ &gt; .gitignore \
<span class="label">[](){#x1-45002r2}</span> \
<span class="label">[](){#x1-45003r3}</span>\$ cat .gitignore \
<span class="label">[](){#x1-45004r4}</span>\*∼ \
<span class="label">[](){#x1-45005r5}</span>\*.tmp \
<span class="label">[](){#x1-45006r6}</span> \
<span class="label">[](){#x1-45007r7}</span>\$ git add .gitignore \
<span class="label">[](){#x1-45008r8}</span> \
<span class="label">[](){#x1-45009r9}</span>\$ touch temporary.tmp \
<span class="label">[](){#x1-45010r10}</span> \
<span class="label">[](){#x1-45011r11}</span>\$ git add \* \
<span
class="label">[](){#x1-45012r12}</span>The following paths are ignored by one of your .gitignore \
<span class="label">[](){#x1-45013r13}</span>files: \
<span class="label">[](){#x1-45014r14}</span>temporary.tmp \
<span
class="label">[](){#x1-45015r15}</span>Use -f if you really want to add them. \
<span class="label">[](){#x1-45016r16}</span>fatal: no files added

</div>

You can also create a global gitignore ﬁle that lists rules for ﬁles to
be ignored in every Git repository on your computer:
[https://help.github.com/articles/ignoring-\_files/](https://help.github.com/articles/ignoring-files/){.url}

#### <span class="titlemark">3.6.1 </span> [](){#x1-460003.6.1}Dealing with binary ﬁles {#dealing-with-binary-ﬁles .subsectionHead}

A binary ﬁle is computer-readable but not human-readable, that is, it
cannot be read by opening them in a text viewer. Examples of binary ﬁles
include compiled executables, zip ﬁles, images, word documents and
videos. In contrast, text ﬁles are stored in a form (usually ASCII) that
is human-readable by opening in a suitable text reader (e.g., geany,
gedit). Without some git extensions and conﬁgurations (coming up next),
binary ﬁles cannot be properly version-controlled because each version
of the entire ﬁle is saved as is in a hidden directory in the repository
(.git). ![PICT](SilBioComp101x.png) ![PICT](SilBioComp102x.png)

However, with some more eﬀort, git can be made to work for binary
formats like \*.docx or image formats such as \*.jpeg, but it is harder
to compare versions; have a look at
[https://git-\_scm.com/docs/gitattributes](https://git-scm.com/docs/gitattributes){.url}
and
[https://git-\_scm.com/book/en/v2/Customizing-\_Git-\_Git-\_Attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes){.url}<span
class="footnote-mark">[^1^](SilBioComp4.html#fn1x17)</span>[](){#x1-46001f1}

Also see:
[https://opensource.com/life/16/8/how-\_manage-\_binary-\_blobs-\_git-\_part-\_7](https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7){.url}

#### <span class="titlemark">3.6.2 </span> [](){#x1-470003.6.2}Dealing with large ﬁles {#dealing-with-large-ﬁles .subsectionHead}

As such, git was designed for version control of workﬂows and software
projects, not large ﬁles (say, &gt;100mb) (which may be plain-text or
binary). Binary ﬁles are particularly problematic because each version
of the ﬁle is saved as is in .git, when you have a large number of
versions it means that there are the same number of binary ﬁles in the
hidden directory (for example 100 $\times$ &gt;100mb ﬁles!).

In this course at least, you should not try to keep large ﬁles
(especially binary ﬁles under version control). You will run into this
problem in the GIS week (where you will have to handle and store large
raster image ﬁles) in particular <span
class="footnote-mark">[^2^](SilBioComp5.html#fn2x17)</span>[](){#x1-47001f2}
. We suggest that you include ﬁles larger than some size in your
.gitignore. For example, you can use the following bash command:

<div id="listing-47" class="lstlisting">

<span
class="label">[](){#x1-47002r1}</span>find . -size +100M | cat &gt;&gt; .gitignore

</div>

The 100M means 100 mb – you can reset it to whatever you want.

You may also explore alternatives such as git-annex (e.g., see
[https://git-\_annex.branchable.com/](https://git-annex.branchable.com/){.url}),
and git-lfs (e.g., see
[https://www.atlassian.com/git/tutorials/git-\_lfs](https://www.atlassian.com/git/tutorials/git-lfs){.url}).

### <span class="titlemark">3.7 </span> [](){#x1-480003.7}Removing ﬁles {#removing-ﬁles .sectionHead}

![PICT](SilBioComp103x.png) ![PICT](SilBioComp104x.png)

To remove a ﬁle (i.e. stop version controlling it) use git rm:

<div id="listing-48" class="lstlisting">

<span
class="label">[](){#x1-48001r1}</span>\$ echo \~Text in a file to remove\~ &gt; FileToRem.txt \
<span class="label">[](){#x1-48002r2}</span> \
<span class="label">[](){#x1-48003r3}</span>\$ git add FileToRem.txt \
<span class="label">[](){#x1-48004r4}</span> \
<span
class="label">[](){#x1-48005r5}</span>\$ git commit -am \~added a new file that we’ll remove later\~ \
<span
class="label">[](){#x1-48006r6}</span>master 5df9e96 added a new file that we’ll remove later \
<span
class="label">[](){#x1-48007r7}</span> 1 files changed, 1 insertions(+), 0 deletions(-) \
<span
class="label">[](){#x1-48008r8}</span> create mode 100644 FileToRem.txt \
<span class="label">[](){#x1-48009r9}</span> \
<span class="label">[](){#x1-48010r10}</span>\$ git rm FileToRem.txt \
<span class="label">[](){#x1-48011r11}</span>rm ’FileToRem.txt’ \
<span class="label">[](){#x1-48012r12}</span> \
<span
class="label">[](){#x1-48013r13}</span>\$ git commit -am \~removed the file\~ \
<span
class="label">[](){#x1-48014r14}</span>master b9f0b1a removed the file \
<span
class="label">[](){#x1-48015r15}</span> 1 files changed, 0 insertions(+), 1 deletions(-) \
<span
class="label">[](){#x1-48016r16}</span> delete mode 100644 FileToRem.txt

</div>

I typically just do all my stuﬀ and then just use git add -A

### <span class="titlemark">3.8 </span> [](){#x1-490003.8}Accessing history of the repository {#accessing-history-of-the-repository .sectionHead}

To see particular changes introduced, read the repo’s log :

<div id="listing-49" class="lstlisting">

<span class="label">[](){#x1-49001r1}</span>\$ git log \
<span
class="label">[](){#x1-49002r2}</span>commit 08b5c1c78c8181d4606d37594681fdcfca3149ec \
<span
class="label">[](){#x1-49003r3}</span>Author: Your Name &lt;your.login@imperial.ac.uk&gt; \
<span
class="label">[](){#x1-49004r4}</span>Date:   Wed Oct 8 16:41:51 2014 -0500 \
<span class="label">[](){#x1-49005r5}</span> \
<span class="label">[](){#x1-49006r6}</span>    removed the file \
<span class="label">[](){#x1-49007r7}</span> \
<span
class="label">[](){#x1-49008r8}</span>commit 13f701775bce71998abe4dd1c48a4df8ed76c08b \
<span
class="label">[](){#x1-49009r9}</span>Author: Your Name &lt;your.login@imperial.ac.uk&gt; \
<span
class="label">[](){#x1-49010r10}</span>Date:   Wed Oct 5 16:41:16 2015 -0500 \
<span class="label">[](){#x1-49011r11}</span> \
<span
class="label">[](){#x1-49012r12}</span>    added a new file that we’ll remove later \
<span class="label">[](){#x1-49013r13}</span> \
<span
class="label">[](){#x1-49014r14}</span>commit a228dd3d5b1921ef18c5efd926ef11ca47306ed5 \
<span
class="label">[](){#x1-49015r15}</span>Author: Your Name &lt;your.login@imperial.ac.uk&gt; \
<span
class="label">[](){#x1-49016r16}</span>Date:   Wed Oct 5 10:03:40 2015 -0500 \
<span class="label">[](){#x1-49017r17}</span> \
<span class="label">[](){#x1-49018r18}</span>    Added README file

</div>

For a more detailed version, add -p at the end.

### <span class="titlemark">3.9 </span> [](){#x1-500003.9}Reverting to a previous version {#reverting-to-a-previous-version .sectionHead}

If things go horribly wrong with new changes, you can revert to the
previous, “pristine” state:

<div id="listing-50" class="lstlisting">

<span class="label">[](){#x1-50001r1}</span>\$ git reset --hard \
<span
class="label">[](){#x1-50002r2}</span>\$ git commit -am \~returned to previous state\~ \#Note I used -am here

</div>

If instead you want to move back in time (temporarily), ﬁrst ﬁnd the
“hash” for the commit you want to revert to, and then check-out:

![PICT](SilBioComp105x.png) ![PICT](SilBioComp106x.png)

<div id="listing-51" class="lstlisting">

<span class="label">[](){#x1-50003r1}</span>\$ git status \
<span class="label">[](){#x1-50004r2}</span>\# On branch master \
<span
class="label">[](){#x1-50005r3}</span>nothing to commit (working directory clean) \
<span class="label">[](){#x1-50006r4}</span> \
<span class="label">[](){#x1-50007r5}</span>\$ git log \
<span
class="label">[](){#x1-50008r6}</span>commit c797824c9acbc59767a3931473aa3c53b6834aae \
<span
class="label">[](){#x1-50009r7}</span>Author: Your Name &lt;your.login@imperial.ac.uk&gt; \
<span
class="label">[](){#x1-50010r8}</span>Date:   Wed Aug 22 16:59:02 2014 -0500 \
<span class="label">[](){#x1-50011r9}</span>. \
<span class="label">[](){#x1-50012r10}</span>. \
<span class="label">[](){#x1-50013r11}</span>. \
<span class="label">[](){#x1-50014r12}</span> \
<span class="label">[](){#x1-50015r13}</span>\$ git checkout c79782

</div>

Now you can play around. However, if you commit changes, you create a
“branch” (git plays safe!). To go back to the future, type git checkout
master

### <span class="titlemark">3.10 </span> [](){#x1-510003.10}Branching {#branching .sectionHead}

Imagine you want to try something out, but you’re not sure it will work
well. For example, say you want to rewrite the Introduction of your
paper, using a diﬀerent angle, or you want to see whether switching to a
library for a piece of code improves speed. What you then need is
branching, which creates a project copy in which you can experiment:

<div id="listing-52" class="lstlisting">

<span class="label">[](){#x1-51001r1}</span>\$ git branch anexperiment \
<span class="label">[](){#x1-51002r2}</span> \
<span class="label">[](){#x1-51003r3}</span>\$ git branch \
<span class="label">[](){#x1-51004r4}</span>  anexperiment \
<span class="label">[](){#x1-51005r5}</span>\* master \
<span class="label">[](){#x1-51006r6}</span> \
<span
class="label">[](){#x1-51007r7}</span>\$ git checkout anexperiment \
<span
class="label">[](){#x1-51008r8}</span>Switched to branch ’anexperiment’ \
<span class="label">[](){#x1-51009r9}</span> \
<span class="label">[](){#x1-51010r10}</span>\$ git branch \
<span class="label">[](){#x1-51011r11}</span>\* anexperiment \
<span class="label">[](){#x1-51012r12}</span>  master \
<span class="label">[](){#x1-51013r13}</span> \
<span
class="label">[](){#x1-51014r14}</span>\$ echo \~Do I like this better?\~ &gt;&gt; README.txt \
<span class="label">[](){#x1-51015r15}</span> \
<span
class="label">[](){#x1-51016r16}</span>\$ git commit -am \~Testing experimental branch\~ \
<span
class="label">[](){#x1-51017r17}</span>\[anexperiment 9f17dc1\] Testing experimental branch \
<span
class="label">[](){#x1-51018r18}</span> 1 files changed, 2 insertions(+), 0 deletions(-)

</div>

If you decide to merge the new branch after modifying it:

<div id="listing-53" class="lstlisting">

<span class="label">[](){#x1-51019r1}</span>\$ git checkout master \
<span class="label">[](){#x1-51020r2}</span> \
<span class="label">[](){#x1-51021r3}</span>\$ git merge anexperiment \
<span class="label">[](){#x1-51022r4}</span>Updating 08b5c1c..9f17dc1 \
<span class="label">[](){#x1-51023r5}</span>Fast-forward \
<span class="label">[](){#x1-51024r6}</span> README.txt |    2 ++ \
<span
class="label">[](){#x1-51025r7}</span> 1 files changed, 2 insertions(+), 0 deletions(-) \
<span class="label">[](){#x1-51026r8}</span> \
<span class="label">[](){#x1-51027r9}</span>\$ cat README.txt \
<span
class="label">[](){#x1-51028r10}</span>My CMEE 2015-16 Coursework Repository \
<span class="label">[](){#x1-51029r11}</span>Do I like this better?

</div>

If there are no conﬂicts (i.e., some ﬁles that you changed also changed
in the master in the meantime), you are done, and you can delete the
branch:

<div id="listing-54" class="lstlisting">

<span
class="label">[](){#x1-51030r1}</span>\$ git branch -d anexperiment \
<span
class="label">[](){#x1-51031r2}</span>Deleted branch anexperiment (was 9f17dc1).

</div>

If instead you are not satisﬁed with the result, and you want to abandon
the branch:

<div id="listing-55" class="lstlisting">

<span
class="label">[](){#x1-51032r1}</span>\$ git branch -D anexperiment
![PICT](SilBioComp107x.png) ![PICT](SilBioComp108x.png)

</div>

When you want to test something out, always branch! Reverting changes,
especially in code, is typically painful. Merging can be tricky,
especially if multiple people have simultaneously worked on a particular
document. In the worst-case scenario, you may want to delete the local
copy and re-clone the remote repository.

<div class="center">

![PIC](Graphics/git_xkcd_1.png)

</div>

### <span class="titlemark">3.11 </span> [](){#x1-520003.11}Running git commands on a diﬀerent directory {#running-git-commands-on-a-diﬀerent-directory .sectionHead}

Since git version 1.8.5, you can run git directly on a diﬀerent
directory than the current one using absolute or relative paths. For
example, using a relative path, you can do:

<div id="listing-56" class="lstlisting">

<span class="label">[](){#x1-52001r1}</span>git -C ../SomeDir/ status

</div>

### <span class="titlemark">3.12 </span> [](){#x1-530003.12}Running git commands on multiple repositories at once {#running-git-commands-on-multiple-repositories-at-once .sectionHead}

For git pulling in multiple subdirectories (each a separate repository):

<div id="listing-57" class="lstlisting">

<span
class="label">[](){#x1-53001r1}</span>    \$ find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \\;

</div>

Breaking down these commands one by one,

find . searches the current directory\
-type d to ﬁnd directories, not ﬁles\
-mindepth 1 for setting min search depth to one sub-directory\
-maxdepth 1 for setting max search depth to one sub-directory\
-exec git -C {} pull $\smallsetminus$ runs a custom git command for
every git repo found\

#### <span class="titlemark">3.12.1 </span> [](){#x1-540003.12.1}Practicals {#practicals .subsectionHead}

 1. 

:   The only practical submission for git is the .gitgnore and overall
    git repository readme ﬁle — make sure these in your
    coursework repository.

    And of course, if you haven’t gotten git with bitbucket going, you
    won’t be able to submit any of your practicals anyway!

### <span class="titlemark">3.13 </span> [](){#x1-550003.13}Practical wrap-up {#practical-wrap-up .sectionHead}

-   Invite me (s.pawar@imperial.ac.uk) to your CMEECourseWork repository
-   The CMEEMasteRepo will contain data and code ﬁles for upcoming
    practicals
-   You will clone CMEEMasteRepo using git clone
    git@bitbucket.org:mhasoba/cmee2015masterepo.git
-   You will thereafter git pullCMEEMasteRepo
-   You will git pull inside CMEEMasteRepo thereafter (always use git
    status ﬁrst)
-   cp ﬁles from CMEEMasteRepo to your CMEECourseWork as and when needed
    — don’t work in the amster repo, as you will lose your work when I
    next update it!

![PICT](SilBioComp111x.png) ![PICT](SilBioComp112x.png)

### <span class="titlemark">3.14 </span> [](){#x1-560003.14}Readings & Resources {#readings-resources-2 .sectionHead}

There is a wealth of information on git out there - just google it!

-   Excellent book on Git:
    [http://git-\_scm.com/book](http://git-scm.com/book){.url}
-   Also, <https://www.atlassian.com/git/>
-   A git tutorial: <https://try.github.io>

![PICT](SilBioComp113x.png) ![PICT](SilBioComp114x.png)

<span class="titlemark">Chapter 4</span>\
[](){#x1-570004}Using <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> for scientiﬁc documents {#chapter4-using-latexfor-scientiﬁc-documents .chapterHead}
-----------------------------------------------------------------------------------------------------------------------------------------------------

### <span class="titlemark">4.1 </span> [](){#x1-580004.1}What’s <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span>? {#whats-latex .sectionHead}

In your research, you will produce papers, reports and – very
importantly – your thesis. These documents can be written using a
WYSIWYG (What You See Is What You Get) editor (e.g., Word). However, an
alternative especially suited for scientiﬁc publications is <span
class="LATEX">L<span class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>. In <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>, the document is simply a text ﬁle
(.tex). Text formatting is using markups (like HTML). The ﬁle is then
“compiled” (like source code of a programming language) into a ﬁle –
typically .pdf.

### <span class="titlemark">4.2 </span> [](){#x1-590004.2}Why <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span>? {#why-latex .sectionHead}

-   The input is a small, portable text ﬁle
-   <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> compilers are
    freely available for all OS’
-   Exactly the same result on any computer (not true for Word)
-   <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> produces
    beautiful, professional looking docs (e.g., like this one!)
-   Mathematical formulas (esp complex ones) are easy to write
-   <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> is very stable
    – current version basically same since 1994! (9 major versions of MS
    Word since 1994 – with compatibility issues)
-   <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> is free!
-   Many journals provide <span class="LATEX">L<span
    class="A">A</span><span class="TEX">T<span
    class="E">E</span>X</span></span> templates, making formatting
    quicker
-   Bibliographies are a breeze and work with Mendeley and Zotero
-   Plenty of online support available – your question has probably
    already been answered
-   You can integrate <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> into a workﬂow
    to auto-generate lengthy and complex documents (like your thesis).

<div class="center">

![PICT](SilBioComp115x.png) ![PICT](SilBioComp116x.png)

![PIC](Graphics/miktex.png)

</div>

#### <span class="titlemark">4.2.1 </span> [](){#x1-600004.2.1}Limitations of <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> {#limitations-of-latex .subsectionHead}

-   It has a steeper learning curve.
-   Can be diﬃcult to manage revisions with multiple authors –
    especially if they don’t use <span class="LATEX">L<span
    class="A">A</span><span class="TEX">T<span
    class="E">E</span>X</span></span>! (I have a dark secret)
-   Typesetting tables can be a bit complex.
-   Images and ﬂoats don’t jump like Word, but if you don’t use the
    right package, they can be diﬃcult to place where you want!

### <span class="titlemark">4.3 </span> [](){#x1-610004.3}Installing <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> {#installing-latex .sectionHead}

<div id="listing-58" class="lstlisting">

<span
class="label">[](){#x1-61001r1}</span>sudo apt-get install texlive-full texlive-fonts-recommended \
<span
class="label">[](){#x1-61002r2}</span>latex-beamer texlive-pictures texlive-latex-extra imagemagick

</div>

We will use a text editor in this lecture, but you can use one of a
number of WYSIWYG frontends (e.g., Lyx, TeXmacs), as well as GUI’s
(texmaker, Gummi, TeXShop, etc). Overleaf (<https://www.overleaf.com/>)
(now merged with Sharelatex) is also very good (and works with git),
especially for collaborating with non <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> -ers (your university may have a
blanket license for the pro version).

### <span class="titlemark">4.4 </span> [](){#x1-620004.4}A ﬁrst <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> example {#a-ﬁrst-latexexample .sectionHead}

![PICT](SilBioComp117x.png) ![PICT](SilBioComp119x.png)

-   Open geany and type the following in a ﬁle
    Week1/Code/FirstExample.tex:

<div class="lstinputlisting">

[](){#x1-62001}  \
<span
class="label">[](){#x1-62002r1}</span>\\documentclass\[12pt\]{article} \
<span class="label">[](){#x1-62003r2}</span>\\title{A Simple Document} \
<span class="label">[](){#x1-62004r3}</span>\\author{Your Name} \
<span class="label">[](){#x1-62005r4}</span>\\date{} \
<span class="label">[](){#x1-62006r5}</span>\\begin{document} \
<span class="label">[](){#x1-62007r6}</span>  \\maketitle \
<span class="label">[](){#x1-62008r7}</span> \
<span class="label">[](){#x1-62009r8}</span>  \\begin{abstract} \
<span
class="label">[](){#x1-62010r9}</span>    This paper must be cool! \
<span class="label">[](){#x1-62011r10}</span>  \\end{abstract} \
<span class="label">[](){#x1-62012r11}</span> \
<span class="label">[](){#x1-62013r12}</span>  \\section{Introduction} \
<span class="label">[](){#x1-62014r13}</span>    Blah Blah! \
<span class="label">[](){#x1-62015r14}</span> \
<span
class="label">[](){#x1-62016r15}</span>  \\section{Materials \\& Methods} \
<span
class="label">[](){#x1-62017r16}</span>  One of the most famous equations is: \
<span class="label">[](){#x1-62018r17}</span>  \\begin{equation} \
<span class="label">[](){#x1-62019r18}</span>    E = mc\^2 \
<span class="label">[](){#x1-62020r19}</span>  \\end{equation} \
<span
class="label">[](){#x1-62021r20}</span>  This equation was first proposed by Einstein in 1905 \
<span
class="label">[](){#x1-62022r21}</span>  \\cite{einstein1905does}. \
<span class="label">[](){#x1-62023r22}</span> \
<span
class="label">[](){#x1-62024r23}</span>  \\bibliographystyle{plain} \
<span
class="label">[](){#x1-62025r24}</span>  \\bibliography{FirstBiblio} \
<span class="label">[](){#x1-62026r25}</span>\\end{document}

</div>

Now, let’s get a citation for Einstein’s paper:

-   In Google Scholar, go to “settings” (upper right corner) and choose
    BibTeX as bibliography manager.
-   Now type “does the energy of a body einstein 1905”
-   The paper should be the one on the top.
-   Click “ Import into BibTeX” should show the following text, that you
    will save in the ﬁle FirstBiblio.bib (in the same directory
    as FirstExample.tex)
    <div class="lstinputlisting">

    [](){#x1-62027}  \
    <span
    class="label">[](){#x1-62028r1}</span>@article{einstein1905does, \
    <span
    class="label">[](){#x1-62029r2}</span>  title={Does the inertia of a body depend upon its energy-content?}, \
    <span
    class="label">[](){#x1-62030r3}</span>  author={Einstein, A.}, \
    <span
    class="label">[](){#x1-62031r4}</span>  journal={Annalen der Physik}, \
    <span class="label">[](){#x1-62032r5}</span>  volume={18}, \
    <span class="label">[](){#x1-62033r6}</span>  pages={639--641}, \
    <span class="label">[](){#x1-62034r7}</span>  year={1905} \
    <span class="label">[](){#x1-62035r8}</span>}

    </div>

Now we can create a .pdf of the article.

-   In the terminal type (are you the right directory?!):

<div id="listing-59" class="lstlisting">

<span
class="label">[](){#x1-62036r1}</span>\$ pdflatex FirstExample.tex \
<span
class="label">[](){#x1-62037r2}</span>\$ pdflatex FirstExample.tex \
<span class="label">[](){#x1-62038r3}</span>\$ bibtex FirstExample \
<span
class="label">[](){#x1-62039r4}</span>\$ pdflatex FirstExample.tex \
<span class="label">[](){#x1-62040r5}</span>\$ pdflatex FirstExample.tex

</div>

This should produce the ﬁle FirstExample.pdf:

<div class="center">

![PICT](SilBioComp120x.png) ![PICT](SilBioComp121x.png)

<span class="fbox">![PIC](SilBioComp118x.png){.graphics}</span>

</div>

#### <span class="titlemark">4.4.1 </span> [](){#x1-630004.4.1}A bash script to compile <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> {#a-bash-script-to-compile-latex .subsectionHead}

You can of course write a useful little bash script to compile latex
with bibtex!

Type the following script and call it CompileLaTeX.sh (you know where to
put it!):

<div class="lstinputlisting">

[](){#x1-63001}  \
<span class="label">[](){#x1-63002r1}</span>\#!/bin/bash \
<span class="label">[](){#x1-63003r2}</span>pdflatex \$1.tex \
<span class="label">[](){#x1-63004r3}</span>pdflatex \$1.tex \
<span class="label">[](){#x1-63005r4}</span>bibtex \$1 \
<span class="label">[](){#x1-63006r5}</span>pdflatex \$1.tex \
<span class="label">[](){#x1-63007r6}</span>pdflatex \$1.tex \
<span class="label">[](){#x1-63008r7}</span>evince \$1.pdf & \
<span class="label">[](){#x1-63009r8}</span> \
<span class="label">[](){#x1-63010r9}</span>\#\# Cleanup \
<span class="label">[](){#x1-63011r10}</span>rm \*∼ \
<span class="label">[](){#x1-63012r11}</span>rm \*.aux \
<span class="label">[](){#x1-63013r12}</span>rm \*.dvi \
<span class="label">[](){#x1-63014r13}</span>rm \*.log \
<span class="label">[](){#x1-63015r14}</span>rm \*.nav \
<span class="label">[](){#x1-63016r15}</span>rm \*.out \
<span class="label">[](){#x1-63017r16}</span>rm \*.snm \
<span class="label">[](){#x1-63018r17}</span>rm \*.toc

</div>

How do you run this script? The same as your previous bash scripts, so

<div id="listing-60" class="lstlisting">

<span
class="label">[](){#x1-63021r1}</span>\$ bash CompileLaTeX.sh FirstExample

</div>

Why have I not written the \*.tex extension of FirstExample in the
command above?

### <span class="titlemark">4.5 </span> [](){#x1-640004.5}A brief <span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> tour {#a-brief-latextour .sectionHead}

![PICT](SilBioComp122x.png) ![PICT](SilBioComp123x.png)

-   Spaces, new lines and special characters:

    -   Several spaces in your text editor are treated as one space in
        the typeset document
    -   Several empty lines are treated as one empty line
    -   One empty line deﬁnes a new paragraph
    -   Some characters are “special”:\# \$ % \^ & \_ { } ˜ \\.
    -   To type these special characters, you have to add a “backslash”
        in front, e.g., \\\$ produces \$.
-   Document structure:

    -   Each <span class="LATEX">L<span class="A">A</span><span
        class="TEX">T<span class="E">E</span>X</span></span> command
        starts with \\(e.g., to get <span class="LATEX">L<span
        class="A">A</span><span class="TEX">T<span
        class="E">E</span>X</span></span>, you need \\LaTeX
    -   The ﬁrst command is always \\documentclass deﬁning the type of
        document (e.g., article, book, report, letter).
    -   You can set several options. For example, to set size of text to
        10 points and the letter paper
        size: \\documentclass\[10pt,letterpaper\]{article}.
-   After having declared the type of document, you can specify packages
    you want to use. The most useful are:

    -   \\usepackage{color}: use colors for text in your document.
    -   \\usepackage{amsmath,amssymb}: American Mathematical Society
        formats and commands for typesetting mathematics.
    -   \\usepackage{fancyhdr}: fancy headers and footers.
    -   \\usepackage{graphicx}: include ﬁgures in pdf, ps, eps, gif
        and jpeg.
    -   \\usepackage{listings}: typeset source code for various
        programming languages.
    -   \\usepackage{rotating}: rotate tables and ﬁgures.
    -   \\usepackage{lineno}: line numbers.
-   Once you select the packages, you can start your document with
    \\begin{document}, and end it with \\end{document}.

### <span class="titlemark">4.6 </span> [](){#x1-650004.6}<span class="LATEX">L<span class="A">A</span><span class="TEX">T<span class="E">E</span>X</span></span> templates {#latextemplates .sectionHead}

There a lots of useful <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>templates out there. As an example of
structure of a document, take the article template provided by the
journal PNAS:

<div class="lstinputlisting">

[](){#x1-65001}  \
<span class="label">[](){#x1-65002r1}</span>\\documentclass{pnastwo} \
<span
class="label">[](){#x1-65003r2}</span>\\usepackage{amssymb,amsfonts,amsmath} \
<span class="label">[](){#x1-65004r3}</span>%% For PNAS Only: \
<span
class="label">[](){#x1-65005r4}</span>\\contributor{Submitted to Proceedings \
<span
class="label">[](){#x1-65006r5}</span>of the National Academy of Sciences of the United States of America} \
<span
class="label">[](){#x1-65007r6}</span>\\url{www.pnas.org/cgi/doi/10.1073/pnas.0709640104} \
<span class="label">[](){#x1-65008r7}</span>\\copyrightyear{2014} \
<span class="label">[](){#x1-65009r8}</span>\\issuedate{Issue Date} \
<span class="label">[](){#x1-65010r9}</span>\\volume{Volume} \
<span
class="label">[](){#x1-65011r10}</span>\\issuenumber{Issue Number} \
<span class="label">[](){#x1-65012r11}</span> \
<span class="label">[](){#x1-65013r12}</span>\\begin{document} \
<span class="label">[](){#x1-65014r13}</span>\\title{My Title} \
<span
class="label">[](){#x1-65015r14}</span>\\author{Some Name \\affil{1}{Imperial College London, UK} \\and \
<span
class="label">[](){#x1-65016r15}</span>Some O. Name\\affil{2}{University of Exeter, Penryn, Corwall, UK}} \
<span class="label">[](){#x1-65017r16}</span>\\maketitle \
<span class="label">[](){#x1-65018r17}</span>\\begin{article} \
<span class="label">[](){#x1-65019r18}</span>\\begin{abstract} \
<span class="label">[](){#x1-65020r19}</span>Mind blowing abstract. \
<span class="label">[](){#x1-65021r20}</span>\\end{abstract} \
<span
class="label">[](){#x1-65022r21}</span>\\keywords{term1 | term2 | term3} \
<span class="label">[](){#x1-65023r22}</span> \
<span class="label">[](){#x1-65024r23}</span>%% Main text of the paper \
<span
class="label">[](){#x1-65025r24}</span>\\dropcap{I}n this work, we show how \\LaTeX can be used to typeset a PNAS paper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sodales consectetur lobortis. Proin tincidunt eros dapibus ipsum faucibus sed rhoncus augue mollis. In lectus velit, interdum at adipiscing quis, imperdiet sed justo. Praesent commodo, mi iaculis tincidunt mollis, sapien lectus aliquam neque, ac faucibus arcu est eu sem. Ut non lacus lacus, eu suscipit odio. Aliquam erat volutpat. Vivamus dapibus pretium nunc, et placerat turpis bibendum mollis. Fusce eu mi ut nulla accumsan viverra. In nulla tellus, ultrices ut venenatis nec, laoreet eget diam. Pellentesque aliquam facilisis ultricies. Vestibulum sollicitudin leo non neque vehicula a volutpat eros faucibus. Vestibulum nec lorem dui. \
<span class="label">[](){#x1-65026r25}</span> \
<span class="label">[](){#x1-65027r26}</span>\\begin{materials} \
<span
class="label">[](){#x1-65028r27}</span>These are the materials and methods. \
<span class="label">[](){#x1-65029r28}</span>\\end{materials} \
<span class="label">[](){#x1-65030r29}</span> \
<span class="label">[](){#x1-65031r30}</span>\\begin{acknowledgments} \
<span
class="label">[](){#x1-65032r31}</span>-- text of acknowledgments here, including grant info -- \
<span class="label">[](){#x1-65033r32}</span>\\end{acknowledgments} \
<span class="label">[](){#x1-65034r33}</span> \
<span class="label">[](){#x1-65035r34}</span>\\end{article} \
<span class="label">[](){#x1-65036r35}</span>\\end{document}

</div>

I have added some templates in the CMEEMasteRepo that you should have a
look and play around with

### <span class="titlemark">4.7 </span> [](){#x1-660004.7}Typesetting math {#typesetting-math .sectionHead}

There are two ways to display math

 1. 
:   First, one can produce inline mathematics (i.e., within the text).

 2. 
:   Second, one can produce stand-alone, numbered equations
    and formulae.

For inline math, the “dollar” sign ﬂanks the math to be typeset. For
example, the code:

<div id="listing-61" class="lstlisting">

<span
class="label">[](){#x1-66003r1}</span>\$\\int\_0\^1 p\^x (1-p)\^y dp\$

</div>

Becomes $\int_{0}^{1}p^{x}\left( {1 - p} \right)^{y}dp$
![PICT](SilBioComp126x.png) ![PICT](SilBioComp127x.png)

For numbered equations (almost always a great idea), <span
class="LATEX">L<span class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span> provides the equation environment:

<div id="listing-62" class="lstlisting">

<span class="label">[](){#x1-66004r1}</span> \
<span class="label">[](){#x1-66005r2}</span>\\begin{equation} \
<span
class="label">[](){#x1-66006r3}</span>\\int\_0\^1 \\left(\\ln \\left( \\frac{1}{x} \\right) \
<span class="label">[](){#x1-66007r4}</span>\\right)\^y dx = y! \
<span class="label">[](){#x1-66008r5}</span>\\end{equation}

</div>

Becomes:

  --------------------------------------------------------------------------------------------- -------
  [](){#x1-66011r1} $$\int_{0}^{1}\left( {\ln\left( \frac{1}{x} \right)} \right)^{y}dx = y!$$   (4.1)
  --------------------------------------------------------------------------------------------- -------

### <span class="titlemark">4.8 </span> [](){#x1-670004.8}A few more tips {#a-few-more-tips .sectionHead}

The following tips might prove handy:

-   <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span> has a full set
    of symbols and operators (plenty of lists online)
-   Long documents can be split into separate .tex documents and
    combined using input
-   Long documents can be split into separate .tex documents and
-   Figures can be included using the graphicx package
-   You can use Mendeley to export and maintain .bib ﬁles
-   You can redeﬁne environments and commands in the preamble

![PICT](SilBioComp128x.png) ![PICT](SilBioComp129x.png)

#### <span class="titlemark">4.8.1 </span> [](){#x1-680004.8.1}Practicals {#practicals-1 .subsectionHead}

Test CompileLaTeX.sh with FirstExample.tex and bring it under verson
control underCMEECourseWork/Week1 in your repository. Make sure that
CompileLaTeX.sh will work if I ran it from my computer using
FirstExample.tex as an input.

### <span class="titlemark">4.9 </span> [](){#x1-690004.9}Practicals wrap-up {#practicals-wrap-up .sectionHead}

Make sure you have your Week 1 directory organized with Data, Sandbox
and Code with the necessary ﬁles and this week’s (functional!) scripts
in there. Every script should run without errors on my computer. This
includes the ﬁve solutions (single-line commands you came up with) in
UnixPrac1.txt.

<div class="center">

Commit and push everything by next Wednesday 5 PM.

</div>

### <span class="titlemark">4.10 </span> [](){#x1-700004.10}Readings & Resources {#readings-resources-3 .sectionHead}

-   The Visual <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span>  FAQ: sometimes
    it is diﬃcult to describe what you want to do!\
    [http://get-\_software.net/info/visualFAQ/visualFAQ.pdf](http://get-software.net/info/visualFAQ/visualFAQ.pdf){.url}
-   Myriad online resources for <span class="LATEX">L<span
    class="A">A</span><span class="TEX">T<span
    class="E">E</span>X</span></span>, including:\
    <www.http://en.wikibooks.org/wiki/LaTeX/Introduction>,\
    [www.ctan.org/tex-\_archive/info/lshort/english/](www.ctan.org/tex-archive/info/lshort/english/){.url}\
    [http://ftp.uni-\_erlangen.de/mirrors/CTAN/info/lshort/english/lshort.pdf](http://ftp.uni-erlangen.de/mirrors/CTAN/info/lshort/english/lshort.pdf){.url}
-   Beautiful presentations in <span class="LATEX">L<span
    class="A">A</span><span class="TEX">T<span
    class="E">E</span>X</span></span>:
    [http://tug.org/pracjourn/2005-\_2/miller/miller.pdf](http://tug.org/pracjourn/2005-2/miller/miller.pdf){.url}
    ![PICT](SilBioComp130x.png) ![PICT](SilBioComp131x.png)
-   Bibliographies in <span class="LATEX">L<span class="A">A</span><span
    class="TEX">T<span class="E">E</span>X</span></span>:
    <http://schneider.ncifcrf.gov/latex.html>

![PICT](SilBioComp132x.png) ![PICT](SilBioComp133x.png)

![PICT](SilBioComp134x.png) ![PICT](SilBioComp135x.png)

<span class="titlemark">Chapter 5</span>\
[](){#x1-710005}Basic Biological Computing in Python {#chapter5-basic-biological-computing-in-python .chapterHead}
----------------------------------------------------

<div class="epigraph">

Science is what we understand well enough to explain to a computer. Art
is everything else we do

------------------------------------------------------------------------

<div class="episource">

—Donald Knuth

</div>

</div>

Firstly, chapter [1](#x1-140001)’s UNIX question?

<div id="listing-63" class="lstlisting">

<span
class="label">[](){#x1-71001r1}</span>find . -type f -exec ls -s {} \\; | sort -n | head -10

</div>

What is the command doing? How has it been built (explain the
components)?

### <span class="titlemark">5.1 </span> [](){#x1-720005.1}Outline of the python module {#outline-of-the-python-module .sectionHead}

The python module is geared towards teaching you scientiﬁc programming
in biology using this modern, and for good reason, immensely popular
language. The components of this module across all the chapters (Basic,
Advanced, Additional topics) are:

-   Basics of python
-   How to write and run python code
-   Understand and implement “control ﬂows”
-   Learning to use the ipython environment
-   Writing, debugging, using, and testing python functions
-   Learning eﬃcient numerical programming in python
-   Using regular expressions in python
-   Introduction to certain particularly useful python packages
-   Using python for building and modifying databases
-   Using python to run other “stuﬀ” and to patch together data analysis
    and/or numerical simulation work ﬂows

------------------------------------------------------------------------

<div class="figure">

![PICT](SilBioComp136x.png) ![PICT](SilBioComp137x.png)
[](){#x1-72001r1} ![PICT](SilBioComp138x.png)
![PICT](SilBioComp139x.png)
![PIC](Graphics/python.png)\
[www.xkcd.com](www.xkcd.com){.url}\

<div class="caption">

<span class="id">Figure 5.1: </span><span class="content">Is python the
most common answer to your daily programming needs? Possibly!</span>

</div>

![PICT](SilBioComp140x.png) ![PICT](SilBioComp141x.png)

</div>

------------------------------------------------------------------------

### <span class="titlemark">5.2 </span> [](){#x1-730005.2}Why python? {#why-python .sectionHead}

python was designed with readability and re-usability in mind. Time
taken by programming + debugging + running is likely to be relatively
lower in python than less intuitive or cluttered languages (e.g.,
FORTRAN, perl). It is a pretty good solution if you want to easily write
readable code that is also reasonably eﬃcient (computationally
speaking).

------------------------------------------------------------------------

<div class="figure">

![PICT](SilBioComp142x.png) ![PICT](SilBioComp143x.png)
[](){#x1-73001r2} ![PICT](SilBioComp144x.png)
![PICT](SilBioComp145x.png)
<div class="center">

![PIC](Graphics/benchmark.png)\
<http://julialang.org/>

</div>

\
<div class="caption">

<span class="id">Figure 5.2: </span><span class="content">python is
pretty fast!</span>

</div>

![PICT](SilBioComp146x.png) ![PICT](SilBioComp147x.png)

</div>

------------------------------------------------------------------------

#### <span class="titlemark">5.2.1 </span> [](){#x1-740005.2.1}The Zen of python {#the-zen-of-python .subsectionHead}

Open a terminal and type

<div id="listing-64" class="lstlisting">

<span class="label">[](){#x1-74001r1}</span>\$ python -c \~import this\~

</div>

### <span class="titlemark">5.3 </span> [](){#x1-750005.3}Installing python {#installing-python .sectionHead}

We will use 2.7.x, not 3.x (you can use 3.x later, if you want)

Your Ubuntu distribution needs python, so it will already be installed.
However, let’s install the interactive python shell ipython which we
will soon use.

-   On Ubuntu/Linux, open a terminal (ctrl+alt+t) and type:
    <div id="listing-65" class="lstlisting">

    <span
    class="label">[](){#x1-75001r1}</span>\$ sudo apt-get install ipython python-scipy python-matplotlib

    </div>

SVG-Viewer needed.

### <span class="titlemark">5.4 </span> [](){#x1-760005.4}Getting started with python {#getting-started-with-python .sectionHead}

Open a terminal (ctrl+alt+t) and type python (or use the terminal that
you just used to install ipython). Then, try the following:

![PICT](SilBioComp148x.png) ![PICT](SilBioComp149x.png)

<div id="listing-66" class="lstlisting">

<span
class="label">[](){#x1-76001r1}</span>&gt;&gt;&gt; 2 + 2 \# Summation; note that comments start with \# \
<span class="label">[](){#x1-76002r2}</span>4 \
<span class="label">[](){#x1-76003r3}</span> \
<span
class="label">[](){#x1-76004r4}</span>&gt;&gt;&gt; 2 \* 2 \# Multiplication \
<span class="label">[](){#x1-76005r5}</span>4 \
<span class="label">[](){#x1-76006r6}</span> \
<span
class="label">[](){#x1-76007r7}</span>&gt;&gt;&gt; 2 / 2 \# Integer division \
<span class="label">[](){#x1-76008r8}</span>1 \
<span class="label">[](){#x1-76009r9}</span> \
<span
class="label">[](){#x1-76010r10}</span>&gt;&gt;&gt; 2 / 2.0 \# \~Float\~ division, note the output is float \
<span class="label">[](){#x1-76011r11}</span>1.0 \
<span class="label">[](){#x1-76012r12}</span> \
<span class="label">[](){#x1-76013r13}</span>&gt;&gt;&gt; 2 / 2. \
<span class="label">[](){#x1-76014r14}</span>1.0 \
<span class="label">[](){#x1-76015r15}</span> \
<span class="label">[](){#x1-76016r16}</span>&gt;&gt;&gt; 2 &gt; 3 \
<span class="label">[](){#x1-76017r17}</span>False \
<span class="label">[](){#x1-76018r18}</span> \
<span class="label">[](){#x1-76019r19}</span>&gt;&gt;&gt; 2 &gt;= 2 \
<span class="label">[](){#x1-76020r20}</span>True

</div>

What does “ﬂoat” mean in the above comment? Why is it necessary to
specify this in Python (not necessary in Python 3.x)? You will
inevitably run into some such jargon in this chapter. The main ones you
need to know are (you will learn more about these along the way):

<div class="tabular">

Workspace

The state of the “environment” of your current python session, including
all variables, functions, objects, etc.

Variable

A named number, text string, boolean (True or False), or data structure
that can change (more on variable and data types later)

Function

A computer procedure or routine that returns some value(s), and which
can be used again and again

Module

Variables and functions packaged into a single set of programs that can
be invoked as a command (potentially with sub-commands)

Class

Also, variables and functions packaged into a single set of programs
that that can be invoked as a command (potentially with sub-commands),
but unlike modules, you can spawn many copies of a class within a python
session or program

Object

A particular instance of a class (every object belongs to a class) that
is created in a session and eventually destroyed; pretty much everything
in your workspace is an object in python!

</div>

This Module vs. Class vs. Object business is confusing. These constructs
are created to make an (object-oriented) programming language like
python more ﬂexible and user friendly (though it might not seem so to
you currently!). In practice, at least for your current purposes, you
will not build python classes yourself much, typically working with
modules. More on all this later. Also, have a look at
<https://learnpythonthehardway.org/book/ex40.html>

#### <span class="titlemark">5.4.1 </span> [](){#x1-770005.4.1}ipython {#ipython .subsectionHead}

We will now immediately switch to the interactive python shell, ipython
that you installed above.

OK, now let’s continue learning python using ipython.

-   Type ctrl+D in the terminal at the python prompt: this will exit you
    from the python shell and you will see the bash prompt again.
-   Now type ipython

You should now see (after some text):

![PICT](SilBioComp150x.png) ![PICT](SilBioComp151x.png)

<div id="listing-67" class="lstlisting">

<span class="label">[](){#x1-77001r1}</span>In \[ \]:

</div>

(I have deleted the prompt numbering \[1\], \[2\], etc to avoid
confusion). This is the interactive python shell (or, “ipython”). This
shell has many advantages over the bare-bones, non-interactive python
shell with the $> > >$ prompt. For example, as in the bash shell, TAB
leads to auto-completion of a command or ﬁle name (try it).

#### <span class="titlemark">5.4.2 </span> [](){#x1-780005.4.2}Magic commands {#magic-commands .subsectionHead}

IPython also has “magic commands” (start with %; e.g., %run). Some
useful magic commands:

<div class="tabular">

%who

Shows current namespace (all variables, modules and functions)

%whos

Also display the type of each variable; typing %whos function only
displays functions etc.

%pwd

Print working directory

%history

Print recent commands

</div>

Try any of these now!

#### <span class="titlemark">5.4.3 </span> [](){#x1-790005.4.3}Determining an object’s type {#determining-an-objects-type .subsectionHead}

Another useful IPython feature is the question mark, which can be used
to ﬁnd what a particular Python object is, including variables you
created. For example, try:

<div id="listing-68" class="lstlisting">

<span class="label">[](){#x1-79001r1}</span>In \[1\]: a = 1 \
<span class="label">[](){#x1-79002r2}</span> \
<span class="label">[](){#x1-79003r3}</span>In \[2\]: ?a \
<span class="label">[](){#x1-79004r4}</span>Type:        int \
<span class="label">[](){#x1-79005r5}</span>String form: 1 \
<span class="label">[](){#x1-79006r6}</span>Docstring: \
<span class="label">[](){#x1-79007r7}</span>int(x=0) -&gt; int or long \
<span
class="label">[](){#x1-79008r8}</span>int(x, base=10) -&gt; int or long \
<span class="label">[](){#x1-79009r9}</span> \
<span
class="label">[](){#x1-79010r10}</span>Convert a number or string to an integer, or return 0 if no arguments \
<span
class="label">[](){#x1-79011r11}</span>are given.  If x is floating point, the conversion truncates towards zero. \
<span
class="label">[](){#x1-79012r12}</span>If x is outside the integer range, the function returns a long instead. \
<span class="label">[](){#x1-79013r13}</span> \
<span
class="label">[](){#x1-79014r14}</span>If x is not a number or if base is given, then x must be a string or \
<span
class="label">[](){#x1-79015r15}</span>Unicode object representing an integer literal in the given base.  The \
<span
class="label">[](){#x1-79016r16}</span>literal can be preceded by ’+’ or ’-’ and be surrounded by whitespace. \
<span
class="label">[](){#x1-79017r17}</span>The base defaults to 10.  Valid bases are 0 and 2-36.  Base 0 means to \
<span
class="label">[](){#x1-79018r18}</span>interpret the base from the string as an integer literal. \
<span
class="label">[](){#x1-79019r19}</span>&gt;&gt;&gt; int(’0b100’, base=0) \
<span class="label">[](){#x1-79020r20}</span>4

</div>

SVG-Viewer needed.

![PICT](SilBioComp152x.png) ![PICT](SilBioComp153x.png)
![PICT](SilBioComp154x.png) ![PICT](SilBioComp155x.png)

SVG-Viewer needed.

### <span class="titlemark">5.5 </span> [](){#x1-800005.5}Python variables {#python-variables .sectionHead}

Now, let’s continue our python intro. We will ﬁrst learn about the
python variable types that were mentioned above. The types are:

<div id="listing-70" class="lstlisting">

<span class="label">[](){#x1-80001r1}</span>In \[ \]: a = 2 \#integer \
<span class="label">[](){#x1-80002r2}</span> \
<span class="label">[](){#x1-80003r3}</span>In \[ \]: ?a \
<span class="label">[](){#x1-80004r4}</span>Type:        int \
<span class="label">[](){#x1-80005r5}</span>String form: 2 \
<span class="label">[](){#x1-80006r6}</span>Docstring: \
<span class="label">[](){#x1-80007r7}</span>int(x=0) -&gt; int or long \
<span
class="label">[](){#x1-80008r8}</span>int(x, base=10) -&gt; int or long \
<span class="label">[](){#x1-80009r9}</span> \
<span
class="label">[](){#x1-80010r10}</span>Convert a number or string to an integer, or return 0 if no arguments \
<span
class="label">[](){#x1-80011r11}</span>are given.  If x is floating point, the conversion truncates towards zero. \
<span
class="label">[](){#x1-80012r12}</span>If x is outside the integer range, the function returns a long instead. \
<span class="label">[](){#x1-80013r13}</span> \
<span
class="label">[](){#x1-80014r14}</span>If x is not a number or if base is given, then x must be a string or \
<span
class="label">[](){#x1-80015r15}</span>Unicode object representing an integer literal in the given base.  The \
<span
class="label">[](){#x1-80016r16}</span>literal can be preceded by ’+’ or ’-’ and be surrounded by whitespace. \
<span
class="label">[](){#x1-80017r17}</span>The base defaults to 10.  Valid bases are 0 and 2-36.  Base 0 means to \
<span
class="label">[](){#x1-80018r18}</span>interpret the base from the string as an integer literal. \
<span
class="label">[](){#x1-80019r19}</span>&gt;&gt;&gt; int(’0b100’, base=0) \
<span class="label">[](){#x1-80020r20}</span>4 \
<span class="label">[](){#x1-80021r21}</span> \
<span class="label">[](){#x1-80022r22}</span>In \[ \]: a = 2. \#Float \
<span class="label">[](){#x1-80023r23}</span> \
<span class="label">[](){#x1-80024r24}</span>In \[ \]: ?a \
<span class="label">[](){#x1-80025r25}</span>Type:        float \
<span class="label">[](){#x1-80026r26}</span>String form: 2.0 \
<span class="label">[](){#x1-80027r27}</span>Docstring: \
<span
class="label">[](){#x1-80028r28}</span>float(x) -&gt; floating point number \
<span class="label">[](){#x1-80029r29}</span> \
<span
class="label">[](){#x1-80030r30}</span>Convert a string or number to a floating point number, if possible. \
<span class="label">[](){#x1-80031r31}</span> \
<span
class="label">[](){#x1-80032r32}</span>In \[ \]: a = \~Two\~ \#String \
<span class="label">[](){#x1-80033r33}</span> \
<span class="label">[](){#x1-80034r34}</span>In \[ \]: ?a \
<span class="label">[](){#x1-80035r35}</span>Type:        str \
<span class="label">[](){#x1-80036r36}</span>String form: Two \
<span class="label">[](){#x1-80037r37}</span>Length:      3 \
<span class="label">[](){#x1-80038r38}</span>Docstring: \
<span
class="label">[](){#x1-80039r39}</span>str(object=’’) -&gt; string \
<span class="label">[](){#x1-80040r40}</span> \
<span
class="label">[](){#x1-80041r41}</span>Return a nice string representation of the object. \
<span
class="label">[](){#x1-80042r42}</span>If the argument is a string, the return value is the same object. \
<span class="label">[](){#x1-80043r43}</span> \
<span
class="label">[](){#x1-80044r44}</span>In \[10\]: a = True \#Boolean \
<span class="label">[](){#x1-80045r45}</span> \
<span class="label">[](){#x1-80046r46}</span>In \[11\]: ?a \
<span class="label">[](){#x1-80047r47}</span>Type:        bool \
<span class="label">[](){#x1-80048r48}</span>String form: True \
<span class="label">[](){#x1-80049r49}</span>Docstring: \
<span class="label">[](){#x1-80050r50}</span>bool(x) -&gt; bool \
<span class="label">[](){#x1-80051r51}</span> \
<span
class="label">[](){#x1-80052r52}</span>Returns True when the argument x is true, False otherwise. \
<span
class="label">[](){#x1-80053r53}</span>The builtins True and False are the only two instances of the class bool. \
<span
class="label">[](){#x1-80054r54}</span>The class bool is a subclass of the class int, and cannot be subclassed.

</div>

Thus, python has integer, ﬂoat (real numbers, with diﬀerent precision
levels) and string variables.

#### <span class="titlemark">5.5.1 </span> [](){#x1-810005.5.1}python operators {#python-operators .subsectionHead}

Here are are the operators in python that you can use on variables:

![PICT](SilBioComp156x.png) ![PICT](SilBioComp157x.png)

<div class="tabular">

+

Addition

-

Subtraction

\*

Multiplication

/

Division

\*\*

Power

%

Modulo

//

Integer division

==

Equals

!=

Diﬀers

$>$

Greater

$>$=

Greater or equal

&, and

Logical and

$|$, or

Logical or

!, not

Logical not

</div>

#### <span class="titlemark">5.5.2 </span> [](){#x1-820005.5.2}Assigning and manipulating variables {#assigning-and-manipulating-variables .subsectionHead}

<div id="listing-71" class="lstlisting">

<span class="label">[](){#x1-82001r1}</span> In \[\]: 2 == 2 \
<span class="label">[](){#x1-82002r2}</span>Out \[\]: True \
<span class="label">[](){#x1-82003r3}</span> \
<span class="label">[](){#x1-82004r4}</span> In \[\]: 2 != 2 \
<span class="label">[](){#x1-82005r5}</span>Out \[\]: False \
<span class="label">[](){#x1-82006r6}</span> \
<span class="label">[](){#x1-82007r7}</span> In \[\]: 3 / 2 \
<span class="label">[](){#x1-82008r8}</span>Out \[\]: 1 \
<span class="label">[](){#x1-82009r9}</span> \
<span class="label">[](){#x1-82010r10}</span> In \[\]: 3 / 2. \
<span class="label">[](){#x1-82011r11}</span>Out \[\]: 1.5 \
<span class="label">[](){#x1-82012r12}</span> \
<span
class="label">[](){#x1-82013r13}</span> In \[\]: ’hola, ’ + ’mi llamo Samraat’ \#why not two languages at the same \
<span class="label">[](){#x1-82014r14}</span>time?! \
<span
class="label">[](){#x1-82015r15}</span>Out \[\]: ’hola, mi llamo Samraat’ \
<span class="label">[](){#x1-82016r16}</span> \
<span class="label">[](){#x1-82017r17}</span>In \[\]: x = 5 \
<span class="label">[](){#x1-82018r18}</span> \
<span class="label">[](){#x1-82019r19}</span> In \[\]: x + 3 \
<span class="label">[](){#x1-82020r20}</span>Out \[\]: 8 \
<span class="label">[](){#x1-82021r21}</span> \
<span class="label">[](){#x1-82022r22}</span> In \[\]: y = 8 \
<span class="label">[](){#x1-82023r23}</span> \
<span class="label">[](){#x1-82024r24}</span> In \[\]: x + y \
<span class="label">[](){#x1-82025r25}</span>Out \[\]: 13 \
<span class="label">[](){#x1-82026r26}</span> \
<span class="label">[](){#x1-82027r27}</span> In \[\]: x = ’My string’ \
<span class="label">[](){#x1-82028r28}</span> \
<span
class="label">[](){#x1-82029r29}</span> In \[\]: x + ’ now has more stuff’ \
<span
class="label">[](){#x1-82030r30}</span>Out \[\]: ’My string now has more stuff’ \
<span class="label">[](){#x1-82031r31}</span> \
<span class="label">[](){#x1-82032r32}</span> In \[\]: x + y \
<span
class="label">[](){#x1-82033r33}</span>Out \[\]: TypeError: cannot concatenate ’str’ and ’int’ objects

</div>

OK, so concatenating string and numeric (integer in this case) variables
doesn’t work. No problem, we can convert from one type to another:

<div id="listing-72" class="lstlisting">

<span class="label">[](){#x1-82034r1}</span> In \[\]: x + str(y) \
<span class="label">[](){#x1-82035r2}</span>Out \[\]: ’My string8’ \
<span class="label">[](){#x1-82036r3}</span> \
<span class="label">[](){#x1-82037r4}</span> In \[\]: z = ’88’ \
<span class="label">[](){#x1-82038r5}</span> \
<span class="label">[](){#x1-82039r6}</span> In \[\]: x + z \
<span class="label">[](){#x1-82040r7}</span>Out \[\]: ’My string88’ \
<span class="label">[](){#x1-82041r8}</span> \
<span class="label">[](){#x1-82042r9}</span> In \[\]: y + int(z) \
<span class="label">[](){#x1-82043r10}</span>Out \[\]: 96

</div>

SVG-Viewer needed.

![PICT](SilBioComp158x.png) ![PICT](SilBioComp159x.png)

### <span class="titlemark">5.6 </span> [](){#x1-830005.6}python data types and data structures {#python-data-types-and-data-structures .sectionHead}

python number or string variables (or both) can be stored and
manipulated in:

-   List: most versatile, can contain compound data, “mutable”, enclosed
    in brackets, \[ \]
-   Tuple: like a list, but “immutable” — like a read only list,
    enclosed in parentheses, ( )
-   Dictionary: a kind of “hash table” of key-value pairs enclosed by
    curly braces, { } — key can be number or string, values can be any
    object! (well OK, a python object)
-   numpy arrays: Fast, compact, convenient for numerical computing —
    more on this later!

#### <span class="titlemark">5.6.1 </span> [](){#x1-840005.6.1}Lists {#lists .subsectionHead}

<div id="listing-73" class="lstlisting">

<span
class="label">[](){#x1-84001r1}</span> In \[\]: MyList = \[3,2.44,’green’,True\] \
<span class="label">[](){#x1-84002r2}</span> \
<span class="label">[](){#x1-84003r3}</span> In \[\]: MyList\[1\] \
<span class="label">[](){#x1-84004r4}</span>Out \[\]: 2.44 \
<span class="label">[](){#x1-84005r5}</span> \
<span
class="label">[](){#x1-84006r6}</span> In \[\]: MyList\[0\] \# NOTE: FIRST ELEMENT -&gt; 0 \
<span class="label">[](){#x1-84007r7}</span>Out \[\]: 3 \
<span class="label">[](){#x1-84008r8}</span> \
<span class="label">[](){#x1-84009r9}</span> In \[\]: MyList\[4\] \
<span
class="label">[](){#x1-84010r10}</span>Out \[\]: IndexError: list index out of range \
<span class="label">[](){#x1-84011r11}</span> \
<span
class="label">[](){#x1-84012r12}</span> In \[\]: MyList\[2\] = ’blue’ \
<span class="label">[](){#x1-84013r13}</span> \
<span class="label">[](){#x1-84014r14}</span> In \[\]: MyList \
<span
class="label">[](){#x1-84015r15}</span>Out \[\]: \[3, 2.44, ’blue’, True\] \
<span class="label">[](){#x1-84016r16}</span> \
<span
class="label">[](){#x1-84017r17}</span> In \[\]: MyList\[0\] = ’blue’ \
<span class="label">[](){#x1-84018r18}</span> \
<span class="label">[](){#x1-84019r19}</span> In \[\]: MyList \
<span
class="label">[](){#x1-84020r20}</span>Out \[\]: \[’blue’, 2.44, ’blue’, True\] \
<span class="label">[](){#x1-84021r21}</span> \
<span
class="label">[](){#x1-84022r22}</span> In \[\]: MyList.append(’a new item’) \# NOTE: \~.append\~! \
<span class="label">[](){#x1-84023r23}</span> \
<span class="label">[](){#x1-84024r24}</span> In \[\]: MyList \
<span
class="label">[](){#x1-84025r25}</span>Out \[\]: \[’blue’, 2.44, ’blue’, True, ’a new item’\] \
<span class="label">[](){#x1-84026r26}</span> \
<span
class="label">[](){#x1-84027r27}</span> In \[\]: MyList.sort() \# NOTE: suffix a \~.\~, hit tab, and wonder! \
<span class="label">[](){#x1-84028r28}</span> \
<span class="label">[](){#x1-84029r29}</span> In \[\]: MyList \
<span
class="label">[](){#x1-84030r30}</span>Out \[\]: \[True, 2.44, ’a new item’, ’blue’, ’blue’\]

</div>

In the above commands, notice that python “indexing” starts at 0, not 1!

#### <span class="titlemark">5.6.2 </span> [](){#x1-850005.6.2}Tuples {#tuples .subsectionHead}

<div id="listing-74" class="lstlisting">

<span
class="label">[](){#x1-85001r1}</span> In \[\]: FoodWeb=\[(’a’,’b’),(’a’,’c’),(’b’,’c’),(’c’,’c’)\] \
<span class="label">[](){#x1-85002r2}</span> \
<span class="label">[](){#x1-85003r3}</span> In \[\]: FoodWeb\[0\] \
<span class="label">[](){#x1-85004r4}</span>Out \[\]: (’a’, ’b’) \
<span class="label">[](){#x1-85005r5}</span> \
<span
class="label">[](){#x1-85006r6}</span> In \[\]: FoodWeb\[0\]\[0\] \
<span class="label">[](){#x1-85007r7}</span>Out \[\]: ’a’ \
<span class="label">[](){#x1-85008r8}</span> \
<span
class="label">[](){#x1-85009r9}</span> In \[\]: FoodWeb\[0\]\[0\] = \~bbb\~  \# NOTE: tuples are \~immutable\~ \
<span
class="label">[](){#x1-85010r10}</span>      TypeError: ’tuple’ object does not support item assignment \
<span class="label">[](){#x1-85011r11}</span> \
<span
class="label">[](){#x1-85012r12}</span> In \[\]: FoodWeb\[0\] = (\~bbb\~,\~ccc\~) \
<span class="label">[](){#x1-85013r13}</span> \
<span class="label">[](){#x1-85014r14}</span> In \[\]: FoodWeb\[0\] \
<span class="label">[](){#x1-85015r15}</span>Out \[\]: (’bbb’, ’ccc’)

</div>

Note that tuples are “immutable”; that is, a particular pair or sequence
of strings or numbers cannot be modiﬁed after it is created.

In the above example, why assign these food web data to a list of tuples
and not a list of lists? — because we want to maintain the species
associations, no matter what — they are sacrosanct!

Tuples contain immutable sequences, but you can append to them:

![PICT](SilBioComp160x.png) ![PICT](SilBioComp161x.png)

<div id="listing-75" class="lstlisting">

<span class="label">[](){#x1-85016r1}</span> In \[\]: a = (1, 2, \[\]) \
<span class="label">[](){#x1-85017r2}</span> \
<span
class="label">[](){#x1-85018r3}</span> In \[\]: a\[2\].append(1000) \
<span class="label">[](){#x1-85019r4}</span> \
<span class="label">[](){#x1-85020r5}</span> In \[\]: a \
<span class="label">[](){#x1-85021r6}</span>Out \[\]: (1, 2, \[1000\])

</div>

#### <span class="titlemark">5.6.3 </span> [](){#x1-860005.6.3}Sets {#sets .subsectionHead}

You can convert a list to an immutable “set” — an unordered collection
with no duplicate elements. Once you create a set you can perform set
operations on it:

<div id="listing-76" class="lstlisting">

<span
class="label">[](){#x1-86001r1}</span> In \[\]: a = \[5,6,7,7,7,8,9,9\] \
<span class="label">[](){#x1-86002r2}</span> \
<span class="label">[](){#x1-86003r3}</span> In \[\]: b = set(a) \
<span class="label">[](){#x1-86004r4}</span> \
<span class="label">[](){#x1-86005r5}</span> In \[\]: b \
<span
class="label">[](){#x1-86006r6}</span>Out \[\]: set(\[8, 9, 5, 6, 7\]) \
<span class="label">[](){#x1-86007r7}</span> \
<span
class="label">[](){#x1-86008r8}</span> In \[\]: c = set(\[3,4,5,6\]) \
<span class="label">[](){#x1-86009r9}</span> \
<span class="label">[](){#x1-86010r10}</span> In \[\]: b & c \
<span class="label">[](){#x1-86011r11}</span>Out \[\]: set(\[5, 6\]) \
<span class="label">[](){#x1-86012r12}</span> \
<span class="label">[](){#x1-86013r13}</span> In \[\]: b | c \
<span
class="label">[](){#x1-86014r14}</span>Out \[\]: set(\[3, 4, 5, 6, 7, 8, 9\]) \
<span class="label">[](){#x1-86015r15}</span> \
<span
class="label">[](){#x1-86016r16}</span> In \[\]: list(b | c) \# set to list \
<span
class="label">[](){#x1-86017r17}</span>Out \[\]: \[3, 4, 5, 6, 7, 8, 9\]

</div>

The key set operations in python are:

<div class="tabular">

a - b

a.diﬀerence(b)

a $< =$ b

a.issubset(b)

a $> =$ b

b.issubset(a)

a & b

a.intersection(b)

a $|$ b

a.union(b)

</div>

#### <span class="titlemark">5.6.4 </span> [](){#x1-870005.6.4}Dictionaries {#dictionaries .subsectionHead}

A set of values (any python object) indexed by keys (string or number),
a bit like R lists.

<div id="listing-77" class="lstlisting">

<span
class="label">[](){#x1-87001r1}</span>In \[\]: GenomeSize = {’Homo sapiens’: 3200.0, ’Escherichia coli’: 4.6, \
<span
class="label">[](){#x1-87002r2}</span>’Arabidopsis thaliana’: 157.0} \
<span class="label">[](){#x1-87003r3}</span> \
<span class="label">[](){#x1-87004r4}</span> In \[\]: GenomeSize \
<span class="label">[](){#x1-87005r5}</span>Out \[\]: \
<span
class="label">[](){#x1-87006r6}</span>{’Arabidopsis thaliana’: 157.0, \
<span class="label">[](){#x1-87007r7}</span>  ’Escherichia coli’: 4.6, \
<span class="label">[](){#x1-87008r8}</span>  ’Homo sapiens’: 3200.0} \
<span class="label">[](){#x1-87009r9}</span> \
<span
class="label">[](){#x1-87010r10}</span> In \[\]: GenomeSize\[’Arabidopsis thaliana’\] \
<span class="label">[](){#x1-87011r11}</span>Out \[\]: 157.0 \
<span class="label">[](){#x1-87012r12}</span> \
<span
class="label">[](){#x1-87013r13}</span> In \[\]: GenomeSize\[’Saccharomyces cerevisiae’\] = 12.1 \
<span class="label">[](){#x1-87014r14}</span> \
<span class="label">[](){#x1-87015r15}</span> In \[\]: GenomeSize \
<span class="label">[](){#x1-87016r16}</span>Out \[\]: \
<span
class="label">[](){#x1-87017r17}</span>{’Arabidopsis thaliana’: 157.0, \
<span class="label">[](){#x1-87018r18}</span>’Escherichia coli’: 4.6, \
<span class="label">[](){#x1-87019r19}</span>’Homo sapiens’: 3200.0, \
<span
class="label">[](){#x1-87020r20}</span>’Saccharomyces cerevisiae’: 12.1} \
<span class="label">[](){#x1-87021r21}</span> \
<span
class="label">[](){#x1-87022r22}</span> In \[\]: GenomeSize\[’Escherichia coli’\] = 4.6  \# ALREADY IN DICTIONARY! \
<span class="label">[](){#x1-87023r23}</span> \
<span class="label">[](){#x1-87024r24}</span> In \[\]: GenomeSize \
<span class="label">[](){#x1-87025r25}</span>Out \[\]: \
<span
class="label">[](){#x1-87026r26}</span>{’Arabidopsis thaliana’: 157.0, \
<span class="label">[](){#x1-87027r27}</span> ’Escherichia coli’: 4.6, \
<span class="label">[](){#x1-87028r28}</span> ’Homo sapiens’: 3200.0, \
<span
class="label">[](){#x1-87029r29}</span> ’Saccharomyces cerevisiae’: 12.1} \
<span class="label">[](){#x1-87030r30}</span> \
<span
class="label">[](){#x1-87031r31}</span> In \[\]: GenomeSize\[’Homo sapiens’\] = 3201.1 \
<span class="label">[](){#x1-87032r32}</span> \
<span class="label">[](){#x1-87033r33}</span> In \[\]: GenomeSize \
<span class="label">[](){#x1-87034r34}</span>Out \[\]: \
<span
class="label">[](){#x1-87035r35}</span>{’Arabidopsis thaliana’: 157.0, \
<span class="label">[](){#x1-87036r36}</span> ’Escherichia coli’: 4.6, \
<span class="label">[](){#x1-87037r37}</span> ’Homo sapiens’: 3201.1, \
<span
class="label">[](){#x1-87038r38}</span> ’Saccharomyces cerevisiae’: 12.1}

</div>

![PICT](SilBioComp162x.png) ![PICT](SilBioComp163x.png)

So, in summary,

-   If your elements/data are unordered and indexed by numbers use lists
-   If they are ordered sequences use a tuple
-   If you want to perform set operations on them, use a set
-   If they are unordered and indexed by keys (e.g., names), use a
    dictionary

But why not use dictionaries for everything? – because it can slow down
your code!

#### <span class="titlemark">5.6.5 </span> [](){#x1-880005.6.5}Copying mutable objects {#copying-mutable-objects .subsectionHead}

Copying mutable objects can be tricky. Try this:

<div class="lstinputlisting">

[](){#x1-88001}  \
<span class="label">[](){#x1-88002r1}</span>\# First, try this: \
<span class="label">[](){#x1-88003r2}</span>a = \[1, 2, 3\] \
<span
class="label">[](){#x1-88004r3}</span>b = a \# you are merely creating a new \~tag\~ (b) \
<span class="label">[](){#x1-88005r4}</span>a.append(4) \
<span class="label">[](){#x1-88006r5}</span>print b \
<span
class="label">[](){#x1-88007r6}</span>\# this will print \[1, 2, 3, 4\]!! \
<span class="label">[](){#x1-88008r7}</span> \
<span class="label">[](){#x1-88009r8}</span>\# Now, try: \
<span class="label">[](){#x1-88010r9}</span>a = \[1, 2, 3\] \
<span
class="label">[](){#x1-88011r10}</span>b = a\[:\]  \# This is a \~shallow\~ copy \
<span class="label">[](){#x1-88012r11}</span>a.append(4) \
<span class="label">[](){#x1-88013r12}</span>print b \
<span
class="label">[](){#x1-88014r13}</span>\# this will print \[1, 2, 3\]. \
<span class="label">[](){#x1-88015r14}</span> \
<span
class="label">[](){#x1-88016r15}</span>\# What about more complex lists? \
<span
class="label">[](){#x1-88017r16}</span>a = \[\[1, 2\], \[3, 4\]\] \
<span class="label">[](){#x1-88018r17}</span>b = a\[:\] \
<span
class="label">[](){#x1-88019r18}</span>a\[0\]\[1\] = 22 \# Note how I accessed this 2D list \
<span class="label">[](){#x1-88020r19}</span>print b \
<span
class="label">[](){#x1-88021r20}</span>\# this will print \[\[1, 22\], \[3, 4\]\] \
<span class="label">[](){#x1-88022r21}</span> \
<span
class="label">[](){#x1-88023r22}</span>\# the solution is to do a \~deep\~ copy: \
<span class="label">[](){#x1-88024r23}</span>import copy \
<span class="label">[](){#x1-88025r24}</span> \
<span
class="label">[](){#x1-88026r25}</span>a = \[\[1, 2\], \[3, 4\]\] \
<span class="label">[](){#x1-88027r26}</span>b = copy.deepcopy(a) \
<span class="label">[](){#x1-88028r27}</span>a\[0\]\[1\] = 22 \
<span class="label">[](){#x1-88029r28}</span>print b \
<span
class="label">[](){#x1-88030r29}</span>\# this will print \[\[1, 2\], \[3, 4\]\]

</div>

So, you need to employ deepcopy to really copy an existing object or
variable and assign a new name to the copy.

SVG-Viewer needed.

![PICT](SilBioComp164x.png) ![PICT](SilBioComp165x.png)

#### <span class="titlemark">5.6.6 </span> [](){#x1-890005.6.6}python with strings {#python-with-strings .subsectionHead}

One of the things that makes python so useful and versatile, is that it
has a powerful set of inbuilt commands to perform string manipulations.
For example, try these:

<div class="lstinputlisting">

[](){#x1-89001}  \
<span class="label">[](){#x1-89002r1}</span>s = \~ this is a string \~ \
<span class="label">[](){#x1-89003r2}</span>len(s) \
<span class="label">[](){#x1-89004r3}</span>\# length of s -&gt; 18 \
<span class="label">[](){#x1-89005r4}</span> \
<span
class="label">[](){#x1-89006r5}</span>print s.replace(\~ \~,\~-\~) \
<span
class="label">[](){#x1-89007r6}</span>\# Substitute spaces \~ \~ with dashes -&gt; -this-is-a-string- \
<span class="label">[](){#x1-89008r7}</span> \
<span class="label">[](){#x1-89009r8}</span>print s.find(\~s\~) \
<span
class="label">[](){#x1-89010r9}</span>\# First occurrence of s -&gt; 4 (start at 0) \
<span class="label">[](){#x1-89011r10}</span> \
<span class="label">[](){#x1-89012r11}</span>print s.count(\~s\~) \
<span
class="label">[](){#x1-89013r12}</span>\# Count the number of \~s\~ -&gt; 3 \
<span class="label">[](){#x1-89014r13}</span> \
<span class="label">[](){#x1-89015r14}</span>t = s.split() \
<span class="label">[](){#x1-89016r15}</span>print t \
<span
class="label">[](){#x1-89017r16}</span>\# Split the string using spaces and make \
<span
class="label">[](){#x1-89018r17}</span>\# a list -&gt; \[’this’, ’is’, ’a’, ’string’\] \
<span class="label">[](){#x1-89019r18}</span> \
<span class="label">[](){#x1-89020r19}</span>t = s.split(\~ is \~) \
<span class="label">[](){#x1-89021r20}</span>print t \
<span
class="label">[](){#x1-89022r21}</span>\# Split the string using \~ is \~ and make \
<span
class="label">[](){#x1-89023r22}</span>\# a list -&gt; \[’ this’, ’a string ’\] \
<span class="label">[](){#x1-89024r23}</span> \
<span class="label">[](){#x1-89025r24}</span>t = s.strip() \
<span class="label">[](){#x1-89026r25}</span>print t \
<span class="label">[](){#x1-89027r26}</span>\# remove trailing spaces \
<span class="label">[](){#x1-89028r27}</span> \
<span class="label">[](){#x1-89029r28}</span>print s.upper() \
<span class="label">[](){#x1-89030r29}</span>\# ’ THIS IS A STRING ’ \
<span class="label">[](){#x1-89031r30}</span> \
<span class="label">[](){#x1-89032r31}</span>’WORD’.lower() \
<span class="label">[](){#x1-89033r32}</span>\# ’word’

</div>

### <span class="titlemark">5.7 </span> [](){#x1-900005.7}Writing python code {#writing-python-code .sectionHead}

Now let’s learn to write and run python code from a \*.py ﬁle. But ﬁrst,
some some guidelines for good code-writing practices (see
[python.org/dev/peps/pep-\_0008/](python.org/dev/peps/pep-0008/){.url}):

-   Wrap lines to be $<$80 characters long. You can use parentheses
    $\left( {} \right)$ or signal that the line continues using a
    “backslash” $\smallsetminus$
-   Use either 4 spaces for indentation or tabs, but not both! (I
    use tabs!)
-   Separate functions using a blank line
-   When possible, write comments on separate lines

Make sure you have chosen a particular indent type (space or tab) in
geany (or whatever IDE you are using) — indentation is all-important in
python. Furthermore,

-   Use “docstrings” to document how to use the code, and comments to
    explain why and how the code works
-   Naming conventions (bit of a mess, you’ll learn as you go!):
    -   \_internal\_global\_variable (for use inside module only)
    -   a\_variable
    -   SOME\_CONSTANT ![PICT](SilBioComp166x.png)
        ![PICT](SilBioComp167x.png)
    -   a\_function
    -   Never call a variable l or O or o\
        why not? – you are likely to confuse it with 1 or 0!
-   Use spaces around operators and after commas:\
    a = func(x, y) + other(3, 4)

### <span class="titlemark">5.8 </span> [](){#x1-910005.8}python Input/Output {#python-inputoutput .sectionHead}

Let’s look at importing and exporting data. Make a textﬁle called
test.txt in Week2/Sandbox/ with the following content (including the
empty lines):

<div id="listing-78" class="lstlisting">

<span class="label">[](){#x1-91001r1}</span>First Line \
<span class="label">[](){#x1-91002r2}</span>Second Line \
<span class="label">[](){#x1-91003r3}</span> \
<span class="label">[](){#x1-91004r4}</span>Third Line \
<span class="label">[](){#x1-91005r5}</span> \
<span class="label">[](){#x1-91006r6}</span>Fourth Line

</div>

Then, type the following in Week2/Code/basic\_io.py (note the
indentation!):

<div class="lstinputlisting">

[](){#x1-91007}  \
<span
class="label">[](){#x1-91008r1}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-91009r2}</span>\# FILE INPUT \
<span
class="label">[](){#x1-91010r3}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-91011r4}</span>\# Open a file for reading \
<span
class="label">[](){#x1-91012r5}</span>f = open(’../Sandbox/test.txt’, ’r’) \
<span
class="label">[](){#x1-91013r6}</span>\# use \~implicit\~ for loop: \
<span
class="label">[](){#x1-91014r7}</span>\# if the object is a file, python will cycle over lines \
<span class="label">[](){#x1-91015r8}</span>for line in f: \
<span
class="label">[](){#x1-91016r9}</span>    print line, \# the \~,\~ prevents adding a new line \
<span class="label">[](){#x1-91017r10}</span> \
<span class="label">[](){#x1-91018r11}</span>\# close the file \
<span class="label">[](){#x1-91019r12}</span>f.close() \
<span class="label">[](){#x1-91020r13}</span> \
<span
class="label">[](){#x1-91021r14}</span>\# Same example, skip blank lines \
<span
class="label">[](){#x1-91022r15}</span>f = open(’../Sandbox/test.txt’, ’r’) \
<span class="label">[](){#x1-91023r16}</span>for line in f: \
<span
class="label">[](){#x1-91024r17}</span>    if len(line.strip()) &gt; 0: \
<span class="label">[](){#x1-91025r18}</span>        print line, \
<span class="label">[](){#x1-91026r19}</span> \
<span class="label">[](){#x1-91027r20}</span>f.close() \
<span class="label">[](){#x1-91028r21}</span> \
<span
class="label">[](){#x1-91029r22}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-91030r23}</span>\# FILE OUTPUT \
<span
class="label">[](){#x1-91031r24}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span
class="label">[](){#x1-91032r25}</span>\# Save the elements of a list to a file \
<span
class="label">[](){#x1-91033r26}</span>list\_to\_save = range(100) \
<span class="label">[](){#x1-91034r27}</span> \
<span
class="label">[](){#x1-91035r28}</span>f = open(’../Sandbox/testout.txt’,’w’) \
<span class="label">[](){#x1-91036r29}</span>for i in list\_to\_save: \
<span
class="label">[](){#x1-91037r30}</span>    f.write(str(i) + ’\\n’) \#\# Add a new line at the end \
<span class="label">[](){#x1-91038r31}</span> \
<span class="label">[](){#x1-91039r32}</span>f.close() \
<span class="label">[](){#x1-91040r33}</span> \
<span
class="label">[](){#x1-91041r34}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-91042r35}</span>\# STORING OBJECTS \
<span
class="label">[](){#x1-91043r36}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span
class="label">[](){#x1-91044r37}</span>\# To save an object (even complex) for later use \
<span
class="label">[](){#x1-91045r38}</span>my\_dictionary = {\~a key\~: 10, \~another key\~: 11} \
<span class="label">[](){#x1-91046r39}</span> \
<span class="label">[](){#x1-91047r40}</span>import pickle \
<span class="label">[](){#x1-91048r41}</span> \
<span
class="label">[](){#x1-91049r42}</span>f = open(’../Sandbox/testp.p’,’wb’) \#\# note the b: accept binary files \
<span
class="label">[](){#x1-91050r43}</span>pickle.dump(my\_dictionary, f) \
<span class="label">[](){#x1-91051r44}</span>f.close() \
<span class="label">[](){#x1-91052r45}</span> \
<span class="label">[](){#x1-91053r46}</span>\#\# Load the data again \
<span
class="label">[](){#x1-91054r47}</span>f = open(’../Sandbox/testp.p’,’rb’) \
<span
class="label">[](){#x1-91055r48}</span>another\_dictionary = pickle.load(f) \
<span class="label">[](){#x1-91056r49}</span>f.close() \
<span class="label">[](){#x1-91057r50}</span> \
<span class="label">[](){#x1-91058r51}</span>print another\_dictionary

</div>

Note the following:

-   The for line in f is an implicit loop — implicit because stating the
    range of things in f to loop over in this way allows python to
    handle any kind of objects to loop thorugh. For example, if f was an
    array of numbers 1 to 10, it would loop thorugh them; if f is a ﬁle,
    as in the case of the script above, it will loop through the lines
    in the ﬁle.
-   is len(line.strip()) &gt; 0 checks if the line is empty. Try ? to
    see what .strip() does.

The csv package makes it easy to manipulate CSV ﬁles (get testcsv.csv
from CMEEMasteRepo). Type the following script in
Week2/Code/basic\_csv.py ![PICT](SilBioComp168x.png)
![PICT](SilBioComp169x.png)

<div class="lstinputlisting">

[](){#x1-91059}  \
<span class="label">[](){#x1-91060r1}</span>import csv \
<span class="label">[](){#x1-91061r2}</span> \
<span class="label">[](){#x1-91062r3}</span>\# Read a file containing: \
<span
class="label">[](){#x1-91063r4}</span>\# ’Species’,’Infraorder’,’Family’,’Distribution’,’Body mass male (Kg)’ \
<span
class="label">[](){#x1-91064r5}</span>f = open(’../Sandbox/testcsv.csv’,’rb’) \
<span class="label">[](){#x1-91065r6}</span> \
<span class="label">[](){#x1-91066r7}</span>csvread = csv.reader(f) \
<span class="label">[](){#x1-91067r8}</span>temp = \[\] \
<span class="label">[](){#x1-91068r9}</span>for row in csvread: \
<span
class="label">[](){#x1-91069r10}</span>    temp.append(tuple(row)) \
<span class="label">[](){#x1-91070r11}</span>    print row \
<span
class="label">[](){#x1-91071r12}</span>    print \~The species is\~, row\[0\] \
<span class="label">[](){#x1-91072r13}</span> \
<span class="label">[](){#x1-91073r14}</span>f.close() \
<span class="label">[](){#x1-91074r15}</span> \
<span
class="label">[](){#x1-91075r16}</span>\# write a file containing only species name and Body mass \
<span
class="label">[](){#x1-91076r17}</span>f = open(’../Sandbox/testcsv.csv’,’rb’) \
<span
class="label">[](){#x1-91077r18}</span>g = open(’../Sandbox/bodymass.csv’,’wb’) \
<span class="label">[](){#x1-91078r19}</span> \
<span class="label">[](){#x1-91079r20}</span>csvread = csv.reader(f) \
<span class="label">[](){#x1-91080r21}</span>csvwrite = csv.writer(g) \
<span class="label">[](){#x1-91081r22}</span>for row in csvread: \
<span class="label">[](){#x1-91082r23}</span>    print row \
<span
class="label">[](){#x1-91083r24}</span>    csvwrite.writerow(\[row\[0\], row\[4\]\]) \
<span class="label">[](){#x1-91084r25}</span> \
<span class="label">[](){#x1-91085r26}</span>f.close() \
<span class="label">[](){#x1-91086r27}</span>g.close()

</div>

SVG-Viewer needed.

#### <span class="titlemark">5.8.1 </span> [](){#x1-920005.8.1}Writing python functions (or modules) {#writing-python-functions-or-modules .subsectionHead}

Now let’s writing proper python functions. We will start with a
“boilerplate” code. Type the code below and save as boilerplate.py in
CMEECourseWork/Week2/Code:

<div class="lstinputlisting">

![PICT](SilBioComp170x.png) ![PICT](SilBioComp171x.png) [](){#x1-92001}
 \
<span class="label">[](){#x1-92002r1}</span>\#!/usr/bin/python \
<span class="label">[](){#x1-92003r2}</span> \
<span
class="label">[](){#x1-92004r3}</span>\~\~\~Description of this program \
<span
class="label">[](){#x1-92005r4}</span>    you can use several lines\~\~\~ \
<span class="label">[](){#x1-92006r5}</span> \
<span
class="label">[](){#x1-92007r6}</span>\_\_author\_\_ = ’Samraat Pawar (s.pawar@imperial.ac.uk)’ \
<span class="label">[](){#x1-92008r7}</span>\_\_version\_\_ = ’0.0.1’ \
<span class="label">[](){#x1-92009r8}</span> \
<span class="label">[](){#x1-92010r9}</span>\# imports \
<span
class="label">[](){#x1-92011r10}</span>import sys \# module to interface our program with the operating system \
<span class="label">[](){#x1-92012r11}</span> \
<span class="label">[](){#x1-92013r12}</span>\# constants can go here \
<span class="label">[](){#x1-92014r13}</span> \
<span class="label">[](){#x1-92015r14}</span> \
<span class="label">[](){#x1-92016r15}</span>\# functions can go here \
<span class="label">[](){#x1-92017r16}</span>def main(argv): \
<span
class="label">[](){#x1-92018r17}</span>        print ’This is a boilerplate’ \# NOTE: indented using two tabs or 4 spaces \
<span class="label">[](){#x1-92019r18}</span>        return 0 \
<span class="label">[](){#x1-92020r19}</span> \
<span
class="label">[](){#x1-92021r20}</span>if \_\_name\_\_ == \~\_\_main\_\_\~: \#makes sure the \~main\~ function is called from commandline \
<span
class="label">[](){#x1-92022r21}</span>        status = main(sys.argv) \
<span class="label">[](){#x1-92023r22}</span>        sys.exit(status)

</div>

##### [](){#x1-930005.8.1}Running your python code {#running-your-python-code .subsubsectionHead}

Now cd to the directory and run the code:

<div id="listing-82" class="lstlisting">

<span
class="label">[](){#x1-93001r1}</span>\$ cd ∼/Documents/../CMEECourseWork/Week2/Code \
<span class="label">[](){#x1-93002r2}</span>\$ python boilerplate.py

</div>

You should see “This is a boilerplate” in your terminal window.

Alternatively, you can use ipython:

<div id="listing-83" class="lstlisting">

<span class="label">[](){#x1-93003r1}</span>\$ ipython boilerplate.py

</div>

You can also execute a python script ﬁle from within the ipython shell
with run MyScript.py. So, enter ipython from bash, and do:

<div id="listing-84" class="lstlisting">

<span class="label">[](){#x1-93004r1}</span>In \[ \]: run boilerplate.py

</div>

To run the script from the native python shell, you would use
execfile(“MyScript.py”).

#### <span class="titlemark">5.8.2 </span> [](){#x1-940005.8.2}Components of the python function {#components-of-the-python-function .subsectionHead}

Now let’s look at the elements of your ﬁrst, boilerplate code:

##### [](){#x1-950005.8.2}The shebang {#the-shebang .subsubsectionHead}

![PICT](SilBioComp172x.png) ![PICT](SilBioComp173x.png)

Just like UNIX shell scripts, the ﬁrst “shebang” line tells the computer
where to look for python. It determines the script’s ability to be
executed like an standalone executable without typing python beforehand
in the terminal or when double clicking it in a ﬁle manager (when
conﬁgured properly to be an executable). It isn’t necessary but
generally put there so when someone sees the ﬁle opened in an editor,
they immediately know what they’re looking at. However, which shebang
line you use is important.

Here by using \#!/usr/bin/python we are specifying the location to the
python executable in your machine that rest of the script needs to be
interpreted with. You may want to use \#!/usr/bin/env python instead,
which will prevent failure to run if the Python executable on some other
machine or distribution isn’t actually located at \#!/usr/bin/python,
but elsewhere.

##### [](){#x1-960005.8.2}The Docstring {#the-docstring .subsubsectionHead}

Triple quotes start a “docstring” comment, which is meant to describe
the operation of the script or a function/module within it. docstrings
are considered part of the running code, while normal comments are
stripped. Hence, you can access your docstrings at run time. It is a
good idea to have doctrings at the start of every python script and
module as it can provide useful information to the user and you as well,
down the line.

You can access the docstring(s) in a script (both for the overall script
and the ones in each of its functions), by importing the function (say,
my\_func), and then typing help(my\_func) in the python or ipython
shell. For example, try import boilerplate and then help(boilerplate)
(but you have to be in the python or ipython shell).

For more info, see
[https://www.python.org/dev/peps/pep-\_0257](https://www.python.org/dev/peps/pep-0257){.url}

##### [](){#x1-970005.8.2}Internal Variables {#internal-variables .subsubsectionHead}

“\_\_” signal “internal” variables (never name your variables so!)

##### [](){#x1-980005.8.2}Function definitions and “modules” {#function-definitions-and-modules .subsubsectionHead}

def indicates the start of a python function; all subsequent lines must
be indented.

It’s important to know that somewhat confusingly, Pythonistas call a ﬁle
containing function defitions’s) and statements (e.g., assignments of
constant variables) a “module”. There is a practical reason (there’s
always one!) for this. You might want to use a particular set of python
![PICT](SilBioComp174x.png) ![PICT](SilBioComp175x.png) def’s
(functions) and statements either as a standalone function, or use it or
subsets of it from other scripts. So in theory, every function you
define can be a sub-module usable by other scripts.

In other words, definitions from a module can be imported into other
modules and scripts, or into the main module itself.

At this juncture, you might also want to know more about a Python
“class”. Have a look at
<http://learnpythonthehardway.org/book/ex40.html> — a nice, intuitive
tutorial that should help you understand functions vs. modules vs.
classes in Python.

The last few lines, including the main function/module are somewhat
esoteric but important; more on this below.

##### [](){#x1-990005.8.2}Why include \_\_name\_\_ == “\_\_main\_\_” and all that jazz {#why-include-__name__-__main__-and-all-that-jazz .subsubsectionHead}

When you run a Python module with or without arguments, the code in the
called module will be executed just as if you imported it, but with the
\_\_name\_\_ set to “\_\_main\_\_”. So adding this code at the end of
your module,

<div id="listing-85" class="lstlisting">

<span
class="label">[](){#x1-99001r1}</span>if (\_\_name\_\_ == \~\_\_main\_\_\~):

</div>

directs the python interpreter to set the special \_\_name\_\_ variable
to have a value “\_\_main\_\_”, so that the ﬁle is usable as a script as
well as an importable module. How do you import? Simply as (in python or
ipython shell):

<div id="listing-86" class="lstlisting">

<span class="label">[](){#x1-99002r1}</span>In \[\]: import boilerplate

</div>

Then type

<div id="listing-87" class="lstlisting">

<span class="label">[](){#x1-99003r1}</span>In \[\]: boilerplate \
<span
class="label">[](){#x1-99004r2}</span>Out\[\]: &lt;module ’boilerplate’ from ’boilerplate.py’&gt;

</div>

One more script to hopefully clarify this further. Type and save the
following in a script ﬁle called using\_name.py:

<div class="lstinputlisting">

[](){#x1-99005}  \
<span class="label">[](){#x1-99006r1}</span>\#!/usr/bin/python \
<span
class="label">[](){#x1-99007r2}</span>\# Filename: using\_name.py \
<span class="label">[](){#x1-99008r3}</span> \
<span
class="label">[](){#x1-99009r4}</span>if \_\_name\_\_ == ’\_\_main\_\_’: \
<span
class="label">[](){#x1-99010r5}</span>    print ’This program is being run by itself’ \
<span class="label">[](){#x1-99011r6}</span>else: \
<span
class="label">[](){#x1-99012r7}</span>    print ’I am being imported from another module’

</div>

![PICT](SilBioComp176x.png) ![PICT](SilBioComp177x.png)

Now run it:

<div id="listing-88" class="lstlisting">

<span
class="label">[](){#x1-99013r1}</span>In \[\]: run using\_name.py \
<span
class="label">[](){#x1-99014r2}</span>This program is being run by itself

</div>

Now, try:

<div id="listing-89" class="lstlisting">

<span
class="label">[](){#x1-99015r1}</span>In \[\]: import using\_name \
<span
class="label">[](){#x1-99016r2}</span>I am being imported from another module

</div>

The output I am being imported from another module will only show up
once.

Also please look up <https://docs.python.org/2/tutorial/modules.html>

##### [](){#x1-1000005.8.2}What on earth is sys.argv? {#what-on-earth-is-sys.argv .subsubsectionHead}

In your boilerplate code, as any other Python code, argv is the
“argument variable”. Such variables are necessarily very common across
programming languages, and play an important role — argv is a variable
that holds the arguments you pass to your Python script when you run it.
sys.argv is simply an object created by python using the sys module
(which you imported at the beginning of the script) that contains the
names of the argument variables in the current script.

To understand this in a practical way, let’s write and save a script
called sysargv.py:

<div class="lstinputlisting">

[](){#x1-100001}  \
<span class="label">[](){#x1-100002r1}</span>import sys \
<span
class="label">[](){#x1-100003r2}</span>print \~This is the name of the script: \~, sys.argv\[0\] \
<span
class="label">[](){#x1-100004r3}</span>print \~Number of arguments: \~, len(sys.argv) \
<span
class="label">[](){#x1-100005r4}</span>print \~The arguments are: \~ , str(sys.argv)

</div>

Now run sysargv.py with diﬀerent numbers of arguments:

<div id="listing-90" class="lstlisting">

<span class="label">[](){#x1-100006r1}</span>run sysargv.py \
<span class="label">[](){#x1-100007r2}</span>run sysargv.py var1 var2 \
<span class="label">[](){#x1-100008r3}</span>run sysargv.py 1 2 var3

</div>

As you can see the ﬁrst variable is always the ﬁle name, and is always
available as to the Python interpreter.

Then, the command main(argv=sys.argv) directs the interpreter to pass
the argument variables to the main function. Which brings us to,

<div id="listing-91" class="lstlisting">

<span class="label">[](){#x1-100009r1}</span>def main(argv): \
<span
class="label">[](){#x1-100010r2}</span>    print ’This is a boilerplate’ \# NOTE: indented using two tabs or four spaces
![PICT](SilBioComp178x.png) ![PICT](SilBioComp179x.png)

</div>

This is the main function. Arguments obtained in the if (\_\_name\_\_ ==
“\_\_main\_\_”): part of the script are “fed” to this main function
where the printing of the line “This is a boilerplate” happens.

OK, ﬁnally, what about this bit:

<div id="listing-92" class="lstlisting">

<span class="label">[](){#x1-100011r1}</span>sys.exit(status)

</div>

It’s just a way to terminate and exit the Python program in an explicit
manner, returning an appropriate status code. In this case, we have
decided that main() returns 0 on a successful run, so sys.exit(status)
will return zero indicating “successful termination”. Try putting
sys.exit(“I am exiting right now!”) in other places in boilerplate.py
and see what happens.

#### <span class="titlemark">5.8.3 </span> [](){#x1-1010005.8.3}Variable scope {#variable-scope .subsectionHead}

One important thing to note about functions, in any language, is that
variables inside functions are invisible outside of it, nor do they
persist once the function has run. These are called “local” variables,
and are only accessible inside their function. However, “global”
variables are visible inside and outside of functions. In python, you
can assign global variables. Type the following script in scope.py and
try it:

<div class="lstinputlisting">

[](){#x1-101001}  \
<span class="label">[](){#x1-101002r1}</span>\#\# Try this first \
<span class="label">[](){#x1-101003r2}</span> \
<span class="label">[](){#x1-101004r3}</span>\_a\_global = 10 \
<span class="label">[](){#x1-101005r4}</span> \
<span class="label">[](){#x1-101006r5}</span>def a\_function(): \
<span class="label">[](){#x1-101007r6}</span>    \_a\_global = 5 \
<span class="label">[](){#x1-101008r7}</span>    \_a\_local = 4 \
<span
class="label">[](){#x1-101009r8}</span>    print \~Inside the function, the value is \~, \_a\_global \
<span
class="label">[](){#x1-101010r9}</span>    print \~Inside the function, the value is \~, \_a\_local \
<span class="label">[](){#x1-101011r10}</span>    return None \
<span class="label">[](){#x1-101012r11}</span> \
<span class="label">[](){#x1-101013r12}</span>a\_function() \
<span class="label">[](){#x1-101014r13}</span> \
<span
class="label">[](){#x1-101015r14}</span>print \~Outside the function, the value is \~, \_a\_global \
<span class="label">[](){#x1-101016r15}</span> \
<span class="label">[](){#x1-101017r16}</span> \
<span class="label">[](){#x1-101018r17}</span> \
<span class="label">[](){#x1-101019r18}</span>\#\# Now try this \
<span class="label">[](){#x1-101020r19}</span> \
<span class="label">[](){#x1-101021r20}</span>\_a\_global = 10 \
<span class="label">[](){#x1-101022r21}</span> \
<span class="label">[](){#x1-101023r22}</span>def a\_function(): \
<span class="label">[](){#x1-101024r23}</span>    global \_a\_global \
<span class="label">[](){#x1-101025r24}</span>    \_a\_global = 5 \
<span class="label">[](){#x1-101026r25}</span>    \_a\_local = 4 \
<span
class="label">[](){#x1-101027r26}</span>    print \~Inside the function, the value is \~, \_a\_global \
<span
class="label">[](){#x1-101028r27}</span>    print \~Inside the function, the value is \~, \_a\_local \
<span class="label">[](){#x1-101029r28}</span>    return None \
<span class="label">[](){#x1-101030r29}</span> \
<span class="label">[](){#x1-101031r30}</span>a\_function() \
<span
class="label">[](){#x1-101032r31}</span>print \~Outside the function, the value is\~, \_a\_global

</div>

However, in general, avoid assigning globals because you run the risk of
“exposing” unwanted variables to all functions within your name
work/namespace.

### <span class="titlemark">5.9 </span> [](){#x1-1020005.9}Control statements {#control-statements .sectionHead}

OK, let’s get deeper into python functions. To begin, ﬁrst copy and
rename boilerplate.py (to make use of it’s existing structure and save
you some typing):

![PICT](SilBioComp180x.png) ![PICT](SilBioComp181x.png)

<div id="listing-93" class="lstlisting">

<span
class="label">[](){#x1-102001r1}</span>\$ cp boilerplate.py control\_flow.py \
<span class="label">[](){#x1-102002r2}</span>\$

</div>

Then type the following script into control\_flow.py:

<div class="lstinputlisting">

[](){#x1-102003}  \
<span class="label">[](){#x1-102004r1}</span>\#!/usr/bin/env python \
<span class="label">[](){#x1-102005r2}</span> \
<span
class="label">[](){#x1-102006r3}</span>\~\~\~Some functions exemplifying the use of control statements\~\~\~ \
<span
class="label">[](){#x1-102007r4}</span>\#docstrings are considered part of the running code (normal comments are \
<span
class="label">[](){#x1-102008r5}</span>\#stripped). Hence, you can access your docstrings at run time. \
<span
class="label">[](){#x1-102009r6}</span>\_\_author\_\_ = ’Samraat Pawar (s.pawar@imperial.ac.uk)’ \
<span class="label">[](){#x1-102010r7}</span>\_\_version\_\_ = ’0.0.1’ \
<span class="label">[](){#x1-102011r8}</span> \
<span class="label">[](){#x1-102012r9}</span>import sys \
<span class="label">[](){#x1-102013r10}</span> \
<span
class="label">[](){#x1-102014r11}</span>def even\_or\_odd(x=0): \# if not specified, x should take value 0. \
<span class="label">[](){#x1-102015r12}</span> \
<span
class="label">[](){#x1-102016r13}</span>    \~\~\~Find whether a number x is even or odd.\~\~\~ \
<span
class="label">[](){#x1-102017r14}</span>    if x % 2 == 0: \#The conditional if \
<span
class="label">[](){#x1-102018r15}</span>        return \~%d is Even!\~ % x \
<span
class="label">[](){#x1-102019r16}</span>    return \~%d is Odd!\~ % x \
<span class="label">[](){#x1-102020r17}</span> \
<span
class="label">[](){#x1-102021r18}</span>def largest\_divisor\_five(x=120): \
<span
class="label">[](){#x1-102022r19}</span>    \~\~\~Find which is the largest divisor of x among 2,3,4,5.\~\~\~ \
<span class="label">[](){#x1-102023r20}</span>    largest = 0 \
<span class="label">[](){#x1-102024r21}</span>    if x % 5 == 0: \
<span class="label">[](){#x1-102025r22}</span>        largest = 5 \
<span
class="label">[](){#x1-102026r23}</span>    elif x % 4 == 0: \#means \~else, if\~ \
<span class="label">[](){#x1-102027r24}</span>        largest = 4 \
<span class="label">[](){#x1-102028r25}</span>    elif x % 3 == 0: \
<span class="label">[](){#x1-102029r26}</span>        largest = 3 \
<span class="label">[](){#x1-102030r27}</span>    elif x % 2 == 0: \
<span class="label">[](){#x1-102031r28}</span>        largest = 2 \
<span
class="label">[](){#x1-102032r29}</span>    else: \# When all other (if, elif) conditions are not met \
<span
class="label">[](){#x1-102033r30}</span>        return \~No divisor found for %d!\~ % x \# Each function can return a value or a variable. \
<span
class="label">[](){#x1-102034r31}</span>    return \~The largest divisor of %d is %d\~ % (x, largest) \
<span class="label">[](){#x1-102035r32}</span> \
<span class="label">[](){#x1-102036r33}</span>def is\_prime(x=70): \
<span
class="label">[](){#x1-102037r34}</span>    \~\~\~Find whether an integer is prime.\~\~\~ \
<span
class="label">[](){#x1-102038r35}</span>    for i in range(2, x): \#  \~range\~ returns a sequence of integers \
<span class="label">[](){#x1-102039r36}</span>        if x % i == 0: \
<span
class="label">[](){#x1-102040r37}</span>          print \~%d is not a prime: %d is a divisor\~ % (x, i) \#Print formatted text \~%d %s %f %e\~ % (20,\~30\~,0.0003,0.00003) \
<span class="label">[](){#x1-102041r38}</span> \
<span class="label">[](){#x1-102042r39}</span>          return False \
<span
class="label">[](){#x1-102043r40}</span>    print \~%d is a prime!\~ % x \
<span class="label">[](){#x1-102044r41}</span>    return True \
<span class="label">[](){#x1-102045r42}</span> \
<span
class="label">[](){#x1-102046r43}</span>def find\_all\_primes(x=22): \
<span
class="label">[](){#x1-102047r44}</span>    \~\~\~Find all the primes up to x\~\~\~ \
<span class="label">[](){#x1-102048r45}</span>    allprimes = \[\] \
<span
class="label">[](){#x1-102049r46}</span>    for i in range(2, x + 1): \
<span class="label">[](){#x1-102050r47}</span>      if is\_prime(i): \
<span
class="label">[](){#x1-102051r48}</span>        allprimes.append(i) \
<span
class="label">[](){#x1-102052r49}</span>    print \~There are %d primes between 2 and %d\~ % (len(allprimes), x) \
<span class="label">[](){#x1-102053r50}</span>    return allprimes \
<span class="label">[](){#x1-102054r51}</span> \
<span class="label">[](){#x1-102055r52}</span>def main(argv): \
<span
class="label">[](){#x1-102056r53}</span>    \# sys.exit(\~don’t want to do this right now!\~) \
<span
class="label">[](){#x1-102057r54}</span>    print even\_or\_odd(22) \
<span
class="label">[](){#x1-102058r55}</span>    print even\_or\_odd(33) \
<span
class="label">[](){#x1-102059r56}</span>    print largest\_divisor\_five(120) \
<span
class="label">[](){#x1-102060r57}</span>    print largest\_divisor\_five(121) \
<span class="label">[](){#x1-102061r58}</span>    print is\_prime(60) \
<span class="label">[](){#x1-102062r59}</span>    print is\_prime(59) \
<span
class="label">[](){#x1-102063r60}</span>    print find\_all\_primes(100) \
<span class="label">[](){#x1-102064r61}</span>    return 0 \
<span class="label">[](){#x1-102065r62}</span> \
<span
class="label">[](){#x1-102066r63}</span>if (\_\_name\_\_ == \~\_\_main\_\_\~): \
<span
class="label">[](){#x1-102067r64}</span>    status = main(sys.argv) \
<span class="label">[](){#x1-102068r65}</span>    sys.exit(status)

</div>

Now run the code:

<div id="listing-94" class="lstlisting">

<span
class="label">[](){#x1-102069r1}</span>In \[\]: run control\_flow.py

</div>

You can also call any of the functions within control\_flow.py:

<div id="listing-95" class="lstlisting">

<span
class="label">[](){#x1-102070r1}</span>In \[\]: even\_or\_odd(11) \
<span class="label">[](){#x1-102071r2}</span>Out\[\]: ’11 is Odd!’

</div>

This is possible without explicitly importing the modules because you
are only running one script. You would have to do an explicit import if
you needed a module from another python script ﬁle.

#### <span class="titlemark">5.9.1 </span> [](){#x1-1030005.9.1}Control ﬂow exercises {#control-ﬂow-exercises .subsectionHead}

-   Write the following, and save them to cfexercises.py.
-   Now try these function by function, pasting the block in the ipython
    command line (hopefully you have set youe code editor to send a
    selection to the commandline by now)

<div class="lstinputlisting">

[](){#x1-103001}  \
<span
class="label">[](){#x1-103002r1}</span>\# How many times will ’hello’ be printed? \
<span class="label">[](){#x1-103003r2}</span>\# 1) \
<span class="label">[](){#x1-103004r3}</span>for i in range(3, 17): \
<span class="label">[](){#x1-103005r4}</span>    print ’hello’ \
<span class="label">[](){#x1-103006r5}</span> \
<span class="label">[](){#x1-103007r6}</span>\# 2) \
<span class="label">[](){#x1-103008r7}</span>for j in range(12): \
<span class="label">[](){#x1-103009r8}</span>    if j % 3 == 0: \
<span class="label">[](){#x1-103010r9}</span>        print ’hello’ \
<span class="label">[](){#x1-103011r10}</span> \
<span class="label">[](){#x1-103012r11}</span>\# 3) \
<span class="label">[](){#x1-103013r12}</span> \
<span class="label">[](){#x1-103014r13}</span>for j in range(15): \
<span class="label">[](){#x1-103015r14}</span>     if j % 5 == 3: \
<span class="label">[](){#x1-103016r15}</span>        print ’hello’ \
<span class="label">[](){#x1-103017r16}</span>     elif j % 4 == 3: \
<span class="label">[](){#x1-103018r17}</span>        print ’hello’ \
<span class="label">[](){#x1-103019r18}</span> \
<span class="label">[](){#x1-103020r19}</span>\# 4) \
<span class="label">[](){#x1-103021r20}</span>z = 0 \
<span class="label">[](){#x1-103022r21}</span>while z != 15: \
<span class="label">[](){#x1-103023r22}</span>    print ’hello’ \
<span class="label">[](){#x1-103024r23}</span>            z = z + 3 \
<span class="label">[](){#x1-103025r24}</span> \
<span class="label">[](){#x1-103026r25}</span>\# 5) \
<span class="label">[](){#x1-103027r26}</span>z = 12 \
<span class="label">[](){#x1-103028r27}</span>while z &lt; 100: \
<span class="label">[](){#x1-103029r28}</span>    if z == 31: \
<span
class="label">[](){#x1-103030r29}</span>        for k in range(7): \
<span
class="label">[](){#x1-103031r30}</span>            print ’hello’ \
<span class="label">[](){#x1-103032r31}</span>    elif z == 18: \
<span class="label">[](){#x1-103033r32}</span>        print ’hello’ \
<span class="label">[](){#x1-103034r33}</span>    z = z + 1 \
<span class="label">[](){#x1-103035r34}</span> \
<span class="label">[](){#x1-103036r35}</span>\# What does fooXX do? \
<span class="label">[](){#x1-103037r36}</span>def foo1(x): \
<span class="label">[](){#x1-103038r37}</span>    return x \*\* 0.5 \
<span class="label">[](){#x1-103039r38}</span> \
<span class="label">[](){#x1-103040r39}</span>def foo2(x, y): \
<span class="label">[](){#x1-103041r40}</span>    if x &gt; y: \
<span class="label">[](){#x1-103042r41}</span>        return x \
<span class="label">[](){#x1-103043r42}</span>    return y \
<span class="label">[](){#x1-103044r43}</span> \
<span class="label">[](){#x1-103045r44}</span>def foo3(x, y, z): \
<span class="label">[](){#x1-103046r45}</span>    if x &gt; y: \
<span class="label">[](){#x1-103047r46}</span>        tmp = y \
<span class="label">[](){#x1-103048r47}</span>        y = x \
<span class="label">[](){#x1-103049r48}</span>        x = tmp \
<span class="label">[](){#x1-103050r49}</span>    if y &gt; z: \
<span class="label">[](){#x1-103051r50}</span>        tmp = z \
<span class="label">[](){#x1-103052r51}</span>        z = y \
<span class="label">[](){#x1-103053r52}</span>        y = tmp \
<span class="label">[](){#x1-103054r53}</span>    return \[x, y, z\] \
<span class="label">[](){#x1-103055r54}</span> \
<span class="label">[](){#x1-103056r55}</span>def foo4(x): \
<span class="label">[](){#x1-103057r56}</span>    result = 1 \
<span
class="label">[](){#x1-103058r57}</span>    for i in range(1, x + 1): \
<span
class="label">[](){#x1-103059r58}</span>        result = result \* i \
<span class="label">[](){#x1-103060r59}</span>    return result \
<span class="label">[](){#x1-103061r60}</span> \
<span
class="label">[](){#x1-103062r61}</span>\# This is a recursive function, meaning that the function calls itself \
<span class="label">[](){#x1-103063r62}</span>\# read about it at \
<span
class="label">[](){#x1-103064r63}</span>\# en.wikipedia.org/wiki/Recursion\_(computer\_science) \
<span class="label">[](){#x1-103065r64}</span>def foo5(x): \
<span class="label">[](){#x1-103066r65}</span>    if x == 1: \
<span class="label">[](){#x1-103067r66}</span>        return 1 \
<span
class="label">[](){#x1-103068r67}</span>    return x \* foo5(x - 1) \
<span class="label">[](){#x1-103069r68}</span> \
<span class="label">[](){#x1-103070r69}</span>foo5(10)
![PICT](SilBioComp182x.png) ![PICT](SilBioComp183x.png)

</div>

### <span class="titlemark">5.10 </span> [](){#x1-1040005.10}Loops {#loops .sectionHead}

Write the following, and save them to loops.py.

<div class="lstinputlisting">

[](){#x1-104001}  \
<span class="label">[](){#x1-104002r1}</span>\# for loops in Python \
<span class="label">[](){#x1-104003r2}</span>for i in range(5): \
<span class="label">[](){#x1-104004r3}</span>    print i \
<span class="label">[](){#x1-104005r4}</span> \
<span
class="label">[](){#x1-104006r5}</span>my\_list = \[0, 2, \~geronimo!\~, 3.0, True, False\] \
<span class="label">[](){#x1-104007r6}</span>for k in my\_list: \
<span class="label">[](){#x1-104008r7}</span>    print k \
<span class="label">[](){#x1-104009r8}</span> \
<span class="label">[](){#x1-104010r9}</span>total = 0 \
<span
class="label">[](){#x1-104011r10}</span>summands = \[0, 1, 11, 111, 1111\] \
<span class="label">[](){#x1-104012r11}</span>for s in summands: \
<span class="label">[](){#x1-104013r12}</span>    total = total + s \
<span class="label">[](){#x1-104014r13}</span>    print total \
<span class="label">[](){#x1-104015r14}</span> \
<span
class="label">[](){#x1-104016r15}</span>\# while loops  in Python \
<span class="label">[](){#x1-104017r16}</span>z = 0 \
<span class="label">[](){#x1-104018r17}</span>while z &lt; 100: \
<span class="label">[](){#x1-104019r18}</span>    z = z + 1 \
<span class="label">[](){#x1-104020r19}</span>    print (z) \
<span class="label">[](){#x1-104021r20}</span> \
<span class="label">[](){#x1-104022r21}</span>b = True \
<span class="label">[](){#x1-104023r22}</span>while b: \
<span
class="label">[](){#x1-104024r23}</span>    print \~GERONIMO! infinite loop! ctrl+c to stop!\~ \
<span class="label">[](){#x1-104025r24}</span>\# ctrl + c to stop!

</div>

------------------------------------------------------------------------

<div class="figure">

[](){#x1-104026r3}
<div class="center">

![PIC](Graphics/Geronimo.jpg)

</div>

\
<div class="caption">

<span class="id">Figure 5.3: </span><span class="content">In case you
were wondering who Geronimo was.</span>

</div>

</div>

------------------------------------------------------------------------

#### <span class="titlemark">5.10.1 </span> [](){#x1-1050005.10.1}List comprehensions {#list-comprehensions .subsectionHead}

Python oﬀers a way to combine loops, functions and logical tests in a
single line of code. Type the following in a script ﬁle called oaks.py:

<div class="lstinputlisting">

[](){#x1-105001}  \
<span
class="label">[](){#x1-105002r1}</span>\#\# Let’s find just those taxa that are oak trees from a list of species \
<span class="label">[](){#x1-105003r2}</span> \
<span
class="label">[](){#x1-105004r3}</span>taxa = \[ ’Quercus robur’, \
<span
class="label">[](){#x1-105005r4}</span>         ’Fraxinus excelsior’, \
<span
class="label">[](){#x1-105006r5}</span>         ’Pinus sylvestris’, \
<span
class="label">[](){#x1-105007r6}</span>         ’Quercus cerris’, \
<span
class="label">[](){#x1-105008r7}</span>         ’Quercus petraea’, \
<span class="label">[](){#x1-105009r8}</span>       \] \
<span class="label">[](){#x1-105010r9}</span> \
<span class="label">[](){#x1-105011r10}</span>def is\_an\_oak(name): \
<span
class="label">[](){#x1-105012r11}</span>    return name.lower().startswith(’quercus ’) \
<span class="label">[](){#x1-105013r12}</span> \
<span class="label">[](){#x1-105014r13}</span>\#\#Using for loops \
<span class="label">[](){#x1-105015r14}</span>oaks\_loops = set() \
<span class="label">[](){#x1-105016r15}</span>for species in taxa: \
<span
class="label">[](){#x1-105017r16}</span>    if is\_an\_oak(species): \
<span
class="label">[](){#x1-105018r17}</span>        oaks\_loops.add(species) \
<span class="label">[](){#x1-105019r18}</span>print oaks\_loops \
<span class="label">[](){#x1-105020r19}</span> \
<span
class="label">[](){#x1-105021r20}</span>\#\#Using list comprehensions \
<span
class="label">[](){#x1-105022r21}</span>oaks\_lc = set(\[species for species in taxa if is\_an\_oak(species)\]) \
<span class="label">[](){#x1-105023r22}</span>print oaks\_lc \
<span class="label">[](){#x1-105024r23}</span> \
<span
class="label">[](){#x1-105025r24}</span>\#\#Get names in UPPER CASE using for loops \
<span class="label">[](){#x1-105026r25}</span>oaks\_loops = set() \
<span class="label">[](){#x1-105027r26}</span>for species in taxa: \
<span
class="label">[](){#x1-105028r27}</span>    if is\_an\_oak(species): \
<span
class="label">[](){#x1-105029r28}</span>        oaks\_loops.add(species.upper()) \
<span class="label">[](){#x1-105030r29}</span>print oaks\_loops \
<span class="label">[](){#x1-105031r30}</span> \
<span
class="label">[](){#x1-105032r31}</span>\#\#Get names in UPPER CASE using list comprehensions \
<span
class="label">[](){#x1-105033r32}</span>oaks\_lc = set(\[species.upper() for species in taxa if is\_an\_oak(species)\]) \
<span class="label">[](){#x1-105034r33}</span>print oaks\_lc

</div>

Don’t go mad with list comprehensions — code readability is more
important than squeezing lots into a single line!
![PICT](SilBioComp184x.png) ![PICT](SilBioComp185x.png)

### <span class="titlemark">5.11 </span> [](){#x1-1060005.11}Practicals {#practicals-2 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository.

 1. 
:   Modify cfexercises.py to make it a “module” like control\_flow.py).
    That is, all the fooXX functions should take arguments from the user
    (like the functions inside control\_flow.py. Also, add some test
    arguments to show that they work (again, like control\_flow.py) —
    for example, “foo5(10)”. Thus, running cfexercises.py should now
    also output evaluations of all the fooXX modules along with a bunch
    of hellos.

 2. 
:   Open and complete the tasks in lc1.py, lc2.py, dictionary.py,
    tuple.py (you can tackle them in any order)

### <span class="titlemark">5.12 </span> [](){#x1-1070005.12}Functions, Modules, and code compartmentalization {#functions-modules-and-code-compartmentalization .sectionHead}

Ideally you should aim to compartmentalize your code into a bunch of
functions, typically written in a single .py ﬁle: this are Python
“modules”, which you were introduced to previously. Why bother with
modules? Because:

-   Keeping code compartmentalized is good for debugging, unit testing,
    and proﬁling (coming up later)
-   Makes code more compact by minimizing redundancies (write repeatedly
    used code segments as a module)
-   Allows you to import and use useful functions that you yourself
    wrote, just like you would from standard python packages (coming up)

#### <span class="titlemark">5.12.1 </span> [](){#x1-1080005.12.1}Importing Modules {#importing-modules .subsectionHead}

There are diﬀerent ways to import a module: ![PICT](SilBioComp186x.png)
![PICT](SilBioComp187x.png)

-   import my\_module, then functions in the module can be called as\
    my\_module.one\_of\_my\_functions().
-   from my\_module import my\_function imports only the function
    my\_function in the module my\_module. It can then be called as if
    it were part of the main ﬁle: my\_function().
-   import my\_module as mm imports the module my\_module and calls it
    mm. Convenient when the name of the module is very long. The
    functions in the module can be called
    as mm.one\_of\_my\_functions().
-   from my\_module import \*. Avoid doing this!\
    Why? – to avoid name conﬂicts!
-   You can also access variables written into modules: import
    my\_module, then\
    my\_module.one\_of\_my\_variables

### <span class="titlemark">5.13 </span> [](){#x1-1090005.13}Python packages {#python-packages .sectionHead}

A Python package is simply a directory of Python modules (quite like an
R package). Many packages, such as the following that I ﬁnd particularly
useful, are always available as standard libraries (just require import
from within python or ipython):

-   io: ﬁle input-output with \*.csv, \*.txt, etc.
-   subprocess: to run other programs, including multiple ones at the
    same time, including operating system-dependent functionality
-   sqlite3: for manipulating and querying sqlite databases
-   math: for mathematical functions

Scores of other packages are accessible by explicitly installing them
using\
sudo apt-get install python-packagename (as you did previously) or by
using pip. Some particularly mentionable ones are:

-   sciPy (<http://scipy.org>) contains a wide array of numerical tools
    for scientiﬁc computing, including NumPy for eﬃcient data crunching
-   matplotlib: for plotting (very matlab-like, requires scipy) (all
    packaged in pylab) ![PICT](SilBioComp188x.png)
    ![PICT](SilBioComp189x.png)
-   pandas provides a powerful set of methods to manipulating data, and
    comes with a DataFrame object similar to the R data frame.
-   scikit-learn
    [http://scikit-\_learn.org/](http://scikit-learn.org/){.url} for
    applying diﬀerent machine learning algorithms to data
-   ipython an enhanced python terminal (which we are currently using!)
-   jupyter an interactive notebook environment for exploratory data
    analysis, visulaization, and creation of interactive documents that
    can be shared. This course is in the process of being written
    entirely in Jupyter notebooks.
-   scrapy: for writing web spiders that crawl web sites and extract
    data from them
-   beautifulsoup: for parsing HTML and XML (can do what scrapy does)
-   biopython: for bioinformatics

Of course, you have already installed some of these (scipy, matplotlib).

For those of you interested in bioinformatics, the biopython package
will be particularly useful. We will not cover bioinformatics in any
depth within the python weeks, but you may want to try to use Python for
bioinformatics in other weeks, especially the Genomics weeks, and
perhaps use it for your own research projects. I suggest that if
bioinformatics is your thing, check out biopython — in particular the
worked examples at
<http://biopython.org/DIST/docs/tutorial/Tutorial.html>.

### <span class="titlemark">5.14 </span> [](){#x1-1100005.14}Practicals {#practicals-3 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository.

##### [](){#x1-1110005.14}Align DNA sequences {#align-dna-sequences .subsubsectionHead}

Align two DNA sequences such that they are as similar as possible.

The idea is to start with the longest string and try to position the
shorter string in all possible positions. For each position, count a
“score” : number of bases matched perfectly over the number of bases
attempted. Your tasks:

 1. 

:   Open and run Practicals/Code/align\_seqs.py — make sure you
    understand ![PICT](SilBioComp190x.png) ![PICT](SilBioComp191x.png)
    what each line is doing to do this)

    Now convert align\_seqs.py to a Python function that takes the DNA
    sequences as an input from a single external ﬁle and saves the best
    alignment along with its corresponding score in a single text ﬁle
    (your choice of format and ﬁle type) to an appropriate location. No
    external should be needed; that is, you should still only need to
    use python align\_seq.py to run it.

    For example, the input ﬁle can be a single .csv ﬁle with the two
    example sequences given at the top of the original script.

    Don’t forget to add docstrings where necessary/appropriate.

 2. 
:   Extra Credit – align all the .fasta sequences from Week 1; call the
    new script\
    align\_seqs\_fasta.py. Unlike align\_seqs.py, this script should
    take any two fasta sequences (in separate ﬁles) to be aligned
    as input. So this script would typically run by using explicit
    inputs, by calling something like python align\_seqs\_fasta.py
    seq1.csv seq2.csv. However, it should still run if no inputs were
    given, using two fasta sequences from Data as defaults.

### <span class="titlemark">5.15 </span> [](){#x1-1120005.15}Errors in your python code {#errors-in-your-python-code .sectionHead}

What do you want from your code? Rank the following by importance:

 1. 
:   it is very fast

 2. 
:   it gives me the right answer

 3. 
:   it is easy to read

 4. 
:   it uses lots of ’clever’ programming techniques

 5. 
:   it uses cool features of the language

Then, think about this:

-   If you are very lucky, your program will crash when you run it
-   If you are lucky, you will get an answer that is obviously wrong
    ![PICT](SilBioComp192x.png) ![PICT](SilBioComp193x.png)
-   If you are unlucky, you won’t notice until after publication
-   If you are very unlucky, someone else will notice it after
    publication

Ultimately, most of your time could well be spent error-checking and
ﬁxing them “debugging”, not writing code. You can debug when errors
appear, but why not just nip as many as you can in the bud? For this,
you would use unit testing.

#### <span class="titlemark">5.15.1 </span> [](){#x1-1130005.15.1}Unit testing {#unit-testing .subsectionHead}

Unit testing prevents the most common mistakes and helps write reliable
code. Indeed, there are many reasons for testing:

-   Can you prove (to yourself) that your code does what you think it
    does?
-   Did you think about the things that might go wrong?
-   Can you prove to other people that your code works?
-   Does it still all work if you ﬁx a bug?
-   Does it still all work if you add a feature?
-   Does it work with that new dataset?
-   Does it work on the latest version of the language (e.g., Python 3.x
    vs. 2.7.x)?
-   Does it work on Mac? on Linux? on Windows?
-   Does it work on 64 bit and 32 bit?
-   Does it work on an old version of a Mac?
-   Does it work on Harvey, or Imperial’s Linux cluster?

The idea is to write independent tests for the smallest units of code.
Why the smallest units? — to be able to retain the tests upon code
modiﬁcation.

##### [](){#x1-1140005.15.1}Unit testing with doctest {#unit-testing-with-doctest .subsubsectionHead}

![PICT](SilBioComp194x.png) ![PICT](SilBioComp195x.png)

Let’s try doctest, the simplest testing tool in python: simpletests for
each function are embedded in the docstring. Copy the ﬁle
control\_flow.py into the ﬁle test\_control\_flow.py and edit the
original function so:

<div class="lstinputlisting">

[](){#x1-114001}  \
<span class="label">[](){#x1-114002r1}</span>\#!/usr/bin/python \
<span class="label">[](){#x1-114003r2}</span> \
<span
class="label">[](){#x1-114004r3}</span>\~\~\~Some functions exemplifying the use of control statements\~\~\~ \
<span class="label">[](){#x1-114005r4}</span> \
<span
class="label">[](){#x1-114006r5}</span>\_\_author\_\_ = ’Your Name (Your.Name@your.institutional.email.address)’ \
<span class="label">[](){#x1-114007r6}</span>\_\_version\_\_ = ’0.0.1’ \
<span class="label">[](){#x1-114008r7}</span> \
<span class="label">[](){#x1-114009r8}</span>import sys \
<span
class="label">[](){#x1-114010r9}</span>import doctest \# Import the doctest module \
<span class="label">[](){#x1-114011r10}</span> \
<span class="label">[](){#x1-114012r11}</span>def even\_or\_odd(x=0): \
<span
class="label">[](){#x1-114013r12}</span>    \~\~\~Find whether a number x is even or odd. \
<span class="label">[](){#x1-114014r13}</span> \
<span
class="label">[](){#x1-114015r14}</span>    &gt;&gt;&gt; even\_or\_odd(10) \
<span class="label">[](){#x1-114016r15}</span>    ’10 is Even!’ \
<span class="label">[](){#x1-114017r16}</span> \
<span
class="label">[](){#x1-114018r17}</span>    &gt;&gt;&gt; even\_or\_odd(5) \
<span class="label">[](){#x1-114019r18}</span>    ’5 is Odd!’ \
<span class="label">[](){#x1-114020r19}</span> \
<span
class="label">[](){#x1-114021r20}</span>    whenever a float is provided, then the closest integer is used: \
<span
class="label">[](){#x1-114022r21}</span>    &gt;&gt;&gt; even\_or\_odd(3.2) \
<span class="label">[](){#x1-114023r22}</span>    ’3 is Odd!’ \
<span class="label">[](){#x1-114024r23}</span> \
<span
class="label">[](){#x1-114025r24}</span>    in case of negative numbers, the positive is taken: \
<span
class="label">[](){#x1-114026r25}</span>    &gt;&gt;&gt; even\_or\_odd(-2) \
<span class="label">[](){#x1-114027r26}</span>    ’-2 is Even!’ \
<span class="label">[](){#x1-114028r27}</span> \
<span class="label">[](){#x1-114029r28}</span>    \~\~\~ \
<span
class="label">[](){#x1-114030r29}</span>    \#Define function to be tested \
<span class="label">[](){#x1-114031r30}</span>    if x % 2 == 0: \
<span
class="label">[](){#x1-114032r31}</span>        return \~%d is Even!\~ % x \
<span
class="label">[](){#x1-114033r32}</span>    return \~%d is Odd!\~ % x \
<span class="label">[](){#x1-114034r33}</span> \
<span
class="label">[](){#x1-114035r34}</span>\#\#\#\#\#\#\# I SUPPRESSED THIS BLOCK: WHY? \#\#\#\#\#\#\# \
<span class="label">[](){#x1-114036r35}</span> \
<span class="label">[](){#x1-114037r36}</span>\# def main(argv): \
<span
class="label">[](){#x1-114038r37}</span>    \# print even\_or\_odd(22) \
<span
class="label">[](){#x1-114039r38}</span>    \# print even\_or\_odd(33) \
<span class="label">[](){#x1-114040r39}</span>    \# return 0 \
<span class="label">[](){#x1-114041r40}</span> \
<span
class="label">[](){#x1-114042r41}</span>\# if (\_\_name\_\_ == \~\_\_main\_\_\~): \
<span
class="label">[](){#x1-114043r42}</span>    \# status = main(sys.argv) \
<span
class="label">[](){#x1-114044r43}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-114045r44}</span> \
<span
class="label">[](){#x1-114046r45}</span>doctest.testmod()   \# To run with embedded tests

</div>

Now type run test\_control\_flow.py -v :

<div id="listing-96" class="lstlisting">

<span
class="label">[](){#x1-114047r1}</span>In \[\]: run  test\_control\_flow.py -v \
<span class="label">[](){#x1-114048r2}</span>Trying: \
<span class="label">[](){#x1-114049r3}</span>    even\_or\_odd(10) \
<span class="label">[](){#x1-114050r4}</span>Expecting: \
<span class="label">[](){#x1-114051r5}</span>    ’10 is Even!’ \
<span class="label">[](){#x1-114052r6}</span>ok \
<span class="label">[](){#x1-114053r7}</span>Trying: \
<span class="label">[](){#x1-114054r8}</span>    even\_or\_odd(5) \
<span class="label">[](){#x1-114055r9}</span>Expecting: \
<span class="label">[](){#x1-114056r10}</span>    ’5 is Odd!’ \
<span class="label">[](){#x1-114057r11}</span>ok \
<span class="label">[](){#x1-114058r12}</span>Trying: \
<span class="label">[](){#x1-114059r13}</span>    even\_or\_odd(3.2) \
<span class="label">[](){#x1-114060r14}</span>Expecting: \
<span class="label">[](){#x1-114061r15}</span>    ’3 is Odd!’ \
<span class="label">[](){#x1-114062r16}</span>ok \
<span class="label">[](){#x1-114063r17}</span>Trying: \
<span class="label">[](){#x1-114064r18}</span>    even\_or\_odd(-2) \
<span class="label">[](){#x1-114065r19}</span>Expecting: \
<span class="label">[](){#x1-114066r20}</span>    ’-2 is Even!’ \
<span class="label">[](){#x1-114067r21}</span>ok \
<span class="label">[](){#x1-114068r22}</span>1 items had no tests: \
<span class="label">[](){#x1-114069r23}</span>    \_\_main\_\_ \
<span
class="label">[](){#x1-114070r24}</span>1 items passed all tests: \
<span
class="label">[](){#x1-114071r25}</span>   4 tests in \_\_main\_\_.even\_or\_odd \
<span class="label">[](){#x1-114072r26}</span>4 tests in 2 items. \
<span class="label">[](){#x1-114073r27}</span>4 passed and 0 failed. \
<span class="label">[](){#x1-114074r28}</span>Test passed.

</div>

You can also run doctest “on the ﬂy”, without writing doctest.testmod()
in the code by typing in a terminal: python -m doctest -v
your\_function\_to\_test.py

SVG-Viewer needed.

#### <span class="titlemark">5.15.2 </span> [](){#x1-1150005.15.2}Debugging {#debugging .subsectionHead}

OK, so you unit-tested, let’s go look at life through beer-goggles...
BUT NO! YOU WILL VERY LIKELY RUN INTO BUGS!

Bugs happen, inevitably, in life and programming. You need to ﬁnd and
debug them. Banish all thoughts of littering your code with print
statements to ﬁnd bugs.

Enter the debugger. The command pdb turns on the python debugger. Type
the following in a ﬁle and ![PICT](SilBioComp196x.png)
![PICT](SilBioComp197x.png) save as debugme.py in your Code directory:

<div class="lstinputlisting">

[](){#x1-115001}  \
<span class="label">[](){#x1-115002r1}</span>def createabug(x): \
<span class="label">[](){#x1-115003r2}</span>    y = x\*\*4 \
<span class="label">[](){#x1-115004r3}</span>    z = 0. \
<span class="label">[](){#x1-115005r4}</span>    y = y/z \
<span class="label">[](){#x1-115006r5}</span>    return y \
<span class="label">[](){#x1-115007r6}</span> \
<span class="label">[](){#x1-115008r7}</span>createabug(25)

</div>

Now run it:

<div id="listing-97" class="lstlisting">

<span class="label">[](){#x1-115009r1}</span>In \[\]: %run debugme.py \
<span class="label">[](){#x1-115010r2}</span>\[lots of text\] \
<span class="label">[](){#x1-115011r3}</span>createabug(x) \
<span class="label">[](){#x1-115012r4}</span>      2     y = x\*\*4 \
<span class="label">[](){#x1-115013r5}</span>      3     z = 0. \
<span class="label">[](){#x1-115014r6}</span>----&gt; 4     y = y/z \
<span class="label">[](){#x1-115015r7}</span>      5     return y \
<span class="label">[](){#x1-115016r8}</span>      6 \
<span class="label">[](){#x1-115017r9}</span> \
<span
class="label">[](){#x1-115018r10}</span>ZeroDivisionError: float division by zero

</div>

OK, so let’s %pdb it

<div id="listing-98" class="lstlisting">

<span class="label">[](){#x1-115019r1}</span>In \[\]: %pdb \
<span
class="label">[](){#x1-115020r2}</span>Automatic pdb calling has been turned ON \
<span class="label">[](){#x1-115021r3}</span> \
<span class="label">[](){#x1-115022r4}</span>In \[\]: run debugme.py \
<span class="label">[](){#x1-115023r5}</span>\[lots of text\] \
<span
class="label">[](){#x1-115024r6}</span>ZeroDivisionError: float division by zero \
<span class="label">[](){#x1-115025r7}</span>&gt; createabug() \
<span class="label">[](){#x1-115026r8}</span>      3     z = 0. \
<span class="label">[](){#x1-115027r9}</span>----&gt; 4     y = y/z \
<span class="label">[](){#x1-115028r10}</span>      5     return y \
<span class="label">[](){#x1-115029r11}</span> \
<span class="label">[](){#x1-115030r12}</span>ipdb&gt;

</div>

Now we’re in the debugger shell, and can use the following commands to
naviagate and test the code line by line or block by block:

SVG-Viewer needed.

<div class="tabular">

n

move to the next line

ENTER

repeat the previous command

s

“step” into function or procedure (i.e., continue the debugging inside
the function, as opposed to simply run it)

p x

print variable x

pp locals()

pretty print all variables and objects in current workspace scope

c

continue until next break-point

q

quit

l

print the code surrounding the current position (you can specify how
many)

r

continue until the end of the function

</div>

\
![PICT](SilBioComp198x.png) ![PICT](SilBioComp199x.png)

So let’s continue our debugging:

<div id="listing-99" class="lstlisting">

<span class="label">[](){#x1-115031r1}</span>ipdb&gt; p x \
<span class="label">[](){#x1-115032r2}</span>25 \
<span class="label">[](){#x1-115033r3}</span>ipdb&gt; p y \
<span class="label">[](){#x1-115034r4}</span>390625 \
<span class="label">[](){#x1-115035r5}</span>ipdb&gt; p z \
<span class="label">[](){#x1-115036r6}</span>0.0 \
<span class="label">[](){#x1-115037r7}</span>ipdb&gt; p y/z \
<span
class="label">[](){#x1-115038r8}</span>\*\*\* ZeroDivisionError: ZeroDivisionError \
<span
class="label">[](){#x1-115039r9}</span>(’float division by zero’,) \
<span class="label">[](){#x1-115040r10}</span>ipdb&gt; l \
<span
class="label">[](){#x1-115041r11}</span>      1 def createabug(x): \
<span class="label">[](){#x1-115042r12}</span>      2     y = x\*\*4 \
<span class="label">[](){#x1-115043r13}</span>      3     z = 0. \
<span class="label">[](){#x1-115044r14}</span>----&gt; 4     y = y/z \
<span class="label">[](){#x1-115045r15}</span>      5     return y \
<span class="label">[](){#x1-115046r16}</span>      6 \
<span class="label">[](){#x1-115047r17}</span>      7 createabug(25) \
<span class="label">[](){#x1-115048r18}</span> \
<span class="label">[](){#x1-115049r19}</span>ipdb&gt; q \
<span class="label">[](){#x1-115050r20}</span> \
<span class="label">[](){#x1-115051r21}</span>In \[\]: %pdb \
<span
class="label">[](){#x1-115052r22}</span>Automatic pdb calling has been turned OFF

</div>

SVG-Viewer needed.

#### <span class="titlemark">5.15.3 </span> [](){#x1-1160005.15.3}Paranoid programming: debugging with breakpoints {#paranoid-programming-debugging-with-breakpoints .subsectionHead}

You may want to pause the program run and inspect a given line or block
of code (why? — impromptu unit-testing is one reason). To do so, simply
put this snippet of code where you want to pause and start a debugging
session and then run the program again:

<div id="listing-100" class="lstlisting">

<span
class="label">[](){#x1-116001r1}</span>import ipdb; ipdb.set\_trace()

</div>

Or, you can use import pdb; pdb.set\_trace()

Alternatively, running the code with the ﬂag %run -d starts a debugging
session from the ﬁrst line of your code (you can also specify the line
to stop at). If you are serious about programming, please start using a
debugger (R, Python, whatever...)!

### <span class="titlemark">5.16 </span> [](){#x1-1170005.16}Practicals {#practicals-4 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository. ![PICT](SilBioComp200x.png) ![PICT](SilBioComp201x.png)

##### [](){#x1-1180005.16}Missing oaks problem {#missing-oaks-problem .subsubsectionHead}

 1. 
:   Open and run the code test\_oaks.py — there’s a bug, for no oaks are
    being found! (where’s TestOaksData.csv?)

 2. 
:   Fix the bug (hint: import ipdb; ipdb.set\_trace())

 3. 
:   Now, write doctests to make sure that, bug or no bug, your
    is\_an\_oak function is working as expected (hint: $> > >$
    is\_an\_oak(’Fagus sylvatica’) should return False)

 4. 
:   If you wrote good doctests, you will note that you found another
    error that you might not have come across just by debugging (hint:
    what happens if you try the doctest with ’Quercuss’ instead
    of ’Quercus’?). How would you ﬁx the new error you found using the
    doctest?

### <span class="titlemark">5.17 </span> [](){#x1-1190005.17}Practicals wrap-up {#practicals-wrap-up-1 .sectionHead}

 1. 
:   Review and make sure you can run all the commands, code fragments,
    and scripts we have till now and get the expected outputs — all
    scripts should work on any other linux laptop.

 2. 
:   Run boilerplate.py and control\_flow.py from the bash terminal
    instead of from within the ipython shell (try both python and
    ipython from the bash)

 3. 
:   Include an appropriate docstring (if one is missing) at the
    beginning of each of each of the python script / module ﬁles you
    have written, as well as at the start of every function
    (or sub-module) in a module. ![PICT](SilBioComp202x.png)
    ![PICT](SilBioComp203x.png)

 4. 
:   Also annotate your code lines as much and as often as necessary
    using \#.

 5. 
:   Keep all code ﬁles organized in CMEECourseWork/Week2/Code

<div class="center">

git add, commitand pushall your code and data to your git repository by
next Wednesday 5 PM.

</div>

### <span class="titlemark">5.18 </span> [](){#x1-1200005.18}Readings and Resources {#readings-and-resources .sectionHead}

-   Code like a Pythonista: Idiomatic python (Google it)
-   Also good: the Google python Style Guide
-   Browse the python tutorial: <https://docs.python.org/3/tutorial/>
-   For functions and modules:\
    <https://learnpythonthehardway.org/book/ex40.html>
-   For IPython:\
    [http://ipython.org/ipython-\_doc/stable/interactive/tips.html](http://ipython.org/ipython-doc/stable/interactive/tips.html){.url}
-   Cookbooks can be very useful:
    <https://github.com/ipython/ipython/wiki>
-   Look up <https://docs.python.org/2/library/index.html> – Read about
    the packages you think will be important to you
-   Some of you might ﬁnd the python package biopython particularly
    useful — check out <http://biopython.org/>, and especially, the
    cookbook

![PICT](SilBioComp204x.png) ![PICT](SilBioComp205x.png)

In general, scores of good module/package-speciﬁc cookbooks are out
there — google “cookbook” along with the name of the package you are
interested in (e.g., “scipy cookbook”). ![PICT](SilBioComp206x.png)
![PICT](SilBioComp207x.png)

<span class="titlemark">Chapter 6</span>\
[](){#x1-1210006}Advanced Biological Computing in Python {#chapter6-advanced-biological-computing-in-python .chapterHead}
--------------------------------------------------------

<div class="epigraph">

...some things in life are bad. They can really make you mad. Other
things just make you swear and curse. When you’re chewing on life’s
gristle, don’t grumble; give a whistle, and this’ll help things turn out
for the best. And... always look on the bright side of life...

------------------------------------------------------------------------

<div class="episource">

—Guess who?

</div>

</div>

In this chapter, we will cover a some topics in Python that will
round-oﬀ your python training:

-   Numerical computing in python
-   “Reading” text data using regular expressions in python
-   Databases, and using python to build and manage them
-   Using python to build workﬂows

The last topic will be necessary for your Miniproject, which will
involve building a reproducible computational workﬂow.

### <span class="titlemark">6.1 </span> [](){#x1-1220006.1}Numerical computing in python {#numerical-computing-in-python .sectionHead}

The python package scipy can help you do serious number crunching
including,

-   Linear algebra (matrix and vector operations)
-   Numerical integration (Solving ODEs)
-   Fourier transforms
-   Interpolation
-   Calculating special functions (incomplete Gamma, Bessel, etc.)
-   Generation of random numbers
-   Using statistical functions and transformations

In the following, we will use the array data structure in scipy for data
manipulations and calculations. Scipy arrays are objects, and are
similar in some respects to python lists, but are more naturally
multidimensional, homogeneous in type (the default is ﬂoat), and allow
eﬃcient (fast) manipulations. Thus scipy arrays are analogous to the R
matrix data object/structure. ![PICT](SilBioComp208x.png)
![PICT](SilBioComp209x.png)

SVG-Viewer needed.

So let’s try scipy:

<div id="listing-101" class="lstlisting">

<span class="label">[](){#x1-122001r1}</span>In \[\]: import scipy \
<span class="label">[](){#x1-122002r2}</span> \
<span
class="label">[](){#x1-122003r3}</span>In \[\]: a = scipy.array(range(5)) \# a one-dimensional array \
<span class="label">[](){#x1-122004r4}</span> \
<span class="label">[](){#x1-122005r5}</span>In \[\]: a \
<span
class="label">[](){#x1-122006r6}</span>Out\[\]: array(\[0, 1, 2, 3, 4\]) \
<span class="label">[](){#x1-122007r7}</span> \
<span class="label">[](){#x1-122008r8}</span>In \[\]: type(a) \
<span class="label">[](){#x1-122009r9}</span>Out\[\]: numpy.ndarray \
<span class="label">[](){#x1-122010r10}</span> \
<span class="label">[](){#x1-122011r11}</span>In \[\]: type(a\[0\]) \
<span class="label">[](){#x1-122012r12}</span>Out \[\]: numpy.int64

</div>

So all elements in a are of type int because that is what range()
returns (try ?range).

------------------------------------------------------------------------

<div class="figure">

![PICT](SilBioComp210x.png) ![PICT](SilBioComp211x.png)
[](){#x1-122013r1} ![PICT](SilBioComp212x.png)
![PICT](SilBioComp213x.png)
![PIC](Graphics/numpyarray.png)\

<div class="caption">

<span class="id">Figure 6.1: </span><span class="content">A graphical
depiction of numpy/scipy arrays, which can have multiple dimensions
(even greater than 3). From
<http://pages.physics.cornell.edu/~myers/teaching/ComputationalMethods/python/arrays.html></span>

</div>

![PICT](SilBioComp214x.png) ![PICT](SilBioComp215x.png)

</div>

------------------------------------------------------------------------

You can also specify the data type of the array:

<div id="listing-102" class="lstlisting">

<span
class="label">[](){#x1-122014r1}</span>In \[\]: a = scipy.array(range(5), float) \
<span class="label">[](){#x1-122015r2}</span> \
<span class="label">[](){#x1-122016r3}</span>In \[\]: a \
<span
class="label">[](){#x1-122017r4}</span>Out\[\]: array(\[ 0.,  1.,  2.,  3.,  4.\]) \
<span class="label">[](){#x1-122018r5}</span> \
<span
class="label">[](){#x1-122019r6}</span>In \[\]: a.dtype \# Check type \
<span class="label">[](){#x1-122020r7}</span>Out\[\]: dtype(’float64’)

</div>

You can also get a 1-D arrays as follows:

<div id="listing-103" class="lstlisting">

<span
class="label">[](){#x1-122021r1}</span>In \[\]: x = scipy.arange(5) \
<span class="label">[](){#x1-122022r2}</span> \
<span class="label">[](){#x1-122023r3}</span>In \[\]: x \
<span
class="label">[](){#x1-122024r4}</span>Out\[8\]: array(\[0, 1, 2, 3, 4\]) \
<span class="label">[](){#x1-122025r5}</span> \
<span
class="label">[](){#x1-122026r6}</span>In \[9\]: x = scipy.arange(5.) \#directly specify float using decimal \
<span class="label">[](){#x1-122027r7}</span> \
<span class="label">[](){#x1-122028r8}</span>In \[10\]: x \
<span
class="label">[](){#x1-122029r9}</span>Out\[10\]: array(\[ 0.,  1.,  2.,  3.,  4.\])

</div>

As with other Python variables (e.g., created as a list or a
dictionary), you can apply methods to variables created as scipy arrays.
For example, TAB after x. to see methods you can apply to x:

<div id="listing-104" class="lstlisting">

<span class="label">[](){#x1-122030r1}</span>In \[11\]: x. \
<span
class="label">[](){#x1-122031r2}</span>x.T             x.conj          x.fill \
<span
class="label">[](){#x1-122032r3}</span>x.nbytes        x.round         x.take \
<span
class="label">[](){#x1-122033r4}</span>x.all           x.conjugate     x.flags \
<span
class="label">[](){#x1-122034r5}</span>x.ndim          x.searchsorted  x.tofile \
<span
class="label">[](){#x1-122035r6}</span>x.any           x.copy          x.flat \
<span
class="label">[](){#x1-122036r7}</span>x.newbyteorder  x.setfield      x.tolist \
<span
class="label">[](){#x1-122037r8}</span>x.argmax        x.ctypes        x.flatten \
<span
class="label">[](){#x1-122038r9}</span>x.nonzero       x.setflags      x.tostring \
<span
class="label">[](){#x1-122039r10}</span>x.argmin        x.cumprod       x.getfield \
<span
class="label">[](){#x1-122040r11}</span>x.prod          x.shape         x.trace \
<span
class="label">[](){#x1-122041r12}</span>x.argsort       x.cumsum        x.imag \
<span
class="label">[](){#x1-122042r13}</span>x.ptp           x.size          x.transpose \
<span
class="label">[](){#x1-122043r14}</span>x.astype        x.data          x.item \
<span
class="label">[](){#x1-122044r15}</span>x.put           x.sort          x.var \
<span
class="label">[](){#x1-122045r16}</span>x.base          x.diagonal      x.itemset \
<span
class="label">[](){#x1-122046r17}</span>x.ravel         x.squeeze       x.view \
<span
class="label">[](){#x1-122047r18}</span>x.byteswap      x.dot           x.itemsize \
<span class="label">[](){#x1-122048r19}</span>x.real          x.std \
<span
class="label">[](){#x1-122049r20}</span>x.choose        x.dtype         x.max \
<span
class="label">[](){#x1-122050r21}</span>x.repeat        x.strides \
<span
class="label">[](){#x1-122051r22}</span>x.clip          x.dump          x.mean \
<span class="label">[](){#x1-122052r23}</span>x.reshape       x.sum \
<span
class="label">[](){#x1-122053r24}</span>x.compress      x.dumps         x.min \
<span
class="label">[](){#x1-122054r25}</span>x.resize        x.swapaxes \
<span class="label">[](){#x1-122055r26}</span> \
<span class="label">[](){#x1-122056r27}</span>In \[12\]: x.shape \
<span class="label">[](){#x1-122057r28}</span>Out\[12\]: (5,)

</div>

SVG-Viewer needed.

You can also convert to and from Python lists:

<div id="listing-105" class="lstlisting">

<span
class="label">[](){#x1-122058r1}</span>In \[\]: b = scipy.array(\[i for i in range(100) if i%2==1\]) \#odd numbers \
<span class="label">[](){#x1-122059r2}</span>between 1 and 100 \
<span class="label">[](){#x1-122060r3}</span> \
<span
class="label">[](){#x1-122061r4}</span>In \[\]: c = b.tolist() \#convert back to list

</div>

To make a matrix, you need a 2-D scipy array:

<div id="listing-106" class="lstlisting">

<span
class="label">[](){#x1-122062r1}</span>In \[14\]: mat = scipy.array(\[\[0, 1\], \[2, 3\]\]) \
<span class="label">[](){#x1-122063r2}</span> \
<span class="label">[](){#x1-122064r3}</span>In \[\]: mat.shape \
<span class="label">[](){#x1-122065r4}</span>Out\[\]: (2, 2)

</div>

![PICT](SilBioComp216x.png) ![PICT](SilBioComp217x.png)

#### <span class="titlemark">6.1.1 </span> [](){#x1-1230006.1.1}Indexing and accessing arrays {#indexing-and-accessing-arrays .subsectionHead}

As with other Python data objects such as lists, scipy array elements
can be accessed using square brackets (\[\]) with the \[row,column\]
reference. Indexing of scipy arrays works like that for other data
strauctures, with index values starting at 0. So, you can obtain all the
elements of a particular row as:

<div id="listing-107" class="lstlisting">

<span
class="label">[](){#x1-123001r1}</span>In \[\]: mat\[1\] \# accessing whole 2nd row, remember indexing starts at \
<span class="label">[](){#x1-123002r2}</span>0 \
<span class="label">[](){#x1-123003r3}</span>Out\[\]: array(\[2, 3\]) \
<span class="label">[](){#x1-123004r4}</span> \
<span
class="label">[](){#x1-123005r5}</span>In \[57\]: mat\[:,1\] \#accessing whole second column \
<span class="label">[](){#x1-123006r6}</span>Out\[57\]: array(\[1, 3\])

</div>

And accessing particular elements:

<div id="listing-108" class="lstlisting">

<span
class="label">[](){#x1-123007r1}</span>In \[\]: mat\[0,0\] \# 1st row, 1st column element \
<span class="label">[](){#x1-123008r2}</span>Out\[\]: 0 \
<span
class="label">[](){#x1-123009r3}</span>In \[\]: mat\[1,0\] \# 2nd row, 1st column element \
<span class="label">[](){#x1-123010r4}</span>Out\[\]: 2

</div>

Note that (like all other programming languages) row index always comes
before column index. That is, mat\[1\] is always going to mean “whole
second row”, and mat\[1,1\] means 1st row and 1st column element.
Therefore, to access the whole second column, you need:

<div id="listing-109" class="lstlisting">

<span
class="label">[](){#x1-123011r1}</span>In \[\]: mat\[:,0\] \#accessing whole first column \
<span class="label">[](){#x1-123012r2}</span>Out\[\]: array(\[0, 2\])

</div>

SVG-Viewer needed.

#### <span class="titlemark">6.1.2 </span> [](){#x1-1240006.1.2}Manipulating arrays {#manipulating-arrays .subsectionHead}

Manipulating scipy arrays is pretty straightforward.
![PICT](SilBioComp218x.png) ![PICT](SilBioComp219x.png)

SVG-Viewer needed.

##### [](){#x1-1250006.1.2}Replacing, adding or deleting elements {#replacing-adding-or-deleting-elements .subsubsectionHead}

Let’s look at how you can replace, add, or delete an array element (a
single entry, or whole row(s) or whole column(s)):

<div id="listing-111" class="lstlisting">

<span
class="label">[](){#x1-125001r1}</span>In \[\]: mat\[0,0\] = -1 \#replace a single element \
<span class="label">[](){#x1-125002r2}</span> \
<span class="label">[](){#x1-125003r3}</span>In \[\]: mat \
<span class="label">[](){#x1-125004r4}</span>Out\[\]: \
<span class="label">[](){#x1-125005r5}</span>array(\[\[-1,  1\], \
<span class="label">[](){#x1-125006r6}</span>       \[ 2,  3\]\]) \
<span class="label">[](){#x1-125007r7}</span> \
<span
class="label">[](){#x1-125008r8}</span>In \[\]: mat\[:,0\] = \[12,12\] \#replace whole column \
<span class="label">[](){#x1-125009r9}</span> \
<span class="label">[](){#x1-125010r10}</span>In \[\]: mat \
<span class="label">[](){#x1-125011r11}</span>Out\[\]: \
<span class="label">[](){#x1-125012r12}</span>array(\[\[12,  1\], \
<span class="label">[](){#x1-125013r13}</span>       \[12,  3\]\]) \
<span class="label">[](){#x1-125014r14}</span> \
<span
class="label">[](){#x1-125015r15}</span>In \[\]: scipy.append(mat, \[\[12,12\]\], axis = 0) \#append row, note axis \
<span class="label">[](){#x1-125016r16}</span>specification \
<span class="label">[](){#x1-125017r17}</span>Out\[\]: \
<span class="label">[](){#x1-125018r18}</span>array(\[\[12,  1\], \
<span class="label">[](){#x1-125019r19}</span>       \[12,  3\], \
<span class="label">[](){#x1-125020r20}</span>       \[12, 12\]\]) \
<span class="label">[](){#x1-125021r21}</span> \
<span
class="label">[](){#x1-125022r22}</span>In \[\]: scipy.append(mat, \[\[12\],\[12\]\], axis = 1) \#append column \
<span class="label">[](){#x1-125023r23}</span>Out\[\]: \
<span class="label">[](){#x1-125024r24}</span>array(\[\[12,  1, 12\], \
<span class="label">[](){#x1-125025r25}</span>       \[12,  3, 12\]\]) \
<span class="label">[](){#x1-125026r26}</span> \
<span
class="label">[](){#x1-125027r27}</span>In \[\]: newRow = \[\[12,12\]\] \#create existing row \
<span class="label">[](){#x1-125028r28}</span> \
<span
class="label">[](){#x1-125029r29}</span>In \[\]: mat = scipy.append(mat, newRow, axis = 0) \#append that existing row \
<span class="label">[](){#x1-125030r30}</span>Out\[\]: \
<span class="label">[](){#x1-125031r31}</span>array(\[\[12,  1\], \
<span class="label">[](){#x1-125032r32}</span>       \[12,  3\], \
<span class="label">[](){#x1-125033r33}</span>       \[12, 12\]\]) \
<span class="label">[](){#x1-125034r34}</span> \
<span
class="label">[](){#x1-125035r35}</span>In \[\]: scipy.delete(mat, 2, 0) \#Delete 3rd row \
<span class="label">[](){#x1-125036r36}</span>Out\[\]: \
<span class="label">[](){#x1-125037r37}</span>array(\[\[12,  1\], \
<span class="label">[](){#x1-125038r38}</span>       \[12,  3\]\])

</div>

And concatenation:

<div id="listing-112" class="lstlisting">

<span
class="label">[](){#x1-125039r1}</span>In \[\]: mat = scipy.array(\[\[0, 1\], \[2, 3\]\]) \
<span class="label">[](){#x1-125040r2}</span> \
<span
class="label">[](){#x1-125041r3}</span>In \[\]: mat0 = scipy.array(\[\[0, 10\], \[-1, 3\]\]) \
<span class="label">[](){#x1-125042r4}</span> \
<span
class="label">[](){#x1-125043r5}</span>In \[\]: scipy.concatenate((mat, mat0), axis = 0) \
<span class="label">[](){#x1-125044r6}</span>Out\[\]: \
<span class="label">[](){#x1-125045r7}</span>array(\[\[ 0,  1\], \
<span class="label">[](){#x1-125046r8}</span>       \[ 2,  3\], \
<span class="label">[](){#x1-125047r9}</span>       \[ 0, 10\], \
<span class="label">[](){#x1-125048r10}</span>       \[-1,  3\]\])

</div>

##### [](){#x1-1260006.1.2}Flattening or reshaping arrays {#flattening-or-reshaping-arrays .subsubsectionHead}

You can also “ﬂatten” or “melt” arrays, that is, change array dimensions
(e.g., from a matrix to a vector):

<div id="listing-113" class="lstlisting">

<span class="label">[](){#x1-126001r1}</span>In \[\]: mat.ravel() \
<span
class="label">[](){#x1-126002r2}</span>Out\[\]: array(\[0, 1, 2, 3\]) \# NOTE: ravel is row-priority \
<span class="label">[](){#x1-126003r3}</span> \
<span
class="label">[](){#x1-126004r4}</span>In \[\]: mat.reshape((4,1)) \# this is different from ravel - check ?scipy.reshape \
<span class="label">[](){#x1-126005r5}</span>Out\[66\]: \
<span class="label">[](){#x1-126006r6}</span>array(\[\[0\], \
<span class="label">[](){#x1-126007r7}</span>       \[1\], \
<span class="label">[](){#x1-126008r8}</span>       \[2\], \
<span class="label">[](){#x1-126009r9}</span>       \[3\]\]) \
<span class="label">[](){#x1-126010r10}</span> \
<span
class="label">[](){#x1-126011r11}</span>In \[\]: mat.reshape((1,4)) \# NOTE: reshaping is also row-priority \
<span
class="label">[](){#x1-126012r12}</span>Out\[\]: array(\[\[0, 1, 2, 3\]\]) \
<span class="label">[](){#x1-126013r13}</span> \
<span
class="label">[](){#x1-126014r14}</span>In \[\]: mat.reshape((3, 1)) \# But total elements must remain the same! \
<span
class="label">[](){#x1-126015r15}</span>--------------------------------------------------------------------------- \
<span
class="label">[](){#x1-126016r16}</span>ValueError                                Traceback (most recent call last) \
<span
class="label">[](){#x1-126017r17}</span>&lt;ipython-input-81-ba16cb0744eb&gt; in &lt;module&gt;() \
<span
class="label">[](){#x1-126018r18}</span>----&gt; 1 mat.reshape((3, 1)) \
<span class="label">[](){#x1-126019r19}</span> \
<span
class="label">[](){#x1-126020r20}</span>ValueError: total size of new array must be unchanged
![PICT](SilBioComp220x.png) ![PICT](SilBioComp221x.png)

</div>

This is a bit diﬀerent than how R behaves (coming up in Chapters
([7](#x1-1600007)–?? )), where you won’t get an error (R “recycles”
data), which is more dangerous!

#### <span class="titlemark">6.1.3 </span> [](){#x1-1270006.1.3}Pre-allocating arrays {#pre-allocating-arrays .subsectionHead}

As in other computer languages, it is usually more eﬃcient to
preallocate a array rather than append / insert / concatenate addtional
elelents, rows, or columns. For example, if you know the size of your
matrix or array, you can inititalize it with ones or zeros:

<div id="listing-114" class="lstlisting">

<span
class="label">[](){#x1-127001r1}</span>In \[\]: scipy.ones((4,2)) \#(4,2) are the (row,col) array dimensions \
<span class="label">[](){#x1-127002r2}</span>Out\[\]: \
<span class="label">[](){#x1-127003r3}</span>array(\[\[ 1.,  1.\], \
<span class="label">[](){#x1-127004r4}</span>       \[ 1.,  1.\], \
<span class="label">[](){#x1-127005r5}</span>       \[ 1.,  1.\], \
<span class="label">[](){#x1-127006r6}</span>       \[ 1.,  1.\]\]) \
<span class="label">[](){#x1-127007r7}</span> \
<span
class="label">[](){#x1-127008r8}</span>In \[\]: scipy.zeros((4,2)) \# or zeros \
<span class="label">[](){#x1-127009r9}</span>Out\[\]: \
<span class="label">[](){#x1-127010r10}</span>array(\[\[ 0.,  0.\], \
<span class="label">[](){#x1-127011r11}</span>       \[ 0.,  0.\], \
<span class="label">[](){#x1-127012r12}</span>       \[ 0.,  0.\], \
<span class="label">[](){#x1-127013r13}</span>       \[ 0.,  0.\]\]) \
<span class="label">[](){#x1-127014r14}</span> \
<span
class="label">[](){#x1-127015r15}</span>In \[\]: m = scipy.identity(4) \#create an identity matrix \
<span class="label">[](){#x1-127016r16}</span> \
<span class="label">[](){#x1-127017r17}</span>In \[\]: m \
<span class="label">[](){#x1-127018r18}</span>Out\[\]: \
<span
class="label">[](){#x1-127019r19}</span>array(\[\[ 1.,  0.,  0.,  0.\], \
<span
class="label">[](){#x1-127020r20}</span>       \[ 0.,  1.,  0.,  0.\], \
<span
class="label">[](){#x1-127021r21}</span>       \[ 0.,  0.,  1.,  0.\], \
<span
class="label">[](){#x1-127022r22}</span>       \[ 0.,  0.,  0.,  1.\]\]) \
<span class="label">[](){#x1-127023r23}</span> \
<span
class="label">[](){#x1-127024r24}</span>In \[\]: m.fill(16) \#fill the matrix with 16 \
<span class="label">[](){#x1-127025r25}</span> \
<span class="label">[](){#x1-127026r26}</span>In \[\]: m \
<span class="label">[](){#x1-127027r27}</span>Out\[26\]: \
<span
class="label">[](){#x1-127028r28}</span>array(\[\[ 16.,  16.,  16.,  16.\], \
<span
class="label">[](){#x1-127029r29}</span>       \[ 16.,  16.,  16.,  16.\], \
<span
class="label">[](){#x1-127030r30}</span>       \[ 16.,  16.,  16.,  16.\], \
<span
class="label">[](){#x1-127031r31}</span>       \[ 16.,  16.,  16.,  16.\]\])

</div>

#### <span class="titlemark">6.1.4 </span> [](){#x1-1280006.1.4}scipy matrices {#scipy-matrices .subsectionHead}

Scipy also has a matrix data structure class. Scipy matrices are
strictly 2-Dimensional, while scipy arrays are N-Dimensional. Matrix
objects are a subclass of scipy arrays, so they inherit all the
attributes and methods of scipy arrays (also called “ndarrays”).

SVG-Viewer needed.

##### [](){#x1-1290006.1.4}Matrix-vector operations {#matrix-vector-operations .subsubsectionHead}

Now let’s perform some common matrix-vector operations on arrays (you
also try the same using matrices instead of arrays):
![PICT](SilBioComp222x.png) ![PICT](SilBioComp223x.png)

<div id="listing-115" class="lstlisting">

<span
class="label">[](){#x1-129001r1}</span>In \[\]: mm = scipy.arange(16) \
<span class="label">[](){#x1-129002r2}</span> \
<span
class="label">[](){#x1-129003r3}</span>In \[\]: mm = mm.reshape(4,4) \#Convert to matrix \
<span class="label">[](){#x1-129004r4}</span> \
<span class="label">[](){#x1-129005r5}</span>In \[\]: mm.transpose() \
<span class="label">[](){#x1-129006r6}</span>Out\[\]: \
<span
class="label">[](){#x1-129007r7}</span>array(\[\[ 0,  4,  8, 12\], \
<span
class="label">[](){#x1-129008r8}</span>       \[ 1,  5,  9, 13\], \
<span
class="label">[](){#x1-129009r9}</span>       \[ 2,  6, 10, 14\], \
<span
class="label">[](){#x1-129010r10}</span>       \[ 3,  7, 11, 15\]\]) \
<span class="label">[](){#x1-129011r11}</span> \
<span
class="label">[](){#x1-129012r12}</span>In \[6\]: mm + mm.transpose() \
<span class="label">[](){#x1-129013r13}</span>Out\[6\]: \
<span
class="label">[](){#x1-129014r14}</span>array(\[\[ 0,  5, 10, 15\], \
<span
class="label">[](){#x1-129015r15}</span>       \[ 5, 10, 15, 20\], \
<span
class="label">[](){#x1-129016r16}</span>       \[10, 15, 20, 25\], \
<span
class="label">[](){#x1-129017r17}</span>       \[15, 20, 25, 30\]\]) \
<span class="label">[](){#x1-129018r18}</span> \
<span
class="label">[](){#x1-129019r19}</span>In \[7\]: mm - mm.transpose() \
<span class="label">[](){#x1-129020r20}</span>Out\[7\]: \
<span
class="label">[](){#x1-129021r21}</span>array(\[\[ 0, -3, -6, -9\], \
<span
class="label">[](){#x1-129022r22}</span>       \[ 3,  0, -3, -6\], \
<span
class="label">[](){#x1-129023r23}</span>       \[ 6,  3,  0, -3\], \
<span
class="label">[](){#x1-129024r24}</span>       \[ 9,  6,  3,  0\]\]) \
<span class="label">[](){#x1-129025r25}</span> \
<span
class="label">[](){#x1-129026r26}</span>In \[8\]: mm \* mm.transpose() \
<span class="label">[](){#x1-129027r27}</span>\#\# Elementwise! \
<span class="label">[](){#x1-129028r28}</span> \
<span class="label">[](){#x1-129029r29}</span>Out\[8\]: \
<span
class="label">[](){#x1-129030r30}</span>array(\[\[  0,   4,  16,  36\], \
<span
class="label">[](){#x1-129031r31}</span>       \[  4,  25,  54,  91\], \
<span
class="label">[](){#x1-129032r32}</span>       \[ 16,  54, 100, 154\], \
<span
class="label">[](){#x1-129033r33}</span>       \[ 36,  91, 154, 225\]\]) \
<span class="label">[](){#x1-129034r34}</span> \
<span
class="label">[](){#x1-129035r35}</span>In \[9\]: mm / mm.transpose() \
<span
class="label">[](){#x1-129036r36}</span>Warning: divide by zero encountered in divide \
<span class="label">[](){#x1-129037r37}</span> \
<span
class="label">[](){#x1-129038r38}</span>\# Note the integer division \
<span class="label">[](){#x1-129039r39}</span>Out\[9\]: \
<span class="label">[](){#x1-129040r40}</span>array(\[\[0, 0, 0, 0\], \
<span class="label">[](){#x1-129041r41}</span>       \[4, 1, 0, 0\], \
<span class="label">[](){#x1-129042r42}</span>       \[4, 1, 1, 0\], \
<span class="label">[](){#x1-129043r43}</span>       \[4, 1, 1, 1\]\]) \
<span class="label">[](){#x1-129044r44}</span> \
<span
class="label">[](){#x1-129045r45}</span>In \[10\]: mm \* scipy.pi \
<span class="label">[](){#x1-129046r46}</span>Out\[10\]: \
<span
class="label">[](){#x1-129047r47}</span>array(\[\[  0.      ,   3.14159,   6.28318531,   9.42477796\], \
<span
class="label">[](){#x1-129048r48}</span>       \[ 12.566370,  15.70796,  18.84955592,  21.99114858\], \
<span
class="label">[](){#x1-129049r49}</span>       \[ 25.132741,  28.27433,  31.41592654,  34.55751919\], \
<span
class="label">[](){#x1-129050r50}</span>       \[ 37.699111,  40.84070,  43.98229715,  47.1238898 \]\]) \
<span class="label">[](){#x1-129051r51}</span> \
<span
class="label">[](){#x1-129052r52}</span>In \[11\]: mm.dot(mm) \# MATRIX MULTIPLICATION \
<span class="label">[](){#x1-129053r53}</span>Out\[11\]: \
<span
class="label">[](){#x1-129054r54}</span>array(\[\[ 56,  62,  68,  74\], \
<span
class="label">[](){#x1-129055r55}</span>       \[152, 174, 196, 218\], \
<span
class="label">[](){#x1-129056r56}</span>       \[248, 286, 324, 362\], \
<span
class="label">[](){#x1-129057r57}</span>       \[344, 398, 452, 506\]\])

</div>

We can do a lot more (but won’t!) by importing the linalg sub-package:
scipy.linalg.

#### <span class="titlemark">6.1.5 </span> [](){#x1-1300006.1.5}Two useful scipy sub-packages {#two-useful-scipy-sub-packages .subsectionHead}

Two particularly useful scipy sub-packages are scipy.integrate (what
will I need this for?) and scipy.stats. Why not use R for this? —
because often you might just want to calculate some summary stats of
your simulation results within Python.

##### [](){#x1-1310006.1.5}scipy.stats {#scipy.stats .subsubsectionHead}

Let’s take a quick spin in scipy.stats.

<div id="listing-116" class="lstlisting">

<span
class="label">[](){#x1-131001r1}</span>In \[18\]: import scipy.stats \
<span class="label">[](){#x1-131002r2}</span> \
<span class="label">[](){#x1-131003r3}</span>In \[19\]: scipy.stats. \
<span
class="label">[](){#x1-131004r4}</span>scipy.stats.arcsine               scipy.stats.lognorm \
<span
class="label">[](){#x1-131005r5}</span>scipy.stats.bernoulli             scipy.stats.mannwhitneyu \
<span
class="label">[](){#x1-131006r6}</span>scipy.stats.beta                  scipy.stats.maxwell \
<span
class="label">[](){#x1-131007r7}</span>scipy.stats.binom                 scipy.stats.moment \
<span
class="label">[](){#x1-131008r8}</span>scipy.stats.chi2                  scipy.stats.nanstd \
<span
class="label">[](){#x1-131009r9}</span>scipy.stats.chisqprob             scipy.stats.nbinom \
<span
class="label">[](){#x1-131010r10}</span>scipy.stats.circvar               scipy.stats.norm \
<span
class="label">[](){#x1-131011r11}</span>scipy.stats.expon                 scipy.stats.powerlaw \
<span
class="label">[](){#x1-131012r12}</span>scipy.stats.gompertz              scipy.stats.t \
<span
class="label">[](){#x1-131013r13}</span>scipy.stats.kruskal               scipy.stats.uniform \
<span class="label">[](){#x1-131014r14}</span> \
<span
class="label">[](){#x1-131015r15}</span>In \[19\]: scipy.stats.norm.rvs(size = 10) \# 10 samples from \
<span class="label">[](){#x1-131016r16}</span>N(0,1) \
<span class="label">[](){#x1-131017r17}</span>Out\[19\]: \
<span
class="label">[](){#x1-131018r18}</span>array(\[-0.951319, -1.997693,  1.518519, -0.975607,  0.8903, \
<span
class="label">[](){#x1-131019r19}</span>       -0.171347, -0.964987, -0.192849,  1.303369,  0.6728\]) \
<span class="label">[](){#x1-131020r20}</span> \
<span
class="label">[](){#x1-131021r21}</span>In \[20\]: scipy.stats.norm.rvs(5, size = 10) \
<span class="label">[](){#x1-131022r22}</span>\# change mean to 5 \
<span class="label">[](){#x1-131023r23}</span>Out\[20\]: \
<span
class="label">[](){#x1-131024r24}</span>array(\[ 6.079362,  4.736106,  3.127175,  5.620740,  5.98831, \
<span
class="label">[](){#x1-131025r25}</span>        6.657388,  5.899766,  5.754475,  5.353463,  3.24320\]) \
<span class="label">[](){#x1-131026r26}</span> \
<span
class="label">[](){#x1-131027r27}</span>In \[21\]: scipy.stats.norm.rvs(5, 100, size = 10) \
<span class="label">[](){#x1-131028r28}</span>\# change sd to 100 \
<span class="label">[](){#x1-131029r29}</span>Out\[21\]: \
<span
class="label">[](){#x1-131030r30}</span>array(\[ -57.886247,   12.620516,  104.654729,  -30.979751, \
<span
class="label">[](){#x1-131031r31}</span>         41.775710,  -31.423377,  -31.003134,   80.537090, \
<span
class="label">[](){#x1-131032r32}</span>          3.835486,  103.462095\]) \
<span class="label">[](){#x1-131033r33}</span> \
<span
class="label">[](){#x1-131034r34}</span>\# Random integers between 0 and 10 \
<span
class="label">[](){#x1-131035r35}</span>In \[23\]: scipy.stats.randint.rvs(0, 10, size =7) \
<span
class="label">[](){#x1-131036r36}</span>Out\[23\]: array(\[6, 6, 2, 0, 9, 8, 5\])

</div>

##### [](){#x1-1320006.1.5}scipy.integrate – the Lotka-Volterra model {#scipy.integrate-the-lotka-volterra-model .subsubsectionHead}

Numerical integration is the approximate computation of an integral
using numerical techniques. You need numerical integration whenever you
have a complicated function that cannot be integrated analytically using
anti-derivatives. A common application is solving ordinary diﬀerential
equations (ODEs), commonly used for modelling biological systems.

Let’s try scipy.integrate for solving a classical model in biology — the
Lotka-Volterra model for a predator-prey system.

![PICT](SilBioComp224x.png) ![PICT](SilBioComp225x.png)

-   Create LV1.py in your weekly directory and run it.

The Lotka-Volterra model is:

  ----------------------------------------- -------
  [](){#x1-132001r1} $$\begin{array}{rlr}   (6.1)
  \frac{dR}{dt} & {= rR - aCR} & \\         
  \frac{dC}{dt} & {= - zC + eaCR} & \\      
  \end{array}$$                             
  ----------------------------------------- -------

where $C$ and $R$ are consumer (e.g., predator) and resource (e.g.,
prey) population sizes (either biomass or numbers), $r$ is the intrinsic
growth rate of the resource population, $a$ is a “search rate” that
determines the encounter rate between consumer and resource, $z$ is
mortality rate and $e$ is the consumer’s eﬃciency in converting resource
to consumer biomass.

LV1.py runs (numerically solves the ODE) this model and plots the
equilbrium. Have good look at the code, line by line, and make sure that
you understand what’s going on. A subsequent practical will require you
to use this code to simulate modiﬁed version od the LV model.

### <span class="titlemark">6.2 </span> [](){#x1-1330006.2}The need for speed: Proﬁling in Python {#the-need-for-speed-proﬁling-in-python .sectionHead}

Donald Knuth says: Premature optimization is the root of all evil.
Indeed, computational speed may not be your initial concern. Also, you
should focus on developing clean, reliable, reusable code rather than
worrying ﬁrst about how fast your code runs. However, speed will become
an issue when and if your analysis or modeling becomes complex enough
(e.g., food web or large network simulations). In that case, knowing
which parts of your code take the most time is useful – optimizing those
parts may save you lots of time. To ﬁnd out what is slowing down your
code you need to use “proﬁling”. ![PICT](SilBioComp226x.png)
![PICT](SilBioComp227x.png)

#### <span class="titlemark">6.2.1 </span> [](){#x1-1340006.2.1}Proﬁling {#proﬁling .subsectionHead}

Proﬁling is easy in ipython – simply type the magic command %run -p
your\_function\_name.

Let’s write a simple illustrative program and name it profileme.py:

<div class="lstinputlisting">

[](){#x1-134001}  \
<span
class="label">[](){#x1-134002r1}</span>def a\_useless\_function(x): \
<span class="label">[](){#x1-134003r2}</span>    y = 0 \
<span
class="label">[](){#x1-134004r3}</span>    for i in range(100000000): \# eight zeros! \
<span class="label">[](){#x1-134005r4}</span>        y = y + i \
<span class="label">[](){#x1-134006r5}</span>    return 0 \
<span class="label">[](){#x1-134007r6}</span> \
<span
class="label">[](){#x1-134008r7}</span>def another\_useless\_function(x): \
<span class="label">[](){#x1-134009r8}</span>    y = 0 \
<span
class="label">[](){#x1-134010r9}</span>    z = 0 \# start a counter \
<span
class="label">[](){#x1-134011r10}</span>    while z &lt;= 100000000: \# eight zeros! \
<span class="label">[](){#x1-134012r11}</span>        y = y + x \
<span class="label">[](){#x1-134013r12}</span>        z += 1 \
<span class="label">[](){#x1-134014r13}</span>    return 0 \
<span class="label">[](){#x1-134015r14}</span> \
<span
class="label">[](){#x1-134016r15}</span>def a\_less\_useless\_function(x): \
<span class="label">[](){#x1-134017r16}</span>    y = 0 \
<span
class="label">[](){#x1-134018r17}</span>    for i in range(100000):\# five zeros! \
<span class="label">[](){#x1-134019r18}</span>        y = y + i \
<span class="label">[](){#x1-134020r19}</span>    return 0 \
<span class="label">[](){#x1-134021r20}</span> \
<span class="label">[](){#x1-134022r21}</span>def some\_function(x): \
<span class="label">[](){#x1-134023r22}</span>    print x \
<span
class="label">[](){#x1-134024r23}</span>    a\_useless\_function(x) \
<span
class="label">[](){#x1-134025r24}</span>    another\_useless\_function(x) \
<span
class="label">[](){#x1-134026r25}</span>    a\_less\_useless\_function(x) \
<span class="label">[](){#x1-134027r26}</span>    return 0 \
<span class="label">[](){#x1-134028r27}</span> \
<span class="label">[](){#x1-134029r28}</span>some\_function(1000)

</div>

Now %run -p profileme.py, and you should see something like:

<div id="listing-117" class="lstlisting">

<span
class="label">[](){#x1-134030r1}</span>         54 function calls in 3.652 seconds \
<span class="label">[](){#x1-134031r2}</span> \
<span
class="label">[](){#x1-134032r3}</span>   Ordered by: internal time \
<span class="label">[](){#x1-134033r4}</span> \
<span
class="label">[](){#x1-134034r5}</span>   ncalls  tottime  percall  cumtime  percall filename:lineno(function) \
<span
class="label">[](){#x1-134035r6}</span>        1    2.744    2.744    3.648    3.648 profileme.py:1(a\_useless\_function) \
<span
class="label">[](){#x1-134036r7}</span>        2    0.905    0.452    0.905    0.452 {range} \
<span
class="label">[](){#x1-134037r8}</span>        1    0.002    0.002    0.003    0.003 profileme.py:8(a\_less\_useless\_function) \
<span class="label">[](){#x1-134038r9}</span>\[more output\]

</div>

The function range is taking long – we should use xrange instead. When
iterating over a large number of values, xrange, unlike range, does not
create all the values before iteration, but creates them “on demand”
(ie.e., xrange is a “generator”). Range creates a list, so if you do
range(1, 10000000) it creates a list in memory with 10000000 elements.
For example, range(1000000)yields a 4Mb+ list.

So let’s modify the script:

<div class="lstinputlisting">

[](){#x1-134039}  \
<span
class="label">[](){#x1-134040r1}</span>def a\_useless\_function(x): \
<span class="label">[](){#x1-134041r2}</span>    y = 0 \
<span
class="label">[](){#x1-134042r3}</span>    for i in xrange(100000000): \# eight zeros! \
<span class="label">[](){#x1-134043r4}</span>        y = y + i \
<span class="label">[](){#x1-134044r5}</span>    return 0 \
<span class="label">[](){#x1-134045r6}</span> \
<span
class="label">[](){#x1-134046r7}</span>def another\_useless\_function(x): \
<span class="label">[](){#x1-134047r8}</span>    y = 0 \
<span
class="label">[](){#x1-134048r9}</span>    z = 0 \# start a counter \
<span
class="label">[](){#x1-134049r10}</span>    while z &lt;= 100000000: \# eight zeros! \
<span class="label">[](){#x1-134050r11}</span>        y = y + x \
<span class="label">[](){#x1-134051r12}</span>        z += 1 \
<span class="label">[](){#x1-134052r13}</span>    return 0 \
<span class="label">[](){#x1-134053r14}</span> \
<span
class="label">[](){#x1-134054r15}</span>def a\_less\_useless\_function(x): \
<span class="label">[](){#x1-134055r16}</span>    y = 0 \
<span
class="label">[](){#x1-134056r17}</span>    for i in xrange(100000): \# five zeros! \
<span class="label">[](){#x1-134057r18}</span>        y = y + i \
<span class="label">[](){#x1-134058r19}</span>    return 0 \
<span class="label">[](){#x1-134059r20}</span> \
<span class="label">[](){#x1-134060r21}</span>def some\_function(x): \
<span class="label">[](){#x1-134061r22}</span>    print x \
<span
class="label">[](){#x1-134062r23}</span>    a\_useless\_function(x) \
<span
class="label">[](){#x1-134063r24}</span>    another\_useless\_function(x) \
<span
class="label">[](){#x1-134064r25}</span>    a\_less\_useless\_function(x) \
<span class="label">[](){#x1-134065r26}</span>    return 0 \
<span class="label">[](){#x1-134066r27}</span> \
<span class="label">[](){#x1-134067r28}</span>some\_function(1000)

</div>

Again running the magic command %run -p yields:

<div id="listing-118" class="lstlisting">

<span
class="label">[](){#x1-134068r1}</span>         52 function calls in 2.153 seconds \
<span class="label">[](){#x1-134069r2}</span> \
<span
class="label">[](){#x1-134070r3}</span>   Ordered by: internal time \
<span class="label">[](){#x1-134071r4}</span> \
<span
class="label">[](){#x1-134072r5}</span>   ncalls  tottime  percall  cumtime  percall filename:lineno(function) \
<span
class="label">[](){#x1-134073r6}</span>        1    2.150    2.150    2.150    2.150 profileme2.py:1(a\_useless\_function) \
<span
class="label">[](){#x1-134074r7}</span>        1    0.002    0.002    0.002    0.002 profileme2.py:8(a\_less\_useless\_function) \
<span
class="label">[](){#x1-134075r8}</span>        1    0.001    0.001    2.153    2.153 {execfile} \
<span class="label">[](){#x1-134076r9}</span> \[more output\]

</div>

So we saved 1.499 s! (not enough to grab a pint, but ah well...).
![PICT](SilBioComp228x.png) ![PICT](SilBioComp229x.png)

#### <span class="titlemark">6.2.2 </span> [](){#x1-1350006.2.2}Quick proﬁling with timeit {#quick-proﬁling-with-timeit .subsectionHead}

Alternatively, if you are writing your script and want to ﬁgure out what
the best way to do something (say a particular command or a loop) might
be, then you can use timeit.

Type an run the following code in a python script called timeitme.py:

<div class="lstinputlisting">

[](){#x1-135001}  \
<span
class="label">[](){#x1-135002r1}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135003r2}</span>\# range vs. xrange. \
<span
class="label">[](){#x1-135004r3}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135005r4}</span>import time \
<span class="label">[](){#x1-135006r5}</span>import timeit \
<span class="label">[](){#x1-135007r6}</span> \
<span
class="label">[](){#x1-135008r7}</span>def a\_not\_useful\_function(): \
<span class="label">[](){#x1-135009r8}</span>    y = 0 \
<span
class="label">[](){#x1-135010r9}</span>    for i in range(100000): \
<span class="label">[](){#x1-135011r10}</span>        y = y + i \
<span class="label">[](){#x1-135012r11}</span>    return 0 \
<span class="label">[](){#x1-135013r12}</span> \
<span
class="label">[](){#x1-135014r13}</span>def a\_less\_useless\_function(): \
<span class="label">[](){#x1-135015r14}</span>    y = 0 \
<span
class="label">[](){#x1-135016r15}</span>    for i in xrange(100000): \
<span class="label">[](){#x1-135017r16}</span>        y = y + i \
<span class="label">[](){#x1-135018r17}</span>    return 0 \
<span class="label">[](){#x1-135019r18}</span> \
<span
class="label">[](){#x1-135020r19}</span>\# One approach is to time it like this: \
<span class="label">[](){#x1-135021r20}</span>start = time.time() \
<span
class="label">[](){#x1-135022r21}</span>a\_not\_useful\_function() \
<span
class="label">[](){#x1-135023r22}</span>print \~a\_not\_useful\_function takes %f s to run.\~ % (time.time() - start) \
<span class="label">[](){#x1-135024r23}</span> \
<span class="label">[](){#x1-135025r24}</span>start = time.time() \
<span
class="label">[](){#x1-135026r25}</span>a\_less\_useless\_function() \
<span
class="label">[](){#x1-135027r26}</span>print \~a\_less\_useless\_function takes %f s to run.\~ % (time.time() - start) \
<span class="label">[](){#x1-135028r27}</span> \
<span
class="label">[](){#x1-135029r28}</span>\# But you’ll notice that if you run it multiple times, the time taken changes a \
<span
class="label">[](){#x1-135030r29}</span>\# bit. So instead, you can also run: \
<span
class="label">[](){#x1-135031r30}</span>\#   %timeit a\_not\_useful\_function() \
<span
class="label">[](){#x1-135032r31}</span>\#   %timeit a\_less\_useless\_function() \
<span class="label">[](){#x1-135033r32}</span>\# in iPython. \
<span class="label">[](){#x1-135034r33}</span> \
<span
class="label">[](){#x1-135035r34}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span
class="label">[](){#x1-135036r35}</span>\# for loops vs. list comprehensions. \
<span
class="label">[](){#x1-135037r36}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135038r37}</span> \
<span class="label">[](){#x1-135039r38}</span>my\_list = range(1000) \
<span class="label">[](){#x1-135040r39}</span> \
<span
class="label">[](){#x1-135041r40}</span>def my\_squares\_loop(x): \
<span class="label">[](){#x1-135042r41}</span>    out = \[\] \
<span class="label">[](){#x1-135043r42}</span>    for i in x: \
<span
class="label">[](){#x1-135044r43}</span>        out.append(i \*\* 2) \
<span class="label">[](){#x1-135045r44}</span>    return out \
<span class="label">[](){#x1-135046r45}</span> \
<span class="label">[](){#x1-135047r46}</span> \
<span class="label">[](){#x1-135048r47}</span>def my\_squares\_lc(x): \
<span
class="label">[](){#x1-135049r48}</span>    out = \[i \*\* 2 for i in x\] \
<span class="label">[](){#x1-135050r49}</span>    return out \
<span class="label">[](){#x1-135051r50}</span> \
<span
class="label">[](){#x1-135052r51}</span>\# %timeit my\_squares\_loop(my\_list) \
<span
class="label">[](){#x1-135053r52}</span>\# %timeit my\_squares\_lc(my\_list) \
<span class="label">[](){#x1-135054r53}</span> \
<span class="label">[](){#x1-135055r54}</span> \
<span
class="label">[](){#x1-135056r55}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span
class="label">[](){#x1-135057r56}</span>\# for loops vs. join method. \
<span
class="label">[](){#x1-135058r57}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135059r58}</span> \
<span class="label">[](){#x1-135060r59}</span>import string \
<span
class="label">[](){#x1-135061r60}</span>my\_letters = list(string.ascii\_lowercase) \
<span class="label">[](){#x1-135062r61}</span> \
<span class="label">[](){#x1-135063r62}</span>def my\_join\_loop(l): \
<span class="label">[](){#x1-135064r63}</span>    out = ’’ \
<span class="label">[](){#x1-135065r64}</span>    for letter in l: \
<span class="label">[](){#x1-135066r65}</span>        out += letter \
<span class="label">[](){#x1-135067r66}</span>    return out \
<span class="label">[](){#x1-135068r67}</span> \
<span class="label">[](){#x1-135069r68}</span> \
<span class="label">[](){#x1-135070r69}</span>def my\_join\_method(l): \
<span class="label">[](){#x1-135071r70}</span>    out = ’’.join(l) \
<span class="label">[](){#x1-135072r71}</span>    return out \
<span class="label">[](){#x1-135073r72}</span> \
<span
class="label">[](){#x1-135074r73}</span>\# %timeit(my\_join\_loop(my\_letters)) \
<span
class="label">[](){#x1-135075r74}</span>\# %timeit(my\_join\_method(my\_letters)) \
<span class="label">[](){#x1-135076r75}</span> \
<span class="label">[](){#x1-135077r76}</span> \
<span
class="label">[](){#x1-135078r77}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135079r78}</span>\# Oh dear. \
<span
class="label">[](){#x1-135080r79}</span>\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\# \
<span class="label">[](){#x1-135081r80}</span> \
<span
class="label">[](){#x1-135082r81}</span>def getting\_silly\_pi(): \
<span class="label">[](){#x1-135083r82}</span>    y = 0 \
<span
class="label">[](){#x1-135084r83}</span>    for i in xrange(100000): \
<span class="label">[](){#x1-135085r84}</span>        y = y + i \
<span class="label">[](){#x1-135086r85}</span>    return 0 \
<span class="label">[](){#x1-135087r86}</span> \
<span class="label">[](){#x1-135088r87}</span> \
<span
class="label">[](){#x1-135089r88}</span>def getting\_silly\_pii(): \
<span class="label">[](){#x1-135090r89}</span>    y = 0 \
<span
class="label">[](){#x1-135091r90}</span>    for i in xrange(100000): \
<span class="label">[](){#x1-135092r91}</span>        y += i \
<span class="label">[](){#x1-135093r92}</span>    return 0 \
<span class="label">[](){#x1-135094r93}</span> \
<span
class="label">[](){#x1-135095r94}</span>\# %timeit(getting\_silly\_pi()) \
<span
class="label">[](){#x1-135096r95}</span>\# %timeit(getting\_silly\_pii())

</div>

Now run it these diﬀerent instances of timeit-ing by tying the % timeit
command followed by the function call. Note that You can import all the
functions using from timeitme import \*

But remember, don’t go crazy with proﬁling for the sake of shaving a
couple of milliseconds, tempting as that may be!

### <span class="titlemark">6.3 </span> [](){#x1-1360006.3}Practicals {#practicals-5 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository.

##### [](){#x1-1370006.3}Lotka-Volterra model problem {#lotka-volterra-model-problem .subsubsectionHead}

Copy and modify LV1.py into another script called LV2.py that does the
following:

 1. 
:   Take arguments for the four LV model parameters $r,a,z,e$ from the
    commandline
    <div id="listing-119" class="lstlisting">

    <span
    class="label">[](){#x1-137002r1}</span> LV2.py arg1 arg2 ... etc

    </div>

    ![PICT](SilBioComp230x.png) ![PICT](SilBioComp231x.png)

 2. 
:   Runs the Lotka-Volterra model with prey density dependence
    $rR\left( {1 - \frac{R}{K}} \right)$, which changes the coupled ODEs
    to,
      ------------------------------------------------------------------- -------
      [](){#x1-137004r2} $$\begin{array}{rlr}                             (6.2)
      \frac{dR}{dt} & {= rR\left( {1 - \frac{R}{K}} \right) - aCR} & \\   
      \frac{dC}{dt} & {= - zC + eaCR} & \\                                
      \end{array}$$                                                       
      ------------------------------------------------------------------- -------

 3. 
:   Saves the plot as .pdf in an external results directory in your
    weekly directory

 4. 
:   The chosen parameter values should show in the plot (e.g.,
    $r = 1,a = .5$, etc) You can change time length $t$ too.

 5. 
:   Include a script in Code that will run both LV1.py and LV2.py with
    appropriate arguments. This script should also proﬁle the two
    scripts and print the results to screen for each of the scripts
    using the %run -p approach. Look at and compare the speed
    bottlenecks in LV1.py and LV2.py. Think about how you could further
    speed up the scripts.

Write every subsequent extra credit script ﬁle with a new name such as
LV3.py,LV4.py, etc.

Extra credit: Choose appropriate values for the parameters such that
both predator and prey persist with prey density dependence — the ﬁnal
(non-zero) population values should be printed to screen.

Extra-extra credit: Write a discrete-time version of the LV model called
LV3.py. The discrete-time model is:

  ------------------------------------------------------------------------------------------------- -------
  [](){#x1-137008r3} ![PICT](SilBioComp232x.png) ![PICT](SilBioComp233x.png) $$\begin{array}{rlr}   (6.3)
  R_{t + 1} & {= R_{t}\left( {1 + r\left( {1 - \frac{R_{t}}{K}} \right) - aC_{t}} \right)} & \\     
  C_{t + 1} & {= C_{t}\left( {1 - z + eaR_{t}} \right)} & \\                                        
  \end{array}$$                                                                                     
  ------------------------------------------------------------------------------------------------- -------

Include this script in run\_LV.py, and proﬁle it as well.

Extra-extra-extra credit: Write a version of the discrete-time model
(eqn [6.3](#x1-137008r3)) simulation with a random gaussian ﬂuctuation
in resource’s growth rate at each time-step:

  --------------------------------------------------------------------------------------------------------------------------- -------
  [](){#x1-137009r4} $$\begin{array}{rlr}                                                                                     (6.4)
  R_{t + 1} & {= R_{t}\left( {1 + \left( {r + \epsilon} \right)\left( {1 - \frac{R_{t}}{K}} \right) - aC_{t}} \right)} & \\   
  C_{t + 1} & {= C_{t}\left( {1 - z + eaR_{t}} \right)} & \\                                                                  
  \end{array}$$                                                                                                               
  --------------------------------------------------------------------------------------------------------------------------- -------

where $\epsilon$ is a random ﬂuctuation drawn from a gaussian
distribution (use scipy.stats). Include this script in run\_LV.py, and
proﬁle it as well.

You can also add ﬂuctuations to both populations simultaneously this
way:

  ------------------------------------------------------------------------------------------------------------- -------
  [](){#x1-137010r5} $$\begin{array}{rlr}                                                                       (6.5)
  R_{t + 1} & {= R_{t}\left( {1 + \epsilon + r + \left( {1 - \frac{R_{t}}{K}} \right) - aC_{t}} \right)} & \\   
  C_{t + 1} & {= C_{t}\left( {1 - z + \epsilon + eaR_{t}} \right)} & \\                                         
  \end{array}$$                                                                                                 
  ------------------------------------------------------------------------------------------------------------- -------

### <span class="titlemark">6.4 </span> [](){#x1-1380006.4}Networks in python (and R) {#networks-in-python-and-r .sectionHead}

![PICT](SilBioComp234x.png) ![PICT](SilBioComp235x.png)

ALL biological systems have a network representation, consisting of
nodes for the biological entities of interest, and edges or links for
the relationships between them. Here are some examples:

-   Metabolic networks
-   Gene regulatory networks
-   Individual-Individual (e.g., social networks)
-   Food webs
-   Pollination networks

Can you think of a few more examples from biology?

You can easily simulate, analyze, and visualize biological networks in
both python and R using some nifty packages. A full network anaalysis
tutorial is out of the scope of our Python module’s objectives, but
let’s try a simple visualization using the networkx python package.

For this you need to ﬁrst install the package:

<div id="listing-120" class="lstlisting">

<span
class="label">[](){#x1-138001r1}</span>\$ sudo apt-get install python-networkx

</div>

Now type the code ﬁle DrawFW.py and run it:

<div class="lstinputlisting">

[](){#x1-138002}  \
<span class="label">[](){#x1-138003r1}</span>\~\~\~ \
<span
class="label">[](){#x1-138004r2}</span>    Plot a snapshot of a food web graph/network. \
<span class="label">[](){#x1-138005r3}</span> \
<span
class="label">[](){#x1-138006r4}</span>    Needs: Adjacency list of who eats whom (consumer name/id in 1st \
<span
class="label">[](){#x1-138007r5}</span>    column, resource name/id in 2nd column), and list of species \
<span
class="label">[](){#x1-138008r6}</span>    names/ids and properties such as biomass (node abundance), or average \
<span class="label">[](){#x1-138009r7}</span>    body mass. \
<span class="label">[](){#x1-138010r8}</span> \
<span class="label">[](){#x1-138011r9}</span>\~\~\~ \
<span class="label">[](){#x1-138012r10}</span>import networkx as nx \
<span class="label">[](){#x1-138013r11}</span>import scipy as sc \
<span
class="label">[](){#x1-138014r12}</span>import matplotlib.pyplot as plt \
<span
class="label">[](){#x1-138015r13}</span>\# import matplotlib.animation as ani \#for animation \
<span class="label">[](){#x1-138016r14}</span> \
<span
class="label">[](){#x1-138017r15}</span>def GenRdmAdjList(N = 2, C = 0.5): \
<span class="label">[](){#x1-138018r16}</span>    \~\~\~ \
<span
class="label">[](){#x1-138019r17}</span>    Generate random adjacency list given N nodes with connectance \
<span class="label">[](){#x1-138020r18}</span>    probability C \
<span class="label">[](){#x1-138021r19}</span>    \~\~\~ \
<span class="label">[](){#x1-138022r20}</span>    Ids = range(N) \
<span class="label">[](){#x1-138023r21}</span>    ALst = \[\] \
<span class="label">[](){#x1-138024r22}</span>    for i in Ids: \
<span
class="label">[](){#x1-138025r23}</span>        if sc.random.uniform(0,1,1) &lt; C: \
<span
class="label">[](){#x1-138026r24}</span>            Lnk = sc.random.choice(Ids,2).tolist() \
<span
class="label">[](){#x1-138027r25}</span>            if Lnk\[0\] != Lnk\[1\]: \#avoid self loops \
<span
class="label">[](){#x1-138028r26}</span>                ALst.append(Lnk) \
<span class="label">[](){#x1-138029r27}</span>    return ALst \
<span class="label">[](){#x1-138030r28}</span> \
<span
class="label">[](){#x1-138031r29}</span>\#\# Assign body mass range \
<span
class="label">[](){#x1-138032r30}</span>SizRan = (\[-10,10\]) \#use log scale \
<span class="label">[](){#x1-138033r31}</span> \
<span
class="label">[](){#x1-138034r32}</span>\#\# Assign number of species (MaxN) and connectance (C) \
<span class="label">[](){#x1-138035r33}</span>MaxN = 30 \
<span class="label">[](){#x1-138036r34}</span>C = 0.75 \
<span class="label">[](){#x1-138037r35}</span> \
<span
class="label">[](){#x1-138038r36}</span>\#\# Generate adjacency list: \
<span
class="label">[](){#x1-138039r37}</span>AdjL = sc.array(GenRdmAdjList(MaxN, C)) \
<span class="label">[](){#x1-138040r38}</span> \
<span
class="label">[](){#x1-138041r39}</span>\#\# Generate species (node) data: \
<span
class="label">[](){#x1-138042r40}</span>Sps = sc.unique(AdjL) \# get species ids \
<span
class="label">[](){#x1-138043r41}</span>Sizs = sc.random.uniform(SizRan\[0\],SizRan\[1\],MaxN)\# Generate body sizes (log10 scale) \
<span class="label">[](){#x1-138044r42}</span> \
<span
class="label">[](){#x1-138045r43}</span>\#\#\#\#\#\# The Plotting \#\#\#\#\# \
<span class="label">[](){#x1-138046r44}</span>plt.close(’all’) \
<span class="label">[](){#x1-138047r45}</span> \
<span class="label">[](){#x1-138048r46}</span>\#\#Plot using networkx: \
<span class="label">[](){#x1-138049r47}</span> \
<span
class="label">[](){#x1-138050r48}</span>\#\# Calculate coordinates for circular configuration: \
<span
class="label">[](){#x1-138051r49}</span>\#\# (See networkx.layout for inbuilt functions to compute other types of node \
<span class="label">[](){#x1-138052r50}</span>\# coords) \
<span
class="label">[](){#x1-138053r51}</span>pos = nx.circular\_layout(Sps) \
<span class="label">[](){#x1-138054r52}</span> \
<span class="label">[](){#x1-138055r53}</span>G = nx.Graph() \
<span class="label">[](){#x1-138056r54}</span>G.add\_nodes\_from(Sps) \
<span
class="label">[](){#x1-138057r55}</span>G.add\_edges\_from(tuple(AdjL)) \
<span
class="label">[](){#x1-138058r56}</span>NodSizs= 10\*\*-32 + (Sizs-min(Sizs))/(max(Sizs)-min(Sizs)) \#node sizes in proportion to body sizes \
<span
class="label">[](){#x1-138059r57}</span>nx.draw(G, pos, node\_size = NodSizs\*1000) \
<span class="label">[](){#x1-138060r58}</span>plt.show()

</div>

Look thorugh the code carefully (line-by-line) as there are some new
python objects introduced by networkx for storing node and edge data.

### <span class="titlemark">6.5 </span> [](){#x1-1390006.5}Practicals {#practicals-6 .sectionHead}

![PICT](SilBioComp236x.png) ![PICT](SilBioComp237x.png)

You can also do nice network visualizations in R. Here you will convert
a network visualization script written in R using the igraph package to
a python script that does the same thing.

First copy the script ﬁle called Nets.R and the data ﬁles it calls and
run it. This script visualizes the QMEE CDT collaboration network (see
[http://www.imperial.ac.uk/qmee-\_cdt/](http://www.imperial.ac.uk/qmee-cdt/){.url}),
coloring the the nodes by the type of node (organization type:
“University”,“Hosting Partner”, “Non-hosting Partner”).

Now, convert this script to a python script that does the same thing,
including writing to an \*.svg ﬁle using the same QMEE CDT link and node
data. You can use networkx or some other python network visualization
package.

### <span class="titlemark">6.6 </span> [](){#x1-1400006.6}Regular expressions in python {#regular-expressions-in-python .sectionHead}

Let’s shift gears now, and look at a very important skill that you
should learn, or at least be aware of — Regular expressions. Regular
expressions (regex) are a tool to ﬁnd patterns in strings, such as:

-   Finding DNA motifs in sequence data
-   Navigating through ﬁles in a directory
-   Parsing text ﬁles
-   Extracting information from html and xml ﬁles

Thus, if you are interested in data mining, need to clean or process
data in any other way, or convert a bunch of information into usable
data, knowing regex is necessary.

------------------------------------------------------------------------

<div class="figure">

![PIC](Graphics/regex.png)\
[www.xkcd.com/208/](www.xkcd.com/208/){.url}

</div>

------------------------------------------------------------------------

Regex packages are available for most programming languages (grep in
UNIX / Linux, where regex ﬁrst became popular).

#### <span class="titlemark">6.6.1 </span> [](){#x1-1410006.6.1}Metacharacters vs. regular characters {#metacharacters-vs.-regular-characters .subsectionHead}

A regex may consist of a combination of “metacharacters” (modiﬁers) and
“regular” or literal characters. There are 14 metacharacters: \[ \] { }
( ) \\  \^ \$ . $|$ ? \* + These metacharacters do special things, for
example:

-   \[12\] means match target to 1 and if that does not match then match
    target to 2 ![PICT](SilBioComp238x.png) ![PICT](SilBioComp239x.png)
-   \[0-9\] means match to any character in range 0 to 9
-   \[\^Ff\] means anything except upper or lower case f and \[\^a-z\]
    means everything except lower case a to z

Everything else is interpreted literally (e.g., a is matched by entering
a in the regex).

\[ and \] , specify a character “class” — the set of characters that you
wish to match. Metacharacters are not active inside classes. For
example, \[a-z\$\] will match any of the characters a to z, but also \$,
because inside a character class it loses its special metacharacter
status.

#### <span class="titlemark">6.6.2 </span> [](){#x1-1420006.6.2}regex elements {#regex-elements .subsectionHead}

A useful (not exhaustive) list of regex elements is:

<div class="tabular">

a

match the character a

3

match the number 3

$\smallsetminus$n

match a newline

$\smallsetminus$t

match a tab

$\smallsetminus$s

match a whitespace

.

match any character except line break (newline)

$\smallsetminus$w

match any alphanumeric character (including underscore)

$\smallsetminus$W

match any character not covered by $\smallsetminus$w (i.e., match any
non-alphanumeric character excluding underscore)

$\smallsetminus$d

match a numeric character

$\smallsetminus$D

match any character not covered by $\smallsetminus$d (i.e., match a
non-digit)

\[atgc\]

match any character listed: a, t, g, c

at|gc

match at or gc

\[$\widehat{\;}$atgc\]

any character not listed: any character but a, t, g, c

?

match the preceding pattern element zero or one times

\*

match the preceding pattern element zero or more times

+

match the preceding pattern element one or more times

{n}

match the preceding pattern element exactly n times

{n,}

match the preceding pattern element at least n times

{n,m}

match the preceding pattern element at least n but not more than m times

\^

match the beginning of a line

\$

match the end of a line

</div>

#### <span class="titlemark">6.6.3 </span> [](){#x1-1430006.6.3}regex in python {#regex-in-python .subsectionHead}

![PICT](SilBioComp240x.png) ![PICT](SilBioComp241x.png)

Regex functions in python are in the module re — so we will import re.
The simplest python regex function is re.search, which searches the
string for match to a given pattern — returns a match object if a match
is found and None if not.

SVG-Viewer needed.

OK, let’s try some regexes (type all that follows in Code/regexs.py):

<div class="lstinputlisting">

[](){#x1-143001}  \
<span class="label">[](){#x1-143002r1}</span>import re \
<span class="label">[](){#x1-143003r2}</span> \
<span
class="label">[](){#x1-143004r3}</span>my\_string = \~a given string\~ \
<span
class="label">[](){#x1-143005r4}</span>\# find a space in the string \
<span
class="label">[](){#x1-143006r5}</span>match = re.search(r’\\s’, my\_string) \
<span class="label">[](){#x1-143007r6}</span> \
<span class="label">[](){#x1-143008r7}</span>print match \
<span
class="label">[](){#x1-143009r8}</span>\# this should print something like \
<span
class="label">[](){#x1-143010r9}</span>\# &lt;\_sre.SRE\_Match object at 0x93ecdd30&gt; \
<span class="label">[](){#x1-143011r10}</span> \
<span
class="label">[](){#x1-143012r11}</span>\# now we can see what has matched \
<span class="label">[](){#x1-143013r12}</span>match.group() \
<span class="label">[](){#x1-143014r13}</span> \
<span
class="label">[](){#x1-143015r14}</span>match = re.search(r’s\\w\*’, my\_string) \
<span class="label">[](){#x1-143016r15}</span> \
<span
class="label">[](){#x1-143017r16}</span>\# this should return \~string\~ \
<span class="label">[](){#x1-143018r17}</span>match.group() \
<span class="label">[](){#x1-143019r18}</span> \
<span
class="label">[](){#x1-143020r19}</span>\# NOW AN EXAMPLE OF NO MATCH: \
<span
class="label">[](){#x1-143021r20}</span>\# find a digit in the string \
<span
class="label">[](){#x1-143022r21}</span>match = re.search(r’\\d’, my\_string) \
<span class="label">[](){#x1-143023r22}</span> \
<span
class="label">[](){#x1-143024r23}</span>\# this should print \~None\~ \
<span class="label">[](){#x1-143025r24}</span>print match \
<span class="label">[](){#x1-143026r25}</span> \
<span class="label">[](){#x1-143027r26}</span> \# Further Example \
<span class="label">[](){#x1-143028r27}</span> \# \
<span
class="label">[](){#x1-143029r28}</span>my\_string = ’an example’ \
<span
class="label">[](){#x1-143030r29}</span>match = re.search(r’\\w\*\\s’, my\_string) \
<span class="label">[](){#x1-143031r30}</span> \
<span class="label">[](){#x1-143032r31}</span>if match: \
<span
class="label">[](){#x1-143033r32}</span>    print ’found a match:’, match.group() \
<span class="label">[](){#x1-143034r33}</span>else: \
<span
class="label">[](){#x1-143035r34}</span>    print ’did not find a match’

</div>

To know whether a pattern was matched, we can use an if:

<div id="listing-121" class="lstlisting">

<span class="label">[](){#x1-143036r1}</span>MyStr = ’an example’ \
<span class="label">[](){#x1-143037r2}</span> \
<span
class="label">[](){#x1-143038r3}</span>match = re.search(r’\\w\*\\s’, MyStr) \
<span class="label">[](){#x1-143039r4}</span> \
<span class="label">[](){#x1-143040r5}</span>if match: \
<span
class="label">[](){#x1-143041r6}</span>    print ’found a match:’, match.group() \
<span class="label">[](){#x1-143042r7}</span>else: \
<span
class="label">[](){#x1-143043r8}</span>    print ’did not find a match’

</div>

Here are some more regexes (add all that follows to the Code/regexs.py):

<div class="lstinputlisting">

[](){#x1-143044}  \
<span class="label">[](){#x1-143045r1}</span>\# Some Basic Examples \
<span
class="label">[](){#x1-143046r2}</span>match = re.search(r’\\d’ , \~it takes 2 to tango\~) \
<span
class="label">[](){#x1-143047r3}</span>print match.group() \# print 2 \
<span class="label">[](){#x1-143048r4}</span> \
<span
class="label">[](){#x1-143049r5}</span>match = re.search(r’\\s\\w\*\\s’, ’once upon a time’) \
<span class="label">[](){#x1-143050r6}</span>match.group() \# ’ upon ’ \
<span class="label">[](){#x1-143051r7}</span> \
<span
class="label">[](){#x1-143052r8}</span>match = re.search(r’\\s\\w{1,3}\\s’, ’once upon a time’) \
<span class="label">[](){#x1-143053r9}</span>match.group() \# ’ a ’ \
<span class="label">[](){#x1-143054r10}</span> \
<span
class="label">[](){#x1-143055r11}</span>match = re.search(r’\\s\\w\*\$’, ’once upon a time’) \
<span class="label">[](){#x1-143056r12}</span>match.group() \# ’ time’ \
<span class="label">[](){#x1-143057r13}</span> \
<span
class="label">[](){#x1-143058r14}</span>match = re.search(r’\\w\*\\s\\d.\*\\d’, ’take 2 grams of H2O’) \
<span
class="label">[](){#x1-143059r15}</span>match.group() \# ’take 2 grams of H2’ \
<span class="label">[](){#x1-143060r16}</span> \
<span
class="label">[](){#x1-143061r17}</span>match = re.search(r’\^\\w\*.\*\\s’, ’once upon a time’) \
<span
class="label">[](){#x1-143062r18}</span>match.group() \# ’once upon a ’ \
<span
class="label">[](){#x1-143063r19}</span>\#\# NOTE THAT \*, +, and { } are all \~greedy\~: \
<span
class="label">[](){#x1-143064r20}</span>\#\# They repeat the previous regex token as many times as possible \
<span
class="label">[](){#x1-143065r21}</span>\#\# As a result, they may match more text than you want \
<span class="label">[](){#x1-143066r22}</span> \
<span
class="label">[](){#x1-143067r23}</span>\#\# To make it non-greedy, use ?: \
<span
class="label">[](){#x1-143068r24}</span>match = re.search(r’\^\\w\*.\*?\\s’, ’once upon a time’) \
<span class="label">[](){#x1-143069r25}</span>match.group() \# ’once ’ \
<span class="label">[](){#x1-143070r26}</span> \
<span
class="label">[](){#x1-143071r27}</span>\#\# To further illustrate greediness, let’s try matching an HTML tag: \
<span
class="label">[](){#x1-143072r28}</span>match = re.search(r’&lt;.+&gt;’, ’This is a &lt;EM&gt;first&lt;/EM&gt; test’) \
<span
class="label">[](){#x1-143073r29}</span>match.group() \# ’&lt;EM&gt;first&lt;/EM&gt;’ \
<span
class="label">[](){#x1-143074r30}</span>\#\# But we didn’t want this: we wanted just &lt;EM&gt; \
<span
class="label">[](){#x1-143075r31}</span>\#\# It’s because + is greedy! \
<span class="label">[](){#x1-143076r32}</span> \
<span
class="label">[](){#x1-143077r33}</span>\#\# Instead, we can make + \~lazy\~! \
<span
class="label">[](){#x1-143078r34}</span>match = re.search(r’&lt;.+?&gt;’, ’This is a &lt;EM&gt;first&lt;/EM&gt; test’) \
<span
class="label">[](){#x1-143079r35}</span>match.group() \# ’&lt;EM&gt;’ \
<span class="label">[](){#x1-143080r36}</span> \
<span
class="label">[](){#x1-143081r37}</span>\#\# OK, moving on from greed and laziness \
<span
class="label">[](){#x1-143082r38}</span>match = re.search(r’\\d\*\\.?\\d\*’,’1432.75+60.22i’) \#note \~\\\~ before \~.\~ \
<span
class="label">[](){#x1-143083r39}</span>match.group() \# ’1432.75’ \
<span class="label">[](){#x1-143084r40}</span> \
<span
class="label">[](){#x1-143085r41}</span>match = re.search(r’\\d\*\\.?\\d\*’,’1432+60.22i’) \
<span class="label">[](){#x1-143086r42}</span>match.group() \# ’1432’ \
<span class="label">[](){#x1-143087r43}</span> \
<span
class="label">[](){#x1-143088r44}</span>match = re.search(r’\[AGTC\]+’, ’the sequence ATTCGT’) \
<span
class="label">[](){#x1-143089r45}</span>match.group() \# ’ATTCGT’ \
<span class="label">[](){#x1-143090r46}</span> \
<span
class="label">[](){#x1-143091r47}</span>re.search(r’\\s+\[A-Z\]{1}\\w+\\s\\w+’, ’The bird-shit frog’’s name is Theloderma asper’).group() \# ’ Theloderma asper’ \
<span
class="label">[](){#x1-143092r48}</span>\#\# NOTE THAT I DIRECTLY RETURNED THE RESULT BY APPENDING .group()

</div>

![PICT](SilBioComp242x.png) ![PICT](SilBioComp243x.png)

------------------------------------------------------------------------

<div class="figure">

![PICT](SilBioComp244x.png) ![PICT](SilBioComp245x.png)
[](){#x1-143093r2} ![PICT](SilBioComp246x.png)
![PICT](SilBioComp248x.png)
![PIC](SilBioComp247x.png){.graphics}\

<div class="caption">

<span class="id">Figure 6.2: </span><span class="content">In case you
were wondering what Theloderma asper, the “bird-shit frog”, looks like.
I snapped this one in North-east India ages ago</span>

</div>

![PICT](SilBioComp249x.png) ![PICT](SilBioComp250x.png)

</div>

------------------------------------------------------------------------

You can group regexes into meaningful blocks using parentheses. For
example, let’s try matching a string consisting of an academic’s name,
email address and research area or interest (no need to type this into
any python ﬁle):

<div id="listing-122" class="lstlisting">

<span
class="label">[](){#x1-143094r1}</span>MyStr = ’Samraat Pawar, s.pawar@imperial.ac.uk, Systems biology and \
<span class="label">[](){#x1-143095r2}</span>ecological theory’ \
<span class="label">[](){#x1-143096r3}</span> \
<span class="label">[](){#x1-143097r4}</span>\# without groups \
<span
class="label">[](){#x1-143098r5}</span>match = re.search(r\~\[\\w\\s\]\*,\\s\[\\w\\.@\]\*,\\s\[\\w\\s&\]\*\~,MyStr) \
<span class="label">[](){#x1-143099r6}</span> \
<span class="label">[](){#x1-143100r7}</span>match.group() \
<span
class="label">[](){#x1-143101r8}</span>’Samraat Pawar, s.pawar@imperial.ac.uk, Systems biology and ecological theory’ \
<span class="label">[](){#x1-143102r9}</span> \
<span class="label">[](){#x1-143103r10}</span>match.group(0) \
<span
class="label">[](){#x1-143104r11}</span>’Samraat Pawar, s.pawar@imperial.ac.uk, Systems biology and ecological theory’ \
<span class="label">[](){#x1-143105r12}</span> \
<span
class="label">[](){#x1-143106r13}</span>\# now add groups using ( ) \
<span
class="label">[](){#x1-143107r14}</span>match = re.search(r\~(\[\\w\\s\]\*),\\s(\[\\w\\.@\]\*),\\s(\[\\w\\s&\]\*)\~,MyStr) \
<span class="label">[](){#x1-143108r15}</span> \
<span class="label">[](){#x1-143109r16}</span>match.group(0) \
<span
class="label">[](){#x1-143110r17}</span>’Samraat Pawar, s.pawar@imperial.ac.uk, Systems biology and ecological theory’ \
<span class="label">[](){#x1-143111r18}</span> \
<span class="label">[](){#x1-143112r19}</span>match.group(1) \
<span class="label">[](){#x1-143113r20}</span>’Samraat Pawar’ \
<span class="label">[](){#x1-143114r21}</span> \
<span class="label">[](){#x1-143115r22}</span>match.group(2) \
<span class="label">[](){#x1-143116r23}</span>’s.pawar@imperial.ac.uk’ \
<span class="label">[](){#x1-143117r24}</span> \
<span class="label">[](){#x1-143118r25}</span>match.group(3) \
<span
class="label">[](){#x1-143119r26}</span>’Systems biology and ecological theory’

</div>

Have a look at re4.py in your code repository for more on parsing email
addresses using regexes.

#### <span class="titlemark">6.6.4 </span> [](){#x1-1440006.6.4}Some RegExercises {#some-regexercises .subsectionHead}

These exercises are not for submission as part of your coursework, but
we will discuss them in class (in a later week).

 1. 
:   Translate the following regular expressions into regular English
    (don’t type this in regexs.py)!
    <div id="listing-123" class="lstlisting">

    <span
    class="label">[](){#x1-144002r1}</span>r’\^abc\[ab\]+\\s\\t\\d’ \
    <span class="label">[](){#x1-144003r2}</span>% ’abca \\t1’ \
    <span class="label">[](){#x1-144004r3}</span> \
    <span
    class="label">[](){#x1-144005r4}</span>r’\^\\d{1,2}\\/\\d{1,2}\\/\\d{4}\$’ \
    <span class="label">[](){#x1-144006r5}</span>% ’11/12/2004’ \
    <span class="label">[](){#x1-144007r6}</span> \
    <span
    class="label">[](){#x1-144008r7}</span>r’\\s\*\[a-zA-Z,\\s\]+\\s\*’ \
    <span class="label">[](){#x1-144009r8}</span>% ’ aBz  ’

    </div>

 2. 
:   Write a regex to match dates in format YYYYMMDD, making sure that:
    -   Only seemingly valid dates match (i.e., year greater than 1900)
    -   First digit in month is either 0 or 1
    -   First digit in day $\leq$ 3

![PICT](SilBioComp251x.png) ![PICT](SilBioComp252x.png)

#### <span class="titlemark">6.6.5 </span> [](){#x1-1450006.6.5}Important re functions {#important-re-functions .subsectionHead}

<div class="tabular">

re.compile(reg)

Compile a regular expression. In this way the pattern is stored for
repeated use, improving the speed.

re.search(reg, text)

Scan the string and ﬁnd the ﬁrst match of the pattern in the string.
Returns a match object if successful and None otherwise.

re.match(reg, text)

as re.search, but only match the beginning of the string.

re.split(ref, text)

Split the text by the occurrence of the pattern described by the regular
expression.

re.findall(ref, text)

As re.search, but return a list of all the matches. If groups are
present, return a list of groups.

re.finditer(ref, text)

As re.search, but return an iterator containing the next match.

re.sub(ref, repl, text)

Substitute each non-overlapping occurrence of the match with the text in
repl (or a function!).

</div>

### <span class="titlemark">6.7 </span> [](){#x1-1460006.7}Practicals {#practicals-7 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository.

##### [](){#x1-1470006.7}Blackbirds problem {#blackbirds-problem .subsubsectionHead}

Complete the code blackbirds.py that you ﬁnd in the CMEEMasteRepo
(necessary data ﬁle is also there).

### <span class="titlemark">6.8 </span> [](){#x1-1480006.8}Databases and python {#databases-and-python .sectionHead}

Many of you will deal with complex data — and often, lots of it.
Ecological and Evolutionary data are particularly complex because they
contain large numbers of attributes, often measured in very diﬀerent
scales and units for individual taxa, populations, etc. In this
scenario, storing the data in a database makes a lot of sense! You can
easily include the database in your analysis workﬂow — indeed, that’s
why people use databases. And you can use python (and R) to build,
manipulate and use your database. ![PICT](SilBioComp253x.png)
![PICT](SilBioComp254x.png)

#### <span class="titlemark">6.8.1 </span> [](){#x1-1490006.8.1}Relational databases {#relational-databases .subsectionHead}

A relational database is a collection of interlinked (related) tables
that altogether store a complex dataset in a logical, computer-readable
format. Dividing a dataset into multiple tables minimizes redundancies.
For example, if your data were sampled from three sites — then, rather
than repeating the site name and description in each row in a text ﬁle,
you could just specify a numerical “key” that directs to another table
containing the sampling site name and description.

Finally, if you have many rows in your data ﬁle, the type of sequential
access we have been using in our python and R scripts is ineﬃcient — you
should be able to instantly access any row regardless of its position

Data columns in a database are usually called ﬁelds, while the rows are
the records. Here are a few things to keep in mind about databases:

-   Each ﬁeld typically contains only one data type (e.g., integers,
    ﬂoats, strings)
-   Each record is a “data point”, composed of diﬀerent values, one for
    each ﬁeld — somewhat like a python tuple
-   Some ﬁelds are special, and are called keys:
    -   The primary key uniquely deﬁnes a record in a table (e.g., each
        row is identiﬁed by a unique number)
    -   To allow fast retrieval, some ﬁelds (and typically all the keys)
        are indexed — a copy of certain columns that can be searched
        very eﬃciently
    -   Foreign keys are keys in a table that are primary keys in
        another table and deﬁne relationships between the tables
-   The key to designing a database is to minimize redundancy and
    dependency without losing the logical consistency of tables — this
    is called normalization (arguably more of an art than a science!)

Let’s look at a simple example.

Imagine you recorded body sizes of species from diﬀerent ﬁeld sites in a
single text ﬁle (e.g., a .csv ﬁle) with the following ﬁelds:

![PICT](SilBioComp255x.png) ![PICT](SilBioComp256x.png)

<div class="tabular">

ID

Unique ID for the record

SiteName

Name of the site

SiteLong

Longitude of the site

SiteLat

Latitude of the site

SamplingDate

Date of the sample

SamplingHour

Hour of the sampling

SamplingAvgTemp

Average air temperature on the sampling day

SamplingWaterTemp

Temperature of the water

SamplingPH

PH of the water

SpeciesCommonName

Species of the sampled individual

SpeciesLatinBinom

Latin binomial of the species

BodySize

Width of the individual

BodyWeight

Weight of the individual

</div>

\

It would be logical to divide the data into four tables:

Site table:\

<div class="tabular">

SiteID

ID for the site

SiteName

Name of the site

SiteLong

Longitude of the site

SiteLat

Latitude of the site

</div>

\

Sample table:\

<div class="tabular">

SamplingID

ID for the sampling date

SamplingDate

Date of the sample

SamplingHour

Hour of the sample

SamplingAvgTemp

Average air temperature

SamplingWaterTemp

Temperature of the water

SamplingPH

PH of the water

</div>

\

Species table:\

<div class="tabular">

SpeciesID

ID for the species

SpeciesCommonName

Species name

SpeciesLatinBinom

Latin binomial of the species

</div>

\

Individual table:\

<div class="tabular">

IndividualID

ID for the individual sampled

SpeciesID

ID for the species

SamplingID

ID for the sampling day

SiteID

ID for the site

BodySize

Width of the individual

BodyWeight

Weight of the individual

</div>

\

In each table, the ﬁrst ID ﬁeld is the primary key. The last table
contains three foreign keys because each individual is associated with
one species, one sampling day and one sampling site.

These structural features of a database are called its schema.
![PICT](SilBioComp257x.png) ![PICT](SilBioComp258x.png)

#### <span class="titlemark">6.8.2 </span> [](){#x1-1500006.8.2}SQLite {#sqlite .subsectionHead}

SQLite is a simple (and very popular) SQL (Structured Query
Language)-based solution for managing localized, personal databases. I
can safely bet that most, if not all of you unknowingly (or knowingly!)
use SQLite — it is used by MacOSX, Firefox, Acrobat Reader, iTunes,
Skype, iPhone, etc. SQLite is also the database “engine” underlying your
Siwlood Masters Web App: <http://silwoodmasters.co.uk>

We can easily use SQLite through Python scripts. First, install SQLite
by typing in the Ubuntu terminal:

<div id="listing-124" class="lstlisting">

<span
class="label">[](){#x1-150001r1}</span>\$ sudo apt-get install sqlite3 libsqlite3-dev

</div>

Also, make sure that you have the necessary package for python by typing
import sqlite3 in the python or ipython shell. Finally, you may install
a GUI for SQLite3 :

<div id="listing-125" class="lstlisting">

<span
class="label">[](){#x1-150002r1}</span>\$ sudo apt-get install sqliteman

</div>

Now type sqlite3 in the Ubuntu terminal to check if SQLite successfully
launches.

SQLite has very few data types (and lacks a boolean and a date type):

<div class="tabular">

NULL

The value is a NULL value

INTEGER

The value is a signed integer, stored in up to or 8 bytes

REAL

The value is a ﬂoating point value, stored as in 8 bytes

TEXT

The value is a text string

BLOB

The value is a blob of data, stored exactly as it was input (useful for
binary types, such as bitmap images or pdfs)

</div>

\

Typically, you will build a database by importing csv data — be aware
that:

-   Headers: the csv should have no headers
-   Separators: if the comma is the separator, each record should not
    contain any other commas
-   Quotes: there should be no quotes in the data
-   Newlines: there should be no newlines

Now build your ﬁrst database in SQLite! We will use as example a global
dataset on metabolic traits called Biotraits that we are currently
developing in our lab (should be in your Data directory). This
![PICT](SilBioComp259x.png) ![PICT](SilBioComp260x.png) dataset contains
164 columns (ﬁelds). Thermal response curves for diﬀerent traits and
species are stored in rows. This means that site description or taxonomy
are repeated as many times as temperatures are measured in the curve.
You can imagine how much redundacy can be here!!!

For this reason, it is easier to migrate the dataset to SQL and split it
into several tables:

-   TCP: Includes the thermal curve performance for each species and
    trait (as many rows per trait and species as temperatures have been
    measured within the TCP)
-   TraitInfo: Contains site description and conditions under the traits
    were measured (one row per thermal curve)
-   Consumer: Consumer description including taxonomy (one row per
    thermal curve).
-   Resource: Resource description including taxonomy (one row per
    thermal curve).
-   Size: Size data for each species (one row per thermal curve)
-   DataSource: Contains information about the data source
    (citation, contributors) (one row per thermal curve).

So all these tables compose the Biotraits schema.

Navigate to your Data directory and in an Ubuntu terminal type:

<div id="listing-126" class="lstlisting">

<span class="label">[](){#x1-150003r1}</span>\$ sqlite3 Biotraits.db \
<span class="label">[](){#x1-150004r2}</span>SQLite version 3.7.9 \
<span
class="label">[](){#x1-150005r3}</span>Enter \~.help\~ for instructions \
<span
class="label">[](){#x1-150006r4}</span>Enter SQL statements terminated with a \~;\~

</div>

This creates an empty database in your Data directory. Now, you need to
create a table with some ﬁelds. Let’s start with the TraitInfo table:

<div id="listing-127" class="lstlisting">

<span class="label">[](){#x1-150007r1}</span> \
<span
class="label">[](){#x1-150008r2}</span>sqlite&gt; CREATE TABLE TraitInfo (Numbers integer primary key, \
<span
class="label">[](){#x1-150009r3}</span>   ...&gt;                                 OriginalID text, \
<span
class="label">[](){#x1-150010r4}</span>   ...&gt;                                 FinalID text, \
<span
class="label">[](){#x1-150011r5}</span>   ...&gt;                                 OriginalTraitName text, \
<span
class="label">[](){#x1-150012r6}</span>   ...&gt;                                 OriginalTraitDef text, \
<span
class="label">[](){#x1-150013r7}</span>   ...&gt;                                 Replicates integer, \
<span
class="label">[](){#x1-150014r8}</span>   ...&gt;                                 Habitat  integer, \
<span
class="label">[](){#x1-150015r9}</span>   ...&gt;                                 Climate text, \
<span
class="label">[](){#x1-150016r10}</span>   ...&gt;                                 Location text, \
<span
class="label">[](){#x1-150017r11}</span>   ...&gt;                                 LocationType text, \
<span
class="label">[](){#x1-150018r12}</span>   ...&gt;                                 LocationDate text, \
<span
class="label">[](){#x1-150019r13}</span>   ...&gt;                                 CoordinateType text, \
<span
class="label">[](){#x1-150020r14}</span>   ...&gt;                                 Latitude integer, \
<span
class="label">[](){#x1-150021r15}</span>   ...&gt;                                 Longitude integer);

</div>

Note that I am writing all SQL commands in upper case, but it is not
necessary. I am using upper case here because SQL syntax is long and
clunky, and it quickly becomes hard to spot (and edit) commands in long
strings of complex queries.

Now let’s import the dataset:

<div id="listing-128" class="lstlisting">

<span class="label">[](){#x1-150024r1}</span>sqlite&gt; .mode csv \
<span class="label">[](){#x1-150025r2}</span> \
<span
class="label">[](){#x1-150026r3}</span>sqlite&gt; .import TraitInfo.csv TraitInfo
![PICT](SilBioComp261x.png) ![PICT](SilBioComp262x.png)

</div>

So we built a table and imported a csv ﬁle into it. Now we can ask
SQLite to show all the tables we currently have:

<div id="listing-129" class="lstlisting">

<span class="label">[](){#x1-150027r1}</span>sqlite&gt; .tables \
<span class="label">[](){#x1-150028r2}</span> \
<span class="label">[](){#x1-150029r3}</span>TraitInfo

</div>

Let’s run our ﬁrst Query (note that you need a semicolon to end a
command):

<div id="listing-130" class="lstlisting">

<span
class="label">[](){#x1-150030r1}</span>sqlite&gt; SELECT \* FROM TraitInfo LIMIT 5; \
<span class="label">[](){#x1-150031r2}</span> \
<span
class="label">[](){#x1-150032r3}</span>1,1,MTD1,\~Resource Consumption Rate\~,\~The number of resource consumed per number of consumers per time\~,6,freshwater,temperate,\~Eunice Lake; Ontario; Canada\~,NA,NA,NA,51.254,-85.323 \
<span
class="label">[](){#x1-150033r4}</span>2,1,MTD1,\~Resource Consumption Rate\~,\~The number of resource consumed per number of consumers per time\~,6,freshwater,temperate,\~Eunice Lake; Ontario; Canada\~,NA,NA,NA,51.254,-85.323 \
<span
class="label">[](){#x1-150034r5}</span>3,1,MTD1,\~Resource Consumption Rate\~,\~The number of resource consumed per number of consumers per time\~,6,freshwater,temperate,\~Eunice Lake; Ontario; Canada\~,NA,NA,NA,51.254,-85.323 \
<span
class="label">[](){#x1-150035r6}</span>4,2,MTD2,\~Resource Consumption Rate\~,\~The number of resource consumed per number of consumers per time\~,6,freshwater,temperate,\~Eunice Lake; Ontario; Canada\~,NA,NA,NA,51.254,-85.323 \
<span
class="label">[](){#x1-150036r7}</span>5,2,MTD2,\~Resource Consumption Rate\~,\~The number of resource consumed per number of consumers per time\~,6,freshwater,temperate,\~Eunice Lake; Ontario; Canada\~,NA,NA,NA,51.254,-85.323

</div>

Let’s turn on some nicer formatting:

<div id="listing-131" class="lstlisting">

<span class="label">[](){#x1-150039r1}</span>sqlite&gt; .mode column \
<span class="label">[](){#x1-150040r2}</span> \
<span class="label">[](){#x1-150041r3}</span>sqlite&gt; .header ON \
<span class="label">[](){#x1-150042r4}</span> \
<span
class="label">[](){#x1-150043r5}</span>sqlite&gt; SELECT \* FROM TraitInfo LIMIT 5; \
<span class="label">[](){#x1-150044r6}</span> \
<span
class="label">[](){#x1-150045r7}</span>Numbers  OriginalID  FinalID     OriginalTraitName           ... \
<span
class="label">[](){#x1-150046r8}</span>-------  ----------  ----------  -------------------------   ... \
<span
class="label">[](){#x1-150047r9}</span>1        1           MTD1        Resource Consumption Rate   ... \
<span
class="label">[](){#x1-150048r10}</span>4        2           MTD2        Resource Consumption Rate   ... \
<span
class="label">[](){#x1-150049r11}</span>6        3           MTD3        Resource Consumption Rate   ... \
<span
class="label">[](){#x1-150050r12}</span>9        4           MTD4        Resource Mass Consumption   ... \
<span
class="label">[](){#x1-150051r13}</span>12       5           MTD5        Resource Mass Consumption   ...

</div>

The main statement to select records from a table is SELECT:

<div id="listing-132" class="lstlisting">

<span
class="label">[](){#x1-150054r1}</span>sqlite&gt; .width 40  \#\# NOTE: Control the width \
<span class="label">[](){#x1-150055r2}</span> \
<span
class="label">[](){#x1-150056r3}</span>sqlite&gt; SELECT DISTINCT OriginalTraitName FROM TraitInfo; \# Returns unique values \
<span class="label">[](){#x1-150057r4}</span> \
<span class="label">[](){#x1-150058r5}</span>OriginalTraitName \
<span
class="label">[](){#x1-150059r6}</span>---------------------------------------- \
<span class="label">[](){#x1-150060r7}</span>Resource Consumption Rate \
<span
class="label">[](){#x1-150061r8}</span>Resource Mass Consumption Rate \
<span
class="label">[](){#x1-150062r9}</span>Mass-Specific Mass Consumption Rate \
<span class="label">[](){#x1-150063r10}</span>Voluntary Body Velocity \
<span class="label">[](){#x1-150064r11}</span>Forward Attack Distance \
<span class="label">[](){#x1-150065r12}</span>Foraging Velocity \
<span
class="label">[](){#x1-150066r13}</span>Resource Reaction Distance \
<span class="label">[](){#x1-150067r14}</span>.... \
<span class="label">[](){#x1-150068r15}</span> \
<span
class="label">[](){#x1-150069r16}</span>sqlite&gt; SELECT DISTINCT Habitat FROM TraitInfo \
<span
class="label">[](){#x1-150070r17}</span>   ...&gt; WHERE OriginalTraitName = \~Resource Consumption Rate\~; \# Sets a condition \
<span class="label">[](){#x1-150071r18}</span> \
<span class="label">[](){#x1-150072r19}</span>Habitat \
<span
class="label">[](){#x1-150073r20}</span>---------------------------------------- \
<span class="label">[](){#x1-150074r21}</span>freshwater \
<span class="label">[](){#x1-150075r22}</span>marine \
<span class="label">[](){#x1-150076r23}</span>terrestrial \
<span class="label">[](){#x1-150077r24}</span> \
<span
class="label">[](){#x1-150078r25}</span>sqlite&gt; SELECT COUNT (\*) FROM TraitInfo;  \# Returns number of rows \
<span class="label">[](){#x1-150079r26}</span> \
<span class="label">[](){#x1-150080r27}</span>Count (\*) \
<span class="label">[](){#x1-150081r28}</span>-------------------- \
<span class="label">[](){#x1-150082r29}</span>2336 \
<span class="label">[](){#x1-150083r30}</span> \
<span
class="label">[](){#x1-150084r31}</span>sqlite&gt; SELECT Habitat, COUNT(OriginalTraitName) \# Returns number of rows for each group \
<span
class="label">[](){#x1-150085r32}</span>   ...&gt; FROM TraitInfo GROUP BY Habitat; \
<span class="label">[](){#x1-150086r33}</span> \
<span
class="label">[](){#x1-150087r34}</span>Habitat     COUNT(OriginalTraitName) \
<span
class="label">[](){#x1-150088r35}</span>----------  ------------------------ \
<span class="label">[](){#x1-150089r36}</span>NA          16 \
<span class="label">[](){#x1-150090r37}</span>freshwater  609 \
<span class="label">[](){#x1-150091r38}</span>marine      909 \
<span class="label">[](){#x1-150092r39}</span>terrestria  802 \
<span class="label">[](){#x1-150093r40}</span> \
<span
class="label">[](){#x1-150094r41}</span>sqlite&gt; SELECT COUNT(DISTINCT OriginalTraitName) \# Returns number of unique values \
<span
class="label">[](){#x1-150095r42}</span>   ...&gt; FROM TraitInfo; \
<span class="label">[](){#x1-150096r43}</span> \
<span
class="label">[](){#x1-150097r44}</span>COUNT(DISTINCT OriginalTraitName) \
<span
class="label">[](){#x1-150098r45}</span>--------------------------------- \
<span class="label">[](){#x1-150099r46}</span>220 \
<span class="label">[](){#x1-150100r47}</span> \
<span
class="label">[](){#x1-150101r48}</span>sqlite&gt; SELECT COUNT(DISTINCT OriginalTraitName) TraitCount \# Assigns alias to the variable \
<span
class="label">[](){#x1-150102r49}</span>   ...&gt; FROM TraitInfo; \
<span class="label">[](){#x1-150103r50}</span> \
<span class="label">[](){#x1-150104r51}</span>TraitCount \
<span class="label">[](){#x1-150105r52}</span>---------- \
<span class="label">[](){#x1-150106r53}</span>220 \
<span class="label">[](){#x1-150107r54}</span> \
<span
class="label">[](){#x1-150108r55}</span>sqlite&gt; SELECT Habitat, \
<span
class="label">[](){#x1-150109r56}</span>   ...&gt; COUNT(DISTINCT OriginalTraitName) AS TN \
<span
class="label">[](){#x1-150110r57}</span>   ...&gt; FROM TraitInfo GROUP BY Habitat; \
<span class="label">[](){#x1-150111r58}</span> \
<span class="label">[](){#x1-150112r59}</span>Habitat     TN \
<span class="label">[](){#x1-150113r60}</span>----------  ---------- \
<span class="label">[](){#x1-150114r61}</span>NA          7 \
<span class="label">[](){#x1-150115r62}</span>freshwater  82 \
<span class="label">[](){#x1-150116r63}</span>marine      95 \
<span class="label">[](){#x1-150117r64}</span>terrestria  96 \
<span class="label">[](){#x1-150118r65}</span> \
<span class="label">[](){#x1-150119r66}</span> \
<span
class="label">[](){#x1-150120r67}</span>sqlite&gt; SELECT \* \# WHAT TO SELECT \
<span
class="label">[](){#x1-150121r68}</span>   ...&gt; FROM TraitInfo \# FROM WHERE \
<span
class="label">[](){#x1-150122r69}</span>   ...&gt; WHERE Habitat = \~marine\~ \# CONDITIONS \
<span
class="label">[](){#x1-150123r70}</span>   ...&gt; AND OriginalTraitName = \~Resource Consumption Rate\~; \
<span class="label">[](){#x1-150124r71}</span> \
<span
class="label">[](){#x1-150125r72}</span>Numbers     OriginalID  FinalID     OriginalTraitName          ... \
<span
class="label">[](){#x1-150126r73}</span>----------  ----------  ----------  -------------------------  ... \
<span
class="label">[](){#x1-150127r74}</span>778         308         MTD99       Resource Consumption Rate  ... \
<span
class="label">[](){#x1-150128r75}</span>798         310         MTD101      Resource Consumption Rate  ... \
<span
class="label">[](){#x1-150129r76}</span>806         311         MTD102      Resource Consumption Rate  ... \
<span
class="label">[](){#x1-150130r77}</span>993         351         MTD113      Resource Consumption Rate  ...

</div>

The structure of the SELECT commend is as follows (Note: all characters
are case insensitive): ![PICT](SilBioComp263x.png)
![PICT](SilBioComp264x.png)

<div id="verbatim-1" class="verbatim">

SELECT \[DISTINCT\] field  \
FROM table  \
WHERE predicate  \
GROUP BY field  \
HAVING predicate  \
ORDER BY field  \
LIMIT number  \
;

</div>

Let’s try some more elaborate queries:

<div id="listing-133" class="lstlisting">

<span
class="label">[](){#x1-150133r1}</span>sqlite&gt; SELECT Numbers FROM TraitInfo LIMIT 5; \
<span class="label">[](){#x1-150134r2}</span> \
<span class="label">[](){#x1-150135r3}</span>Numbers \
<span class="label">[](){#x1-150136r4}</span>---------- \
<span class="label">[](){#x1-150137r5}</span>1 \
<span class="label">[](){#x1-150138r6}</span>4 \
<span class="label">[](){#x1-150139r7}</span>6 \
<span class="label">[](){#x1-150140r8}</span>9 \
<span class="label">[](){#x1-150141r9}</span>12 \
<span class="label">[](){#x1-150142r10}</span> \
<span
class="label">[](){#x1-150143r11}</span>sqlite&gt; SELECT Numbers \
<span
class="label">[](){#x1-150144r12}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150145r13}</span>   ...&gt; WHERE Numbers &gt; 100 \
<span
class="label">[](){#x1-150146r14}</span>   ...&gt; AND Numbers &lt; 200; \
<span class="label">[](){#x1-150147r15}</span> \
<span class="label">[](){#x1-150148r16}</span>Numbers \
<span class="label">[](){#x1-150149r17}</span>---------- \
<span class="label">[](){#x1-150150r18}</span>107 \
<span class="label">[](){#x1-150151r19}</span>110 \
<span class="label">[](){#x1-150152r20}</span>112 \
<span class="label">[](){#x1-150153r21}</span>115 \
<span class="label">[](){#x1-150154r22}</span> \
<span
class="label">[](){#x1-150155r23}</span>sqlite&gt; SELECT Numbers \
<span
class="label">[](){#x1-150156r24}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150157r25}</span>   ...&gt; WHERE Habitat = \~freshwater\~ \
<span
class="label">[](){#x1-150158r26}</span>   ...&gt; AND Number &gt; 700 \
<span
class="label">[](){#x1-150159r27}</span>   ...&gt; AND Number &lt; 800; \
<span class="label">[](){#x1-150160r28}</span> \
<span class="label">[](){#x1-150161r29}</span>Numbers \
<span class="label">[](){#x1-150162r30}</span>---------- \
<span class="label">[](){#x1-150163r31}</span>704 \
<span class="label">[](){#x1-150164r32}</span>708 \
<span class="label">[](){#x1-150165r33}</span>712 \
<span class="label">[](){#x1-150166r34}</span>716 \
<span class="label">[](){#x1-150167r35}</span>720 \
<span class="label">[](){#x1-150168r36}</span>725 \
<span class="label">[](){#x1-150169r37}</span>730 \
<span class="label">[](){#x1-150170r38}</span>735 \
<span class="label">[](){#x1-150171r39}</span>740 \
<span class="label">[](){#x1-150172r40}</span>744 \
<span class="label">[](){#x1-150173r41}</span>748

</div>

You can also match records using something like regular expressions. In
SQL, when we use the command LIKE, the percent % symbol matches any
sequence of zero or more characters and the underscore matches any
single character. Similarly, GLOB uses the asterisk and the underscore.

<div id="listing-134" class="lstlisting">

<span
class="label">[](){#x1-150176r1}</span>sqlite&gt; SELECT DISTINCT OriginalTraitName \
<span class="label">[](){#x1-150177r2}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150178r3}</span>   ...&gt; WHERE OriginalTraitName LIKE \~\_esource Consumption Rate\~; \
<span class="label">[](){#x1-150179r4}</span> \
<span class="label">[](){#x1-150180r5}</span>OriginalTraitName \
<span class="label">[](){#x1-150181r6}</span>------------------------- \
<span class="label">[](){#x1-150182r7}</span>Resource Consumption Rate \
<span class="label">[](){#x1-150183r8}</span> \
<span
class="label">[](){#x1-150184r9}</span>sqlite&gt; SELECT DISTINCT OriginalTraitName \
<span
class="label">[](){#x1-150185r10}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150186r11}</span>   ...&gt; WHERE OriginalTraitName LIKE \~Resource%\~; \
<span class="label">[](){#x1-150187r12}</span> \
<span class="label">[](){#x1-150188r13}</span>OriginalTraitName \
<span
class="label">[](){#x1-150189r14}</span>---------------------------------------- \
<span
class="label">[](){#x1-150190r15}</span>Resource Consumption Rate \
<span
class="label">[](){#x1-150191r16}</span>Resource Mass Consumption Rate \
<span
class="label">[](){#x1-150192r17}</span>Resource Reaction Distance \
<span
class="label">[](){#x1-150193r18}</span>Resource Habitat Encounter Rate \
<span
class="label">[](){#x1-150194r19}</span>Resource Consumption Probability \
<span
class="label">[](){#x1-150195r20}</span>Resource Mobility Selection \
<span class="label">[](){#x1-150196r21}</span>Resource Size Selection \
<span
class="label">[](){#x1-150197r22}</span>Resource Size Capture Intent Acceptance \
<span class="label">[](){#x1-150198r23}</span>Resource Encounter Rate \
<span
class="label">[](){#x1-150199r24}</span>Resource Escape Response Probability \
<span class="label">[](){#x1-150200r25}</span> \
<span
class="label">[](){#x1-150201r26}</span>sqlite&gt; SELECT DISTINCT OriginalTraitName \
<span
class="label">[](){#x1-150202r27}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150203r28}</span>   ...&gt; WHERE OriginalTraitName GLOB \~Resource\*\~; \
<span class="label">[](){#x1-150204r29}</span> \
<span class="label">[](){#x1-150205r30}</span> \
<span class="label">[](){#x1-150206r31}</span>OriginalTraitName \
<span
class="label">[](){#x1-150207r32}</span>---------------------------------------- \
<span
class="label">[](){#x1-150208r33}</span>Resource Consumption Rate \
<span
class="label">[](){#x1-150209r34}</span>Resource Mass Consumption Rate \
<span
class="label">[](){#x1-150210r35}</span>Resource Reaction Distance \
<span
class="label">[](){#x1-150211r36}</span>Resource Habitat Encounter Rate \
<span
class="label">[](){#x1-150212r37}</span>Resource Consumption Probability \
<span
class="label">[](){#x1-150213r38}</span>Resource Mobility Selection \
<span class="label">[](){#x1-150214r39}</span>Resource Size Selection \
<span
class="label">[](){#x1-150215r40}</span>Resource Size Capture Intent Acceptance \
<span class="label">[](){#x1-150216r41}</span>Resource Encounter Rate \
<span
class="label">[](){#x1-150217r42}</span>Resource Escape Response Probability \
<span class="label">[](){#x1-150218r43}</span> \
<span
class="label">[](){#x1-150219r44}</span>\# NOTE THAT GLOB IS CASE SENSITIVE, WHILE LIKE IS NOT \
<span class="label">[](){#x1-150220r45}</span> \
<span
class="label">[](){#x1-150221r46}</span>sqlite&gt; SELECT DISTINCT OriginalTraitName \
<span
class="label">[](){#x1-150222r47}</span>   ...&gt; FROM TraitInfo \
<span
class="label">[](){#x1-150223r48}</span>   ...&gt; WHERE OriginalTraitName LIKE \~resource%\~; \
<span class="label">[](){#x1-150224r49}</span> \
<span class="label">[](){#x1-150225r50}</span>OriginalTraitName \
<span
class="label">[](){#x1-150226r51}</span>---------------------------------------- \
<span
class="label">[](){#x1-150227r52}</span>Resource Consumption Rate \
<span
class="label">[](){#x1-150228r53}</span>Resource Mass Consumption Rate \
<span
class="label">[](){#x1-150229r54}</span>Resource Reaction Distance \
<span
class="label">[](){#x1-150230r55}</span>Resource Habitat Encounter Rate \
<span
class="label">[](){#x1-150231r56}</span>Resource Consumption Probability \
<span
class="label">[](){#x1-150232r57}</span>Resource Mobility Selection \
<span class="label">[](){#x1-150233r58}</span>Resource Size Selection \
<span
class="label">[](){#x1-150234r59}</span>Resource Size Capture Intent Acceptance \
<span class="label">[](){#x1-150235r60}</span>Resource Encounter Rate \
<span
class="label">[](){#x1-150236r61}</span>Resource Escape Response Probability

</div>

We can also order by any column:

<div id="listing-135" class="lstlisting">

<span
class="label">[](){#x1-150239r1}</span>sqlite&gt; SELECT OriginalTraitName, Habitat FROM \
<span
class="label">[](){#x1-150240r2}</span>   ...&gt;  TraitInfo LIMIT 5; \
<span class="label">[](){#x1-150241r3}</span> \
<span
class="label">[](){#x1-150242r4}</span>OriginalTraitName          Habitat \
<span
class="label">[](){#x1-150243r5}</span>-------------------------  ---------- \
<span
class="label">[](){#x1-150244r6}</span>Resource Consumption Rate  freshwater \
<span
class="label">[](){#x1-150245r7}</span>Resource Consumption Rate  freshwater \
<span
class="label">[](){#x1-150246r8}</span>Resource Consumption Rate  freshwater \
<span
class="label">[](){#x1-150247r9}</span>Resource Mass Consumption  freshwater \
<span
class="label">[](){#x1-150248r10}</span>Resource Mass Consumption  freshwater \
<span class="label">[](){#x1-150249r11}</span> \
<span
class="label">[](){#x1-150250r12}</span>sqlite&gt; SELECT OriginalTraitName, Habitat FROM \
<span
class="label">[](){#x1-150251r13}</span>   ...&gt; TraitInfo ORDER BY OriginalTraitName LIMIT 5; \
<span class="label">[](){#x1-150252r14}</span> \
<span
class="label">[](){#x1-150253r15}</span>OriginalTraitName           Habitat \
<span
class="label">[](){#x1-150254r16}</span>--------------------------  ---------- \
<span
class="label">[](){#x1-150255r17}</span>48-hr Hatching Probability  marine \
<span
class="label">[](){#x1-150256r18}</span>Asexual Reproduction Rate   marine \
<span
class="label">[](){#x1-150257r19}</span>Attack Body Acceleration    marine \
<span
class="label">[](){#x1-150258r20}</span>Attack Body Velocity        marine \
<span
class="label">[](){#x1-150259r21}</span>Attack Body Velocity        marine

</div>

Until now we have just queried data from one single table, but as we
have seen, the point of storing a database in SQL is that we can use
multiple tables minimizing redundancies within them. And of course,
querying data from those diﬀerent tables at the same time will be
necessary at some point. ![PICT](SilBioComp265x.png)
![PICT](SilBioComp266x.png)

Let’s import then one more table to our database:

<div id="listing-136" class="lstlisting">

<span
class="label">[](){#x1-150260r1}</span> sqlite&gt; CREATE TABLE Consumer (Numbers integer primary key, \
<span
class="label">[](){#x1-150261r2}</span>   ...&gt;                                OriginalID text, \
<span
class="label">[](){#x1-150262r3}</span>   ...&gt;                                FinalID text, \
<span
class="label">[](){#x1-150263r4}</span>   ...&gt;                                Consumer text, \
<span
class="label">[](){#x1-150264r5}</span>   ...&gt;                                ConCommon text, \
<span
class="label">[](){#x1-150265r6}</span>   ...&gt;                                ConKingdom text, \
<span
class="label">[](){#x1-150266r7}</span>   ...&gt;                                ConPhylum text, \
<span
class="label">[](){#x1-150267r8}</span>   ...&gt;                                ConClass text, \
<span
class="label">[](){#x1-150268r9}</span>   ...&gt;                                ConOrder text, \
<span
class="label">[](){#x1-150269r10}</span>   ...&gt;                                ConFamily text, \
<span
class="label">[](){#x1-150270r11}</span>   ...&gt;                                ConGenus text, \
<span
class="label">[](){#x1-150271r12}</span>   ...&gt;                                ConSpecies text); \
<span class="label">[](){#x1-150272r13}</span> \
<span class="label">[](){#x1-150273r14}</span> \
<span
class="label">[](){#x1-150274r15}</span>sqlite&gt; .import Consumer.csv Consumer \
<span class="label">[](){#x1-150275r16}</span> \
<span
class="label">[](){#x1-150276r17}</span>\# Now we have two tables in our database: \
<span class="label">[](){#x1-150277r18}</span> \
<span class="label">[](){#x1-150278r19}</span>sqlite&gt; .tables \
<span class="label">[](){#x1-150279r20}</span>Consumer   TraitInfo \
<span class="label">[](){#x1-150280r21}</span> \
<span class="label">[](){#x1-150281r22}</span> \
<span
class="label">[](){#x1-150282r23}</span>\# These tables are connected by two differents keys: OriginalID \
<span
class="label">[](){#x1-150283r24}</span>\# and FinalID. These are unique IDs for each thermal curve. For each \
<span
class="label">[](){#x1-150284r25}</span>\# FinalID we can get the trait name (OriginalTraitName) from the TraitInfo \
<span
class="label">[](){#x1-150285r26}</span>\# table and the corresponding species name (ConSpecies) from the Consumer table. \
<span class="label">[](){#x1-150286r27}</span> \
<span
class="label">[](){#x1-150287r28}</span>sqlite&gt; SELECT A1.FinalID, A1.Consumer, A2.FinalID,  A2.OriginalTraitName \
<span
class="label">[](){#x1-150288r29}</span>   ...&gt; FROM Consumer A1, TraitInfo A2 \
<span
class="label">[](){#x1-150289r30}</span>   ...&gt; WHERE A1.FinalID=A2.FinalID LIMIT 8; \
<span class="label">[](){#x1-150290r31}</span> \
<span
class="label">[](){#x1-150291r32}</span>FinalID     Consumer               FinalID     OriginalTraitName \
<span
class="label">[](){#x1-150292r33}</span>----------  ---------------------  ----------  ------------------------- \
<span
class="label">[](){#x1-150293r34}</span>MTD1        Chaoborus trivittatus  MTD1        Resource Consumption Rate \
<span
class="label">[](){#x1-150294r35}</span>MTD2        Chaoborus trivittatus  MTD2        Resource Consumption Rate \
<span
class="label">[](){#x1-150295r36}</span>MTD3        Chaoborus americanus   MTD3        Resource Consumption Rate \
<span
class="label">[](){#x1-150296r37}</span>MTD4        Stizostedion vitreum   MTD4        Resource Mass Consumption \
<span
class="label">[](){#x1-150297r38}</span>MTD5        Macrobrachium rosenbe  MTD5        Resource Mass Consumption \
<span
class="label">[](){#x1-150298r39}</span>MTD6        Ranatra dispar         MTD6        Resource Consumption Rate \
<span
class="label">[](){#x1-150299r40}</span>MTD7        Ceriodaphnia reticula  MTD7        Mass-Specific Mass Consum \
<span
class="label">[](){#x1-150300r41}</span>MTD8        Polyphemus pediculus   MTD8        Voluntary Body Velocity \
<span class="label">[](){#x1-150301r42}</span> \
<span
class="label">[](){#x1-150302r43}</span>\# In the same way we assign alias to variables, we can use them for tables.

</div>

This example seems easy because both tables have the same number of
rows. But the query is still as simple when we have tables with diﬀerent
rows.

<div id="listing-137" class="lstlisting">

<span
class="label">[](){#x1-150305r1}</span>\# Let’s import the TCP table: \
<span class="label">[](){#x1-150306r2}</span> \
<span
class="label">[](){#x1-150307r3}</span>sqlite&gt; CREATE TABLE TCP (Numbers integer primary key, \
<span
class="label">[](){#x1-150308r4}</span>   ...&gt;                           OriginalID text, \
<span
class="label">[](){#x1-150309r5}</span>   ...&gt;                           FinalID text, \
<span
class="label">[](){#x1-150310r6}</span>   ...&gt;                           OriginalTraitValue integer, \
<span
class="label">[](){#x1-150311r7}</span>   ...&gt;                           OriginalTraitUnit text, \
<span
class="label">[](){#x1-150312r8}</span>   ...&gt;                           LabGrowthTemp integer, \
<span
class="label">[](){#x1-150313r9}</span>   ...&gt;                           LabGrowthTempUnit text, \
<span
class="label">[](){#x1-150314r10}</span>   ...&gt;                           ConTemp integer, \
<span
class="label">[](){#x1-150315r11}</span>   ...&gt;                           ConTempUnit text, \
<span
class="label">[](){#x1-150316r12}</span>   ...&gt;                           ConTempMethod text, \
<span
class="label">[](){#x1-150317r13}</span>   ...&gt;                           ConAcc text, \
<span
class="label">[](){#x1-150318r14}</span>   ...&gt;                           ConAccTemp integer); \
<span class="label">[](){#x1-150319r15}</span> \
<span class="label">[](){#x1-150320r16}</span> \
<span
class="label">[](){#x1-150321r17}</span>sqlite&gt; .import TCP.csv TCP \
<span class="label">[](){#x1-150322r18}</span>sqlite&gt; .tables \
<span
class="label">[](){#x1-150323r19}</span>Consumer   TCP        TraitInfo \
<span class="label">[](){#x1-150324r20}</span> \
<span
class="label">[](){#x1-150325r21}</span>\# Now imagine we want to query the thermal performance curves that we have \
<span
class="label">[](){#x1-150326r22}</span>\# stored for the species Mytilus edulis. Using the FinalID to match the tables, \
<span
class="label">[](){#x1-150327r23}</span>\# the query can be as simple as: \
<span class="label">[](){#x1-150328r24}</span> \
<span
class="label">[](){#x1-150329r25}</span>sqlite&gt; SELECT A1.ConTemp, A1.OriginalTraitValue, A2.OriginalTraitName, A3.Consumer \
<span
class="label">[](){#x1-150330r26}</span>   ...&gt; FROM TCP A1, TraitInfo A2, Consumer A3 \
<span
class="label">[](){#x1-150331r27}</span>   ...&gt; WHERE A1.FinalID=A2.FinalID AND A3.ConSpecies=\~Mytilus edulis\~ AND A3.FinalID=A2.FinalID LIMIT 8 \
<span class="label">[](){#x1-150332r28}</span> \
<span
class="label">[](){#x1-150333r29}</span>ConTemp     OriginalTraitValue    OriginalTraitName               Consumer \
<span
class="label">[](){#x1-150334r30}</span>----------  --------------------  ------------------------------  -------------------- \
<span
class="label">[](){#x1-150335r31}</span>25          2.707075              Filtration Rate                 Mytilus edulis \
<span
class="label">[](){#x1-150336r32}</span>20          3.40721               Filtration Rate                 Mytilus edulis \
<span
class="label">[](){#x1-150337r33}</span>5           3.419455              Filtration Rate                 Mytilus edulis \
<span
class="label">[](){#x1-150338r34}</span>15          3.711165              Filtration Rate                 Mytilus edulis \
<span
class="label">[](){#x1-150339r35}</span>10          3.875465              Filtration Rate                 Mytilus edulis \
<span
class="label">[](){#x1-150340r36}</span>5           0.34                  In Vitro Gill Particle Transpo  Mytilus edulis \
<span
class="label">[](){#x1-150341r37}</span>10          0.46                  In Vitro Gill Particle Transpo  Mytilus edulis \
<span
class="label">[](){#x1-150342r38}</span>15          0.595                 In Vitro Gill Particle Transpo  Mytilus edulis

</div>

So on and so forth (joining tables etc. would come next...). But if you
want to keep practicing and learn more about sqlite commands, this is a
very useful site: <http://www.sqlite.org/sessions/sqlite.html>. You can
store your queries and database management commands in an .sql ﬁle
(geany will take care of syntax highlighting etc.)

#### <span class="titlemark">6.8.3 </span> [](){#x1-1510006.8.3}SQLite with python {#sqlite-with-python .subsectionHead}

It is easy to access, update and manage SQLite databases with python
(you should have this script ﬁle in your Code directory):

<div class="lstinputlisting">

[](){#x1-151001}  \
<span
class="label">[](){#x1-151002r1}</span>\# import the sqlite3 library \
<span class="label">[](){#x1-151003r2}</span>import sqlite3 \
<span class="label">[](){#x1-151004r3}</span> \
<span
class="label">[](){#x1-151005r4}</span>\# create a connection to the database \
<span
class="label">[](){#x1-151006r5}</span>conn = sqlite3.connect(’../Data/test.db’) \
<span class="label">[](){#x1-151007r6}</span> \
<span
class="label">[](){#x1-151008r7}</span>\# to execute commands, create a \~cursor\~ \
<span class="label">[](){#x1-151009r8}</span>c = conn.cursor() \
<span class="label">[](){#x1-151010r9}</span> \
<span
class="label">[](){#x1-151011r10}</span>\# use the cursor to execute the queries \
<span
class="label">[](){#x1-151012r11}</span>\# use the triple single quote to write \
<span
class="label">[](){#x1-151013r12}</span>\# queries on several lines \
<span
class="label">[](){#x1-151014r13}</span>c.execute(’’’CREATE TABLE Test \
<span
class="label">[](){#x1-151015r14}</span>           (ID INTEGER PRIMARY KEY, \
<span
class="label">[](){#x1-151016r15}</span>           MyVal1 INTEGER, \
<span
class="label">[](){#x1-151017r16}</span>           MyVal2 TEXT)’’’) \
<span class="label">[](){#x1-151018r17}</span> \
<span
class="label">[](){#x1-151019r18}</span>\#∼c.execute(’’’DROP TABLE test’’’) \
<span class="label">[](){#x1-151020r19}</span> \
<span
class="label">[](){#x1-151021r20}</span>\# insert the records. note that because \
<span
class="label">[](){#x1-151022r21}</span>\# we set the primary key, it will auto-increment \
<span
class="label">[](){#x1-151023r22}</span>\# therefore, set it to NULL \
<span
class="label">[](){#x1-151024r23}</span>c.execute(’’’INSERT INTO Test VALUES \
<span
class="label">[](){#x1-151025r24}</span>           (NULL, 3, ’mickey’)’’’) \
<span class="label">[](){#x1-151026r25}</span> \
<span
class="label">[](){#x1-151027r26}</span>c.execute(’’’INSERT INTO Test VALUES \
<span
class="label">[](){#x1-151028r27}</span>           (NULL, 4, ’mouse’)’’’) \
<span class="label">[](){#x1-151029r28}</span> \
<span
class="label">[](){#x1-151030r29}</span>\# when you \~commit\~, all the commands will \
<span class="label">[](){#x1-151031r30}</span>\# be executed \
<span class="label">[](){#x1-151032r31}</span>conn.commit() \
<span class="label">[](){#x1-151033r32}</span> \
<span
class="label">[](){#x1-151034r33}</span>\# now we select the records \
<span
class="label">[](){#x1-151035r34}</span>c.execute(\~SELECT \* FROM TEST\~) \
<span class="label">[](){#x1-151036r35}</span> \
<span
class="label">[](){#x1-151037r36}</span>\# access the next record: \
<span class="label">[](){#x1-151038r37}</span>print c.fetchone() \
<span class="label">[](){#x1-151039r38}</span>print c.fetchone() \
<span class="label">[](){#x1-151040r39}</span> \
<span
class="label">[](){#x1-151041r40}</span>\# let’s get all the records at once \
<span
class="label">[](){#x1-151042r41}</span>c.execute(\~SELECT \* FROM TEST\~) \
<span class="label">[](){#x1-151043r42}</span>print c.fetchall() \
<span class="label">[](){#x1-151044r43}</span> \
<span
class="label">[](){#x1-151045r44}</span>\# insert many records at once: \
<span
class="label">[](){#x1-151046r45}</span>\# create a list of tuples \
<span
class="label">[](){#x1-151047r46}</span>manyrecs = \[(5, ’goofy’), \
<span
class="label">[](){#x1-151048r47}</span>            (6, ’donald’), \
<span
class="label">[](){#x1-151049r48}</span>            (7, ’duck’)\] \
<span class="label">[](){#x1-151050r49}</span> \
<span class="label">[](){#x1-151051r50}</span>\# now call executemany \
<span
class="label">[](){#x1-151052r51}</span>c.executemany(’’’INSERT INTO test \
<span
class="label">[](){#x1-151053r52}</span>                 VALUES(NULL, ?, ?)’’’, manyrecs) \
<span class="label">[](){#x1-151054r53}</span> \
<span class="label">[](){#x1-151055r54}</span>\# and commit \
<span class="label">[](){#x1-151056r55}</span>conn.commit() \
<span class="label">[](){#x1-151057r56}</span> \
<span
class="label">[](){#x1-151058r57}</span>\# now let’s fetch the records \
<span
class="label">[](){#x1-151059r58}</span>\# we can use the query as an iterator! \
<span
class="label">[](){#x1-151060r59}</span>for row in c.execute(’SELECT \* FROM test’): \
<span
class="label">[](){#x1-151061r60}</span>    print ’Val’, row\[1\], ’Name’, row\[2\] \
<span class="label">[](){#x1-151062r61}</span> \
<span
class="label">[](){#x1-151063r62}</span>\# close the connection before exiting \
<span class="label">[](){#x1-151064r63}</span>conn.close()

</div>

You can create a database in memory, without using the disk — thus you
can create and discard an SQLite database within your workﬂow!:

<div class="lstinputlisting">

[](){#x1-151065}  \
<span class="label">[](){#x1-151066r1}</span>import sqlite3 \
<span class="label">[](){#x1-151067r2}</span> \
<span
class="label">[](){#x1-151068r3}</span>conn = sqlite3.connect(\~:memory:\~) \
<span class="label">[](){#x1-151069r4}</span> \
<span class="label">[](){#x1-151070r5}</span>c = conn.cursor() \
<span class="label">[](){#x1-151071r6}</span> \
<span
class="label">[](){#x1-151072r7}</span>c.execute(\~CREATE TABLE tt (Val TEXT)\~) \
<span class="label">[](){#x1-151073r8}</span> \
<span class="label">[](){#x1-151074r9}</span>conn.commit() \
<span class="label">[](){#x1-151075r10}</span> \
<span
class="label">[](){#x1-151076r11}</span>z = \[(’a’,), (’ab’,), (’abc’,), (’b’,), (’c’,)\] \
<span class="label">[](){#x1-151077r12}</span> \
<span
class="label">[](){#x1-151078r13}</span>c.executemany(\~INSERT INTO tt VALUES (?)\~, z) \
<span class="label">[](){#x1-151079r14}</span> \
<span class="label">[](){#x1-151080r15}</span>conn.commit() \
<span class="label">[](){#x1-151081r16}</span> \
<span
class="label">[](){#x1-151082r17}</span>c.execute(\~SELECT \* FROM tt WHERE Val LIKE ’a%’\~).fetchall() \
<span class="label">[](){#x1-151083r18}</span> \
<span class="label">[](){#x1-151084r19}</span>conn.close()
![PICT](SilBioComp267x.png) ![PICT](SilBioComp268x.png)

</div>

### <span class="titlemark">6.9 </span> [](){#x1-1520006.9}Using python to build workﬂows {#using-python-to-build-workﬂows .sectionHead}

You can use python to build an automated data analysis or simulation
workﬂow that involves multiple applications, especially the ones you
have already learnt: R, <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>, & UNIX bash. For example, you could,
in theory, write a single Python script to generate and update your
masters dissertation, tables, plots, and all. Python is ideal for
building such workﬂows because it has packages for practically every
purpose (see Section on Packages above).

#### <span class="titlemark">6.9.1 </span> [](){#x1-1530006.9.1}Using subprocess {#using-subprocess .subsectionHead}

The subprocess module is particularly important as it can run other
applications, including R. Let’s try – ﬁrst launch ipython, then cd to
your python code directory, and type:

<div id="listing-138" class="lstlisting">

<span class="label">[](){#x1-153001r1}</span>import subprocess \
<span
class="label">[](){#x1-153002r2}</span>subprocess.os.system(\~geany boilerplate.py\~) \
<span
class="label">[](){#x1-153003r3}</span>subprocess.os.system(\~gedit ../Data/TestOaksData.csv\~) \
<span
class="label">[](){#x1-153004r4}</span>subprocess.os.system(\~python boilerplate.py\~) \# A bit silly!

</div>

Easy as pie! You will notice that the terminal remains “connected” to
geany after you run the ﬁrst of the three lines above, and you have to
quit geany to go on to launcing gedit. To avoid this, you can do:

<div id="listing-139" class="lstlisting">

<span
class="label">[](){#x1-153005r1}</span>subprocess.os.system(\~geany boilerplate.py &\~) \
<span
class="label">[](){#x1-153006r2}</span>subprocess.os.system(\~gedit ../Data/TestOaksData.csv &\~) \
<span
class="label">[](){#x1-153007r3}</span>subprocess.os.system(\~python boilerplate.py &\~) \# A bit silly!

</div>

Adding a & after a program call, i.e., geany boilerplate.py & instead of
geany boilerplate.py disconnects the terminal and allows you to run
sequential commands in the terminal/bash.

Similarly, to compile your <span class="LATEX">L<span
class="A">A</span><span class="TEX">T<span
class="E">E</span>X</span></span>document (using pdflatex in this case):

<div id="listing-140" class="lstlisting">

<span
class="label">[](){#x1-153008r1}</span>subprocess.os.system(\~pdflatex yourlatexdoc.tex\~)
![PICT](SilBioComp269x.png) ![PICT](SilBioComp270x.png)

</div>

You can also do this (instead of using subprocess.os):

<div id="listing-141" class="lstlisting">

<span
class="label">[](){#x1-153009r1}</span>subprocess.Popen(\~geany boilerplate.py\~, shell=True).wait()

</div>

You can also use subprocess.os to make your code OS (Linux, Windows,
Mac) independent. For example to assign paths:

<div id="listing-142" class="lstlisting">

<span
class="label">[](){#x1-153010r1}</span>subprocess.os.path.join(’directory’, ’subdirectory’, ’file’)

</div>

The result would be appropriately diﬀerent on Windows (with backslashes
instead of forward slashes).

Note that in all cases you can “catch” the output of subprocess so that
you can then use the output within your python script. A simple example,
where the output is a platform-dependent directory path, is:

<div id="listing-143" class="lstlisting">

<span
class="label">[](){#x1-153011r1}</span>MyPath = subprocess.os.path.join(’directory’, ’subdirectory’, ’file’)

</div>

Explore what subprocess can do by tabbing subprocess., and also for
submodules, e.g., type subprocess.os. and then tab.

#### <span class="titlemark">6.9.2 </span> [](){#x1-1540006.9.2}Running R {#running-r .subsectionHead}

R is likely an important part of your project’s analysis and data
visualization components in particular — for example for statistical
analyses and pretty plotting (Ahem. ggplot2).

You can run R from Python pretty easily. Try the following:

-   Create an R script ﬁle called TestR.R in your Week6/Code with the
    following content:
    <div id="listing-144" class="lstlisting">

    <span
    class="label">[](){#x1-154001r1}</span>print(\~Hello, this is R!\~)

    </div>

    ![PICT](SilBioComp271x.png) ![PICT](SilBioComp272x.png)
-   Now, create TestR.py in CMEECourseWork/Week6/Code with the following
    content :

    <div id="listing-145" class="lstlisting">

    <span class="label">[](){#x1-154002r1}</span>import subprocess \
    <span
    class="label">[](){#x1-154003r2}</span>subprocess.Popen(\~/usr/lib/R/bin/Rscript --verbose TestR.R &gt; \\ \
    <span
    class="label">[](){#x1-154004r3}</span>../Results/TestR.Rout 2&gt; ../Results/TestR\_errFile.Rout\~,\\ \
    <span class="label">[](){#x1-154005r4}</span> shell=True).wait()

    </div>

    Note the backslashes — this is so that python can read the mutiline
    script as a single line.

-   Now run TestR.py (or %cpaste) and check TestR.Rout
    and TestR\_errorFile.Rout.
-   Also check what happens if you run (type directly in ipython or
    python console):
    <div id="listing-146" class="lstlisting">

    <span
    class="label">[](){#x1-154006r1}</span>subprocess.Popen(\~/usr/lib/R/bin/Rscript --verbose NonExistScript.R &gt; \\ \
    <span
    class="label">[](){#x1-154007r2}</span>../Results/outputFile.Rout 2&gt; ../Results/errorFile.Rout\~, \\ \
    <span class="label">[](){#x1-154008r3}</span>shell=True).wait()

    </div>

SVG-Viewer needed.

What do you see on the screen? Now check outputFile.Rout and
errorFile.Rout.

### <span class="titlemark">6.10 </span> [](){#x1-1550006.10}Practicals {#practicals-8 .sectionHead}

As always, test, add, commit and push all your new code and data to your
git repository.

##### [](){#x1-1560006.10}Using os problem 1 {#using-os-problem-1 .subsubsectionHead}

Open using\_os.py and complete the tasks assigned\
(hint: you might want to look at subprocess.os.walk())
![PICT](SilBioComp273x.png) ![PICT](SilBioComp274x.png)

##### [](){#x1-1570006.10}Using os problem 2 {#using-os-problem-2 .subsubsectionHead}

Open fmr.R and work out what it does; check that you have
NagyEtAl1999.csv. Now write python code called run\_fmr\_R.py that:

-   Runs fmr.R to generate the desired result
-   run\_fmr\_R.py should also print to the python screen whether the
    run was successful, and the contents of the R console output

### <span class="titlemark">6.11 </span> [](){#x1-1580006.11}Practicals wrap-up {#practicals-wrap-up-2 .sectionHead}

 1. 
:   Review and make sure you can run all the commands, code fragments,
    and scripts we have till now and get the expected outputs — all
    scripts should work on any other linux laptop.

 2. 
:   Include an appropriate docstring (if one is missing) at the
    beginning of each of each of the python script / module ﬁles you
    have written, as well as at the start of every function
    (or sub-module) in a module.

 3. 
:   Also annotate your code lines as much and as often as necessary
    using \#.

 4. 
:   Keep all ﬁles organized in CMEECourseWork.

 5. 
:   git add, commit and push all your week’s code and data to your git
    repository by next Wednesday.

### <span class="titlemark">6.12 </span> [](){#x1-1590006.12}Readings and Resources {#readings-and-resources-1 .sectionHead}

-   <http://matplotlib.org/> ![PICT](SilBioComp275x.png)
    ![PICT](SilBioComp276x.png)
-   For SciPy, the oﬃcial documentation is great:\
    <https://docs.scipy.org/doc/scipy/reference/>\
    Read about the scipy modules you think will be important to you.
-   The “ecosystem” for Scientiﬁc computing in python:
    [http://www.scipy-\_lectures.org/](http://www.scipy-lectures.org/){.url}
-   A Primer on Scientiﬁc Programming with Python
    <http://www.springer.com/us/book/9783642549595>; Multiple copies of
    this book are available from the central library and can be
    requested to Silwood from the IC library website. You can also ﬁnd a
    pdf - google it
-   Many great examples of applications in the scipy cookbook:
    <https://lagunita.stanford.edu/courses/DB/2014/SelfPaced/about>
-   <https://docs.python.org/2/howto/regex.html>
-   Google’s short class on regex in python:\
    [https://developers.google.com/edu/python/regular-\_expressions](https://developers.google.com/edu/python/regular-expressions){.url}
-   [http://www.regular-\_expressions.info/](http://www.regular-expressions.info/){.url}
    has a good intro, tips and a great array of canned solutions
-   Use and abuse of regex:\
    [https://blog.codinghorror.com/regex-\_use-\_vs-\_regex-\_abuse/](https://blog.codinghorror.com/regex-use-vs-regex-abuse/){.url}
-   “The Deﬁnitive Guide to SQLite” is a pretty complete guide to SQLite
    and freely available from
    [http://sd.blackball.lv/library/The\_Definitive\_Guide\_to\_SQLite\_2nd\_edition.pdf](%0Ahttp://sd.blackball.lv/library/The_Definitive_Guide_to_SQLite_2nd_edition.pdf){.url}
-   For databses in general, try the Stanford Introduction to Databases
    course: <https://www.coursera.org/course/db>

![PICT](SilBioComp277x.png) ![PICT](SilBioComp278x.png)

![PICT](SilBioComp279x.png) ![PICT](SilBioComp280x.png)

<span class="titlemark">Chapter 7</span>\
[](){#x1-1600007}Introduction to R {#chapter7-introduction-to-r .chapterHead}
-----------------------------------------

### <span class="titlemark">7.1 </span> [](){#x1-1610007.1}Outline of the the R module {#outline-of-the-the-r-module .sectionHead}

You will use R a lot during the rest of your courses, your thesis
dissertation, and very likely, your career. The R module aims to lay
down the foundations for you to become comfortable with it, speciﬁcally,

-   Giving you an introduction to R syntax and programming conventions,
    assuming you have never set your eyes on R
-   Teaching you principles of data processing and exploration
    (including visualization) using R
-   Teaching you principles of clean and eﬃcient programming using R
-   Teaching you how to generate publication quality graphics in R
-   Teaching you how to develop reproducible data analysis “work ﬂows”
    so you (or anybody else) can run and re-run your analyses, graphics
    outputs and all, in R

### <span class="titlemark">7.2 </span> [](){#x1-1620007.2}What is R? {#what-is-r .sectionHead}

R is a freely available statistical software with strong programming
capabilities widely used by professional scientists around the world. It
was based on the commercial statistical software S by Robert Gentleman
and Ross Ihaka. The ﬁrst stable version appeared in 2000.

R was essentially designed for programming statistical analysis and
data-mining. It became the standard tool for data analysis and
visualization in biology in a matter of just 10 years or so. It is also
increasingly being used for modelling in biology. This is because

 1. 
:   R has many tried and tested packages to perform practically all
    statistical analysis

 2. 
:   R has numerous packages for data-handling and processing

 3. 
:   R has excellent graphing and visualization capabilities

 4. 
:   R has good capabilities for mathematical calculations, including
    matrix algebra

![PICT](SilBioComp281x.png) ![PICT](SilBioComp282x.png)

### <span class="titlemark">7.3 </span> [](){#x1-1630007.3}Why R? {#why-r .sectionHead}

There are many commercial statistical (minitab, SPSS, etc) software
packages in the world that are mouse-driven, warm, and friendly, and
have lots of statistical tests and plotting/graphing capabilities. Why
not just use them? Here are some very good reasons:

-   R is scriptable, so you can build a perfectly repeatable record of
    your analysis. This in itself has several advantages:
    -   You can never replicate exactly the same analysis with all the
        same steps using a point-and-click approach/software. With R you
        can reproduce your full analysis for yourself (in the future!),
        your colleagues, your supervisor/employer, and any journal you
        might want to submit your work to.
    -   You may need to rerun your analysis every time you get new data.
        Once you have it all in a R script, you can just rerun your
        analysis and go home!
    -   You may need to tweak your analysis many times (new data,
        supervisor changes mind, you change mind, paper reviewers want
        you do something diﬀerently). Having the analysis recorded as
        script then allows you to do so by revising the relevant parts
        of your analysis with relatively little pain.
-   R provides basically every statistical test you’ll ever need and is
    constantly being improved – you can tailor your analyses rather than
    trying to use the more limited options each statistical software
    package can oﬀer
-   R can produce publication-quality graphics that can be re-produced
    with scripts – you won’t get RSI mouse-clicking your way though
    graphing and re-graphing your data every time you change your
    analysis!
-   R is freely available for all common computer operating systems – if
    you want a copy on your laptop, help yourself at the
    [CRAN](https://cran.r-project.org) website.

Thus, being able to program in R means you can develop and automate your
own data handling, statistical analysis, and graphing/plotting, a set of
skills you are likely to need in many, if not most careers paths!

#### <span class="titlemark">7.3.1 </span> [](){#x1-1640007.3.1}Would you ever need anything other than R? {#would-you-ever-need-anything-other-than-r .subsectionHead}

![PICT](SilBioComp283x.png) ![PICT](SilBioComp284x.png)

Being able to program R means you can develop and automate your
statistical analyses and the generation of ﬁgures into a reproducible
work ﬂow. For many of you, using R as your only programming language
will do the job. However, if your work also includes extensive numerical
simulations, manipulation of very large matrices, bioinformatics,
relational database access and manipulation, or web development, you
will be better-oﬀ also knowing another programming language that is more
versatile and computationally eﬃcient (like python, perl or C).

### <span class="titlemark">7.4 </span> [](){#x1-1650007.4}Installing R {#installing-r .sectionHead}

If you are using a college computer, R will likely already be available.
Otherwise you can install R on your own computer as follows:

On linux/ubuntu, run the following in terminal:

<div id="listing-147" class="lstlisting">

<span
class="label">[](){#x1-165001r1}</span>sudo apt-get install r-base r-base-dev

</div>

On Mac OS X, download and install from:
[https://cran.r-\_project.org/bin/macosx/](https://cran.r-project.org/bin/macosx/){.url}

On Windows, download and install from:
[https://cran.r-\_project.org/bin/windows/base/](https://cran.r-project.org/bin/windows/base/){.url}

### <span class="titlemark">7.5 </span> [](){#x1-1660007.5}Getting started {#getting-started .sectionHead}

Let’s brieﬂy look at the bare-bones R interface and command line
interface (CLI), and then switch to a more Interactive Development
Environment (IDE) like Geany or RStudio.

Launch R (From Applications menu on Window or Mac, from terminal in
Linux/Ubuntu) — it should look something like this (on Linux/Ubuntu or
Mac terminal):

<div class="center">

![PIC](Graphics/R_Linux.png)

</div>

Or like this (Windows “console”, similar in Mac):

![PICT](SilBioComp285x.png) ![PICT](SilBioComp286x.png)

<div class="center">

![PIC](Graphics/HorrorVacui.png)

</div>

#### <span class="titlemark">7.5.1 </span> [](){#x1-1670007.5.1}Gooey IDEs! {#gooey-ides .subsectionHead}

To develop your R code, you should ideally use an IDE (Interactive
Development Environment) that oﬀers useful features like syntax
highlighting (google it!) and embedded data and plot viewing windows,
such as RStudio, geany, vim, etc.

These IDEs come with graphic user interfaces (GUI’s, or “gooeys”) of
diﬀering levels of sophistication and shiny-ness.

In fact, one of the reasons that R has become so popular is that there
are some very nice, freely available GUI IDE’s for it where you can use
your mouse to do certain “stuﬀ”.

In particular, [RStudio](http://rstudio.org/) is very good.

A big advantage of something like RStudio is that you will get “syntax
highlighting” wherein R language elements such as variables, commands,
and brackets are diﬀerently colored. This is very handy and will make
your R programming far more convenient and error-free. If you are using
your own desktop/laptop, you can download it freely from
<https://www.rstudio.com/> and install (versions are available for all
computer platforms). If you are suing a college computer, it should
already be available.

The R modules do not require you to use RStudio (everything will be
command line based), but I would recommend that you to use it, or some
other IDE like geany or emacs.

You may now launch RStudio (assuming it is available on your computer).
Here is an example RStudio window:

<div class="center">

![PIC](Graphics/RStudio.png)

</div>

You are still in the R environment, but with some useful frills and
additional thrills. There are four main elements here (you can hide or
resize any of them using the RStudio GUI options):

 Console 
:   This is the same R terminal you saw above. In this week we will work
    mainly in this console ![PICT](SilBioComp287x.png)
    ![PICT](SilBioComp288x.png)

 Source code 
:   This panel is the code editor with syntax highlighting and other
    handy features that we will explore soon. This is where you will
    write your scripts/programs, and save them. To save, you will use
    Ctrl + S and to execute it you will use Ctrl + Shift + S

 Environment 
:   This panel lists all the variables you created (more on this later).
    It has another tab that shows you the history of the commands you
    typed

 Plots 
:   This panel shows you all the plots you drew. Other tabs in this
    panel allow you to access the list of packages you have loaded, and
    the help page for commands (just type help(command\_name) in
    the Console) and packages

In RStudio, you can feed your mouse habit, but I strongly suggest using
the terminal/console, and resist, to the extent possible, the temptation
to do everything using the shiny buttons you see (that is the dark side
pulling, my young padawan).

### <span class="titlemark">7.6 </span> [](){#x1-1680007.6}Some R Basics {#some-r-basics .sectionHead}

Gets get started with some R basics. You will be working by entering R
commands interactively at the R user prompt (&gt;). Up and down arrow
keys scroll through your command history.

#### <span class="titlemark">7.6.1 </span> [](){#x1-1690007.6.1}Useful R commands {#useful-r-commands .subsectionHead}

<div class="tabular">

ls()

list all the variables in the work space

rm(’a’, ’b’)

remove variable(s) a and b

rm(list=ls())

remove all variable(s)

getwd()

get current working directory

setwd(’Path’)

set working directory to Path

q()

quit R

?Command

show the documentation of Command

??Keyword

search the all packages/functions with Keyword, “fuzzy search”

</div>

\

#### <span class="titlemark">7.6.2 </span> [](){#x1-1700007.6.2}R Warm-up {#r-warm-up .subsectionHead}

Like in any programming language, you will need to use “variables” to
store information in a R session’s workspace. Each Variable has a
reserved location in your memory (RAM), and takes up “real
![PICT](SilBioComp289x.png) ![PICT](SilBioComp290x.png) estate” in it —
that is when you create a variable you reserve some space in yur
computer’s memory.

Now, try assigning a few variables in the R and doing things to them:

<div id="listing-148" class="lstlisting">

<span
class="label">[](){#x1-170001r1}</span>&gt; a &lt;- 4  \# store 4 as variable a \
<span class="label">[](){#x1-170002r2}</span>&gt; a \
<span class="label">[](){#x1-170003r3}</span>\[1\] 4 \
<span class="label">[](){#x1-170004r4}</span>&gt; a\*a  \# product \
<span class="label">[](){#x1-170005r5}</span>\[1\] 16 \
<span
class="label">[](){#x1-170006r6}</span>&gt; a\_squared &lt;- a\*a \
<span
class="label">[](){#x1-170007r7}</span>&gt; sqrt(a\_squared) \# square root \
<span class="label">[](){#x1-170008r8}</span>\[1\] 4 \
<span
class="label">[](){#x1-170009r9}</span>&gt; v &lt;- c(0, 1, 2, 3, 4) \# build a vector with c (for \~concatenate\~)

</div>

Note that any text after a “\#” is ignored by R — handy for commenting.
In general, please comment your code and scripts, for everybody’s sake.
You will be amazed by how diﬃcult it is to read and understand what a
certain R script does (or any other script, for that matter) without
judicious comments — even scripts you yourself wrote not so long ago!

SVG-Viewer needed.

OK continuing our R warmup:

<div id="listing-149" class="lstlisting">

<span
class="label">[](){#x1-170010r1}</span>&gt; v \# Display the vector variable you created \
<span class="label">[](){#x1-170011r2}</span>\[1\] 0 1 2 3 4 \
<span
class="label">[](){#x1-170012r3}</span>&gt; is.vector(v) \# check if it’s a vector \
<span class="label">[](){#x1-170013r4}</span>\[1\] TRUE \
<span class="label">[](){#x1-170014r5}</span>&gt; mean(v) \# mean \
<span class="label">[](){#x1-170015r6}</span>\[1\] 2

</div>

SVG-Viewer needed.

This is one of many ways R stores and processes data. More on R data
types and objects below.

A single value (any kind) is a vector object of length 1 by default.
That’s why in the console you see \[1\] before any single-value output
(e.g., type 8, and you will see \[1\] 8).

<div id="listing-150" class="lstlisting">

<span class="label">[](){#x1-170016r1}</span>&gt; var(v) \# variance \
<span class="label">[](){#x1-170017r2}</span>\[1\] 2.5 \
<span class="label">[](){#x1-170018r3}</span>&gt; median(v) \# median \
<span class="label">[](){#x1-170019r4}</span>\[1\] 2 \
<span
class="label">[](){#x1-170020r5}</span>&gt; sum(v) \# sum all elements \
<span class="label">[](){#x1-170021r6}</span>\[1\] 10 \
<span
class="label">[](){#x1-170022r7}</span>&gt; prod(v + 1) \# multiply \
<span class="label">[](){#x1-170023r8}</span>\[1\] 120 \
<span
class="label">[](){#x1-170024r9}</span>&gt; length(v) \# length of vector \
<span class="label">[](){#x1-170025r10}</span>\[1\] 5

</div>

![PICT](SilBioComp291x.png) ![PICT](SilBioComp292x.png)

#### <span class="titlemark">7.6.3 </span> [](){#x1-1710007.6.3}Variable names and Tabbing {#variable-names-and-tabbing .subsectionHead}

In R, you can name variables in the following way to keep track of
related variables:

<div id="listing-151" class="lstlisting">

<span
class="label">[](){#x1-171001r1}</span>&gt; wing.width.cm &lt;- 1.2 \#Using dot notation \
<span
class="label">[](){#x1-171002r2}</span>&gt; wing.length.cm &lt;- c(4.7, 5.2, 4.8)

</div>

This can be handy; type:

<div id="listing-152" class="lstlisting">

<span class="label">[](){#x1-171003r1}</span>&gt; wing.

</div>

And then hit the tab key to reveal all variables in that category. This
is nice — variable names should be as obvious as possible. However, they
should not be over-long either! Good style and readability is more
important than just convenient variable names.

#### <span class="titlemark">7.6.4 </span> [](){#x1-1720007.6.4}Operators {#operators .subsectionHead}

The usual “operators” are available in R:

<div class="tabular">

+

Addition

-

Subtraction

\*

Multiplication

/

Division

\^

Power

%%

Modulo

%/%

Integer division

==

Equals

!=

Diﬀers

$>$

Greater

$>$=

Greater or equal

&

Logical and

$|$

Logical or

!

Logical not

</div>

#### <span class="titlemark">7.6.5 </span> [](){#x1-1730007.6.5}When things go wrong {#when-things-go-wrong .subsectionHead}

![PICT](SilBioComp293x.png) ![PICT](SilBioComp294x.png)

Syntax errors are those where you’ve just made a mistake while typing
code. Here are some common problems in R:

-   missing close bracket leads to continuation line.

    <div id="listing-153" class="lstlisting">

    <span
    class="label">[](){#x1-173001r1}</span>&gt; x &lt;- (1 + (2 \* 3) \
    <span class="label">[](){#x1-173002r2}</span>+

    </div>

    Hit Ctrl-C (UNIX terminal or base R command line) or ESC (in
    in RStudio) or keep typing!

-   Too many parentheses: 2 + (2\*3))
-   Wrong or mismatched brackets (see next subsection)
-   Do not mix double quotes and single quotes

SVG-Viewer needed.

#### <span class="titlemark">7.6.6 </span> [](){#x1-1740007.6.6}Types of parentheses {#types-of-parentheses .subsectionHead}

R has speciﬁc uses for diﬀerent types of parentheses that you need to
get used to:

![PICT](SilBioComp295x.png) ![PICT](SilBioComp296x.png)

<div class="tabular">

  -------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  f(3,4)                     call the function (or command) f, with the arguments 3 & 4.
  a + (b\*c)                 to enforce order over which statements or calculations are executed. Here (b\*c) is executed before adding to a; here is an alternative order: (a + b)\*c
  { expr1; expr2; …exprn }   group a set of expressions or commands into one compound expression. Value returned is value of last expression; used in building function, loops, and conditionals (more on these soon!).
  x\[4\]                     get the 4th element of the vector x.
  li\[\[3\]\]                get the 3rd element of some list li, and return it. (compare with li\[3\], which returns a list with just the 3rd element inside). More on lists in next section
  -------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

### <span class="titlemark">7.7 </span> [](){#x1-1750007.7}Variable Types {#variable-types .sectionHead}

There are diﬀerent kinds of data variable types in R, but you will
basically need to know four for most of your work: integer, ﬂoat (or
“numeric”, including real numbers), string (or “character”, e.g., text),
and Boolean (“logical”; True or False). Try this:

<div id="listing-154" class="lstlisting">

<span class="label">[](){#x1-175001r1}</span>&gt; v &lt;- TRUE \
<span class="label">[](){#x1-175002r2}</span>&gt; class(v) \
<span class="label">[](){#x1-175003r3}</span>\[1\] \~logical\~ \
<span class="label">[](){#x1-175004r4}</span> \
<span class="label">[](){#x1-175005r5}</span>&gt; v &lt;- 3.2 \
<span class="label">[](){#x1-175006r6}</span>&gt; class(v) \
<span class="label">[](){#x1-175007r7}</span>\[1\] \~numeric\~ \
<span class="label">[](){#x1-175008r8}</span> \
<span class="label">[](){#x1-175009r9}</span>&gt; v &lt;- 2L \
<span class="label">[](){#x1-175010r10}</span>&gt; class(v) \
<span class="label">[](){#x1-175011r11}</span>\[1\] \~integer\~ \
<span class="label">[](){#x1-175012r12}</span> \
<span
class="label">[](){#x1-175013r13}</span>&gt; v &lt;- \~A string\~ \
<span class="label">[](){#x1-175014r14}</span>&gt; class(v) \
<span class="label">[](){#x1-175015r15}</span>\[1\] \~character\~

</div>

SVG-Viewer needed.

![PICT](SilBioComp297x.png) ![PICT](SilBioComp298x.png)

#### <span class="titlemark">7.7.1 </span> [](){#x1-1760007.7.1}Type Conversion and Special Values {#type-conversion-and-special-values .subsectionHead}

In the following examples, the as.\* commands all convert a variable
from one type to another:

<div id="listing-156" class="lstlisting">

<span class="label">[](){#x1-176001r1}</span>&gt; as.integer(3.1) \
<span class="label">[](){#x1-176002r2}</span>\[1\] 3 \
<span class="label">[](){#x1-176003r3}</span>&gt; as.numeric(4) \
<span class="label">[](){#x1-176004r4}</span>\[1\] 4 \
<span class="label">[](){#x1-176005r5}</span>&gt; as.roman(155) \
<span class="label">[](){#x1-176006r6}</span>\[1\] CLV \
<span
class="label">[](){#x1-176007r7}</span>&gt; as.character(155) \# same as converting to string \
<span class="label">[](){#x1-176008r8}</span>\[1\] \~155\~ \
<span
class="label">[](){#x1-176009r9}</span>&gt; as.logical(5) \#what’s happening here?! \
<span class="label">[](){#x1-176010r10}</span>\[1\] TRUE \
<span class="label">[](){#x1-176011r11}</span>&gt; as.logical(0) \
<span class="label">[](){#x1-176012r12}</span>\[1\] FALSE \
<span class="label">[](){#x1-176013r13}</span>&gt; b &lt;- NA \
<span class="label">[](){#x1-176014r14}</span>&gt; is.na(b) \
<span class="label">[](){#x1-176015r15}</span>\[1\] TRUE \
<span class="label">[](){#x1-176016r16}</span>&gt; b &lt;- 0/0 \
<span class="label">[](){#x1-176017r17}</span>&gt; b \
<span class="label">[](){#x1-176018r18}</span>\[1\] NaN \
<span class="label">[](){#x1-176019r19}</span>&gt; is.nan(b) \
<span class="label">[](){#x1-176020r20}</span>\[1\] TRUE \
<span class="label">[](){#x1-176021r21}</span>&gt; b &lt;- 5/0 \
<span class="label">[](){#x1-176022r22}</span>&gt; b \
<span class="label">[](){#x1-176023r23}</span>\[1\] Inf \
<span class="label">[](){#x1-176024r24}</span>&gt; is.nan(b) \
<span class="label">[](){#x1-176025r25}</span>\[1\] FALSE \
<span class="label">[](){#x1-176026r26}</span>&gt; is.infinite(b) \
<span class="label">[](){#x1-176027r27}</span>\[1\] TRUE \
<span class="label">[](){#x1-176028r28}</span>&gt; is.finite(b) \
<span class="label">[](){#x1-176029r29}</span>\[1\] FALSE \
<span class="label">[](){#x1-176030r30}</span>&gt; is.finite(0/0) \
<span class="label">[](){#x1-176031r31}</span>\[1\] FALSE

</div>

SVG-Viewer needed.

### <span class="titlemark">7.8 </span> [](){#x1-1770007.8}Data Structure types {#data-structure-types .sectionHead}

R comes with diﬀerent built-in structures (objects) for data storage and
manipulation. Mastering these, and knowing which one to use when will
help you write better, more eﬃcient programs and also handle diverse
datasets (numbers, counts, names, dates, etc).

#### <span class="titlemark">7.8.1 </span> [](){#x1-1780007.8.1}Vectors {#vectors .subsectionHead}

The Vector, which you ﬁrst saw above, is a fundamental data object in R.
Scalars (single data values) are treated as vector of length 1. A vector
is like a single column or row in a spreadsheet. Now get back into R (if
you somehow quit R using q() or something else), and try this:

<div id="listing-157" class="lstlisting">

<span class="label">[](){#x1-178001r1}</span>&gt; a &lt;- 5 \
<span class="label">[](){#x1-178002r2}</span>&gt; is.vector(a) \
<span class="label">[](){#x1-178003r3}</span>\[1\] TRUE \
<span
class="label">[](){#x1-178004r4}</span>&gt; v1 &lt;- c(0.02, 0.5, 1) \
<span
class="label">[](){#x1-178005r5}</span>&gt; v2 &lt;- c(\~a\~, \~bc\~, \~def\~, \~ghij\~) \
<span
class="label">[](){#x1-178006r6}</span>&gt; v3 &lt;- c(TRUE, TRUE, FALSE)

</div>

![PICT](SilBioComp299x.png) ![PICT](SilBioComp300x.png)

R vectors can only store data of a single type (e.g., all numeric or all
character). If you try to combine diﬀerent types, R will homogenize
everything to the same data type. To see this, try the following:

<div id="listing-158" class="lstlisting">

<span
class="label">[](){#x1-178007r1}</span>&gt; v1 &lt;- c(0.02, TRUE, 1) \
<span
class="label">[](){#x1-178008r2}</span>&gt; v1 \# TRUE gets converted to 1.00! \
<span class="label">[](){#x1-178009r3}</span>\[1\] 0.02 1.00 1.00 \
<span
class="label">[](){#x1-178010r4}</span>&gt; v1 &lt;- c(0.02, \~Mary\~, 1) \
<span
class="label">[](){#x1-178011r5}</span>&gt; v1 \# Everything gets converted to text! \
<span
class="label">[](){#x1-178012r6}</span>\[1\] \~0.02\~ \~Mary\~ \~1\~

</div>

#### <span class="titlemark">7.8.2 </span> [](){#x1-1790007.8.2}Matrices and arrays {#matrices-and-arrays .subsectionHead}

A Rmatrix is a 2 dimensional vector (has both rows and columns). and an
R array is can store data in more than two dimensions (e.g., a stack of
2-D matrices).

R has many functions to build and manipulate matrices and arrays. Try:

<div id="listing-159" class="lstlisting">

<span
class="label">[](){#x1-179001r1}</span>&gt; mat1 &lt;- matrix(1:25, 5, 5) \
<span class="label">[](){#x1-179002r2}</span>&gt; mat1 \
<span
class="label">[](){#x1-179003r3}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-179004r4}</span>\[1,\]    1    6   11   16   21 \
<span
class="label">[](){#x1-179005r5}</span>\[2,\]    2    7   12   17   22 \
<span
class="label">[](){#x1-179006r6}</span>\[3,\]    3    8   13   18   23 \
<span
class="label">[](){#x1-179007r7}</span>\[4,\]    4    9   14   19   24 \
<span
class="label">[](){#x1-179008r8}</span>\[5,\]    5   10   15   20   25 \
<span
class="label">[](){#x1-179009r9}</span>&gt; mat1 &lt;- matrix(1:25, 5, 5, byrow=TRUE) \
<span class="label">[](){#x1-179010r10}</span>&gt; mat1 \
<span
class="label">[](){#x1-179011r11}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-179012r12}</span>\[1,\]    1    2    3    4    5 \
<span
class="label">[](){#x1-179013r13}</span>\[2,\]    6    7    8    9   10 \
<span
class="label">[](){#x1-179014r14}</span>\[3,\]   11   12   13   14   15 \
<span
class="label">[](){#x1-179015r15}</span>\[4,\]   16   17   18   19   20 \
<span
class="label">[](){#x1-179016r16}</span>\[5,\]   21   22   23   24   25 \
<span
class="label">[](){#x1-179017r17}</span>&gt; dim(mat1) \#get the size of the matrix \
<span class="label">[](){#x1-179018r18}</span>\[1\] 5 5

</div>

Make an array consisting of two 5$\times$5 matrices containing the
integers 1–50:

<div id="listing-160" class="lstlisting">

<span
class="label">[](){#x1-179019r1}</span>&gt; arr1 &lt;- array(1:50, c(5, 5, 2)) \
<span class="label">[](){#x1-179020r2}</span>&gt; arr1 \
<span class="label">[](){#x1-179021r3}</span>, , 1 \
<span class="label">[](){#x1-179022r4}</span> \
<span
class="label">[](){#x1-179023r5}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-179024r6}</span>\[1,\]    1    6   11   16   21 \
<span
class="label">[](){#x1-179025r7}</span>\[2,\]    2    7   12   17   22 \
<span
class="label">[](){#x1-179026r8}</span>\[3,\]    3    8   13   18   23 \
<span
class="label">[](){#x1-179027r9}</span>\[4,\]    4    9   14   19   24 \
<span
class="label">[](){#x1-179028r10}</span>\[5,\]    5   10   15   20   25 \
<span class="label">[](){#x1-179029r11}</span> \
<span class="label">[](){#x1-179030r12}</span>, , 2 \
<span class="label">[](){#x1-179031r13}</span> \
<span
class="label">[](){#x1-179032r14}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-179033r15}</span>\[1,\]   26   31   36   41   46 \
<span
class="label">[](){#x1-179034r16}</span>\[2,\]   27   32   37   42   47 \
<span
class="label">[](){#x1-179035r17}</span>\[3,\]   28   33   38   43   48 \
<span
class="label">[](){#x1-179036r18}</span>\[4,\]   29   34   39   44   49 \
<span
class="label">[](){#x1-179037r19}</span>\[5,\]   30   35   40   45   50

</div>

Just like R vectors, R matrices and arrays have to be of a homogeneous
type, and R will do the same sort of type homogenization you saw for R
vectors above (try inserting a text value in mat1 and see what happens),
and in python’s numpy array and matrix data structures.

#### <span class="titlemark">7.8.3 </span> [](){#x1-1800007.8.3}Data frames {#data-frames .subsectionHead}

This is a very important data structure in R. Unlike matrices and
vectors, R data frames can store data in which each column contains a
diﬀerent data type (e.g., numbers, strings, boolean) or even a
combination of data types, just like a standard spreadsheet. Indeed, the
dataframe data type was built to emulate some of the convenient
properties of spreadsheets. Many statistical and plotting functions and
packages in R naturally use data frames. Let’s build and manipulate a
dataframe:

![PICT](SilBioComp301x.png) ![PICT](SilBioComp302x.png)

<div id="listing-161" class="lstlisting">

<span class="label">[](){#x1-180001r1}</span>&gt; Col1 &lt;- 1:10 \
<span class="label">[](){#x1-180002r2}</span>&gt; Col1 \
<span
class="label">[](){#x1-180003r3}</span> \[1\]  1  2  3  4  5  6  7  8  9 10 \
<span
class="label">[](){#x1-180004r4}</span>&gt; Col2 &lt;- LETTERS\[1:10\] \
<span class="label">[](){#x1-180005r5}</span>&gt; Col2 \
<span
class="label">[](){#x1-180006r6}</span> \[1\] \~A\~ \~B\~ \~C\~ \~D\~ \~E\~ \~F\~ \~G\~ \~H\~ \~I\~ \~J\~ \
<span
class="label">[](){#x1-180007r7}</span>&gt; Col3 &lt;- runif(10) \# 10 random numbers from a uniform distribution \
<span class="label">[](){#x1-180008r8}</span>&gt; Col3 \
<span
class="label">[](){#x1-180009r9}</span> \[1\] 0.29109 0.91495 0.64962 0.95503 0.26589 0.02482 0.59718 \
<span
class="label">[](){#x1-180010r10}</span> \[8\] 0.99134 0.98786 0.86168 \
<span
class="label">[](){#x1-180011r11}</span>&gt; MyDF &lt;- data.frame(Col1, Col2, Col3) \
<span class="label">[](){#x1-180012r12}</span>&gt; MyDF \
<span class="label">[](){#x1-180013r13}</span>     Col1 Col2      Col3 \
<span class="label">[](){#x1-180014r14}</span>1     1    A 0.2910981 \
<span class="label">[](){#x1-180015r15}</span>2     2    B 0.9149558 \
<span class="label">[](){#x1-180016r16}</span>3     3    C 0.6496248 \
<span class="label">[](){#x1-180017r17}</span>4     4    D 0.9550331 \
<span class="label">[](){#x1-180018r18}</span>5     5    E 0.2658936 \
<span class="label">[](){#x1-180019r19}</span>6     6    F 0.0248217 \
<span class="label">[](){#x1-180020r20}</span>7     7    G 0.5971868 \
<span class="label">[](){#x1-180021r21}</span>8     8    H 0.9913407 \
<span class="label">[](){#x1-180022r22}</span>9     9    I 0.9878679 \
<span class="label">[](){#x1-180023r23}</span>10   10    J 0.8616854 \
<span
class="label">[](){#x1-180024r24}</span>&gt; names(MyDF) &lt;- c(\~A.name\~, \~another\~, \~another.one\~) \
<span class="label">[](){#x1-180025r25}</span>&gt; MyDF \
<span
class="label">[](){#x1-180026r26}</span>     A.name another another.one \
<span
class="label">[](){#x1-180027r27}</span>1       1       A   0.2910981 \
<span
class="label">[](){#x1-180028r28}</span>2       2       B   0.9149558 \
<span
class="label">[](){#x1-180029r29}</span>3       3       C   0.6496248 \
<span
class="label">[](){#x1-180030r30}</span>4       4       D   0.9550331 \
<span
class="label">[](){#x1-180031r31}</span>5       5       E   0.2658936 \
<span
class="label">[](){#x1-180032r32}</span>6       6       F   0.0248217 \
<span
class="label">[](){#x1-180033r33}</span>7       7       G   0.5971868 \
<span
class="label">[](){#x1-180034r34}</span>8       8       H   0.9913407 \
<span
class="label">[](){#x1-180035r35}</span>9       9       I   0.9878679 \
<span
class="label">[](){#x1-180036r36}</span>10     10       J   0.8616854

</div>

Unlike matrices, you can access the contents of data frames by naming
the columns using a \$ sign:

<div id="listing-162" class="lstlisting">

<span class="label">[](){#x1-180037r1}</span>&gt; MyDF\$A.name \
<span
class="label">[](){#x1-180038r2}</span> \[1\]  1  2  3  4  5  6  7  8  9 10 \
<span
class="label">[](){#x1-180039r3}</span>&gt; MyDF\[,1\] \#using numerical indexing instead \
<span
class="label">[](){#x1-180040r4}</span> \[1\]  1  2  3  4  5  6  7  8  9 10 \
<span
class="label">[](){#x1-180041r5}</span>&gt; MyDF\[c(\~A.name\~,\~another\~)\] \# show two specific columns only \
<span class="label">[](){#x1-180042r6}</span>     A.name another \
<span class="label">[](){#x1-180043r7}</span>1       1       A \
<span class="label">[](){#x1-180044r8}</span>2       2       B \
<span class="label">[](){#x1-180045r9}</span>3       3       C \
<span class="label">[](){#x1-180046r10}</span>4       4       D \
<span class="label">[](){#x1-180047r11}</span>5       5       E \
<span class="label">[](){#x1-180048r12}</span>6       6       F \
<span class="label">[](){#x1-180049r13}</span>7       7       G \
<span class="label">[](){#x1-180050r14}</span>8       8       H \
<span class="label">[](){#x1-180051r15}</span>9       9       I \
<span class="label">[](){#x1-180052r16}</span>10     10       J

</div>

You can check whether a particular object is a dataframe data structure
with:

<div id="listing-163" class="lstlisting">

<span class="label">[](){#x1-180053r1}</span>&gt; class(MyDF) \
<span class="label">[](){#x1-180054r2}</span>\[1\] \~data.frame\~

</div>

You can check the structure of a dataframe with str():

<div id="listing-164" class="lstlisting">

<span class="label">[](){#x1-180055r1}</span>&gt; str(MyDF) \
<span
class="label">[](){#x1-180056r2}</span>’data.frame’:  10 obs. of  3 variables: \
<span
class="label">[](){#x1-180057r3}</span> \$ A.name     : int  1 2 3 4 5 6 7 8 9 10 \
<span
class="label">[](){#x1-180058r4}</span> \$ another    : Factor w/ 10 levels \~A\~,\~B\~,\~C\~,\~D\~,.. \
<span
class="label">[](){#x1-180059r5}</span> \$ another.one: num  0.291 0.915 0.65 0.955 0.266 ...

</div>

You can print the column names and top few rows with head(),

<div id="listing-165" class="lstlisting">

<span class="label">[](){#x1-180060r1}</span>&gt; head(MyDF)

</div>

And the bottom few rows with tail(),

<div id="listing-166" class="lstlisting">

<span class="label">[](){#x1-180061r1}</span>&gt; tail(MyDF)

</div>

SVG-Viewer needed.

![PICT](SilBioComp303x.png) ![PICT](SilBioComp304x.png)
![PICT](SilBioComp305x.png) ![PICT](SilBioComp306x.png)

SVG-Viewer needed.

#### <span class="titlemark">7.8.4 </span> [](){#x1-1810007.8.4}Lists {#lists-1 .subsectionHead}

A list is used to collect a group of data objects of diﬀerent sizes and
types (e.g., one whole data frame and one vector can both be in a single
list). It is simply an ordered collection of objects (that can be
variables). The outputs of many statistical functions in R are lists
(e.g. linear model ﬁtting using lm()), to return all relevant
information in one output object. So you need to know how to unpack and
manipulate lists.

SVG-Viewer needed.

<div id="listing-168" class="lstlisting">

<span
class="label">[](){#x1-181001r1}</span>&gt; List1 &lt;- list(species=c(\~Quercus robur\~,\~Fraxinus excelsior\~), age=c(123, 84)) \
<span class="label">[](){#x1-181002r2}</span>&gt; List1 \
<span class="label">[](){#x1-181003r3}</span>\$species \
<span
class="label">[](){#x1-181004r4}</span>\[1\] \~Quercus robur\~      \~Fraxinus excelsior\~ \
<span class="label">[](){#x1-181005r5}</span> \
<span class="label">[](){#x1-181006r6}</span>\$age \
<span class="label">[](){#x1-181007r7}</span>\[1\] 123 84

</div>

You can access contents of a list item using number of the item instead
of name:

<div id="listing-169" class="lstlisting">

<span class="label">[](){#x1-181008r1}</span>&gt; List1\[\[1\]\] \
<span
class="label">[](){#x1-181009r2}</span>\[1\] \~Quercus robur\~      \~Fraxinus excelsior\~ \
<span class="label">[](){#x1-181010r3}</span>&gt; List1\[\[2\]\] \
<span class="label">[](){#x1-181011r4}</span>\[1\] 123 84

</div>

And you can access it using the name of the item in these two way:

<div id="listing-170" class="lstlisting">

<span class="label">[](){#x1-181012r1}</span>&gt; List1\[\[\~age\~\]\] \
<span class="label">[](){#x1-181013r2}</span>\[1\] 123 84 \
<span class="label">[](){#x1-181014r3}</span>&gt; List1\$age \
<span class="label">[](){#x1-181015r4}</span>\[1\] 123 84

</div>

You can build lists of lists too! Also, you have perhaps guessed by now
that R dataframes are actually a kind of list.
![PICT](SilBioComp307x.png) ![PICT](SilBioComp308x.png)

SVG-Viewer needed.

### <span class="titlemark">7.9 </span> [](){#x1-1820007.9}Creating and manipulating data structures {#creating-and-manipulating-data-structures .sectionHead}

#### <span class="titlemark">7.9.1 </span> [](){#x1-1830007.9.1}Creating Sequences {#creating-sequences .subsectionHead}

The : operator creates vectors of sequential integers:

<div id="listing-171" class="lstlisting">

<span
class="label">[](){#x1-183001r1}</span>&gt; years &lt;- 1990:2009 \
<span class="label">[](){#x1-183002r2}</span>&gt; years \
<span
class="label">[](){#x1-183003r3}</span>\[1\] 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 \
<span
class="label">[](){#x1-183004r4}</span>\[11\] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 \
<span class="label">[](){#x1-183005r5}</span> \
<span
class="label">[](){#x1-183006r6}</span>&gt; years &lt;- 2009:1990 \# or in reverse order \
<span class="label">[](){#x1-183007r7}</span>&gt; years \
<span
class="label">[](){#x1-183008r8}</span>\[1\] 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 \
<span
class="label">[](){#x1-183009r9}</span>\[11\] 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990

</div>

For sequences of fractional numbers, you have to use seq() :

<div id="listing-172" class="lstlisting">

<span class="label">[](){#x1-183010r1}</span>&gt; seq(1, 10, 0.5) \
<span
class="label">[](){#x1-183011r2}</span> \[1\]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0 \
<span class="label">[](){#x1-183012r3}</span>\[16\]  8.5  9.0  9.5 10.0

</div>

You can also seq(from=1,to=10, by=0.5) OR seq(from=1, by=0.5, to=10)
with the same eﬀect (try it) — this explicit, “argument matching”
approach is partly why R is so popular.

![PICT](SilBioComp309x.png) ![PICT](SilBioComp310x.png)

#### <span class="titlemark">7.9.2 </span> [](){#x1-1840007.9.2}Acessing parts of data stuctures – Indices and Indexing {#acessing-parts-of-data-stuctures-indices-and-indexing .subsectionHead}

Every element (entry) of a vector in R has an order: the ﬁrst value,
second, third, etc. To illustrate this, let’s create a simple vector:

<div id="listing-173" class="lstlisting">

<span
class="label">[](){#x1-184001r1}</span>&gt; MyVar &lt;- c( ’a’ , ’b’ , ’c’ , ’d’ , ’e’ )

</div>

Then, square brackets extract values based on their numerical order in
the vector:

<div id="listing-174" class="lstlisting">

<span
class="label">[](){#x1-184002r1}</span>&gt; MyVar\[1\] \# Show element in first position \
<span class="label">[](){#x1-184003r2}</span>\[1\] \~a\~ \
<span class="label">[](){#x1-184004r3}</span>&gt; MyVar\[4\] \
<span
class="label">[](){#x1-184005r4}</span>\[1\] \~d\~ \# Show element in fourth position

</div>

The values in square brackets are called “indices” — they give the index
(position) of the required value. We can also select sets of values in
diﬀerent orders, or repeat values:

<div id="listing-175" class="lstlisting">

<span
class="label">[](){#x1-184006r1}</span>&gt; MyVar\[c(3,2,1)\] \# reverse order \
<span class="label">[](){#x1-184007r2}</span>\[1\] \~c\~ \~b\~ \~a\~ \
<span
class="label">[](){#x1-184008r3}</span>MyVar\[c(1,1,5,5)\] \# repeat indices \
<span
class="label">[](){#x1-184009r4}</span>\[1\] \~a\~ \~a\~ \~e\~ \~e\~

</div>

You can also manipulate data structures/objects by indexing:

<div id="listing-176" class="lstlisting">

<span
class="label">[](){#x1-184010r1}</span>&gt; v &lt;- c(0, 1, 2, 3, 4) \# Re-create the vector variable v \
<span
class="label">[](){#x1-184011r2}</span>&gt; v\[3\] \# access one element \
<span class="label">[](){#x1-184012r3}</span>\[1\] 2 \
<span
class="label">[](){#x1-184013r4}</span>&gt; v\[1:3\] \# access sequential elements \
<span class="label">[](){#x1-184014r5}</span>\[1\] 0 1 2 \
<span
class="label">[](){#x1-184015r6}</span>&gt; v\[-3\] \# remove elements \
<span class="label">[](){#x1-184016r7}</span>\[1\] 0 1 3 4 \
<span
class="label">[](){#x1-184017r8}</span>&gt; v\[c(1, 4)\] \# access non-sequential \
<span class="label">[](){#x1-184018r9}</span>\[1\] 0 3

</div>

For matrices, you need to use both row and column indices:

<div id="listing-177" class="lstlisting">

<span
class="label">[](){#x1-184019r1}</span>&gt; mat1 &lt;- matrix(1:25, 5, 5, byrow=TRUE) \#create a matrix \
<span class="label">[](){#x1-184020r2}</span>&gt; mat1 \
<span
class="label">[](){#x1-184021r3}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-184022r4}</span>\[1,\]    1    2    3    4    5 \
<span
class="label">[](){#x1-184023r5}</span>\[2,\]    6    7    8    9   10 \
<span
class="label">[](){#x1-184024r6}</span>\[3,\]   11   12   13   14   15 \
<span
class="label">[](){#x1-184025r7}</span>\[4,\]   16   17   18   19   20 \
<span
class="label">[](){#x1-184026r8}</span>\[5,\]   21   22   23   24   25 \
<span class="label">[](){#x1-184027r9}</span>&gt; mat1\[1,2\] \
<span class="label">[](){#x1-184028r10}</span>\[1\] 2 \
<span class="label">[](){#x1-184029r11}</span>&gt; mat1\[1,2:4\] \
<span class="label">[](){#x1-184030r12}</span>\[1\] 2 3 4 \
<span class="label">[](){#x1-184031r13}</span>&gt; mat1\[1:2,2:4\] \
<span
class="label">[](){#x1-184032r14}</span>     \[,1\] \[,2\] \[,3\] \
<span class="label">[](){#x1-184033r15}</span>\[1,\]    2    3    4 \
<span class="label">[](){#x1-184034r16}</span>\[2,\]    7    8    9

</div>

#### <span class="titlemark">7.9.3 </span> [](){#x1-1850007.9.3}Recycling {#recycling .subsectionHead}

When vectors are of diﬀerent lengths, R will recycle the shorter one to
make a vector of the same length:

<div id="listing-178" class="lstlisting">

<span class="label">[](){#x1-185001r1}</span>a &lt;- c(1,5) + 2 \
<span
class="label">[](){#x1-185002r2}</span>x &lt;- c(1,2); y &lt;- c(5,3,9,2) \
<span class="label">[](){#x1-185003r3}</span>x + y \
<span
class="label">[](){#x1-185004r4}</span>x + c(y,1)  \#\# somewhat strange!
![PICT](SilBioComp311x.png) ![PICT](SilBioComp312x.png)

</div>

Recycling is convenient, but dangerous!

#### <span class="titlemark">7.9.4 </span> [](){#x1-1860007.9.4}Basic vector-matrix operations {#basic-vector-matrix-operations .subsectionHead}

<div id="listing-179" class="lstlisting">

<span
class="label">[](){#x1-186001r1}</span>&gt; v &lt;- c(0, 1, 2, 3, 4) \
<span
class="label">[](){#x1-186002r2}</span>&gt; v2 &lt;- v\*2 \# multiply whole vector by 2 \
<span class="label">[](){#x1-186003r3}</span>&gt; v2 \
<span class="label">[](){#x1-186004r4}</span>\[1\] 0 2 4 6 8 \
<span
class="label">[](){#x1-186005r5}</span>&gt; v \* v2 \# element-wise product \
<span class="label">[](){#x1-186006r6}</span>\[1\]  0  2  8 18 32 \
<span
class="label">[](){#x1-186007r7}</span>&gt; t(v) \# transpose the vector \
<span
class="label">[](){#x1-186008r8}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-186009r9}</span>\[1,\]    0    1    2    3    4 \
<span
class="label">[](){#x1-186010r10}</span>&gt; v %\*% t(v) \# matrix/vector product \
<span
class="label">[](){#x1-186011r11}</span>     \[,1\] \[,2\] \[,3\] \[,4\] \[,5\] \
<span
class="label">[](){#x1-186012r12}</span>\[1,\]    0    0    0    0    0 \
<span
class="label">[](){#x1-186013r13}</span>\[2,\]    0    1    2    3    4 \
<span
class="label">[](){#x1-186014r14}</span>\[3,\]    0    2    4    6    8 \
<span
class="label">[](){#x1-186015r15}</span>\[4,\]    0    3    6    9   12 \
<span
class="label">[](){#x1-186016r16}</span>\[5,\]    0    4    8   12   16 \
<span
class="label">[](){#x1-186017r17}</span>&gt; v3 &lt;- 1:7 \# assign using sequence \
<span class="label">[](){#x1-186018r18}</span>&gt; v3 \
<span class="label">[](){#x1-186019r19}</span>\[1\] 1 2 3 4 5 6 7 \
<span
class="label">[](){#x1-186020r20}</span>&gt; v4 &lt;- c(v2, v3) \# concatenate vectors \
<span class="label">[](){#x1-186021r21}</span>&gt; v4 \
<span
class="label">[](){#x1-186022r22}</span> \[1\] 0 2 4 6 8 1 2 3 4 5 6 7

</div>

#### <span class="titlemark">7.9.5 </span> [](){#x1-1870007.9.5}Strings and Pasting {#strings-and-pasting .subsectionHead}

It is important to know how to handle strings in R for two main reasons:

-   To deal with text data, such as names of experimental treatments
-   To generate appropriate text labels and titles for ﬁgures

Let’s try creating and manipulating strings:

<div id="listing-180" class="lstlisting">

<span
class="label">[](){#x1-187001r1}</span>&gt; species.name &lt;- \~Quercus robur\~ \#double quotes \
<span class="label">[](){#x1-187002r2}</span>&gt; species.name \
<span class="label">[](){#x1-187003r3}</span>\[1\] \~Quercus robur\~ \
<span
class="label">[](){#x1-187004r4}</span>&gt; species.name &lt;- ’Fraxinus excelsior’ \#single quotes \
<span class="label">[](){#x1-187005r5}</span>&gt; species.name \
<span
class="label">[](){#x1-187006r6}</span>\[1\] \~Fraxinus excelsior\~ \
<span
class="label">[](){#x1-187007r7}</span>&gt; paste(\~Quercus\~, \~robur\~) \
<span class="label">[](){#x1-187008r8}</span>\[1\] \~Quercus robur\~ \
<span
class="label">[](){#x1-187009r9}</span>&gt; paste(\~Quercus\~, \~robur\~,sep = \~\~) \#Get rid of space \
<span class="label">[](){#x1-187010r10}</span>\~Quercusrobur\~ \
<span
class="label">[](){#x1-187011r11}</span>&gt; paste(\~Quercus\~, \~robur\~,sep = \~, \~) \#insert comma to separate

</div>

As you can see above, both double and single quotes work, but I suggest
that you use double quotes — this will allow you to deﬁne strings that
contain a single quotes, which is often necessary.

And as is the case with so many R functions, pasting works on vectors:

<div id="listing-181" class="lstlisting">

<span
class="label">[](){#x1-187012r1}</span>&gt; paste(’Year is:’, 1990:2000) \
<span
class="label">[](){#x1-187013r2}</span> \[1\] \~Year is: 1990\~ \~Year is: 1991\~ \~Year is: 1992\~ \~Year is: 1993\~ \
<span
class="label">[](){#x1-187014r3}</span> \[5\] \~Year is: 1994\~ \~Year is: 1995\~ \~Year is: 1996\~ \~Year is: 1997\~ \
<span
class="label">[](){#x1-187015r4}</span> \[9\] \~Year is: 1998\~ \~Year is: 1999\~ \~Year is: 2000\~

</div>

Note that this last example creates a vector of 11 strings as it is
1990:2000 inclusive.

![PICT](SilBioComp313x.png) ![PICT](SilBioComp314x.png)

SVG-Viewer needed.

### <span class="titlemark">7.10 </span> [](){#x1-1880007.10}Your analysis workﬂow {#your-analysis-workﬂow .sectionHead}

In using R for an analysis, you will likely use and create several ﬁles.
As in the case of bash and python based projects, in R projects as well,
you should keep your workﬂow well organized. For example, it is sensible
to create a folder (directory) to keep all code ﬁles together. You can
then set R to work from this directory, so that ﬁles are easy to ﬁnd and
run — this will be your “working directory” (more on this below). Also,
you don’t want to mix code ﬁles with data and results ﬁles. So you
should create separate directories for these as well. Thus, your typical
R analysis workﬂow will be:

<div class="center">

SVG-Viewer needed.

</div>

![PICT](SilBioComp315x.png) ![PICT](SilBioComp316x.png)

Some details on each kind of ﬁle:

 R script ﬁles 
:   These are plain text ﬁles containing all the R code needed for
    an analysis. These should always be created with a simple text
    editor like Notepad (Windows), TextEdit (MacOS) or Geany (Linux) and
    saved with the extension \*.R. We will use RStudio in this class
    (more on this below). You should never use Word to save or edit
    these ﬁles as R can only read code from plain text ﬁles.

 Text data ﬁles 
:   These are ﬁles of data in plain text format containing one or more
    columns of data (numbers, strings, or both). Although there are
    several format options, we will tyoucally be using csv ﬁles, where
    the entries are separated by commas. These are easy to create and
    export from Excel (if that’s what you use...).<span
    class="footnote-mark">[^1^](SilBioComp6.html#fn1x51)</span>[](){#x1-188001f1}

 Results output ﬁles 
:   These are a plain text ﬁles contain your results, such the the
    summary of output of a regression or ANOVA analysis. Typically, you
    will putput your results in a table format where the columns are
    separated by commas (csv) or tabs (tab-delimited)

 Graphics ﬁles 
:   R can export graphics in a wide range of formats. This can be done
    automatically from R code and we will look at this later but you can
    also select a graphics window and click ‘File $\vartriangleright$
    Save as...’

 Rdata ﬁles 
:   You can save any data loaded or created in R, including model
    outputs and other things, into a singleRdata ﬁle. These are not
    plain text and can only be read by R, but can hold all the data from
    an analysis in a single handy location. I never use these, but you
    can, if you want.

So let’s build your R analysis project structure.

Do the following:

-   Create a sensibly named directory (e.g., MyICRModule, Week3, etc in
    an appropriate location on your computer. If you are using a college
    Windows computer, you will need to create it in your H: drive.
-   Create subdirectories within this directory called Code, Data, and
    Results

![PICT](SilBioComp317x.png) ![PICT](SilBioComp318x.png)

SVG-Viewer needed.

You can create directories using dir.create() within R:

<div id="listing-182" class="lstlisting">

<span
class="label">[](){#x1-188002r1}</span>&gt; dir.create(\~MyICRModule\~) \
<span
class="label">[](){#x1-188003r2}</span>&gt; dir.create(\~MyICRModule/Code\~) \
<span
class="label">[](){#x1-188004r3}</span>&gt; dir.create(\~MyICRModule/Data\~) \
<span
class="label">[](){#x1-188005r4}</span>&gt; dir.create(\~MyICRModule/Results\~)

</div>

#### <span class="titlemark">7.10.1 </span> [](){#x1-1890007.10.1}The R Workspace and Working Directory {#the-r-workspace-and-working-directory .subsectionHead}

R has a “workspace” – a current working environment that includes any
user-deﬁned data structures objects (vectors, matrices, data frames,
lists) as well as other objects (e.g., functions). At the end of an R
session, the user can save an image of the current workspace that is
automatically reloaded the next time R is started. Your workspace is
saved in your “Working Directory”, which has to be set manually.

So before we go any further, let’s get sort out where your R “Working
Directory” should be and how you should set it. R has a default location
where it assumes your working directory is.

in Windows, it is C:/Windows/system32 or similar.

in Mac, it is /User/User Name or similar.

In UNIX/Linux, it is whichever directory you are in when you launch R.

To see where your current working directory is, at the R command prompt,
type:

<div id="listing-183" class="lstlisting">

<span class="label">[](){#x1-189001r1}</span>&gt; getwd()

</div>

This tells you what the current working directory (“wd”) is.

Now, set the working directory to be MyICRModule/Code. For example, if
you created MyICRModule directly in your H:\\, the you would use:

![PICT](SilBioComp319x.png) ![PICT](SilBioComp320x.png)

<div id="listing-184" class="lstlisting">

<span
class="label">[](){#x1-189002r1}</span>&gt; setwd(\~H:/MyICRModule/Code\~) \
<span
class="label">[](){#x1-189003r2}</span>&gt; dir() \#check what’s in the current working directory

</div>

On your own computer, you can also change R’s default to a particular
working directory where you would like to start (easily done in
RStudio).

In Linux, you can do this by editing the Rprofile.site site with\
sudo geany /etc/R/Rprofile.site. In that ﬁle, you would add your
start-up parameters between the lines .First &lt;- function() cat(“\\n
Welcome to R!\\n\\n”) and .Last &lt;- function() cat(“\\n
Goodbye!\\n\\n”) — between these lines, insert\
setwd(“/home/YourName/YourDirectoryPath”)

In Windows and Macs, you can ﬁnd the Rprofile.site ﬁle by searching for
it. When I last checked for Windows, it used to be at C:\\Program
Files\\R\\etc\\Rprofile.site

If you are using RStudio, you can change the default working directory
by through the RStudio “Options” dialog.

### <span class="titlemark">7.11 </span> [](){#x1-1900007.11}Importing and Exporting Data {#importing-and-exporting-data .sectionHead}

We are now ready to see how to import and export data in R, typically
the ﬁrst step of your analysis. The best option is to have your data in
a comma separated value (csv) text ﬁle or in a tab separated text ﬁle.
Then, you can use the function read.csv (or read.table) to import your
data. Now, lets get some data into your Data directory.

-   Go to the repository you downloaded from bitbucket and unzipped, and
    navigate to the Data directory.
-   Copy the ﬁle trees.csv into your own Data directory.
-   Now, try the following:

<div id="listing-185" class="lstlisting">

<span
class="label">[](){#x1-190001r1}</span>&gt; MyData &lt;- read.csv(\~../Data/trees.csv\~) \
<span
class="label">[](){#x1-190002r2}</span>&gt; ls() \#Check that MyData has appeared \
<span
class="label">[](){#x1-190003r3}</span>&gt; head(MyData) \# Have a quick look at the data frame \
<span
class="label">[](){#x1-190004r4}</span>&gt; str(MyData) \# Have a quick look at the column types \
<span
class="label">[](){#x1-190005r5}</span>&gt; MyData &lt;- read.csv(\~../Data/trees.csv\~, header = TRUE) \# with headers \
<span
class="label">[](){#x1-190006r6}</span>&gt; MyData &lt;- read.table(\~../Data/trees.csv\~, sep = ’,’, header = TRUE) \#another way \
<span class="label">[](){#x1-190007r7}</span>&gt; head(MyData) \
<span
class="label">[](){#x1-190008r8}</span>&gt; MyData &lt;- read.csv(\~../Data/trees.csv\~, skip = 5) \# skip first 5 lines

</div>

Note that the resulting MyData in your workspace is a R dataframe. Also,
note the UNIX-like paths using forward slashes (Windows uses back
slashes). ![PICT](SilBioComp321x.png) ![PICT](SilBioComp322x.png)

#### <span class="titlemark">7.11.1 </span> [](){#x1-1910007.11.1}Relative paths! {#relative-paths .subsectionHead}

The $\left. ..\slash \right.$ in read.csv(“../Data/trees.csv”) above
signiﬁes a “relative” path. That is, you are asking R to load data that
lies in a diﬀerent directory (folder) relative your current location (in
this case, you are in your Code directory). In other, more dorky words,
../Data/trees.txt points to a ﬁle named trees.txt located in the
“parent” of the current directory.

What is an absolute path?— one that speciﬁes the whole path on your
computer, say from C:/ “upwards”.

Using relative paths in in your R scripts and code will make your code
computer independent and your life better! The relative path way should
always be the way you load data in your analyses scripts — it will
guarantee that your analysis works on every computer, not just your
college computer.

Also, AVOID putting a setwdcommand at the start of your R script, as
setting the working directory always requires an absolute directory
path, which will diﬀer across computers, platforms, and users. Let the
end user sort out how to set the working directory. So to import data
and export results, your script should not use absolute paths.

#### <span class="titlemark">7.11.2 </span> [](){#x1-1920007.11.2}Writing out to and saving ﬁles {#writing-out-to-and-saving-ﬁles .subsectionHead}

You can also save your data frames using write.table or write.csv:

<div id="listing-186" class="lstlisting">

<span
class="label">[](){#x1-192001r1}</span>&gt; write.csv(MyData, \~../Results/MyData.csv\~) \
<span
class="label">[](){#x1-192002r2}</span>&gt; dir(\~../Results/\~) \# Check if it worked \
<span
class="label">[](){#x1-192003r3}</span>&gt; write.table(MyData\[1,\], file = \~../Results/MyData.csv\~,append=TRUE) \# append \
<span
class="label">[](){#x1-192004r4}</span>&gt; write.csv(MyData, \~../Results/MyData.csv\~, row.names=TRUE) \# write row names \
<span
class="label">[](){#x1-192005r5}</span>&gt; write.table(MyData, \~../Results/MyData.csv\~, col.names=FALSE) \# ignore col names

</div>

### <span class="titlemark">7.12 </span> [](){#x1-1930007.12}Writing R code {#writing-r-code .sectionHead}

Typing in commands interactively in the R console is good for starters,
but you will want to switch to putting your sequence of commands into a
script ﬁle, and then ask R to run those commands.

![PICT](SilBioComp323x.png)
