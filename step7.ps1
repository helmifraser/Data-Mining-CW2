# Step 7, using SimpleKMeans

pushd 'C:/Program Files/Weka-3-8'

$input_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff"
$output_path = "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\output"

$n = 10
$k = 10
$min_dens = 2
$t1 = -1.25
$t2 = -1

Write-Host "Normalizing attributes in optall and optN:"

For ($i=0; $i -le 10; $i++) {

    if ($i -ge 0 -and $i -le 9) {
        Write-Host "Normalizing opt$i..."

        java -cp weka.jar weka.filters.unsupervised.attribute.Normalize -i "$input_path\opt$i\opt$i.arff" -unset-class-temporarily -o "$input_path\opt$i\opt$i - normalized.arff"

        Write-Host "Finished normalizing opt $i"

        Write-Host "Clustering opt$i..."

        Write-Host "Not including class:"
        Write-Host "Removing class attribute from $i..."
        java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R 65 -i "$input_path\opt$i\opt$i - normalized.arff" -o "$input_path\opt$i\opt$i - normalized(no class).arff"

        Write-Host "Clustering..."   

        java -cp weka.jar weka.clusterers.SimpleKMeans -t "$input_path\opt$i\opt$i - normalized(no class).arff" -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density $min_dens -t1 $t1 -t2 $t2 -N $n -A "weka.core.EuclideanDistance -R first-last" -I 500 -num-slots 1 -S 10 > "$output_path\step 7\No class\opt$i - cluster.txt"

        Write-Host "Done, saved output"

        Write-Host "Including class:"

        Write-Host "Clustering..."

        java -cp weka.jar weka.filters.unsupervised.attribute.AddCluster -i "$input_path\opt${i}\opt${i} - normalized.arff" -o "$input_path\opt${i}\opt${i} - clustered.arff" -W "weka.clusterers.SimpleKMeans -N ${n}" 

        java -cp weka.jar weka.clusterers.SimpleKMeans -t "$input_path\opt$i\opt$i - normalized.arff" -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density $min_dens -t1 $t1 -t2 $t2 -N $n -A "weka.core.EuclideanDistance -R first-last" -I 500 -num-slots 1 -S 10 -c last > "$output_path\step 7\Class\opt$i - cluster.txt"

        Write-Host "Done, saved output"

    }

    else {
        Write-Host "Normalizing optall..."

        java -cp weka.jar weka.filters.unsupervised.attribute.Normalize -i "$input_path\optall\optall.arff" -unset-class-temporarily -o "$input_path\optall\optall - normalized.arff"

        Write-Host "Finished normalizing optall"

        Write-Host "Clustering optall..."

        Write-Host "Not including class:"
        Write-Host "Removing class attribute from optall..."

        java -cp weka.jar weka.filters.unsupervised.attribute.Remove -R 65 -i "$input_path\optall\optall - normalized.arff" -o "$input_path\optall\optall - normalized(no class).arff"

        Write-Host "Clustering..."

        java -cp weka.jar weka.clusterers.SimpleKMeans -t "$input_path\optall\optall - normalized(no class).arff" -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density $min_dens -t1 $t1 -t2 $t2 -N $k -A "weka.core.EuclideanDistance -R first-last" -I 500 -num-slots 1 -S 10 > "$output_path\step 7\No class\optall - cluster.txt"

        Write-Host "Done, saved output"

        Write-Host "Including class:"

        Write-Host "Clustering..."
        
        java -cp weka.jar weka.filters.unsupervised.attribute.AddCluster -i "$input_path\optall\optall - normalized.arff" -o "$input_path\optall\optall - clustered.arff" -W "weka.clusterers.SimpleKMeans -N $k" 

        java -cp weka.jar weka.clusterers.SimpleKMeans -t "$input_path\optall\optall - normalized.arff" -init 0 -max-candidates 100 -periodic-pruning 10000 -min-density $min_dens -t1 $t1 -t2 $t2 -N $k -A "weka.core.EuclideanDistance -R first-last" -I 500 -num-slots 1 -S 10 -c last > "$output_path\step 7\Class\optall - cluster.txt"

        Write-Host "Done, saved output"

        Write-Host "optall done"
    }

    Write-Host "Completed"


    }

popd