cd 'C:\Program Files\Weka-3-8'

Write-Host "Starting NaiveBayes:"

For ($i=0; $i -le 9; $i++) {
	Write-Host "Top 2 for $i"
	java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$i\opt$i-top2.arff" > "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output\step 5\bayes on non-strat\opt$i\opt$i-top2.txt"
	Write-Host "Top 3 for $i"
	java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$i\opt$i-top3.arff" > "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output\step 5\bayes on non-strat\opt$i\opt$i-top3.txt"
	Write-Host "Top 5 for $i"
	java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$i\opt$i-top5.arff" > "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output\step 5\bayes on non-strat\opt$i\opt$i-top5.txt"
	Write-Host "All for $i" 
	java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$i\opt$i.arff" > "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output\step 5\bayes on non-strat\opt$i\opt$i.txt"

    }

cd ~