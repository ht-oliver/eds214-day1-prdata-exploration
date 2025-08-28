# Automate

#### Running the entire analysis requires rendering one Quarto document
*Meets spec* - My analysis isn't totally complete, but I have a quarto document that reads, cleans, wrangles and plots my data without error messages.
*To Exceed* - Quarto document is friendly to the eyes, and includes only relevant information for my hypothetical audience. Possibly has interactive portions.

#### The analysis runs without errors
*Meets spec* - I do want to make some tweaks to my analysis, but I'm not getting any error messages and I'm generating a portion of the expected result

#### The analysis produces the expected output
*Not yet* - My output has a fair amount of missing data, and I still need to organize my ggplot correctly.

#### Data import/cleaning is handled in its own script(s)
*Not yet* - My import and cleaning are still in the same script as my analysis. I must create new files, place the import and cleaning there, and source them in my analysis document.



# Organize

#### Raw data is contained it it's own folder
*Meets spec* - Raw data is alone in a data folder

#### Intermediate outputs are created and saved in a separate folder from raw data
*Not yet* - My intermediate outputs are separate from my raw data, but not separate from my analysis

#### At least one piece of functionality has been refactored in a function in its own file
*Meets spec* - My rolling average function is contained in it's own script
*To exceed* - I could pull this function into another function that automates running the function for every constituent and adds it to my data frame



# Document

#### The repo has a README that explains where find (1) date, (2) analysis script, (3) supporting code and (4) outputs.
*Not yet* - My README is a draft, and needs to be updated with my new workflow

#### The README includes a flowchart and text explaining how the analysis works
*Not yet* - My flowchart is still a list in my notebook

#### The code is appropriately commented
*Not yet* - I have header comments, but need to update in-line comments

#### Variable and function names are descripitive and follow a consistenet naming convention
*Meets spec* - My function and object names are short and descriptive, and dont contradict eachother. They could still use some improvement



# Scale

#### Running the environment initialization script installs all required packages
*Not yet* - Need to move environmental initialization into separate script

#### The analysis script runs without errors
*Meets spec* - No errors in my current analysis, I do want to make somge changes.



