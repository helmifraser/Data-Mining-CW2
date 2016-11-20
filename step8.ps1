pushd 'C:/Program Files/Weka-3-8'

java -cp weka.jar weka.clusterers.EM -t "C:\Users\helmi\Google Drive\Data Mining\Coursework 2\opt arff\opt0\opt0 - normalized.arff" -I 100 -N -1 -X 10 -max -1 -ll-cv 1.0E-6 -ll-iter 1.0E-6 -M 1.0E-6 -K 10 -num-slots 1 -S 100

popd