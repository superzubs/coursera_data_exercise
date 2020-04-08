# Code Book

A brief explanation on the variables in the tidy_data.txt file and the approach to process the data.

# Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Processes Made

1. Merges the training and the test sets to create one data set.
Uses rbind and cbind to merge data

2. Extracts only the measurements on the mean and standard deviation for each measurement.
Uses grep and subsetting to extract the variables

3. Uses descriptive activity names to name the activities in the data set
Uses the approach to factorize the set and convert it into the correct label

4. Appropriately labels the data set with descriptive activity names.
Uses gsub, trimws, tolower to make the names easily readable and understandable

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Uses aggregate and order to summarise the data quickly and neatly. It is summarised by the function mean()

# Variables

This section has been assisted by the str function in R

data.frame':	180 obs. of  81 variables:
 $ subject                                     : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 2 2 2 2 ...
 $ activity                                    : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ t_body_accelerometer_mean_x                 : num  0.277 0.255 0.289 0.261 0.279 ...
 $ t_body_accelerometer_mean_y                 : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
 $ t_body_accelerometer_mean_z                 : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
 $ t_body_accelerometer_std_x                  : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
 $ t_body_accelerometer_std_y                  : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
 $ t_body_accelerometer_std_z                  : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
 $ t_gravity_accelerometer_mean_x              : num  0.935 0.893 0.932 0.832 0.943 ...
 $ t_gravity_accelerometer_mean_y              : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
 $ t_gravity_accelerometer_mean_z              : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
 $ t_gravity_accelerometer_std_x               : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
 $ t_gravity_accelerometer_std_y               : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
 $ t_gravity_accelerometer_std_z               : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
 $ t_body_accelerometer_jerk_mean_x            : num  0.074 0.1014 0.0542 0.0775 0.0754 ...
 $ t_body_accelerometer_jerk_mean_y            : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
 $ t_body_accelerometer_jerk_mean_z            : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
 $ t_body_accelerometer_jerk_std_x             : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
 $ t_body_accelerometer_jerk_std_y             : num  0.067 -0.378 -0.102 -0.981 -0.986 ...
 $ t_body_accelerometer_jerk_std_z             : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
 $ t_body_gyroscope_mean_x                     : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
 $ t_body_gyroscope_mean_y                     : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
 $ t_body_gyroscope_mean_z                     : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
 $ t_body_gyroscope_std_x                      : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
 $ t_body_gyroscope_std_y                      : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
 $ t_body_gyroscope_std_z                      : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
 $ t_body_gyroscope_jerk_mean_x                : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
 $ t_body_gyroscope_jerk_mean_y                : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
 $ t_body_gyroscope_jerk_mean_z                : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...
 $ t_body_gyroscope_jerk_std_x                 : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
 $ t_body_gyroscope_jerk_std_y                 : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
 $ t_body_gyroscope_jerk_std_z                 : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
 $ t_body_accelerometer_magnitude_mean         : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ t_body_accelerometer_magnitude_std          : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ t_gravity_accelerometer_magnitude_mean      : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ t_gravity_accelerometer_magnitude_std       : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ t_body_accelerometer_jerk_magnitude_mean    : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
 $ t_body_accelerometer_jerk_magnitude_std     : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
 $ t_body_gyroscope_magnitude_mean             : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
 $ t_body_gyroscope_magnitude_std              : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
 $ t_body_gyroscope_jerk_magnitude_mean        : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
 $ t_body_gyroscope_jerk_magnitude_std         : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
 $ f_body_accelerometer_mean_x                 : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
 $ f_body_accelerometer_mean_y                 : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
 $ f_body_accelerometer_mean_z                 : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
 $ f_body_accelerometer_std_x                  : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
 $ f_body_accelerometer_std_y                  : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
 $ f_body_accelerometer_std_z                  : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
 $ f_body_accelerometer_meanfreq_x             : num  -0.2075 -0.4187 -0.3074 -0.0495 0.0865 ...
 $ f_body_accelerometer_meanfreq_y             : num  0.1131 -0.1607 0.0632 0.0759 0.1175 ...
 $ f_body_accelerometer_meanfreq_z             : num  0.0497 -0.5201 0.2943 0.2388 0.2449 ...
 $ f_body_accelerometer_jerk_mean_x            : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
 $ f_body_accelerometer_jerk_mean_y            : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
 $ f_body_accelerometer_jerk_mean_z            : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
 $ f_body_accelerometer_jerk_std_x             : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
 $ f_body_accelerometer_jerk_std_y             : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
 $ f_body_accelerometer_jerk_std_z             : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
 $ f_body_accelerometer_jerk_meanfreq_x        : num  -0.209 -0.377 -0.253 0.257 0.314 ...
 $ f_body_accelerometer_jerk_meanfreq_y        : num  -0.3862 -0.5095 -0.3376 0.0475 0.0392 ...
 $ f_body_accelerometer_jerk_meanfreq_z        : num  -0.18553 -0.5511 0.00937 0.09239 0.13858 ...
 $ f_body_gyroscope_mean_x                     : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
 $ f_body_gyroscope_mean_y                     : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
 $ f_body_gyroscope_mean_z                     : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
 $ f_body_gyroscope_std_x                      : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
 $ f_body_gyroscope_std_y                      : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
 $ f_body_gyroscope_std_z                      : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
 $ f_body_gyroscope_meanfreq_x                 : num  0.0148 -0.1875 -0.1005 0.1892 -0.1203 ...
 $ f_body_gyroscope_meanfreq_y                 : num  -0.0658 -0.4736 0.0826 0.0631 -0.0447 ...
 $ f_body_gyroscope_meanfreq_z                 : num  0.000773 -0.133374 -0.075676 -0.029784 0.100608 ...
 $ f_body_accelerometer_magnitude_mean         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
 $ f_body_accelerometer_magnitude_std          : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
 $ f_body_accelerometer_magnitude_meanfreq     : num  0.1906 -0.0977 0.1192 0.2367 0.2846 ...
 $ f_body_accelerometer_jerk_magnitude_mean    : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
 $ f_body_accelerometer_jerk_magnitude_std     : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
 $ f_body_accelerometer_jerk_magnitude_meanfreq: num  0.0938 0.0854 0.0765 0.3519 0.4222 ...
 $ f_body_gyroscope_magnitude_mean             : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
 $ f_body_gyroscope_magnitude_std              : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
 $ f_body_gyroscope_magnitude_meanfreq         : num  0.268844 -0.219303 0.349614 -0.000262 -0.028606 ...
 $ f_body_gyroscope_jerk_magnitude_mean        : num  -0.319 -0.635 -0.282 -0.99 -0.995 ...
 $ f_body_gyroscope_jerk_magnitude_std         : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
 $ f_body_gyroscope_jerk_magnitude_meanfreq    : num  0.191 0.114 0.19 0.185 0.334 ...


