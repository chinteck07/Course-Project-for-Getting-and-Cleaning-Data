#Data Set Information:

 
| Column | Column Name     		|  Description 																																								  |
|--------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  1	 | subject				| ID assigned to 30 volunteers within an age bracket of 19-48 years																											  |
|  2	 | activity				| 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)																					  |

##For column 3-68, explanation as below:
* **Accelerometer (Acc)** and **gyroscope(Gyro)** 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz in standard gravity units **'g'**.
* Similarly, the **acceleration** signal was then separated into **body** and **gravity acceleration** signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).The units are **radians/second**.  Also, the **magnitude(Mag)** of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
* The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
* While tBodyAcc-mean()-XYZ or tBodyAcc-std()-XYZ is referring to the **average (mean)** or **standard deviation** (std) for the respective measurements.
 

###Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


