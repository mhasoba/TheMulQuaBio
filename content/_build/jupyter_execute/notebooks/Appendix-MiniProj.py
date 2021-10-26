#!/usr/bin/env python
# coding: utf-8

# # The Computing Miniproject

# ## Introduction 
# 
# The computing Miniproject gives you an opportunity to try the "whole nine yards" of *asking and answering* a scientific question in biology (potentially involving multiple sub-questions/hypotheses) in a **fully reproducible way**. It will in essence give you an opportunity to perform a useful "dry run" of executing your actual Dissertation project. *It is an opportunity to do apply the computational methods you have been learning to a biological problem.*
# 
# 
# ## Objectives
# 
# **The general question you will address is:** *What mathematical models best fit an empirical dataset?*
# 
# You may think of this as testing a set of alternative hypotheses — every alternative hypothesis is nothing but a different model to describe an observed phenomenon, as you will have learned in [the model fitting lectures](https://github.com/mhasoba/TheMulQuaBio/tree/master/content/lectures).
# 
# ## The Project 
# 
# From the options provided to you (below), you will choose an empirical dataset, and a set of alternative models to fit to the data in that dataset.
# 
# The Miniproject must satisfy the following criteria (and follow the accompanying guidelines):
# 
# 1. **It employs the biological computing tools you have learned so far *as necessary***: Shell (bash) scripting, Git, LaTeX, R, and Python. Using these tools, you will build a workflow that starts with the data and ends with a written report (in LaTeX). How you choose the different tools (e.g., how much Python vs R) is your choice; that is part of what will be assessed.
# 
# 2. **Fits and compares *at least* two alternative mathematical models to the data**. The models should be fitted and selected using an appropriate method. For example you may use a combination of Ordinary Linear and Nonlinear Least Squares (NLLS) methods to fit $\ge 2$ alternative models to data, followed by model selection using AIC and BIC.
# 
# 3. **It should be fully reproducible.** You will write a script that "glues" the workflow together and runs it, from data processing, to model fitting, to plotting, to compilation of the written report (*More detailed instructions on report below*). Refer back to the TheMulQuaBio Computing chapters to see how you would run the different components. For example, we have covered how to run R and compile $\LaTeX$ using the `subprocess` module in the [second Python Chapter](./06-Python_II.ipynb). The assessor should be able to run just this script to get everything to work without errors.
# 
# *You will be given lectures and practicals on model fitting using least squares before you start on your Miniproject.*
# 
# *Please read the papers in the **Readings & Resources** section below* (and in particular, the Johnson and Omland 2005 paper) — these will help orient you in the right direction for tackling your Miniproject.
# 
# 
# ## The Report
# 
# The report should,
# 
# * be written in LaTeX using the article document class, in 11pt (any font will do, within reason!).
# 
# * be 1.5-spaced, with *continuous* line numbers.
# 
# * have a Title, Author name with Affiliation and Word count on a *separate Title page*.
# 
# * have an Introduction with objectives of the study, and appropriate additional sections such as Methods, Data, Results, Discussion, etc.
# 
# * contain in the *Methods* a sub-section called "Computing tools" which states briefly how each of the scripting languages (bash, R, Python) was used and what packages within them were used and a justification of why.
# 
# * have References properly cited in text and formatted in a list using bibtex.
# 
# * contain $\leq$3500 words *excluding the contents of the title page, references, and Figure or Table captions+legends*. There should be a word count at the beginning of the document (typically using the `texcount` package).
# 
# (Miniproject-report-guidelines)=
# ### Guidelines
# 
# Please read the *general* (*not* word count, formatting etc.) dissertation writing guidelines given in the Silwood Masters Student Guidebook.
# 
# ```{tip}
# **Start writing early**. Its NEVER too early to start writing! Outline the structure of your report and attempt to write a brief introduction even if you don't have any results, or have not finalized your methods, computational work flow, or analyses. Doing this preliminary writing will force you to think about the logic of what you are planning to do, put your planned work in some context, and help motivate you.  
# ```
# 
# Here are some additional suggestions/guidelines:
# 
# * **In General**:
#     * In scientific writing (papers, reports), a "narrative" or "flow" is important. What this means (more on each of these components below):
#         * Starting with the Title, and through the Introduction, Methods, Results and Discussion, there is a common thread (focal issue or topic).
#         * The *Title* gives a summary of what the article is about, and may even convey what the main finding is.
#         * The *Introduction* clearly and accurately builds and "expectation" for the reader, i.e., what to look for in the subsequent sections. 
#         * The *Methods* and *Results*, to thee extent possible, follow the same sequence of topics (and questions/hypotheses) that were laid out in the Introduction
#         * The *Discussion* reminds the reader about what the original goals of the study were, states out key findings succinctly, and then discusses their implications in the wider context and then finished off with some caveats and a conclusion that delivers the final take-away messages.     
#     * Avoid sub-sectioning (with headers) the *Introduction* and *Discussion* sections as it breaks the flow of your "narrative". On the other hand, you will almost always sub-section the Methods, and often, the Results section.
#     * Pay attention to detail: 
#         * Do a spell check on the final draft.
#         * Make sure that all graphics are rendered in good quality (use [vector graphic](https://en.wikipedia.org/wiki/Vector_graphics) formats as much as possible). Remember, $\LaTeX$ allows you to embed vector graphics in pdf.
#         * Make sure that all the display items (Tables + Figures) have a text caption that states what the display item is for, and then a text legend that explains the figure and delivers any take home messages. 
#     * The display items alone should be able to tell most of the story. Once you have an outline of the manuscript, first, before doing any more writing, put in the display items (generally, 4-6 should be enough) with Captions and Legends, and see if they are indeed telling the story you would like your paper/report to tell.   
#     * Avoid the words "explore" or "look at" to describe your objectives.
#     * Use direct speech (as it is YOUR work!).
#         * So, for example, avoid phrases such as "This study investigates"; say "Here I investigate" or something like that instead.
#         
# * **The Title**
#    * The Title should give a summary of what the article is about, and may even convey the main finding(s). Make it as result-focused as possible, and avoid being vague. 
#    * Keep the number of words to a minimum (upto 10-15 words is reasonable).
#        * Some succinct title examples:
#            * "The role of xx in determining yy"/
#            * "The relative success of xx models in providing parameter estimates for yy".
#            * *Or better still*: "xx models out-perform yy models for quantifying zz data"
#            * *OR even better still*: "xx [organisms / traits] differ systematically across yy [some grouping variable, such as location or taxonomic categories]". 
#        * Some not-so-nice title examples:
#            * "A comparison of models for describing zz using Linear and no-linear model fitting with AIC/BIC".
#            * "An exploration of xx models for describing yy data using Linear and Non-linear model fitting with model selection".
# 
# * **Abstract**: *The report must have an Abstract.*
#     * It should be a "mini-paper" in itself: So, 1-2 lines on background, 1-2 lines on the paper's objectives, 1-2 lines on the methods, 1-2 lines on the main results, 1-2 lines on the main conclusions + take home messages. Remember the abstract counts towards the total word limit (at least as far as your Mini-project report is concerned), so you will need to be succinct. About 200 words is the suggested maximum.
#     * Do not be vague about the take home messages at the end of the abstract. For example, do not say something like "Thus this study shows that more work needs to be done...", or "This study shows that model selection is useful...". Try instead to say something like "This study shows that in general, xx models are better suited for yy data..." or "This study provides evidence that in xx [organisms / traits], yy models tend to under-perform because..." (NOTE THAT THESE ARE HYPOTHETICAL/EXAMPLE STATEMENTS!).   
#     
# * **Introduction**:     
#     * The Introduction should open with a general *enough* background (with citations). What is "general enough"? &ndash; A context that *justifies* the main focus of the study, and *motivates* the reader. So, for example, if the focus is population growth rates, then provide a context for why growth rates are important to study in biology.  
#     * Towards or at the end of the Introduction, provide some specific questions or hypotheses that will be addressed in the study. But do not present hypotheses if they are not backed by logical arguments or mathematical / computational modelling / theory. Asking questions is better than (logically/theoretically) unfounded hypotheses. The *narrative* of the Introduction should funnel the reader's attention *naturally* towards the stated hypotheses/questions; *the hypotheses/questions should not come out of the blue*.
#     * And if you are going with hypotheses, adding statements following the hypotheses that briefly explain the logic behind each hypothesis is often a good idea.
#     
# * **Methods**:
#     * This will typically include subsections for key elements of your methods (e.g., Data, Models, Model fitting, etc).
#     * Do not go overboard with describing every detail and every step of your workflow. For example, you do not need to state that "figures were plotted in ggplot and saved to a directory called xx".
#     * Note that there is an additional requirement for the miniproject report in particular: include a section on specific computing languages and tools used and the justification for using them (more on this later).
# 
# * **Results**:
#     * These can also be sub-sectioned by the main questions/hypotheses/issues your are tackling. 
#     * Avoid discussion of the results here.
#     * Reference the Figures and Tables clearly and specifically (e.g., refer to key sub-panels of figures when needed).
# 
# * **Discussion**:
#     * Start by reminding the reader about what the original goals of the study were.
#     * State key findings succinctly.
#     * Then discuss their implications in the wider context (with additional referencing beyond what you had in the intro).
#     * Include a paragraph or two of caveats/shortcomings with clear indication of what future work can do to address them.  
#     * End with a conclusion that delivers the final take-away messages.     
#    
# * **Supplementary Information** (SI):
#     * If used, SI should be a separate document and cited in the main text.
#     * Make sure it is a separate document that includes is own references and sections/subsections.
#     * When citing the SI in the main text, reference specific sections/subsections.
#     * The SI should be concatenated with the main document in the final submission.
# 
# ## Submission
# 
# Add, commit and push all your work to your git repository using a directory called `MiniProject` at the same level as the Week1, Week2 etc. directories, by the Miniproject deadline given to you.
# 
# At this stage, you are not going to be told you how to organize your project — that's part of the marking criteria (see next section).
# 
# ```{note}
# The single script that runs the whole project should be called *run_MiniProject*, with an appropriate extension (e.g., `run_MiniProject.py` or `run_MiniProject.sh`).
# ```
# 
# ## Marking criteria
# 
# *Equal weightage will be given to the code+workflow and writeup components — each component will be marked to a max of 100 pts and then rescaled to a single mark / 100 using equal weightage*
# 
# The assessor will be looking for the following while assessing your submission:
# 
# ### Computing
# 
# * A well-organized project where code, results, data, etc., are easy to locate, inspect, and use. In the project's README also include:
# 
#     * Version of each language used.
# 
#     * Any dependencies or special packages the user/marker should be aware of.
# 
#     * What each package you used is for.
# 
# * A project that runs smoothly and efficiently, without any errors once a single script is called.
# 
# 
# ### Report
# 
# * A report that contains all the components indicated above in "The Report" subsection, with some original thought and synthesis in the *Introduction* and *Discussion* sections.
# 
# * Quality of the presentation of the graphics and tables in your report, as well as any plots showing model fits to the data.
# 
# * Don't forget to read the report guidelines [above](Miniproject-report-guidelines).    
# 
# ### Overall
# 
# * The marking criteria you may refer to for both components are the [summative marking criteria](https://github.com/mhasoba/TheMulQuaBio/raw/master/content/readings/MARKING_CRITERIA.pdf). 
# * The goal is to fit as many mathematical models as possible, but the minimum being 2 (to allow model comparison). You will get more marks for picking more "difficult" models to fit and compare (basically, one or more non-linear mathematical models).
#     * However, note that you need to pick a problem that is within reach. You will not get extra marks for attempting to fit one or more "difficult" models and then, failing overall to achieve a coherent report and model fitting exercise, because, for example, you ended up spending too much time on the "difficult" models(s).   

