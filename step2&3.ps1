pushd 'C:\Program Files\Weka-3-8'

$dir = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2"

Write-Host "Step 2: Randomizing optall..."
java -cp weka.jar weka.filters.unsupervised.instance.Randomize -i "$dir\opt arff\optall\optall.arff" | Out-File  "$dir\opt arff\optall\optall - randomized.arff" -encoding ASCII

Write-Host "Step 3: Performing NaiveBayes on the resulting version..."
java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "$dir\opt arff\optall\optall - randomized.arff" > "$dir\output\bayes-optall-random.txt"

Write-Host "Finished steps 2 and 3, optall randomized and NaiveBayes performed"

popd