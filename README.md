# Data-Mining-CW2
PowerShell scripts for performing some of the steps in Coursework 2.

In order to run these scripts, the file paths must be changed, as they were the directories on my personal machine. These file paths are
often denoted by "input_path" or "output_path" or something similar. Also, the destinations of the result text files will need changing 
too, to suit your own machine.

Within each .ps1 script, I have placed console outputs which act both to track the position the script is at and also to make the code 
easier to understand.

step2&3.ps1 randomizes the dataset and performs naive Bayes classification on the resulting file.

step4&5.ps1 is slightly more complicated. For each optN file it:
      Splits the data set into two equal folds, saves the first fold.
      Performs CorrelationAttributeEval with a Ranker search method, and outputs the result to a text file.
      Reads this file, extracts the top 2/3/5 attributes and saves them to variables.
      Removes these selected attributes from optN, and produces subtracted data sets only including the class attribute and the top 2/3/5 
      attributes. 
      Performs naive Bayes on these 2/3/5reduced data sets as well as the original optN set and saves these results for analysis.
      
step7.ps1 utilises SimpleKMeans clustering. For each optN and optall file:
      Produces a new data set based on the file with normalized attribute values (minus the class attribute).
      Removes the class attribute from this set (eg opt0 - normalised), saves it as a new dataset (eg opt0 - normalised(no class))
      and clusters, saving the output.
      Produces a .arff file for the clustered instances (for visualisation).
      Clusters the normalised .arff set with the class attribute, saving the output.
      
step8.ps1 is functionally similar to step7.ps1, however instead of SimpleKMeans clustering it uses EM clustering. This script has 
variables to chaneg the parameters of the EM clustering, which is needed to compare and analyse the effects of different parameters.
