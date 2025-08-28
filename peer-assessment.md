---
editor_options: 
  markdown: 
    wrap: 72
---

# Automate

### Running the entire analysis requires rendering one Quarto document

Yes, but to make it run better:

-   You have too many NAs in your data_comb_avg for it to look right!
    Where your roll_avg function says "result \<-
    mean(window_concs\*\*\*\*)" - there needs to be an added "NA.RM =
    TRUE" where the stars are! And that will fix your graph

-   Sourcing your function should prob avoid the slashes to make it more
    reproducible. If you use the source(here::here("R", "roll_mean.R")),
    tool it might help.

### The analysis runs without errors

Everything ran on my computer with no errors!

### The analysis produces the expected output

Not yet! Need either decided if you want to:

-   

    (1) pivot longer the data_comb_avg table (this can take all the avg
        columns and make 2 columns: one with all the concentrations and
        one with all the nutrients) --\> Then you can make 1 ggplot and
        facetwrap(\~nutrients) (where x = time and y = concentrations)

-   

    (2) make separate ggplots for each nutrients --\> patchwork them
        together using (k / mg / NO3 / NH4).

### Data import/cleaning is handled in its own script(s)

I can't find it. Take the first 3 code chunks in your "data exploration"
file and copy and paste it in another script! Then you complete this!!

I asked Max where I should put my file like this and they say "keep it
in the root and call it something like '1_data_import_cleaning'" so when
someone opens the repository they know to do this first.

# Organize

### Raw data is contained in its own folder

Yes! Great job! If you want to make it less confusing to the audience,
delete unneeded data files!

### Intermediate outputs are created and saved to a separate folder from raw data

Yes! In the "R" folder!

### **At least one piece of functionality has been refactored into a function in its own file**

I would put more comments in your scripts. Every new code trying to do
something new, needs a comment at the top and/or within. Think "if I was
going to close this repo and open it in 3 months, would I understand
what I'm doing in ALL codes by the comments."

# Document

### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

Not yet! Add a bulleted list that has all your file names and what goes
in each file. (For me, this is gonna be one of the last things I do
because I am constantly moving/ reorganizing my files).

### **The README includes a flowchart and text explaining how the analysis works**

Not yet! (I'm gonna make a pretty flowchart on canva and "EXCEED" in
this if that gives you any good ideas)

### **The code is appropriately commented**

I would comment some more! More comments before each code chunk and even
within the code. (to "exceed" in this, I added an roxygen thing to my
functions)

### **Variable and function names are descriptive and follow a consistent naming convention**

Yes! (be cautious: your "Fig_3" is the only name with a capital)

# scale

### Running the environment initialization script installs all required packages

Met!

### The analysis script runs without errors

Yes! I talked about some edits earlier that will help with this!

# 

-   you have too many NAs in your data_comb_avg. Where your function
    says "result \<- mean(window_concs\*\*\*\*)" - there needs to be an
    added "NA.RM = TRUE" where the stars are!!