This section has been assisted with the summary() function in R
  subject                  activity  t_body_accelerometer_mean_x t_body_accelerometer_mean_y
 1      :  6   WALKING           :30   Min.   :0.2216              Min.   :-0.040514          
 2      :  6   WALKING_UPSTAIRS  :30   1st Qu.:0.2712              1st Qu.:-0.020022          
 3      :  6   WALKING_DOWNSTAIRS:30   Median :0.2770              Median :-0.017262          
 4      :  6   SITTING           :30   Mean   :0.2743              Mean   :-0.017876          
 5      :  6   STANDING          :30   3rd Qu.:0.2800              3rd Qu.:-0.014936          
 6      :  6   LAYING            :30   Max.   :0.3015              Max.   :-0.001308          
 (Other):144                                                                                  
 t_body_accelerometer_mean_z t_body_accelerometer_std_x t_body_accelerometer_std_y t_body_accelerometer_std_z
 Min.   :-0.15251            Min.   :-0.9961            Min.   :-0.99024           Min.   :-0.9877           
 1st Qu.:-0.11207            1st Qu.:-0.9799            1st Qu.:-0.94205           1st Qu.:-0.9498           
 Median :-0.10819            Median :-0.7526            Median :-0.50897           Median :-0.6518           
 Mean   :-0.10916            Mean   :-0.5577            Mean   :-0.46046           Mean   :-0.5756           
 3rd Qu.:-0.10443            3rd Qu.:-0.1984            3rd Qu.:-0.03077           3rd Qu.:-0.2306           
 Max.   :-0.07538            Max.   : 0.6269            Max.   : 0.61694           Max.   : 0.6090           
                                                                                                             
 t_gravity_accelerometer_mean_x t_gravity_accelerometer_mean_y t_gravity_accelerometer_mean_z
 Min.   :-0.6800                Min.   :-0.47989               Min.   :-0.49509              
 1st Qu.: 0.8376                1st Qu.:-0.23319               1st Qu.:-0.11726              
 Median : 0.9208                Median :-0.12782               Median : 0.02384              
 Mean   : 0.6975                Mean   :-0.01621               Mean   : 0.07413              
 3rd Qu.: 0.9425                3rd Qu.: 0.08773               3rd Qu.: 0.14946              
 Max.   : 0.9745                Max.   : 0.95659               Max.   : 0.95787              
                                                                                             
 t_gravity_accelerometer_std_x t_gravity_accelerometer_std_y t_gravity_accelerometer_std_z
 Min.   :-0.9968               Min.   :-0.9942               Min.   :-0.9910              
 1st Qu.:-0.9825               1st Qu.:-0.9711               1st Qu.:-0.9605              
 Median :-0.9695               Median :-0.9590               Median :-0.9450              
 Mean   :-0.9638               Mean   :-0.9524               Mean   :-0.9364              
 3rd Qu.:-0.9509               3rd Qu.:-0.9370               3rd Qu.:-0.9180              
 Max.   :-0.8296               Max.   :-0.6436               Max.   :-0.6102              
                                                                                          
 t_body_accelerometer_jerk_mean_x t_body_accelerometer_jerk_mean_y t_body_accelerometer_jerk_mean_z
 Min.   :0.04269                  Min.   :-0.0386872               Min.   :-0.067458               
 1st Qu.:0.07396                  1st Qu.: 0.0004664               1st Qu.:-0.010601               
 Median :0.07640                  Median : 0.0094698               Median :-0.003861               
 Mean   :0.07947                  Mean   : 0.0075652               Mean   :-0.004953               
 3rd Qu.:0.08330                  3rd Qu.: 0.0134008               3rd Qu.: 0.001958               
 Max.   :0.13019                  Max.   : 0.0568186               Max.   : 0.038053               
                                                                                                   
 t_body_accelerometer_jerk_std_x t_body_accelerometer_jerk_std_y t_body_accelerometer_jerk_std_z
 Min.   :-0.9946                 Min.   :-0.9895                 Min.   :-0.99329               
 1st Qu.:-0.9832                 1st Qu.:-0.9724                 1st Qu.:-0.98266               
 Median :-0.8104                 Median :-0.7756                 Median :-0.88366               
 Mean   :-0.5949                 Mean   :-0.5654                 Mean   :-0.73596               
 3rd Qu.:-0.2233                 3rd Qu.:-0.1483                 3rd Qu.:-0.51212               
 Max.   : 0.5443                 Max.   : 0.3553                 Max.   : 0.03102               
                                                                                                
 t_body_gyroscope_mean_x t_body_gyroscope_mean_y t_body_gyroscope_mean_z t_body_gyroscope_std_x t_body_gyroscope_std_y
 Min.   :-0.20578        Min.   :-0.20421        Min.   :-0.07245        Min.   :-0.9943        Min.   :-0.9942       
 1st Qu.:-0.04712        1st Qu.:-0.08955        1st Qu.: 0.07475        1st Qu.:-0.9735        1st Qu.:-0.9629       
 Median :-0.02871        Median :-0.07318        Median : 0.08512        Median :-0.7890        Median :-0.8017       
 Mean   :-0.03244        Mean   :-0.07426        Mean   : 0.08744        Mean   :-0.6916        Mean   :-0.6533       
 3rd Qu.:-0.01676        3rd Qu.:-0.06113        3rd Qu.: 0.10177        3rd Qu.:-0.4414        3rd Qu.:-0.4196       
 Max.   : 0.19270        Max.   : 0.02747        Max.   : 0.17910        Max.   : 0.2677        Max.   : 0.4765       
                                                                                                                      
 t_body_gyroscope_std_z t_body_gyroscope_jerk_mean_x t_body_gyroscope_jerk_mean_y t_body_gyroscope_jerk_mean_z
 Min.   :-0.9855        Min.   :-0.15721             Min.   :-0.07681             Min.   :-0.092500           
 1st Qu.:-0.9609        1st Qu.:-0.10322             1st Qu.:-0.04552             1st Qu.:-0.061725           
 Median :-0.8010        Median :-0.09868             Median :-0.04112             Median :-0.053430           
 Mean   :-0.6164        Mean   :-0.09606             Mean   :-0.04269             Mean   :-0.054802           
 3rd Qu.:-0.3106        3rd Qu.:-0.09110             3rd Qu.:-0.03842             3rd Qu.:-0.048985           
 Max.   : 0.5649        Max.   :-0.02209             Max.   :-0.01320             Max.   :-0.006941           
                                                                                                              
 t_body_gyroscope_jerk_std_x t_body_gyroscope_jerk_std_y t_body_gyroscope_jerk_std_z
 Min.   :-0.9965             Min.   :-0.9971             Min.   :-0.9954            
 1st Qu.:-0.9800             1st Qu.:-0.9832             1st Qu.:-0.9848            
 Median :-0.8396             Median :-0.8942             Median :-0.8610            
 Mean   :-0.7036             Mean   :-0.7636             Mean   :-0.7096            
 3rd Qu.:-0.4629             3rd Qu.:-0.5861             3rd Qu.:-0.4741            
 Max.   : 0.1791             Max.   : 0.2959             Max.   : 0.1932            
                                                                                    
 t_body_accelerometer_magnitude_mean t_body_accelerometer_magnitude_std t_gravity_accelerometer_magnitude_mean
 Min.   :-0.9865                     Min.   :-0.9865                    Min.   :-0.9865                       
 1st Qu.:-0.9573                     1st Qu.:-0.9430                    1st Qu.:-0.9573                       
 Median :-0.4829                     Median :-0.6074                    Median :-0.4829                       
 Mean   :-0.4973                     Mean   :-0.5439                    Mean   :-0.4973                       
 3rd Qu.:-0.0919                     3rd Qu.:-0.2090                    3rd Qu.:-0.0919                       
 Max.   : 0.6446                     Max.   : 0.4284                    Max.   : 0.6446                       
                                                                                                              
 t_gravity_accelerometer_magnitude_std t_body_accelerometer_jerk_magnitude_mean
 Min.   :-0.9865                       Min.   :-0.9928                         
 1st Qu.:-0.9430                       1st Qu.:-0.9807                         
 Median :-0.6074                       Median :-0.8168                         
 Mean   :-0.5439                       Mean   :-0.6079                         
 3rd Qu.:-0.2090                       3rd Qu.:-0.2456                         
 Max.   : 0.4284                       Max.   : 0.4345                         
                                                                               
 t_body_accelerometer_jerk_magnitude_std t_body_gyroscope_magnitude_mean t_body_gyroscope_magnitude_std
 Min.   :-0.9946                         Min.   :-0.9807                 Min.   :-0.9814               
 1st Qu.:-0.9765                         1st Qu.:-0.9461                 1st Qu.:-0.9476               
 Median :-0.8014                         Median :-0.6551                 Median :-0.7420               
 Mean   :-0.5842                         Mean   :-0.5652                 Mean   :-0.6304               
 3rd Qu.:-0.2173                         3rd Qu.:-0.2159                 3rd Qu.:-0.3602               
 Max.   : 0.4506                         Max.   : 0.4180                 Max.   : 0.3000               
                                                                                                       
 t_body_gyroscope_jerk_magnitude_mean t_body_gyroscope_jerk_magnitude_std f_body_accelerometer_mean_x
 Min.   :-0.99732                     Min.   :-0.9977                     Min.   :-0.9952            
 1st Qu.:-0.98515                     1st Qu.:-0.9805                     1st Qu.:-0.9787            
 Median :-0.86479                     Median :-0.8809                     Median :-0.7691            
 Mean   :-0.73637                     Mean   :-0.7550                     Mean   :-0.5758            
 3rd Qu.:-0.51186                     3rd Qu.:-0.5767                     3rd Qu.:-0.2174            
 Max.   : 0.08758                     Max.   : 0.2502                     Max.   : 0.5370            
                                                                                                     
 f_body_accelerometer_mean_y f_body_accelerometer_mean_z f_body_accelerometer_std_x f_body_accelerometer_std_y
 Min.   :-0.98903            Min.   :-0.9895             Min.   :-0.9966            Min.   :-0.99068          
 1st Qu.:-0.95361            1st Qu.:-0.9619             1st Qu.:-0.9820            1st Qu.:-0.94042          
 Median :-0.59498            Median :-0.7236             Median :-0.7470            Median :-0.51338          
 Mean   :-0.48873            Mean   :-0.6297             Mean   :-0.5522            Mean   :-0.48148          
 3rd Qu.:-0.06341            3rd Qu.:-0.3183             3rd Qu.:-0.1966            3rd Qu.:-0.07913          
 Max.   : 0.52419            Max.   : 0.2807             Max.   : 0.6585            Max.   : 0.56019          
                                                                                                              
 f_body_accelerometer_std_z f_body_accelerometer_meanfreq_x f_body_accelerometer_meanfreq_y
 Min.   :-0.9872            Min.   :-0.63591                Min.   :-0.379518              
 1st Qu.:-0.9459            1st Qu.:-0.39165                1st Qu.:-0.081314              
 Median :-0.6441            Median :-0.25731                Median : 0.007855              
 Mean   :-0.5824            Mean   :-0.23227                Mean   : 0.011529              
 3rd Qu.:-0.2655            3rd Qu.:-0.06105                3rd Qu.: 0.086281              
 Max.   : 0.6871            Max.   : 0.15912                Max.   : 0.466528              
                                                                                           
 f_body_accelerometer_meanfreq_z f_body_accelerometer_jerk_mean_x f_body_accelerometer_jerk_mean_y
 Min.   :-0.52011                Min.   :-0.9946                  Min.   :-0.9894                 
 1st Qu.:-0.03629                1st Qu.:-0.9828                  1st Qu.:-0.9725                 
 Median : 0.06582                Median :-0.8126                  Median :-0.7817                 
 Mean   : 0.04372                Mean   :-0.6139                  Mean   :-0.5882                 
 3rd Qu.: 0.17542                3rd Qu.:-0.2820                  3rd Qu.:-0.1963                 
 Max.   : 0.40253                Max.   : 0.4743                  Max.   : 0.2767                 
                                                                                                  
 f_body_accelerometer_jerk_mean_z f_body_accelerometer_jerk_std_x f_body_accelerometer_jerk_std_y
 Min.   :-0.9920                  Min.   :-0.9951                 Min.   :-0.9905                
 1st Qu.:-0.9796                  1st Qu.:-0.9847                 1st Qu.:-0.9737                
 Median :-0.8707                  Median :-0.8254                 Median :-0.7852                
 Mean   :-0.7144                  Mean   :-0.6121                 Mean   :-0.5707                
 3rd Qu.:-0.4697                  3rd Qu.:-0.2475                 3rd Qu.:-0.1685                
 Max.   : 0.1578                  Max.   : 0.4768                 Max.   : 0.3498                
                                                                                                 
 f_body_accelerometer_jerk_std_z f_body_accelerometer_jerk_meanfreq_x f_body_accelerometer_jerk_meanfreq_y
 Min.   :-0.993108               Min.   :-0.57604                     Min.   :-0.60197                    
 1st Qu.:-0.983747               1st Qu.:-0.28966                     1st Qu.:-0.39751                    
 Median :-0.895121               Median :-0.06091                     Median :-0.23209                    
 Mean   :-0.756489               Mean   :-0.06910                     Mean   :-0.22810                    
 3rd Qu.:-0.543787               3rd Qu.: 0.17660                     3rd Qu.:-0.04721                    
 Max.   :-0.006236               Max.   : 0.33145                     Max.   : 0.19568                    
                                                                                                          
 f_body_accelerometer_jerk_meanfreq_z f_body_gyroscope_mean_x f_body_gyroscope_mean_y f_body_gyroscope_mean_z
 Min.   :-0.62756                     Min.   :-0.9931         Min.   :-0.9940         Min.   :-0.9860        
 1st Qu.:-0.30867                     1st Qu.:-0.9697         1st Qu.:-0.9700         1st Qu.:-0.9624        
 Median :-0.09187                     Median :-0.7300         Median :-0.8141         Median :-0.7909        
 Mean   :-0.13760                     Mean   :-0.6367         Mean   :-0.6767         Mean   :-0.6044        
 3rd Qu.: 0.03858                     3rd Qu.:-0.3387         3rd Qu.:-0.4458         3rd Qu.:-0.2635        
 Max.   : 0.23011                     Max.   : 0.4750         Max.   : 0.3288         Max.   : 0.4924        
                                                                                                             
 f_body_gyroscope_std_x f_body_gyroscope_std_y f_body_gyroscope_std_z f_body_gyroscope_meanfreq_x
 Min.   :-0.9947        Min.   :-0.9944        Min.   :-0.9867        Min.   :-0.395770          
 1st Qu.:-0.9750        1st Qu.:-0.9602        1st Qu.:-0.9643        1st Qu.:-0.213363          
 Median :-0.8086        Median :-0.7964        Median :-0.8224        Median :-0.115527          
 Mean   :-0.7110        Mean   :-0.6454        Mean   :-0.6577        Mean   :-0.104551          
 3rd Qu.:-0.4813        3rd Qu.:-0.4154        3rd Qu.:-0.3916        3rd Qu.: 0.002655          
 Max.   : 0.1966        Max.   : 0.6462        Max.   : 0.5225        Max.   : 0.249209          
                                                                                                 
 f_body_gyroscope_meanfreq_y f_body_gyroscope_meanfreq_z f_body_accelerometer_magnitude_mean
 Min.   :-0.66681            Min.   :-0.50749            Min.   :-0.9868                    
 1st Qu.:-0.29433            1st Qu.:-0.15481            1st Qu.:-0.9560                    
 Median :-0.15794            Median :-0.05081            Median :-0.6703                    
 Mean   :-0.16741            Mean   :-0.05718            Mean   :-0.5365                    
 3rd Qu.:-0.04269            3rd Qu.: 0.04152            3rd Qu.:-0.1622                    
 Max.   : 0.27314            Max.   : 0.37707            Max.   : 0.5866                    
                                                                                            
 f_body_accelerometer_magnitude_std f_body_accelerometer_magnitude_meanfreq f_body_accelerometer_jerk_magnitude_mean
 Min.   :-0.9876                    Min.   :-0.31234                        Min.   :-0.9940                         
 1st Qu.:-0.9452                    1st Qu.:-0.01475                        1st Qu.:-0.9770                         
 Median :-0.6513                    Median : 0.08132                        Median :-0.7940                         
 Mean   :-0.6210                    Mean   : 0.07613                        Mean   :-0.5756                         
 3rd Qu.:-0.3654                    3rd Qu.: 0.17436                        3rd Qu.:-0.1872                         
 Max.   : 0.1787                    Max.   : 0.43585                        Max.   : 0.5384                         
                                                                                                                    
 f_body_accelerometer_jerk_magnitude_std f_body_accelerometer_jerk_magnitude_meanfreq f_body_gyroscope_magnitude_mean
 Min.   :-0.9944                         Min.   :-0.12521                             Min.   :-0.9865                
 1st Qu.:-0.9752                         1st Qu.: 0.04527                             1st Qu.:-0.9616                
 Median :-0.8126                         Median : 0.17198                             Median :-0.7657                
 Mean   :-0.5992                         Mean   : 0.16255                             Mean   :-0.6671                
 3rd Qu.:-0.2668                         3rd Qu.: 0.27593                             3rd Qu.:-0.4087                
 Max.   : 0.3163                         Max.   : 0.48809                             Max.   : 0.2040                
                                                                                                                     
 f_body_gyroscope_magnitude_std f_body_gyroscope_magnitude_meanfreq f_body_gyroscope_jerk_magnitude_mean
 Min.   :-0.9815                Min.   :-0.45664                    Min.   :-0.9976                     
 1st Qu.:-0.9488                1st Qu.:-0.16951                    1st Qu.:-0.9813                     
 Median :-0.7727                Median :-0.05352                    Median :-0.8779                     
 Mean   :-0.6723                Mean   :-0.03603                    Mean   :-0.7564                     
 3rd Qu.:-0.4277                3rd Qu.: 0.08228                    3rd Qu.:-0.5831                     
 Max.   : 0.2367                Max.   : 0.40952                    Max.   : 0.1466                     
                                                                                                        
 f_body_gyroscope_jerk_magnitude_std f_body_gyroscope_jerk_magnitude_meanfreq
 Min.   :-0.9976                     Min.   :-0.18292                        
 1st Qu.:-0.9802                     1st Qu.: 0.05423                        
 Median :-0.8941                     Median : 0.11156                        
 Mean   :-0.7715                     Mean   : 0.12592                        
 3rd Qu.:-0.6081                     3rd Qu.: 0.20805                        
 Max.   : 0.2878                     Max.   : 0.42630                        

