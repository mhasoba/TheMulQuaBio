# MQB Coursework Assessment

Here are the guidelines for the assessment of any coursework based on the MQB materials.

Assessment may be through computer-based tests, exercises, practicals, projects, or individual and group work.

In computer-based tests, you will be expected to apply the concepts and techniques you have learned to address the questions by using appropriate computer code and interpreting the output.

## Assessment of exercises, practicals and projects

Both the correctness and quality of your solutions, and whether you are following good programming and workflow practices, will be assessed: how well you have learned the principles and implementation of **keeping workflows/pipelines/software organised and reusable** and **good coding practices**, _irrespective of programming language_ (please refer back to the [Unix](unix.ipynb) and [Python](python.ipynb) chapters in particular).

```{Note}
Lowercase for directory names below is a suggestion—just be consistent with whatever you choose, such as [CamelCase](https://en.wikipedia.org/wiki/Camel_case); for example, you may choose to name your `code` directory `Code` instead.
```

The basic rules you must follow, irrespective of the submission or project's content, are:

* Keep one coursework project repository for the related assignments. Put all code and scripts in its root-level `code/` directory.
    
* Keep supplied or created input data in the root-level `data/` directory.
    
* Put generated outputs in the root-level `results/` directory. Do not commit generated results unless the assignment brief explicitly asks for them. Because Git does not track empty directories, `results/` may be absent in a clean clone; scripts or the assessment runner should create it when needed.
    
* Keep temporary experiments and disposable test fixtures in an optional root-level `sandbox/` directory, and use [`.gitignore`](./git) to keep them out of submissions. Give any other necessary directories meaningful names.
    
* No single file should be greater than 100 MB, whether data or script/code. If a script needs a data file, but the example data file is >100 MB, reduce it to a minimally sized working dataset and upload that, keeping the main data file(s) in `.gitignore`. Keep all your data backed up elsewhere, of course!
    
* Most importantly, all scripts should run without errors, taking in data and spitting out the results as necessary.
    
When necessary, more specific details for a chapter, practical or assignment will be provided in the relevant brief.

### Pre-submission checklist

Do this after you finish an assignment, and before submission:

* review and make sure you can run all the commands, code fragments, and named scripts you have built so far and get the expected outputs.
    
* review your code files and annotate/comment code lines as much and as often as necessary using `#`.
    
* Check that required code, input data, and generated outputs follow the shared project layout and the current assignment brief.
    
* `git add`, commit and push after each major change to the coursework repository, and make a final push by the given deadline.
    

```{Note}
An _example script_ is supplied, or built from demonstrated code fragments, to illustrate one or more programming concepts or tools. An _assigned script_ is one you write yourself, either from scratch or by modifying a starter, to complete an exercise, practical or project identified in the relevant assignment brief.
```

### Code testing and feedback

Your coursework project repository will be checked for a clear, logical structure, and its required scripts will be tested and screened for good project structure and coding practice; in particular, that:

* All in-class and assigned scripts are in the project root's `code/` directory.
    
* All code/script files are functional (no errors, correct output) when run on the assessor's (Linux) computer.
    
* The scripts are all up to the mark in terms of internal documentation (e.g., docstrings in the case of Python) and commenting.
    
* Maintain one root `README.md` for the coursework repository. Update it as the work grows so it explains the project and how to run and check its required scripts. Do not create weekly directories or per-week README files unless a released assignment brief explicitly requires them.
    
* The `results` directory is empty (no pre-existing results).
    
* All _valid_ script files in the `code` directory have an appropriate extension (`*.sh`, `*.py`, etc.).
    
* All results of a code/script run are saved to a separate `results` directory.
    

### The Good, The Bad, and The Ugly

This is a practical way to interpret the criteria above: what to aim for, what to avoid, and what to clean up before submission. Think of it as a quick quality check before your code struts onto the assessment stage.

#### The Good (what you must do consistently well)

These are the core practices expected in all submissions; doing these well is the baseline for strong marks.

*No drama, no mystery, just reproducible science and solid Git habits.*

If your repository were a flat, this is the "looks tidy and smells like fresh coffee" version:

* Scripts run on Linux without errors and produce the expected outputs.
* Files are organised clearly (for example, `code/`, `data/`, and an empty `results/` at submission time).
* Readmes explain what scripts do and how to run them.
* Code is readable, with meaningful names and helpful comments/docstrings.
* Git history shows regular, descriptive commits and steady progress.

