<div class="maketitle">

Introduction to Biological Statistics\
Imperial College London {#introduction-to-biological-statistics-imperial-college-london .titleHead}
--------------------------------------

<div class="author">

<span class="ptmr8t-x-x-120">Samraat Pawar
(s.pawar@imperial.ac.uk),</span>\
<span class="ptmri8t-x-x-120">with many inputs from Steve Cook and major
contributions from David Orme! </span>

</div>

\
<div class="date">

<span class="ptmr8t-x-x-120">January 25, 2018</span>

</div>

</div>

[](){#x1-1000}Contents {#contents .likechapterHead}
----------------------

<div class="tableofcontents">

<span class="chapterToc">0 [Introduction](#x1-20000){#QQ2-1-2}</span>\
 <span class="sectionToc">0.1 [What is this document
about?](#x1-30000.1){#QQ2-1-3}</span>\
 <span class="sectionToc">0.2 [Conventions used in this
document](#x1-40000.2){#QQ2-1-4}</span>\
 <span class="sectionToc">0.3 [Readings](#x1-50000.3){#QQ2-1-5}</span>\
<span class="chapterToc">1 [Experimental design and Data
exploration](#x1-60001){#QQ2-1-6}</span>\
 <span class="sectionToc">1.1 [Some statistical
parlance](#x1-70001.1){#QQ2-1-7}</span>\
 <span class="sectionToc">1.2 [Descriptive
Statistics](#x1-80001.2){#QQ2-1-8}</span>\
  <span class="subsectionToc">1.2.1 [Descriptive statistic functions in
R](#x1-90001.2.1){#QQ2-1-9}</span>\
 <span class="sectionToc">1.3 [Data types and
distributions](#x1-100001.3){#QQ2-1-10}</span>\
  <span class="subsectionToc">1.3.1 [Sampling from distributions in
R](#x1-110001.3.1){#QQ2-1-11}</span>\
 <span class="sectionToc">1.4 [Two basic rules of experimental design
and sampling](#x1-120001.4){#QQ2-1-12}</span>\
 <span class="sectionToc">1.5 [A data exploration case
study](#x1-130001.5){#QQ2-1-13}</span>\
  <span class="subsectionToc">1.5.1 [Visualise distributions of the
variables](#x1-140001.5.1){#QQ2-1-14}</span>\
  <span class="subsectionToc">1.5.2 [Take a quick look at eﬀects of
certain factors](#x1-150001.5.2){#QQ2-1-15}</span>

</div>

<span class="titlemark">Chapter 0</span>\
[](){#x1-20000}Introduction {#chapter0-introduction .chapterHead}
-----------------------------------------

<div class="quote">

Donald Knuth, 1995: <span class="ptmri8t-x-x-109">Science is what we
understand well enough to explain to a</span> <span
class="ptmri8t-x-x-109">computer. Art is everything else we do.</span>

</div>

### <span class="titlemark">0.1 </span> [](){#x1-30000.1}What is this document about? {#what-is-this-document-about .sectionHead}

This document contains the content of the Imperial College London
Department of Life Sciences BSc Year 1 (Y1) and 2 (Y2) statistics
modules, including workshops and practicals. Diﬀerent subsets of the
content of this document will be covered in Y1 and Y2. You will be given
instructions about which sections will be covered in your respective (Y1
or Y2) modules. You will learn statistics with R in a hands-on on way in
this module. A few “pure” lectures on statistical concepts will also be
delivered.

This document is accompanied by data and code on which you can practice
your skills in your own time and during the Practical sessions. These
materials are available (and will be updated regularly) at bitbucket
(it’s like GitHub): [<span
class="pcrr8t-x-x-109">https://bitbucket.org/mhasoba/iccompbiostat</span>](https://bitbucket.org/mhasoba/iccompbiostat){.url}.

<span class="ptmb8t-x-x-109">Note that you can download the code, data
and everything from the bitbucket repository at one go,</span> <span
class="ptmb8t-x-x-109">by going to </span>[<span
class="pcrb8t-x-x-109">https://bitbucket.org/mhasoba/iccompbiostat</span>](https://bitbucket.org/mhasoba/iccompbiostat){.url}<span
class="ptmb8t-x-x-109">and then clicking on the</span> <span
class="ptmb8t-x-x-109">“Download repository” link. You can then unzip
the downloaded .zip and grab the ﬁles you</span> <span
class="ptmb8t-x-x-109">need.</span>

These notes and the scripts that you create form a valuable reference
for using and interpreting statistics. You will be expected to be able
to use your experience and these notes to complete analyses for
statistical components of other courses, in the second and third year in
particular.

The topics covered here assume that you have already worked through at
least the basic R sections of the <span
class="pcrr8t-x-x-109">SilBioComp.pdf </span>document (also available in
the same bitbucket repository)

Finally, it is important that you work through the problems in each
chapter, particularly as some of the questions ask you to ﬁnd out about
commands and functions not introduced in the chapter’s text itself, but
which will be relied on in later chapters. By the time you have attended
the lectures and workshops, and completed the exercises in this
document, you should able to:

-   Use R to perform common statistical tests, particularly t, F, and
    $\chi^{2}$ tests
-   Develop ability to build, criticize and interpret linear models,
    especially linear regression and ANOVA.
-   Interpret R output (particularly p values) correctly, and use them
    appropriately in practical write-ups and presentations

### <span class="titlemark">0.2 </span> [](){#x1-40000.2}Conventions used in this document {#conventions-used-in-this-document .sectionHead}

You will ﬁnd all R commandline/console arguments, code snippets and
output in colored boxes like this:

<div id="listing-1" class="lstlisting">

<span class="label">[](){#x1-4001r1}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">ls</span><span
class="pcrr8t-x-x-80">()</span>

</div>

Here $>$ is the R prompt, and will type (or copy-paste, but not
recommended!) the commands/code that you see from this document into the
R command line. But please exclude the $>$ as this is just the R command
prompt! I have included the $>$ prompts in the code shown in this
document so that you are forced to see what each line is doing. Indeed,
avoid copying-and-pasting chunks of R code you do not understand:
blindly shovelling data into a black box and assuming the output is
correct and meaningful will eventually lead to frustrations, and if you
are unlucky, embarrassments or even catastrophes!

The content of this document is computer platform (Mac, PC or Linux)
independent because many of you will probably also later be working with
R on your personal laptops or desktops. Indeed, platform-independence of
your statistical analysis is one of the main reasons why you are using
R!

Finally, note that:

-   In all subsequent chapters, lines marked with a star like this are
    things for you to do.

### <span class="titlemark">0.3 </span> [](){#x1-50000.3}Readings {#readings .sectionHead}

Look up the Readings directory on the bitbucket repository (link given
above).

-   Bolker, B. M.: Ecological Models and Data in R (eBook and
    Hardcover available).
-   Beckerman, A. P. & Petchey, O. L. (2012) Getting started with R: an
    introduction for biologists. Oxford, Oxford University Press.\
    Good, short, general introduction
-   Crawley, R. (2013) The R book. 2nd edition. Chichester, Wiley.\
    Excellent but enormous reference book, code and data available from
    [<span
    class="pcrr8t-x-x-109">www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm</span>](www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm){.url}
-   Use the internet! Type “R tutorial”, and scores will pop up. Choose
    one that seems the most intuitive to you.

<span class="titlemark">Chapter 1</span>\
[](){#x1-60001}Experimental design and Data exploration {#chapter1-experimental-design-and-data-exploration .chapterHead}
-------------------------------------------------------

Ideally, you would like to design experiments (manipulations and/or
observations) that are appropriate for the question you want to answer.
However, you still need to explore you data to determine what kind of
statistical tests would be appropriate because: (a) Your experiments or
observations may not go as planned, and (b) You might have somebody
else’s data to analyse (very likely in your UG projects). Building on
the previous chapter, in this chapter we you learn how to use R to
explore your data and determine appropriate statistical tests. By the
time you have worked through this chapter, you should be able to

-   Provided suﬃcient information is available, be able to judge whether
    the sampling design used to generate a particular dataset was
    appropriate
-   Determine if your sample sizes are adequate, especially for a
    speciﬁc statistical test qualitatively (Y1) or quantitatively using
    power analysis (Y2).
-   Calculate basic statistical measures on your data to determine its
    properties

We are going to start oﬀ in Y1 with the simplest of scenarios for
statistical testing — that you want to determine whether a sample, or a
pair of samples meet some expectation (hypothesis) or not.

First, some conceptual preliminaries.

### <span class="titlemark">1.1 </span> [](){#x1-70001.1}Some statistical parlance {#some-statistical-parlance .sectionHead}

The following terms are important for you to get familiar with:

 <span class="ptmb8t-x-x-109">(Statistical) Population</span> 
:   A statistical population is a <span class="ptmri8t-x-x-109">complete
    set </span>of items that share at least one <span
    class="ptmri8t-x-x-109">attribute </span>of interest. This attribute
    of interest is the target of your statistical analysis. For example,
    if we are interested in studying the weight of year-old cod in the
    Oceans, the population consists of <span class="ptmri8t-x-x-109">all
    </span>year-old cod, but more speciﬁcally, the weight measurements
    of all the individuals of the cod population is what we want
    to analyse.

 <span class="ptmb8t-x-x-109">(Statistical) Distribution</span> 
:   A statistical distribution is a mathematical description (expressed
    as a mathematical equation) of the properties of a population
    of interest. Theoreticians have come up with a bunch of
    distributions (e.g., Gaussian or Normal, Poisson, Binomial, etc.)
    that are appropriate for diﬀerent kinds of data. Figuring out which
    distribution best describes a population of interest is one of the
    ﬁrst steps in a statistical analysis. In reality, of course, even
    collecting and measuring all the individuals of a population may not
    be suﬃcient to characterize its statistical properties — imagine the
    situation where the cod population has declined to a few hundred
    individuals (not an impossibility in the future!).

 <span class="ptmb8t-x-x-109">(Data or Population) Sample</span> 
:   A data <span class="ptmri8t-x-x-109">sample </span>is a set of
    measurements of the attribute of interest collected from a <span
    class="ptmri8t-x-x-109">statistical population </span>by a deﬁned
    procedure (<span class="ptmri8t-x-x-109">sampling
    methodology</span>). In the cod example above, this would be the
    weight of every individual of a <span class="ptmri8t-x-x-109">subset
    </span>of the year-old Cod population.

 <span class="ptmb8t-x-x-109">(Statistical) Parameter</span> 
:   A statistical parameter is a measure of some attribute of the <span
    class="ptmri8t-x-x-109">theoretical</span> statistical distribution
    that is support to represent your population. An example would be
    the average weight of yearling cod. In practice, this is not
    measurable because the population is much too large or incompletely
    inaccessible/invisible — imagine measuring the weight of every
    year-old cod individual in the oceans!

 <span class="ptmb8t-x-x-109">Statistic</span> 
:   A statistic (singular) is an <span class="ptmri8t-x-x-109">estimate
    </span>of a statistical parameter of the population of interest,
    obtained by calculating the <span class="ptmri8t-x-x-109">measure
    </span>for a <span class="ptmri8t-x-x-109">sample </span>(e.g., the
    average or mean weight of individuals in a sample of one-year
    old cod). This is also your <span
    class="ptmri8t-x-x-109">descriptive statistic</span>. Therefore, a
    <span class="ptmri8t-x-x-109">Statistic </span>is to a <span
    class="ptmri8t-x-x-109">Statistical Parameter </span>what a <span
    class="ptmri8t-x-x-109">Sample </span>is to the <span
    class="ptmri8t-x-x-109">Statistical</span> <span
    class="ptmri8t-x-x-109">Population</span>. For example, the average
    of a sample of cod weights is a statistic that <span
    class="ptmri8t-x-x-109">estimates</span> the theoretical “real”
    average of the weights of the entire one-year Cod population, which
    is its statistical parameter.

 <span class="ptmb8t-x-x-109">Hypothesis</span> 
:   A Hypothesis is an (hopefully) informed <span
    class="ptmri8t-x-x-109">postulate </span>about an attribute of your
    population of interest. For example, you may hypothesize that the
    one-year old cod population’s mean weight has declined over the last
    two decades (it has!). You will want to confront your main
    hypothesis with a “null” Hypothesis, to minimize the risk of making
    a “type I” error. A type I error is the probability of accepting an
    alternative (or main) hypothesis (and rejecting the null hypothesis)
    that is not really valid (e.g., the yearling cods have actually not
    declined in weight). This is a big NO NO from a scientiﬁc and
    philosophical standpoint. The rate or probability of the type I
    error is denoted by the Greek letter $\alpha$, and equals the <span
    class="ptmri8t-x-x-109">signiﬁcance level </span>of a
    statistical test.

### <span class="titlemark">1.2 </span> [](){#x1-80001.2}Descriptive Statistics {#descriptive-statistics .sectionHead}

The fundamental statistics that describe a sample (or a population) are,
ﬁrstly, the mean, or average value of a sample, typically denoted by a
$\overset{\bar{}}{x}$:

  ------------------------------------------------------------------------------------------------------------------------------ -------
  [](){#x1-8001r1} $$\overset{\bar{}}{x} = \frac{\sum\limits_{i = 1}^{n}x_{i}}{n} = \frac{x_{1} + x_{2} + \cdots + x_{n}}{n}$$   (1.1)
  ------------------------------------------------------------------------------------------------------------------------------ -------

That is, it is the sum of all the values in a sample divided by the
number, $n$, of items in the sample. Thus it is a measure of the <span
class="ptmri8t-x-x-109">central-tendency </span>of the sample and
population.

Second, the standard deviation ($s$) is:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
  [](){#x1-8002r2} $$s = \sqrt{\frac{\sum\limits_{i = 1}^{n}\left( {\overset{\bar{}}{x} - x_{i}} \right)^{2}}{n - 1}} = \sqrt{\frac{\left( {\overset{\bar{}}{x} - x_{1}} \right)^{2} + \left( {\overset{\bar{}}{x} - x_{2}} \right)^{2} + \cdots + \left( {\overset{\bar{}}{x} - x_{n}} \right)^{2}}{n - 1}}$$   (1.2)
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------

That is, the the square root of the sum of squares (“SS”) of the
diﬀerences between each item in the sample and the mean, divided by the
<span class="ptmri8t-x-x-109">degrees of freedom, “df” </span>remaining
in the data set ($n - 1$). df is the sample size, $n$, minus the number
of statistical parameters estimated from the data set. This is to reduce
the <span class="ptmri8t-x-x-109">bias </span>in your <span
class="ptmri8t-x-x-109">estimate </span>of the statistic, as you are
calculating it from the sample, and not the whole theoretical
population.

Thus, the formula for $s$ above has $n - 1$ in its denominator because,
to to work out the standard deviation, you must have already estimated
the mean ($\overset{\bar{}}{x}$) from the same data set. This removes 1
degree of freedom. Also, note that the sample variance, $s^{2}$ is the
square of standard deviation. Or, in other words, the standard deviation
is the square-root of the variance!

The above two statistics (mean and sd) are particularly meaningful when
the sample and population have a symmetric distribution (e.g., normal or
gaussian). When the distribution is not symmetric (that is, it is <span
class="ptmri8t-x-x-109">skewed</span>), another statistic, the <span
class="ptmri8t-x-x-109">median </span>becomes important. This is the
middle value in the ordered set of data, that is exactly 50% of the data
live below and 50% lie above the median. In skewed distributions, the
median is a better measure of the <span
class="ptmri8t-x-x-109">central-tendency </span>of the sample and
population.

Other descriptive statistics you should keep in mind are the range
(diﬀerence between the largest and smallest values), and the quartiles
(values lying in the data divided into the intervals
$\left\lbrack {\frac{1}{4},\frac{1}{2},\frac{3}{4},1} \right\rbrack$ or
at 1% intervals (percentiles). Box-plots, which you have seen, represent
a number of these statistics in one ﬁgure.

#### <span class="titlemark">1.2.1 </span> [](){#x1-90001.2.1}Descriptive statistic functions in R {#descriptive-statistic-functions-in-r .subsectionHead}

<div class="tabular">

<span class="pcrr8t-x-x-109">mean(x)</span>

Compute mean (of a vector or matrix)

<span class="pcrr8t-x-x-109">sd(x)</span>

Standard deviation

<span class="pcrr8t-x-x-109">var(x)</span>

Variance

<span class="pcrr8t-x-x-109">median(x)</span>

Median

<span class="pcrr8t-x-x-109">quantile(x,0.05)</span>

Compute the 0.05 quantile

<span class="pcrr8t-x-x-109">range(x)</span>

Range of the data

<span class="pcrr8t-x-x-109">min(x)</span>

Minimum

<span class="pcrr8t-x-x-109">max(x)</span>

Maximum

<span class="pcrr8t-x-x-109">sum(x)</span>

Sum all elements

</div>

\

### <span class="titlemark">1.3 </span> [](){#x1-100001.3}Data types and distributions {#data-types-and-distributions .sectionHead}

You will typically encounter or sample the following main types of data:

 <span class="ptmb8t-x-x-109">Continuous numeric</span> 
:   This is the <span class="pcrr8t-x-x-109">numeric </span>or <span
    class="pcrr8t-x-x-109">real </span>data type in R, and as far as you
    are concerned, these data typically will be made up
    of (mathematically) real numbers such as human height or weight.
    These may be unbounded (any value between negative inﬁnity to
    positive inﬁnity), or bounded (e.g., between or zero and some upper
    positive number) like human weight.

 <span class="ptmb8t-x-x-109">Discrete numeric</span> 
:   This is the <span class="pcrr8t-x-x-109">integer </span>data type in
    R, and consist of (mathematically) integer (whole) numbers such as
    counts of individuals in a population, e.g., The number of bacteria
    in a ml of pond water.

 <span class="ptmb8t-x-x-109">Percentage (proportion)</span> 
:   Percentage data is a particular kind of numeric data that is
    strictly bounded between 0 and 100. The fact that you can never get
    samples of percentages that exceed these bounds makes such data
    tricky to analyse.

 <span class="ptmb8t-x-x-109">Categorical</span> 
:   These are typically stored as the <span
    class="pcrr8t-x-x-109">character </span>data type in R. Categorical
    data are discrete, typically expressed as a one of a ﬁxed number of
    <span class="ptmri8t-x-x-109">levels </span>of a <span
    class="ptmri8t-x-x-109">factor</span>. For example, the the factor
    “Type.of.feeding.interaction” from the predator-prey dataset you
    have seen previously had ﬁve levels: “insectivorous”, “piscivorous”,
    “planktivorous”, “predacious”, and “predacious/piscivorous”.

 <span class="ptmb8t-x-x-109">Binary (presence/absence) data</span> 
:   A special type of categorical data are binary, where only two
    categories or states are possible: (1, 0) (or “present”, “absent”),
    e.g., a disease symptom. These may be stored as <span
    class="pcrr8t-x-x-109">integer </span>or <span
    class="pcrr8t-x-x-109">character </span>in R.

While designing experiments or exploring data obtained by somebody else,
you need to keep in mind that each type will typically be best
represented a particular <span class="ptmri8t-x-x-109">statistical
distribution</span>. For example, continuous numeric data are <span
class="ptmri8t-x-x-109">often </span>normally distributed. On the other
hand, count data are likely to be distributed according to the Poisson
distribution.

If you are lucky, you will mostly have to deal with data that are
continuous or discrete numeric, which are the most straightforward to
analyse using Linear models (more on that in subsequent chapters).
However, some of the most interesting and important problems in biology
involve proportion (percentage), categorical and binary data (e.g.,
Presence or absence of a disease symptom).

For example, think about what type of data, and what type of
distribution, a sample of the following is likely to be:

-   Wavelength of light
-   Temperature
-   Egg clutch size
-   Rate of a reaction
-   Eye-colour
-   Score in Scrabble
-   UG Degree class
-   Ground-cover of grass in a quadrat
-   Winning side in chess

#### <span class="titlemark">1.3.1 </span> [](){#x1-110001.3.1}Sampling from distributions in R {#sampling-from-distributions-in-r .subsectionHead}

You can generate samples form many distributions in R (and handy thing
to know). In particular, the following are important:

<div class="tabular">

<span class="pcrr8t-x-x-109">rnorm(10, m=0, sd=1)</span>

Draw 10 normal random numbers with mean 0 and s.d. 1

<span class="pcrr8t-x-x-109">dnorm(x, m=0, sd=1)</span>

Density function

<span class="pcrr8t-x-x-109">qnorm(x, m=0, sd=1)</span>

Cumulative density function

<span class="pcrr8t-x-x-109">runif(20, min=0, max=2)</span>

Twenty random numbers from uniform \[0,2\]

<span class="pcrr8t-x-x-109">rpois(20, lambda=10)</span>

Twenty random numbers from Poisson($\lambda$)

</div>

\

### <span class="titlemark">1.4 </span> [](){#x1-120001.4}Two basic rules of experimental design and sampling {#two-basic-rules-of-experimental-design-and-sampling .sectionHead}

In general, while designing experiments, and sampling from a <span
class="ptmri8t-x-x-109">population</span>, there are two key (and
simple) rules:

 1. 
:   <span class="ptmb8t-x-x-109">The more you sample, the more your
    sample’s distribution will look like the population</span> <span
    class="ptmb8t-x-x-109">distribution </span>(obviously!)

 2. 
:   <span class="ptmb8t-x-x-109">The more you sample, the closer will
    your sample statistic be to the population’s</span> <span
    class="ptmb8t-x-x-109">statistical parameter </span>(the central
    limit theorem)

Let’s have a quick look at rule 1 using R (open R and <span
class="pcrr8t-x-x-109">setwd </span>to <span
class="pcrr8t-x-x-109">Code</span>):

<div id="listing-2" class="lstlisting">

<span class="label">[](){#x1-12003r1}</span><span
class="pcrr8t-x-x-80">\#</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">Draw</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">5</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">normal</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">random</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">nos</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">w</span><span
class="pcrr8t-x-x-80">/</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">mean</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">0</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">and</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">s</span><span
class="pcrr8t-x-x-80">.</span><span class="pcrr8t-x-x-80">d</span><span
class="pcrr8t-x-x-80">.</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">1:</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12004r2}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample5</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(5,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12005r3}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample10</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(10,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12006r4}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample20</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(20,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12007r5}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample40</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(40,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12008r6}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample80</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(80,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12009r7}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">MySample160</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">&lt;-</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rnorm</span><span
class="pcrr8t-x-x-80">(160,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">m</span><span
class="pcrr8t-x-x-80">=0,</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">sd</span><span
class="pcrr8t-x-x-80">=1)</span>

</div>

Now let’s visualize these “samples”:

<div id="listing-3" class="lstlisting">

<span class="label">[](){#x1-12010r1}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfcol</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(2,3)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">\#</span><span
class="pcrr8t-x-x-80">initialize</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">multi</span><span
class="pcrr8t-x-x-80">-</span><span
class="pcrr8t-x-x-80">paneled</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">plot</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12011r2}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(1,1)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample5</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">5</span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12012r3}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(1,2)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample10</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">10</span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12013r4}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(1,3)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample20</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">20</span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12014r5}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(2,1)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample40</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">40</span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12015r6}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(2,2)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample80</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">80</span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80"> </span>\
<span class="label">[](){#x1-12016r7}</span><span
class="pcrr8t-x-x-80">&gt;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">par</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">mfg</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">c</span><span
class="pcrr8t-x-x-80">(2,3)</span><span
class="pcrr8t-x-x-80">)</span><span class="pcrr8t-x-x-80">;</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">hist</span><span
class="pcrr8t-x-x-80">(</span><span
class="pcrr8t-x-x-80">MySample160</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">col</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">rgb</span><span
class="pcrr8t-x-x-80">(1,1,0)</span><span
class="pcrr8t-x-x-80">,</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">main</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8t-x-x-80">=</span><span
class="pcrr8t-x-x-80"> </span><span class="pcrr8c-x-x-80">’</span><span
class="pcrr8t-x-x-80">n</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">=</span><span class="pcrr8t-x-x-80"> </span><span
class="pcrr8t-x-x-80">160</span><span
class="pcrr8c-x-x-80">’</span><span class="pcrr8t-x-x-80">)</span>

</div>

The second rule above states that if I was to repeat even $n = 5$
suﬃcient number of times, I would get a good <span
class="ptmri8t-x-x-109">estimate </span>of mean (= 0) and standard
deviation (= 1) of the normal distribution we sampled from.

### <span class="titlemark">1.5 </span> [](){#x1-130001.5}A data exploration case study {#a-data-exploration-case-study .sectionHead}

As a case study, we will use data from a paper looking at the
relationship between genome size and body size across species of
dragonﬂies and damselﬂies
([Odonata](http://en.wikipedia.org/wiki/Odonata)):

<div class="quote">

Ardila-Garcia, AM & Gregory, TR (2009) ‘An exploration of genome size
diversity in dragonﬂies and damselﬂies (Insecta: Odonata)’ Journal of
Zoology, 278, 163 - 173

</div>

You will work with the script ﬁle <span
class="pcrr8t-x-x-109">ExpDesign.R</span>, which performs exploratory
analyses on the data in <span
class="pcrr8t-x-x-109">GenomeSize.csv</span>. Let’s go through the code
block by block.

-   Get the script <span class="pcrr8t-x-x-109">ExpDesign.R </span>from
    the Bitbucket repository and put it in your own <span
    class="pcrr8t-x-x-109">Code</span> directory.
-   Also get <span class="pcrr8t-x-x-109">GenomeSize.csv</span>
-   Open the script <span class="pcrr8t-x-x-109">ExpDesign.R </span>in
    RStudio (or some other text editor).
-   Use the shift and arrow keys to select the code in block (2),
    including the comments. Now use the keyboard short cut (look back at
    the R Chapters if you don’t know how!) to run the highlighted block
    of code.

This ﬁrst line (block (1)) reads in the data, as you have learned
previously.

-   Now the code in block (2) line by line of code.

Have a good look at the data. There are three factors (categorical
variables): Suborder, splitting the species into dragonﬂies (Anisoptera)
and damselﬂies (Zygoptera); Family, splitting the species further into 9
taxonomic families; and Species, giving the latin binomial for each
species in the table. The remaining columns are measurements of genome
size (in picograms) and measurements of body size and morphology (in
grams, mm and mm${}^{2}$). There are two columns ending with an N that
show the sample size from which the observations for each species are
taken and a column ending SE showing standard errors.

One thing you should see in the output from <span
class="pcrr8t-x-x-109">head </span>or <span class="pcrr8t-x-x-109">str
</span>is that there are some observations marked as <span
class="pcrr8t-x-x-109">NA </span>– this is the way R shows <span
class="ptmri8t-x-x-109">missing data</span>. It is important to check
how much missing data there is an dataset, so we’ll use another function
that includes this information. Many R functions refuse to use variables
containing missing data — this is just R being careful and you can add
<span class="pcrr8t-x-x-109">na.rm=TRUE </span>into most functions to
avoid this problem.

-   Run the <span class="pcrr8t-x-x-109">summary </span>line from the
    script window (block 3).

Look at the output. There is a column for each variable: for factors, it
provides a short table of the number of observations in each level and
for continuous variables, it provides some simple summary statistics
about the distribution (range, quartiles, mean and median), and the
number of missing values

#### <span class="titlemark">1.5.1 </span> [](){#x1-140001.5.1}Visualise distributions of the variables {#visualise-distributions-of-the-variables .subsectionHead}

The <span class="pcrr8t-x-x-109">summary </span>function shows us the
basic distribution (range, quartiles, mean and median) of a continuous
variable, but this is easier to interpret if we visualise it. We’ll look
at two ways:

 <span class="ptmb8t-x-x-109">Histogram</span> 
:   In the simplest form, this shows the number of observations of the
    variable falling into a set of bins spanning the range of
    the variable. The option <span class="pcrr8t-x-x-109">breaks
    </span>allows you to change the number of bins.

 <span class="ptmb8t-x-x-109">Density plot</span> 
:   Rather than showing blocks of counts, the density plot shows a
    continuous smooth line. This is a <span
    class="ptmri8t-x-x-109">smoothed </span>estimate of the how
    frequently data is observed across the range of values and the <span
    class="ptmri8t-x-x-109">bandwidth </span>(<span
    class="pcrr8t-x-x-109">bw=0.1</span>) controls the degree of
    the smoothing.

-   Go to block (4) of the script and run each line separately, looking
    at the output.
-   In the editor, change the values of <span
    class="pcrr8t-x-x-109">breaks </span>and <span
    class="pcrr8t-x-x-109">bw </span>— for example <span
    class="pcrr8t-x-x-109">breaks=5 </span>and <span
    class="pcrr8t-x-x-109">bw=0.05 </span>— and re-run these lines to
    see how this aﬀects the graph. Basically, with both types of graph
    you can look at the data too coarsely or too ﬁnely.
-   The graphs you’ve just created look at genome size. Add a copy of
    those two lines of code in the script and change them to look at the
    variable <span class="pcrr8t-x-x-109">TotalLength</span>. You will
    need to alter the <span class="pcrr8t-x-x-109">density
    </span>function to ignore missing values (<span
    class="pcrr8t-x-x-109">na.rm=TRUE</span>) and to play around with
    the bandwidth. You should get something like this:

#### <span class="titlemark">1.5.2 </span> [](){#x1-150001.5.2}Take a quick look at eﬀects of certain factors {#take-a-quick-look-at-eﬀects-of-certain-factors .subsectionHead}

R has a special way of describing a model that deﬁnes the response
variable and the explanatory variables (“factors”). This is called a
’formula’ and is used to deﬁne linear models (more on these in a later
chapters). The same structure is used in many plotting functions and
will put the response variable on the $y$ axis and the explanatory
variable on the $x$ axis. The structure is “response variable $\sim$
explanatory variables”. We will look at multiple explanatory variables
in a later practical but an example with one explantory variable
(factor) is:
