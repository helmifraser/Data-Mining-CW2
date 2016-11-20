pushd 'C:/Program Files/Weka-3-8'

$input_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff"
$output_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output"

$min_clusters = 2
$max_clusters = 4

$min_clusters_2 = 10
$max_clusters_2 = 10

$ll_cv = 1E-6
$ll_iter = 1E-6

$min_std = 0.09

$k_runs = 10
$cv_folds = 10

For ($i=0; $i -le 10; $i++) {

    if ($i -ge 0 -and $i -le 9) {
        Write-Host "Performing EM clustering for opt${i}..."
        java -cp weka.jar weka.clusterers.EM -t "$input_path\opt$i\opt$i - normalized.arff" -I 100 -N $min_clusters -X $cv_folds -max $max_clusters -ll-cv $ll_cv -ll-iter $ll_iter -M $min_std -K $k_runs -num-slots 1 -S 100 -c last > "$output_path\step 8\opt${i} - EM.txt"
    }

    else {
        Write-Host "Performing EM clustering for optall..."
        java -cp weka.jar weka.clusterers.EM -t "$input_path\optall\optall - normalized.arff" -I 100 -N $min_clusters_2 -X $cv_folds -max $max_clusters_2 -ll-cv $ll_cv -ll-iter $ll_iter -M $min_std -K $k_runs -num-slots 1 -S 100 -c last > "$output_path\step 8\optall - EM.txt"
    }

    }

popd