#### The Bad (errors, missing files, etc - must avoid; usually easy to prevent)

These are direct functional problems (errors, missing files, broken runs) and are usually avoidable with careful checks.

*"It works on my machine" is not a genre we award marks for.*

In short: the code equivalent of forgetting your keys, your wallet, and your laptop charger on the same day:

* Runtime errors, missing input files, or broken commands.
* Scripts that only run on one machine because of hard-coded paths.
* Required files or directories missing from the repository.
* Placeholder files (or mostly commented-out files) submitted as complete work.
* Basic checks missing, leading to crashes or unclear failures.

#### The Ugly (niggling quality issues that improve with practice)

These are quality issues that may not crash code, but they reduce readability, maintainability, and assessor confidence.

*The code runs, but the comments vanished and the folder structure went feral.*

The code may run, but future-you (and your assessor) will need detective skills and strong tea:

* Cluttered project structure or inconsistent naming.
* `results/` filled with stale or unnecessary outputs.
* Overly long, monolithic scripts with repeated code.
* Too little, too much, or unclear commenting/documentation.
* Readmes that are too vague, too long, or out of sync with the actual code.

Bad usually stops execution or correctness. Ugly usually harms communication and quality even when execution succeeds.

Bad code can often be debugged; ugly workflow usually has to be excavated first, ideally with a brush, a map, and a lot of patience.

#### Quick recovery checklist before submission

* Fix all "Bad" issues first so everything runs correctly (no crashes, no mysteries).
* Then clean up "Ugly" issues so your work is readable and assessable (and less likely to scare your future self).
* Re-run from a clean clone to confirm full reproducibility.

*Debug for survival, refactor for dignity, document for posterity.*


### Group work execution

#### Repository setup and access

* Each student group will assign a "scribe" to the group who will create a **new Group work repository** where all assigned group work practicals will be tackled collaboratively.
    
* The scribe must add all group members as collaborators with **write access** to ensure everyone can contribute directly.
    
* All group members are expected to clone the repository and work on it throughout the assignment period.

#### Collaborative workflow

* Group members will collaborate to develop the solution by creating feature branches as necessary, following proper Git workflow practices.
    
* Each team member should create their own branches for specific features or tasks, with descriptive branch names (e.g., `jane-data-import`, `john-analysis-function`).
    
* Use pull requests (or merge requests) for merging branches into main, allowing for code review and discussion.
    
* Once the group has reached a solution, merge all feature branches into main. **Do not delete branches before merging** — the full Git history, including merged branches, is essential for assessment.

#### Contribution expectations

All group members are expected to contribute meaningfully to the project. The Git repository history will be used to assess individual contributions. Specifically:

* **Commit regularly**: Make frequent, incremental commits throughout the assignment period, not just before the deadline. Each commit should represent a logical unit of work.
    
* **Write descriptive commit messages**: Use clear, informative commit messages that explain what was changed and why (e.g., "Add data validation function for tree heights" rather than "update code").
    
* **Participate in code reviews**: Comment on pull requests, suggest improvements, and engage in technical discussions (visible in PR comments).
    
* **Document your work**: Contribute to code comments, docstrings, and readme documentation.
    
* **Share responsibilities**: Aim for a balanced distribution of coding, testing, documentation, and debugging tasks across all team members.

#### Required documentation

Each group work repository must include a `CONTRIBUTIONS.md` file in the root directory that documents:

* The name and role(s) of each team member
* A brief description of each member's specific contributions (e.g., "Implemented data import functions", "Wrote unit tests", "Created visualization code", "Debugged edge cases and improved error handling")
* Any challenges faced and how they were resolved as a team

This file should be updated collaboratively and reflect the actual work distribution. A template is available at `notebooks/experimental/contributions-template.md` to help you get started.

#### Assessing individual contributions

Your individual grade for group work will be determined by:

1. **Group work quality** (60%): The overall correctness, code quality, and documentation of the submitted solution.
    
2. **Individual contribution** (40%): Your personal contribution as evidenced by:
    * Number and quality of commits
    * Complexity and significance of code contributed
    * Participation in code reviews and discussions
    * Contributions to documentation and testing
    * Accuracy of the `CONTRIBUTIONS.md` documentation

A group member who does not contribute meaningfully (as evidenced by Git history and peer feedback) may receive a significantly reduced grade, even if the group's solution is excellent.