# ## Suggested Workflow
# 
# You will build a workflow that starts with the data and ends with a report written in LaTeX. 
# 
# The following components and sequence of your workflow are suggested (you may choose to do it differently).
# 
# ### Data preparation script 
# 
# First, a script that imports the data and prepares it for model fitting. This may be in Python or R, and will typically have the following features:
# 
# * Creates unique ids so that you can identify unique datasets (e.g., single thermal responses or functional responses). *This may not always be necessary because your data might already contain a field that delineates single curves (e.g., an `ID` field/column)* 
# * Deals with missing, and other problematic data values.
# * Saves the modified data to one or more csv file(s).
# 
# 
# ### Model fitting script
# 
# A separate script that does the Model fitting. For example, it may have the following features: 
# 
# * Opens the (new, modified) dataset from previous step.
# 
# * Does model fitting. Ultimately you need to fit at least one mechanistic/nonlinear model along with one or more linear models, but for building your workflow, just go ahead an fit a couple of different linear models (e.g., linear regression bvs quadratic and / or cubic polynomial).    
# 
# * Calculates AIC, BIC, R$^{2}$, and other statistical measures of model fit (you decide what you want to include).
# 
# * Exports the results to a csv that the [final plotting script](#Final-plotting-script) can read.
#  
# 
# ```{note}
# Some data series (e.g., a single growth rate or functional response curve) may have insufficient data points for fitting a particular model. That is, the number of unique x-axis values is $\le k$, where $k$ is the number of parameters in the model (e.g., a regression line has two parameters). Your model fitting will fail on such datasets, but you can deal with those failures later (e.g., by using the `try` keyword that you have learned in both Python and R chapters). In particular, the model fitting (or estimation of goodness of fit statistics) will fail for datasets with small sample sizes, and you can then filter these datasets *after* the Model fitting script has finished running and you are in the Analysis phase.  
# ```
# 
# ### Final plotting and analysis script  
# 
# * Next, write a script that imports the results from the previous step and plots every curve with the two (or more) models (or none, if nothing converges) overlaid. 
#     * Doing this will help you identify poor fits visually and help you decide whether the model fitting (e.g., using NLLS) can be further optimized. 
#     * All plots should be saved in a single separate sub-directory. 
# 
# * This script will also perform any analyses of the results of the Model fitting, for example to summarize which model(s) fit(s) best, and address any biological questions involving co-variates.    
# 
# ### Report compiling script
# 
# * Then comes the $\LaTeX$ source code and a (typically, Bash) script that compiles it. 
# 
# ### A single script to run them all
# 
# * Finally, write a script called `run_MiniProject.py` or `run_MiniProject.sh` respectively, which runs the whole project, right down to compilation of the LaTeX  document.

