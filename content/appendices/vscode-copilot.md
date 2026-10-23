(vscode-copilot-setup)=
# Getting started with GitHub Copilot in VS Code

This appendix introduces the GitHub Copilot and VS Code setup used for AI-assisted programming in MQB. It supports the [AI-assisted programming in biology chapter](../notebooks/ai-assisted-programming.ipynb) and [lecture](../lectures/ai_coding/ai_coding.html).

As you gain experience, you can explore other AI coding tools, such as OpenAI's Codex or Claude Code.

## Before you start

Set up [VS Code for MQB](vscode.md) and [Python](python-environments.md) for the check below.

(copilot-access)=
## Choose an access route

GitHub hosts code; GitHub Copilot provides AI assistance with coding. Having a GitHub account does not mean you have Copilot access. Check [Copilot settings](https://github.com/settings/copilot) for the account you want to use.

```{important}
If you are preparing for a taught session, apply for Copilot access at least ten days beforehand. Approval can take time, and you may still need to activate Copilot afterwards.
```

| Your situation | Next action |
| --- | --- |
| You already have Copilot access | Use the GitHub account with that access when you sign in through VS Code. |
| You are an eligible student | Apply for GitHub Education benefits, then activate Copilot Student as described below. |
| Your institution or employer provides access | Follow its instructions and check that a licence has been assigned to your account. Ask its support team about any restrictions. |
| You do not have access yet | Check whether your account qualifies for Copilot Free in VS Code. If you cannot get access, follow the [troubleshooting steps below](#if-something-does-not-work). |

For an MQB class, do not buy a subscription to complete setup. Tell the teaching team if you cannot get access or have reached your usage limit. Plans and allowances change; check the [current GitHub plan guide](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-started-with-a-copilot-plan).

### Eligible students

In your web browser:

1. Sign in to the GitHub account you want to use, then open [Education benefits](https://github.com/settings/education/benefits).
2. If you are not yet verified, start an application and follow GitHub's evidence requirements. Check [student eligibility and application instructions](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) if you are unsure whether you qualify.
3. After GitHub verifies your student status, return to Education benefits and follow the prompts to activate **Copilot Student**. See [GitHub's activation and troubleshooting guide](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students) if you need help.
4. Check Copilot settings again. If you still see only a trial or a payment page, consult the guide's troubleshooting section.

### If you are at Imperial College London

Start with [ICL's GitHub Copilot information page](https://www.imperial.ac.uk/admin-services/ict/self-service/research-support/research-support-systems/github/github-copilot/) for an overview of code completion, chat and the supported tools. Then follow [ICL's access instructions](https://imperialcollegelondon.github.io/docs/copilot/request_access) for your role:

- **Undergraduate and postgraduate students:** apply through GitHub Education for free student access, then complete the activation steps above.
- **Postgraduates seeking a Business licence for research:** first agree funding with your department or project. Follow the paid-billing process, then submit the licence request after the Azure subscription has been created.
- **Centrally funded staff:** sign in to the ICL GitHub organisation and submit the licence request. ICT initially funds usage within its fair usage policy; additional usage requires paid billing.
- **Externally funded staff:** arrange funding through a cost code and follow the paid-billing process before submitting the licence request. Check your funding category with your line manager if unsure.

```{important}
You must belong to the ICL GitHub organisation to use the institutional licence request form. Joining the organisation does not automatically activate Copilot. GitHub Education verification is a separate process. Once Copilot is active, use the same GitHub account in VS Code.
```

If you are not at ICL, follow the student instructions above or ask your institution or employer about access. The VS Code setup and checks below are the same whichever route you use.

## Sign in through VS Code

```{warning}
Before sending coursework to Copilot, check the assignment brief: may you use AI, and how should you acknowledge it? For research, check your institution's and project's rules on sending code or data to an external AI service.

For this setup, use a separate practice project with made-up data. Do not include passwords, access tokens, other people's work or restricted research data.
```

1. Create a separate folder called `copilot-practice`. Inside it, create `code/`, `data/` and `results/` folders and a `README.md` file. Use **File → Open Folder…** to open `copilot-practice` in VS Code. Do not use your coursework repository or the downloaded MQB book source. See [Organising your learning project](../part-computing.md#organising-your-learning-project) for the folder layout.
2. Follow the current [VS Code Copilot setup guide](https://code.visualstudio.com/docs/setup/copilot). Select the Copilot status-bar control, choose **Use AI Features** if offered, and complete GitHub sign-in in the browser. Use the account whose access you checked above.
3. If prompted to install or enable Copilot, follow VS Code's instructions and check that the extension is published by GitHub. Ask IT for help if your computer blocks installation. The [MQB editor guide](vscode.md) covers Python and R language support.
4. Open the **Accounts** menu in VS Code and confirm the account used for Copilot. If you have several GitHub accounts, the [account-switching instructions](https://code.visualstudio.com/docs/setup/copilot#use-a-different-github-account-with-copilot) explain how to select another one.

VS Code can include selected code and other files with your request. Check the files and context listed in chat before sending it. A private repository restricts who can see your files on GitHub. It does not give you permission to share them with Copilot: your coursework and research rules still apply.

(copilot-controls)=
## Copilot controls

Before sending your first request, find the mode, model and permissions controls.

 <!-- The chapter explains {ref}`what the options mean <ai-copilot-options>` and {ref}`how to choose a model <ai-model-choice>`; here we just get ready to use them. -->

1. Open the Chat view from VS Code's Chat menu. Find the mode/agent picker beside the message box and choose **Ask**. If a **Session Target** control appears, use **Copilot** for these setup instructions. See the [Chat view guide](https://code.visualstudio.com/docs/agents/run/chat-view) if your layout differs.
2. Open the model picker and choose **Auto**. Leave thinking effort at its default. See [VS Code's model controls](https://code.visualstudio.com/docs/agent-customization/language-models) for the current layout.
3. Before an Agent task, choose **Manual permissions**. Check which actions are already approved to run without asking you. See the [permissions guide](https://code.visualstudio.com/docs/agents/run/approvals).
4. GitHub currently lists Free and Student as Auto-only plans. Check your plan and remaining allowance in Copilot settings, and consult the [current plan comparison](https://docs.github.com/en/copilot/get-started/plans).

(copilot-setup-check)=
## Check it with a small prediction

This exercise checks two things: can Python run your script, and can you check Copilot's explanation of the result?

### Predict and run locally

In VS Code, create `code/copilot_setup_check.py` inside `copilot-practice` and save this deliberately imperfect example:

```python
heights_cm = [8, 12, 10, 15]
threshold_cm = 10
count = sum(height >= threshold_cm for height in heights_cm)
print(count)
```

The question is: **how many heights are strictly greater than 10 cm?** Work out your answer before running the code. Should a height of exactly 10 cm count?

Open **Terminal → New Terminal**. From the `copilot-practice` folder, run:

```bash
python3 code/copilot_setup_check.py
```

If you normally run Python with `python`, use that command instead.

The script prints `3`: it counts 12, 10 and 15. But our question excludes 10, so the answer should be `2`. The code runs, but it answers the wrong question.

### Ask Copilot

```{note}
If Copilot is unavailable, follow the [troubleshooting steps below](#if-something-does-not-work). Return to this exercise once access is working.
```

Select the four lines of code and add them to your chat request. Check that chat shows the practice file as context. Ask:

> My question is how many heights are strictly greater than 10 cm. I predicted two, but this code prints three. Explain which value accounts for the difference and why. Do not edit files or run commands.

Check Copilot's explanation against the list: which value should have been excluded?

### Correct and check the code

Change `>=` to `>` yourself, save the file and run it again. It should now print `2`. Keeping the threshold at 10, try a list containing only `[10]`, then an empty list (`[]`). Both should print `0`. Finally, restore the original list.

To try an inline suggestion, add a comment such as `# Count heights strictly greater than 10 cm`. Copilot will suggest some code to insert there. Read the suggested code before accepting it. If no suggestion appears, try the chat check above or the troubleshooting steps below.

## If something does not work

| Symptom | What to check |
| --- | --- |
| Python cannot run the file | Check the saved filename, project folder and Python command using the [MQB editor checks](vscode.md#python-scripts-select-run-and-debug). Get the script running before troubleshooting Copilot. |
| GitHub has verified your student status, but Copilot is missing | Check that you have activated Copilot Student. See GitHub's [student-benefit troubleshooting](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students#troubleshooting). |
| VS Code uses the wrong account | Compare the account in the browser's Copilot settings with the one selected for Copilot in VS Code. Follow the official account-switching steps above. |
| Copilot or chat is unavailable | Check that Copilot is enabled in VS Code and that your organisation allows chat. See [GitHub's troubleshooting guide](https://docs.github.com/en/copilot/how-tos/troubleshoot-copilot/troubleshoot-common-issues). |
| Only Auto is available, or a model is missing | Check the signed-in account, the current plan comparison and organisation restrictions. Do not relax security settings to obtain another model. |
| Your mode picker differs from a tutorial | Use the current guides linked above. For the setup check, use Ask. The chapter explains the other modes and legacy Edit option. |
| Access worked, then requests stopped | Read the error message and check your usage allowance. If you have reached a limit, tell the teaching team. For other errors, follow GitHub's troubleshooting guide above. |
| You cannot install or enable Copilot on a course machine | Ask teaching staff or IT for help. |

If you are still waiting for access, tell the teaching team before the session. At ICL, contact [ICT support](https://www.imperial.ac.uk/admin-services/ict/contact-ict-service-desk/) for help with institutional access. For GitHub Education problems, follow the support instructions in the student-verification guide above.

When reporting a problem, include your operating system, VS Code version, relevant extension versions, the step that failed and the error text. Remove passwords, tokens and personal information from copied messages or screenshots.

## Ready? What next?

Your setup is ready when you can run `code/copilot_setup_check.py` in VS Code, ask Copilot to explain its output and check that explanation against your own calculation. Check which GitHub account is active and locate the mode, model and permissions controls. Can you explain why the script first printed `3` and how you checked your correction? Take the same approach to larger problems: **plan → implement → test → explain → rerun**.

Next, work through the [AI-assisted programming in biology chapter](../notebooks/ai-assisted-programming.ipynb) for the concepts and practicals. In a workshop, follow the [lecture](../lectures/ai_coding/ai_coding.html) and use the chapter for the practicals.

To prepare for the chapter's R practicals, follow the [R setup guide](r-setup.md).

For coursework, follow the assignment's rules on AI use and acknowledgement. For research, follow the project's data and authorship requirements. If you need to acknowledge AI use, record the tool, date, what you asked it to do and how you checked the result.

## References

These are the official guides used for this appendix. They were checked in October 2026; consult the current versions when setting up.

### ICL guidance

- [ICL ICT: GitHub Copilot](https://www.imperial.ac.uk/admin-services/ict/self-service/research-support/research-support-systems/github/github-copilot/) — features, supported tools and links to further setup resources.
- [ICL GitHub documentation: Requesting access](https://imperialcollegelondon.github.io/docs/copilot/request_access) — student and staff routes, organisation membership and funding requirements.

### General guidance, including for students outside ICL

- [GitHub: Apply to GitHub Education as a student](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) — eligibility, evidence and application steps.
- [GitHub: Access GitHub Copilot for free as a student](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students) — activating the benefit after verification and resolving delays.
- [VS Code: Set up GitHub Copilot](https://code.visualstudio.com/docs/setup/copilot) — editor setup, sign-in and account switching.
- [VS Code: Use the Chat view](https://code.visualstudio.com/docs/agents/run/chat-view) — finding the session, mode, model and permissions controls.
- [VS Code: AI language models](https://code.visualstudio.com/docs/agent-customization/language-models) and [approvals and permissions](https://code.visualstudio.com/docs/agents/run/approvals) — model selection and action approvals. These controls were checked on 23 October 2026.
- [GitHub: Plans for Copilot](https://docs.github.com/en/copilot/get-started/plans) — plan features, model access and usage allowances.
- [GitHub: Getting started with a GitHub Copilot plan](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-started-with-a-copilot-plan) — access options when student or institutional access is unavailable.
- [GitHub: Asking GitHub Copilot questions in your IDE](https://docs.github.com/en/copilot/how-tos/copilot-in-your-ide/chat-with-copilot/chat-in-ide) — chat modes, requests and project context.
- [GitHub: Troubleshooting common issues with GitHub Copilot](https://docs.github.com/en/copilot/how-tos/troubleshoot-copilot/troubleshoot-common-issues) — sign-in, extension and service problems.