#### Peer assessment

After the final submission, each team member will complete a brief confidential peer assessment form rating each teammate's:

* Contribution to coding and problem-solving
* Communication and collaboration
* reliability and meeting commitments
* Overall contribution to the team's success

Significant discrepancies between Git history and peer assessments will be investigated and may affect individual grades.

#### Handling team issues

If team conflicts arise or a team member is not contributing:

1. First, try to resolve the issue within the team through open communication.
2. If the issue persists, document the problem and contact your instructor or TA as early as possible (not just before the deadline).
3. Provide specific evidence (e.g., lack of commits, missed meetings, unresponsive to communications).

The instructor can provide mediation, reassign work, or adjust individual grades based on documented evidence.

#### Timeline expectations

* **Start early**: Begin work within the first few days of receiving the assignment.
* **Commit regularly**: Aim for commits spread across multiple working sessions, not concentrated in the final 24 hours; see [Apply the loop to your coursework](git.ipynb#apply-the-loop-to-your-coursework).
* **Coordinate meetings**: Schedule regular team meetings (online or in-person) to discuss progress, divide tasks, and resolve issues.
* **Review before submission**: Allow time for final code review, testing, and documentation polish before the deadline.

```{Note}
Please read about git branching and merging during teamwork in the [git Chapter](git), including the "**Common Mistakes to avoid…**" listed there. Please also check the readings & resources at the end of the chapter.
```

#### Group work assessment

Every "Group work" question/script completed will be assessed using the criteria above, with both group-level and individual-level components. The final assessment (below) will include reviewing:

* The quality and correctness of the submitted code
* The Git repository history (commits, branches, merges)
* The `CONTRIBUTIONS.md` documentation
* Peer assessment feedback
* Individual contribution patterns and engagement

### Computing bootcamp assessment timeline

The bootcamp coursework comprises four submissions: three formative submissions followed by one cumulative summative submission. Check the course timetable and released briefs for submission deadlines and feedback dates.

| Submission | Focus | Type | Deadline | Feedback target |
| --- | --- | --- | --- | --- |
| 1 | Unix, shell and individual Git portfolio. | Formative | See course timetable/brief | See course timetable/brief |
| 2 | Python I work, using the Unix, shell and Git workflow established in Submission 1; any corrections specified in the assignment brief. | Formative | See course timetable/brief | See course timetable/brief |
| 3 | R data workflow, reproducible figure and interpretation, as specified in the brief. | Formative | See course timetable/brief | See course timetable/brief |
| 4 | Cumulative portfolio of required work from Submissions 1-3, plus only the Python II tasks listed in the final brief. | Summative | See course timetable/brief | See course timetable/brief |

Submissions 1-3 are formative feedback checkpoints and receive no numeric mark. Submission 4 is the single cumulative summative assessment and accounts for 100% of the bootcamp coursework mark. Its rubric totals 100 points when assessed group-work criteria apply; otherwise the individual rubric subtotal is converted from 85 points to a percentage. Group-work criteria are N/A, not zero, when group work is not part of the released brief.

You will have reasonable time to use formative feedback before the cumulative summative submission. You will not be penalised for not acting on feedback that has not been returned before final, summative assessment.

### Final assessment of computing coursework

A written summative assessment of your overall performance will be sent at the end of your computing module or course (e.g., the CMEE computing bootcamp; please refer to your course documentation for specific dates). For this, all required scripts and project artifacts (including any assigned group work) will be run or reviewed, with logs and feedback returned.

Using the testing results, the assessor will exercise their judgment to deduct marks if the coursework project layout is disorganised, the code inadequately commented or insufficiently documented, the solution is not correct, or the written components of practicals are not up to the mark (see _The Weekly Feedback_ section).

Feedback logs for each submission are provided to help you spot general and programming-language-specific issues. You may and should fix bugs and other problems they identify. The assessor will review how you addressed the feedback in the final assessment by Weeklyrerunning the required scripts from the coursework project. The final assessment is more holistic than formative feedback: it gives an overall summative picture of your work and what you can improve. Final marks follow the coursework criteria published for your course; ask your course or module instructor if those criteria are unclear.

## Plagiarism

Students are encouraged to collaborate for learning, including on the practicals. You may often exchange code snippets (solutions to sub-problems within the bigger problem, if you like) or blocks of code to test them. Also, two implementations of a coding solution / algorithm might often be very convergent and relatively similar. However, unless it is a group work practical (see above), extremely similar or identical scripts / code files will be reviewed carefully by assessors. To this end, the assessment script will perform a diff on pairs of (non-group work) code files to detect "inordinate" degrees of similarity.

### Appropriate usage of AI for coding

Artificial Intelligence (AI) tools such as ChatGPT have become valuable resources for learning and coding assistance. However, it's important to use them responsibly to enhance your learning experience without violating academic integrity and undermining your actual learning.

Here are some guidelines to help you make appropriate use of AI in your coding journey.

1. **Use AI as a Learning Aid, Not a Crutch**

Leverage AI to understand concepts and get unstuck, but avoid relying on it to do the work for you.

*Example:* If you're struggling to understand how a recursive function (recall the [Python Chapter](python)) works, you might ask an AI tool to explain the concept or provide a simple example. Use this information to deepen your understanding and then attempt to write your own recursive function.

2. **Understand and Verify AI-Generated Code**

Always read and comprehend any code provided by AI to ensure you understand how it works.

*Example:* Suppose an AI tool suggests a solution for sorting a list. Before using it, go through each line of code to understand the sorting algorithm implemented. Try to explain it in your own words or comment the code to reinforce your understanding.

3. **Avoid Plagiarism and Uphold Academic Integrity**

Do not submit AI-generated code as your own in assignments or projects where external assistance is not permitted.

*Example:* If your assignment requires you to implement a function without outside help, avoid copying code from an AI tool. Instead, use the AI to clarify concepts if allowed, but write the code independently to ensure it reflects your understanding.

4. **Follow Your Institution's Policies on AI Usage**

Be aware of and comply with your institution, school, or university's rules regarding AI assistance.

*Example:* If your course syllabus states that using AI tools is prohibited for homework assignments, refrain from using them. Violating these policies can lead to serious academic consequences.

5. **Use AI to Enhance Problem-Solving Skills**

Employ AI to practice coding challenges and improve your skills, not just to get answers.

*Example:* When practicing coding problems, you might attempt a problem on your own first. If you get stuck, use the AI to get hints or alternative approaches, then try solving the problem again without directly copying the solution.

6. **Cite AI Assistance When required**

Acknowledge the use of AI tools in your work if your academic or professional guidelines require it.

*Example:* In a project report, you might include a section like: "Portions of the code were developed with the assistance of AI tools such as ChatGPT." Alternatively, add comments in your code where AI assistance was used.

7. **Develop Independent Coding Skills**

Strive to solve coding problems on your own to build confidence and proficiency.

*Example:* Before consulting AI, spend time brainstorming and coding your solution. Use AI only after you've made a genuine effort, which helps reinforce learning and retention.

8. **Be Aware of AI's Limitations**

recognize that AI tools can sometimes provide incorrect or suboptimal solutions.

*Example:* If an AI suggests a piece of code, test it thoroughly. Suppose the AI provides a function that doesn't handle edge cases properly; identifying and correcting this strengthens your debugging skills.

9. **Protect Sensitive Information**

Do not input confidential or personal data into AI tools.

*Example:* If you're working on a project with proprietary code or sensitive data, avoid sharing that code with an AI tool. Instead, abstract the problem or create a simplified version that doesn't disclose sensitive information.

10. **Collaborate Ethically in Team Projects**

Ensure all team members agree on the use of AI tools and properly attribute any AI-generated contributions.

*Example:* In a group project, discuss with your team whether to use AI assistance. If you collectively decide to use it, make sure to document where and how it was used, following any required citation practices.

11. **Avoid Overreliance on AI**

Balance the use of AI with traditional learning resources like textbooks, lectures, and discussions with peers or instructors.

*Example:* If you are learning a new programming language, use official documentation and tutorials as your primary resources. Supplement your learning with AI explanations when needed, but don't let it replace foundational learning methods.

12. **Contribute to the Learning Community**

Share your insights and understanding gained from AI assistance with classmates, fostering a collaborative learning environment.

*Example:* If an AI tool helped you grasp a difficult concept, consider explaining it to study group members or participating in class discussions to help others benefit from your newfound understanding.

By following these guidelines, you can make the most of AI tools to enhance your coding skills while maintaining academic integrity and personal growth. Remember, the goal of using AI in coding is to support your learning journey, *not* to replace the valuable process of learning through practice and problem-solving.

---
*Alright, full steam ahead then!*