# ## For NLLS fitting 
# 
# **FIRST read and work through the materials [here](./20-ModelFitting-NLLS.ipynb) (NLLS in R) and [here](./Appendix-NLLS-Python.ipynb) (NLLS in Python).**
# 
# * You will typically need to write a script that calculates starting values (more on this topic [here](Model-Fitting-NLLS-Starting-Values)).
# 
# * You will need to use the `try` keyword because not all runs will converge. *The more data curves you are able to fit, the better — that is part of the challenge*
# 
# *One thing to note is that you may need to do the NLLS fitting on the logarithm of the function (and therefore, the data) to facilitate convergence (examples are [here](./20-ModelFitting-NLLS.ipynb) and [here](./Appendix-NLLS-Python.ipynb).
# 
# ## Getting started 
# 
# Doing all this may seem a bit scary at the start. However, if you approach the problem systematically and methodically, you will soon be on your way. 
#    
# ```{Note}
# The Miniproject is also an exercise in learning to pick the right size of (computational) problem given the amount of time you have to solve it. So even if you might be tempted to take on, at the very start, a very ambitious project (basically, picking both linear and non-linear models) and *then* trying to develop your workflow, you will very likely get stuck in "local optima" in terms of the overall workflow design and implementation. It is important that you first pick a "bite sized" problem (e.g., two linear models), and develop the overall computational work flow, from plotting and fitting to model selection. At the same time, *also start at least outlining  the report* based on the first, simple, tractable problem you pick.     
# ```
# 
# Here are some suggested first steps to get started:
# 
# * **Explore the data** in R or Python (e.g., using Jupyter) (first part of the suggested workflow above). 
# 
# * **Write a preliminary version of the plotting script** without the fitted models overlaid. That will also give you a feel for the data and allow you to see (literally) what shapes the curves can take.
# 
# * **Explore the models you will be fitting**: Basically, plot them: Write mathematical functions you want to fit in a Python/R script (you can then re-use these functions in your model fitting script as well), and then evaluate them  numerically to see the shape of the function.
# 
# * **Set and achieve you baseline target**: First perform, produce figures for, and interpret model comparisons using LMs only. For example, finish the workflow, right down to a summary figure and/or table showing, which, out of straight line, cubic and quadratic, fit the data better, with some interpretation. As such, this will be sufficient to write up a report. The next step wuld be adding one or more non-linear model(s) to the set of mdoels you are comparing, fitted using NLLS.  
# 
# * **For NLLS fitting**: Figure out, using one, "nice-looking" dataset to test how the NLLS fitting package and its commands work. This is your minimal example that will give you confidence that it works!
#    * Next, write a loop over all unique datasets (data curves) using the `try` to catch errors (and examine them carefully) in case the fitting doesn't converge.
#    
# ```{tip}
# Remember to sandbox and/or gitignore any code and output for exploratory plotting of the functions in the final product.
# ```

