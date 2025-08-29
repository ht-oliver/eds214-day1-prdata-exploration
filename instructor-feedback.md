#### Exceeds Spec

Code is appropriately commented: I believe that my headers and in-line code make the code understandable to someone who may have never seen code before. I do fear that I have over-commented, but I'm still trying to figure out where to land on that.

**NOTE:** The two exceeds specs have to be in separate learning objectives

The README includes a flowchart and text explaining how the analysis works: I believe that my README is very thorough, and could be useful to someone who is completely unfamiliar with R. I am probably being too verbose, but would love some advice on how I can make the explanation of my analysis more professional.

#### Collaboration

My participation in peer feedback was a bit bumpy because I initially reviewed the project for the wrong student, but I was able to go back and give Marie feedback on all of her specs. I found it was very valuable to see what the process was like for a borderline finished project and for a project that needed a fair amount of work to do. I believe I was able to help Marie understand how to utilize separate scripts for data import and cleaning, and then source those in the quarto document. Megan also directly helped me fix my rolling average function to eliminate NA values.


Issues:

https://github.com/issues/recent?issue=ht-oliver%7Ceds214-day1-prdata-exploration%7C9

https://github.com/issues/recent?issue=ht-oliver%7Ceds214-day1-prdata-exploration%7C5


https://github.com/issues/recent?issue=mmorenorolon%7Churricane-streams%7C12




Git Commit Conflict:

https://github.com/ht-oliver/eds214-day1-prdata-exploration/commit/77b3fac3c87ac638161e66cca8ea906798d7b7a3


# Instructor feedback

## Automate

[NY] **Running the entire analysis requires rendering one Quarto document**

- paper.qmd looks really good, but the only contents of the docs/ folder should be what you want rendered on GitHub Pages (pretty much HTML files and nothing else). paper.qmd should go in paper/.

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[M] **Data import/cleaning is handled in its own script(s)**

## Organize

[M] Raw data is contained in its own folder

[M] Intermediate outputs are created and saved to a separate folder from raw data

[M] **At least one piece of functionality has been refactored into a function in its own file**

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[E] **The README includes a flowchart and text explaining how the analysis works**

- This is a great README! Good level of detail (not too little, not too much), flowchart looks very professional, and you clearly describes the steps of the analysis.

[M] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[NY] The rendered analysis is accessible via GitHub Pages

- Due to a capitalization issue, the paper.html version on GitHub Pages doesn't render
