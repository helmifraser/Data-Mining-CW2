cd 'C:\Program Files\Weka-3-8'

$file = 9

$var = 30,22,44,43,35
$varAll = "30,22,44,43,35"
$k = 2

Write-Host "Executing"
java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $var[0],$var[1],65 -i "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file.arff" -o "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file-top2.arff" -V
Write-Host "Top 2 done..."
java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $var[0],$var[1],$var[2],65 -i "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file.arff" -o "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file-top3.arff" -V
Write-Host "Top 3 done..."
java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R $varAll,65 -i "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file.arff" -o "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt$file\opt$file-top5.arff" -V
Write-Host "Top 5 done, finished"

cd ~