# ## The Dataset and Model Options
# 
# You will pick from one of the following three sets of options. All students will pick the same dataset (there will be a vote in class).  
# 
# First, let's load some packages to explore the data sets in Python: 

# In[1]:


import pandas as pd
import scipy as sc
import matplotlib.pylab as pl
import seaborn as sns # You might need to install this (e.g., pip install seaborn)


# ### Population Growth
# 
# #### The Question 
# 
# *How well do different mathematical models, e.g., based upon population growth (mechanistic) theory  vs. phenomenological ones, fit to functional responses data across species?*
# 
# Fluctuations in the abundance (density) of single populations may play a crucial role in ecosystem dynamics and emergent functional characteristics, such as rates of carbon fixation or disease transmission. A population grows exponentially while its abundance is low and resources are not limiting (the Malthusian principle). This growth then slows and eventually stops as resources become limiting. There may also be a time lag before the population growth really takes off at the start. We will focus on microbial (specifically, bacterial) growth rates. Bacterial growth in batch culture follows a distinct set of phases; lag phase, exponential phase and stationary phase. During the lag phase a suite of transcriptional machinery is activated, including genes involved in nutrient uptake and metabolic changes, as bacteria prepare for growth. During the exponential growth phase, bacteria divide at a constant rate, the population doubling with each generation. When the carrying capacity of the media is reached, growth slows and the number of cells in the culture stabilises, beginning the stationary phase. Traditionally, microbial growth rates were measured by plotting cell numbers or culture density against time on a semi-log graph and fitting a straight line through the exponential growth phase &ndash; the slope of the line gives the maximum growth rate ($r_{max}$). Models have since been developed which we can use to describe the whole sigmoidal bacterial growth curve. 
# 
# #### The Data
# 
# The dataset is called `LogisticGrowthData.csv`. It contains measurements of change in biomass or number of cells of microbes over time. These data were collected through lab experiments across the world. The field names are defined in a file called  `LogisticGrowthMetaData.csv`, also in the `data` directory. The two main fields of interest are `PopBio` (abundance), and `Time`. Single population growth rate curves can be identified by as unique  temperature-species-medium-citation-replicate combinations (concatenate them to get a new string variable that identifies unique growth curves).
# 
# Let's have a look at the data:

# In[20]:


