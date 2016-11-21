pushd 'C:\Program Files\Weka-3-8'

$input_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff"
$output_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output"

$n_attributes = 5

For ($i=0; $i -le 9; $i++) {

    Write-Host "Performing steps 4 and 5 on opt${i}:-"

    Write-Host "Splitting opt$i in 2 and saving the first half..."
    java -cp weka.jar weka.filters.unsupervised.instance.RemoveFolds -i "$input_path\opt$i\opt$i.arff" -o "$input_path\opt$i\opt$i-train.arff" -c last -N 2 -F 1

    Write-Host "Performing attribute selection on the resulting file..."
    java -cp weka.jar weka.attributeSelection.CorrelationAttributeEval -s "weka.attributeSelection.Ranker -N ${n_attributes}" -i "$input_path\opt$i\opt$i-train.arff" > "$output_path\step 4\opt$i-train-rank.txt"

    $regex = "\b\d{1,3}\,\d{1,3}\b"
    $attributes2 = Select-String -Path "$output_path\step 4\opt$i-train-rank.txt" -Pattern $regex | % { $_.Matches } | % { $_.Value }

    $regex = "\b\d{1,3}\,\d{1,3}\,\d{1,3}\b"
    $attributes3 = Select-String -Path "$output_path\step 4\opt$i-train-rank.txt" -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value }

    $regex = "\b\d{1,3}\,\d{1,3}\,\d{1,3}\,\d{1,3},\d{1,3}\b"
    $attributes5 = Select-String -Path "$output_path\step 4\opt$i-train-rank.txt" -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value }

    Write-Host "Top 5 attributes saved as opt$i-train-rank.txt"

    Write-Host "Removing attributes from opt${i}:"
    java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $attributes2,65 -i "$input_path\opt$i\opt$i.arff" -o "$input_path\opt$i\opt$i-top2.arff" -V
    Write-Host "Top 2 done..."
    java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $attributes3,65 -i "$input_path\opt$i\opt$i.arff" -o "$input_path\opt$i\opt$i-top3.arff" -V
    Write-Host "Top 3 done..."
    java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $attributes5,65 -i "$input_path\opt$i\opt$i.arff" -o "$input_path\opt$i\opt$i-top5.arff" -V
    Write-Host "Top 5 done..."

    Write-Host "All saved to individual .arff files"


    Write-Host "Performing NaiveBayes on opt${i}:"

    Write-Host "Top 2 for $i..."
    java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "$input_path\opt$i\opt$i-top2.arff" > "$output_path\step 5\opt$i-top2.txt"
    Write-Host "Top 3 for $i..."
    java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "$input_path\opt$i\opt$i-top3.arff" > "$output_path\step 5\opt$i-top3.txt"
    Write-Host "Top 5 for $i..."
    java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "$input_path\opt$i\opt$i-top5.arff" > "$output_path\step 5\opt$i-top5.txt"
    Write-Host "All for $i..." 
    java -cp weka.jar weka.classifiers.bayes.NaiveBayes -t "$input_path\opt$i\opt$i.arff" > "$output_path\step 5\opt${i}.txt"

    }

Write-Host "Completed steps 4 and 5"

popd