data = pd.read_csv("../data/LogisticGrowthData.csv")
print("Loaded {} columns.".format(len(data.columns.values)))


# In[21]:


print(data.columns.values)


# In[22]:


pd.read_csv("../data/LogisticGrowthMetaData.csv")


# In[23]:


data.head()


# In[24]:


print(data.PopBio_units.unique()) #units of the response variable 


# In[25]:


print(data.Time_units.unique()) #units of the independent variable 


# Unlike the previous two datasets there are no ID coulmns, so you will have to  infer single growth curves by combining `Species`, `Medium`, `Temp` and `Citation` columns (each species-medium-citation combination is unique):

# In[26]:


data.insert(0, "ID", data.Species + "_" + data.Temp.map(str) + "_" + data.Medium + "_" + data.Citation)


# Note that the `map()` method coverts temperature values to string (`str`) for concatenation.

# In[27]:


print(data.ID.unique()) #units of the independent variable 


# These are rather ungainly IDs, so you might want to replace them with numbers!

# In[28]:


data_subset = data[data['ID']=='Chryseobacterium.balustinum_5_TSB_Bae, Y.M., Zheng, L., Hyun, J.E., Jung, K.S., Heu, S. and Lee, S.Y., 2014. Growth characteristics and biofilm formation of various spoilage bacteria isolated from fresh produce. Journal of food science, 79(10), pp.M2072-M2080.']
data_subset.head()


# In[29]:


sns.lmplot("Time", "PopBio", data = data_subset, fit_reg = False) # will give warning - you can ignore it


# #### The Models
# 
# Yet again, the simplest mathematical models you can use are the phenomenological quadratic and cubic polynomial models, that is eqns. 1 and 2 above (replace $x$ with Time). A Polynomial model may be able to capture decline in population size after some maximum value (the carrying capacity) has been reached (the "death phase" of population growth). For two mechanistic models of population growth (Logistic and Gompertz), have a look at the [Model Fitting Chapter](./20-ModelFitting-NLLS.ipynb).
# 
# ---
# 
# ![image](./graphics/Pop_Grow.svg)
# <small> <center> An example population growth curve dataset to which the modified Gompertz model (Zwietering et. al., 1990) has been fitted.
# </center></small>
# 
# (See the [Model fitting in NLLS Chapter](./20-ModelFitting-NLLS.ipynb) for more information)
# 
# ---
# 
# In addtion to the Gompertz model, two growth rate models that also include a lag phase are the Baranyi model (Baranyi, 1993), and the Buchanan model (or three-phase logistic model; Buchanan, 1997). Please see the Readings & Resources section below for the full references of these papers.

# ### Functional Responses
# 
# #### The Question 
# 
# *How well do different mathematical models, e.g., based upon foraging theory (mechanistic) principles  vs. phenomenological ones, fit to functional responses data across species?*
# 
# In ecological parlance, a functional response is the relationship between a consumer's (e.g., predator) biomass consumption rate and abundance of the target resource (e.g., prey). Functional responses arise from fundamental biological and physical constraints on consumer-resource interactions (e.g., Holling 1959, Pawar et al, 2012), and determine the rate of biomass flow between species in ecosystems across the full scale of sizes, from the smallest (e.g., microbes) to the largest (e.g., blue whales). Functional responses also play a key sole in determining the stability (responses to perturbations) of the food webs that underpin ecosystems.
# 
# #### The Data
# 
# The dataset is called `CRat.csv`. It contains measurements of rates of consumption of a single resource (e.g., prey, plants) species' by a consumer species (e.g., predators, grazers). These data were collected through lab and field experiments across the world. The field names are defined in a file called `BiotraitsTemplateDescription.pdf`, also in the `data` directory. The two main fields of interest are `N_TraitValue` (The number of resources consumed per consumer per unit time), and `ResDensity` (the resource abundance). Individual functional response curves can be identified by `ID` values --- each `ID` corresponds to one curve. Or you can reconstruct them as unique combinations of `Citation` (where the functional response dataset came from), `ConTaxa` (consumer species ID), `ResTaxa` (resource species ID).
# 
# Let's have a look at the data:

# In[12]:


data = pd.read_csv("../data/CRat.csv")
print("Loaded {} columns.".format(len(data.columns.values)))


# In[13]:


data.head()


# In[14]:


print(data.columns.values)


# In[15]:


print(data.TraitUnit.unique()) #units of the response variable 


# In[16]:


print(data.ResDensityUnit.unique()) #units of the independent variable 


# In[17]:


print(data.ID.unique()) #units of the independent variable 


# In[18]:


data_subset = data[data['ID']==39982]
data_subset.head()


# In[19]:


sns.lmplot("ResDensity", "N_TraitValue", data=data_subset, fit_reg=False)


# (Miniproject-FR-Models)=
# #### The Models
# 
# *All the following parameters and variables are in SI units*.
# 
# The fundamental measure of interest (the response variable) is consumption rate ($c$). This is expressed in terms of biomass quantity or number of individuals of resource consumed *per unit time per unit consumer* (so units of Mass (or Individuals) / Time). 
# 
# Again, the simplest mathematical models you can use are the phenomenological quadratic and cubic polynomial models, that is eqns. {eq}`eq:quad` and {eq}`eq:cubic` (replace $x$ with resource abundance).
# 
# Then, there is the more mechanistic Holling Type II model (Holling, 1959):
# 
# $$
#       c = \frac{a x_R}{1 + h a x_R}
# $$(eq:FR_II)
# 
# Here, $x_R$ is resource density (Mass / Area or Volume), $a$ is consumer's search rate (Area or Volume / Time ), and  $h$ is handling time of the consumer for that resource (time taken to overpower and ingest it). 
# 
# Below is an example FR curve from the dataset you have been given with the Type II model fitted to it.  
# 
# ---
# ![image](./graphics/3_FR.svg)
# <small>  <center> Example of the a Type II model (eqn. {eq}`eq:FR_II`) fitted to a functional response of a consumer on a resource. 
# </center> </small>
# 
# ---
# 
# There is also the less-mechanistic "generalized" functional response model:  
# 
# $$
#       c = \frac{a x_R^{q + 1}}{1 + h a x_R^{q + 1}}
# $$(eq:FR_gen)
# 	   
# Where everything is same as eqn. {eq}`eq:FR_II`, but the additional parameter $q$ (dimensionless) is a shape parameter that allows the shape of the response to be more flexible/variable, from "Type I" to "Type III". This model is less mechanistic because it includes a phenomenological parameter $q$ which does not have a formal biological meaning. 
# 
# ```{note}
# Note that if $q=0$, eqn {eq}`eq:FR_gen` becomes same as the Type II model (eqn. {eq}`eq:FR_II`). 
# ```
# ---
# ![image](./graphics/FR.svg)
# <small> <center> The range of functional responses captured by the generalized functional response model (eqn. {eq}`eq:FR_gen`). 
# </center>
# </small>
# 
# ---
# 
# There are not too many other models for functional responses, though you can and should try looking for them in the literature. One more mechanistic model that defines parameters of the Type II functional response in terms of body size of predator and prey can be found in  Pawar et al (2012).

# ### Thermal Performance Curves
# 
# #### The Question 
# 
# *How well do different mathematical models, e.g., based upon biochemical (mechanistic) principles  vs. phenomenological ones, fit to the thermal responses of metabolic traits?*
# 
# This is currently a "hot" (no pun intended!) topic in biology. On the *ecological side*, because the temperature-dependence of metabolic rate sets the rate of intrinsic $r_\text{max}$ (papers by Savage et al., Brown et al.) as well as interactions between species, it has a strong effect on population dynamics. In this context, note that 99.9% of life on earth is ectothermic! On the *evolutionary side*, the temperature-dependence of fitness and species interactions also means that warmer environments may have stronger rates of evolution. This may be compounded by the fact that mutation rates may also increase with temperature (papers by Gillooly et al.).
# 
# #### The Data
# 
# The dataset is called `ThermRespData.csv`. It contains a subset of the full "BioTraits" database. This subset contains hundreds of "thermal responses" for growth, respiration and photosynthesis rates in plants and bacteria (both aquatic and terrestrial). These data were collected through lab experiments across the world, and compiled by various people over the years. The field names are defined in a file called `BiotraitsTemplateDescription.pdf`, also in the `data` directory. The two main fields of interest are `OriginalTraitValue` (the trait values responding to temperature), and `ConTemp` (the temperature). Individual thermal response curves can be identified by `ID` values --- each `ID` corresponds to one thermal performance curve.
# 
# Let's have a look at the data:

# In[3]:


data = pd.read_csv("../data/ThermRespData.csv")
print("Loaded {} columns.".format(len(data.columns.values)))


# In[4]:


data.head()


# In[5]:


print(data.columns.values)


# In[6]:


print(data.OriginalTraitUnit.unique()) #units of the response variable 


# In[7]:


print(data.ConTempUnit.unique()) #units of the independent variable 


# In[8]:


print(data.ID.unique()) #units of the independent variable 


# In[9]:


data_subset = data[data['ID']==110]
data_subset.head()


# In[11]:


sns.lmplot("ConTemp", "OriginalTraitValue", data=data_subset, fit_reg=False)


# (Miniproj-TPCs-Models)=
# #### The Models
# 
# *All the following parameters and variables are in SI units*.
# 
# There are multiple models that might best describe these data. The simplest are the general quadratic and cubic polynomial models:
# 
# $$
#     B = B_0 + B_1 x + B_2 x^2
# $$(eq:quad)
# 
# 
# $$
#     B = B_0 + B_1 x + B_2 x^2 + B_3 x^3
# $$(eq:cubic)
# 
# These are phenomenological models, with the parameters $B_0$, $B_1$, $B_2$ and $B_3$ lacking any mechanistic interpretation. $x$ is the independent variable (in this case Temperature, $T$) 
# 
# Another phenomenological model option is the Briere model:
# 
# $$
# B = \left\{
#         \begin{array}{ll}
#             0 & \quad T \leq T_0 \\
#             B_0 T (T-T_0) \sqrt{T_m-T} & \quad T_0 \leq T \leq T_m \\
#             0 & \quad T \geq T_m
#         \end{array}
#     \right.
# $$(eq:Briere1)
# 
# Where $T$ is temperature, $T_0$ and $T_m$ are the minimum and maximum feasible temperatures for the trait (below or above which the traits goes to zero), and $B_0$ is a normalization constant.  Example R code for fitting this mdoel can be found [here](Model-Fitting-NLLS-TPCs).
# 
# If you look at the original paper, you will find that Briere et al also propose a more general version of this equation (by adding a new parameter $m$ to replace the square root above):
# 
# $$
# B = \left\{
#         \begin{array}{ll}
#             0 & \quad T \leq T_0 \\
#             B_0 T (T-T_0) (T_m-T)^\frac{1}{m} & \quad T_0 \leq T \leq T_m \\
#             0 & \quad T \geq T_m
#         \end{array}
#     \right.
# $$
# 
# 
# In contrast, the Schoolfield model (Schoolfield et al 1981) is a mechanistic option that is based upon thermodynamics and enzyme kinetics:
# 
# $$
#     B = \frac{B_0 e^{\frac{-E}{k} (\frac{1}{T} - \frac{1}{283.15})}}
#     { 1 + e^{\frac{E_l}{k} (\frac{1}{T_l} - \frac{1}{T})} + 
#     e^{\frac{E_h}{k} (\frac{1}{T_h} - \frac{1}{T})}}
# $$(eq:schoolf)
# 
# Here, $k$ is the Boltzmann constant ($8.617 \times 10^{-5}$ eV $\cdot$ K$^{-1}$), $B$ the value of the trait at a given temperature $T$ (K) (K = $^\circ$C + 273.15), while $B_0$ is the trait value at 283.15 K (10$^\circ$C) which stands for the value of the growth rate at low temperature and controls the vertical offset of the curve. $E_l$ is the enzyme's low-temperature de-activation energy (eV) which controls the behavior of the enzyme (and the curve) at very low temperatures, and $T_l$ is the at which the enzyme is 50% low-temperature deactivated. $E_h$ is the
# enzyme's high-temperature de-activation energy (eV) which controls the behavior of the enzyme (and the curve) at very high temperatures, and $T_h$ is the at which the enzyme is 50% high-temperature deactivated. $E$ is the activation energy (eV) which controls the rise of the curve up to the peak in the "normal operating range" for the enzyme (below the peak of the curve and above $T_h$).
# 
# *Please also have a look at the Delong et al 2017 paper, which lists this and other mechanistic TPC models* (see [Readings & Resources](Miniproj-Readings)). You may choose additional models listed in that paper for comparison, if you want.
# 
# ---
# 
# ![image](./graphics/SchoolfEx.png)
# <small> <center>Example of the full Sharpe-Schoolfield model (Eqn. {eq}`eq:schoolf`) fitted to the thermal response curve of a metabolic trait $x$ with resource abundance. </center> </small>
# 
# ---
# 
# In many cases, a simplified Schoolfield model would be more appropriate for thermal response data, because low temperature inactivation is weak, or is undetectable in the data because low-temperature measurements were not made.
# 
# $$
#       B = \frac{B_0 e^{\frac{-E}{k} (\frac{1}{T} - \frac{1}{283.15})}}
#     { 1 +  e^{\frac{E_h}{k} (\frac{1}{T_h} - \frac{1}{T})}}
# $$(eq:schoolfH)
# 
# In other cases, a different simplified Schoolfield model would be more appropriate, because high temperature inactivation was not detectable in the data because measurements were not made at sufficiently high temperatures:
# 
# $$
#       B = \frac{B_0 e^{\frac{-E}{k} (\frac{1}{T} - \frac{1}{283.15})}}
#     { 1 +  e^{\frac{E_l}{k} (\frac{1}{T_l} - \frac{1}{T})}}
# $$(eq:schoolfL)
# 
# Note that the cubic model (Eqn. {eq}`eq:cubic`) has the same number of parameters as the the reduced Schoolfield models (Eqn. {eq}`eq:schoolfH` & {eq}`eq:schoolfL`). Also, the temperature parameter ($T$) of the cubic model (Eqn. {eq}`eq:cubic`) is in $^\circ$C, whereas the Temperature parameter in the Schoolfield model is in K.

# ## Additional models and questions you can tackle
# 
# In all three options above, you may try to tackle fitting to additional models you find in the literature. Some Readings have been provided for each of the three data types below. 
# 
# You may choose to tackle some biological hypotheses or explore patterns by considering additional covariates. For example, 
# 
# *Do different taxa show different functional responses?*
# 
# *Does temperature or taxon identity affect which population growth rate model fits best?*
# 
# *Do different models fit different types of thermal performance curves (e.g., Photosynthesis vs Respiration)?* 
# 
# You may also choose to revisit the results of another paper that has done comparisons of the models you have chosen with your new dataset (but remember, that may well become too ambitious a project given the time you have).

# (Miniproj-Readings)=
# ## Readings & Resources
# 
# Many of these papers are in pdf format in the Readings directory on TheMulQuaBio repository.
# 
# ### General
# 
# * Levins, R. (1966) The strategy of model building in population biology. Am. Sci. 54, 421–431.
# 
# * Johnson, J. B. & Omland, K. S. (2004) Model selection in ecology and evolution. Trends Ecol. Evol. 19, 101–108.
# 
# * Motulsky, H. & Christopoulos A. (2004) Fitting models to biological data using linear and nonlinear regression: a practical guide to curve fitting. Oxford University Press, USA. 
# 
# * Bolker, B. M. et al. (2013) Strategies for fitting nonlinear ecological models in R, AD Model Builder, and BUGS. Methods Ecol. Evol. 4, 501–512.
#     
# 
# ### Functional responses
# 
# * Holling, C. S. 1959. Some Characteristics of Simple Types of Predation and Parasitism. The Canadian Entomologist 91 (7): 385–98. https://doi.org/10.4039/Ent91385-7.
# 
# * Holling, C S. 1966. The Functional Response of Invertebrate Predators to Prey Density. Mem. Entomol. Soc. Canada 48 (48): 1–86.
# 
# * Aljetlawi, A. A., E. Sparrevik, and K. Leonardsson. 2004. Prey-predator size-dependent functional response: derivation and rescaling to the real world. J. Anim. Ecol. 73, 239–252.
# 
# * Jeschke, J. M.,  M. Kopp & R. Tollrian. 2002. Predator functional responses: Discriminating between handling and digesting prey. Ecol. Monogr. 72, 95–112.
# 
# * Pawar, S., A. I. Dell, and V. M. Savage. 2012. Dimensionality of Consumer Search Space Drives Trophic Interaction Strengths. Nature 486 (7404): 485–89. https://doi.org/10.1038/nature11131.
# 
# * Pritchard, D. W., R. A. Paterson, H. C. Bovy, and D. Barrios-O'Neill. 2017. frair: an R package for fitting and comparing consumer functional responses. Methods Ecol. Evol. 8, 1528–1534.
# 
# ### Population Growth
# 
# * Zwietering, M. H., I. Jongenburger, F. M. Rombouts, and K. Van't Riet. 1990. Modeling of the Bacterial Growth Curve. Applied and Environmental Microbiology 56 (6): 1875–81.
# 
# * Buchanan, R. L., R. C. Whiting, and W. C. Damert. 1997. When Is Simple Good Enough: A Comparison of the Gompertz, Baranyi, and Three-Phase Linear Models for Fitting Bacterial Growth Curves. Food Microbiology 14 (4): 313–26. https://doi.org/10.1006/fmic.1997.0125.
# 
# * Grijspeerdt, K. and P. Vanrolleghem. 1999. Estimating the parameters of the Baranyi model for bacterial growth. Food Microbiol. 16, 593–605.
# 
# * Micha, P., and M. G. Corradini. 2011. Microbial Growth Curves: What the Models Tell Us and What They Cannot. Critical Reviews in Food Science and Nutrition. https://doi.org/10.1080/10408398.2011.570463.
# 
# ### Thermal Performance Curves
# 
# * Schoolfield, R. M., P. J H Sharpe, and C. E. Magnuson. 1981. Non-Linear Regression of Biological Temperature-Dependent Rate Models Based on Absolute Reaction-Rate Theory. Journal of Theoretical Biology 88 (4): 719–31. https://doi.org/10.1016/0022-5193(81)90246-0.
# 
# * Zwietering, M. H.,  J. T de Koos, B. E. Hasenack, J. C. de Witt,  and K. van't Riet. 1991. Modeling of bacterial growth as a function of temperature. Appl. Environ. Microbiol. 57, 1094–101.
# 
# * Briere J. F., Pracros P., Le Roux A. Y., Pierre J. S. 1999. A novel rate model of temperature-dependent development for arthropods. Environ Entomol 28: 22–29.
# 
# * Dell, A. I., S. Pawar, and V. M. Savage. 2011. Systematic Variation in the Temperature Dependence of Physiological and Ecological Traits. Proceedings of the National Academy of Sciences of the United States of America 108 (26): 10591–10596. https://doi.org/doi: 10.1073/pnas.1015178108.
# 
# * DeLong, J. P., J. P. Gibert, T. M. Luhring, G. Bachman, B. Reed, A. Neyer, and K. L. Montooth. 2017. The Combined Effects of Reactant Kinetics and Enzyme Stability Explain the Temperature Dependence of Metabolic Rates. Ecology and Evolution 7 (11): 3940–50. https://doi.org/10.1002/ece3.2955.
