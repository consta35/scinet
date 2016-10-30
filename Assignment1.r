

### Question 2a		
### Download data 
data<-read.table("http://www.biostatisticien.eu/springeR/Weight_birth.csv", header=TRUE, sep= "\t")

### Question 2b
## Create an empty vector that will act as a place holder for the birth weights that correspond to the smoking/or non smoking mothers
NSWeights<- rep(NA, nrow(data) )
SWeights<- rep(NA, nrow(data) )

## Pull out the Birth Weights from the mothers that didn't smoke and put the weights in their vector (NSWeights)

	for (i in 1:nrow(data)) {
	if(data$SMOKE[i]<=0){
	NSWeights[i]<-data$BWT[i]
	}
}

## Pull out the Birth Weights from the mothers that smoked and put the weights in their vector (SWeights)
for (i in 1:nrow(data)) {
	if(data$SMOKE[i]>=1){
	SWeights[i]<-data$BWT[i]
	}
}

## Find the mean of the weights in each category
NS<-mean(NSWeights, na.rm=TRUE) 
S<-mean(SWeights, na.rm=TRUE) 

## Print the findings
cat('The mean weight of children born to smoking mothers is', S, 'grams. The mean weight of children born to non-smoking mothers is', NS, 'grams. \n') 

### Question 2c
## Create an empty vector that will act as a place holder for the birth weights that correspond to the mothers with previous pre term labour and without
PTLWeights<- rep(NA, nrow(data) )
NptlWeights<- rep(NA, nrow(data) )

## Pull out the birth weights from the mothers that never had pre-term labour and put the weights in their vector (NptlWeights)
	for (i in 1:nrow(data)) {
	if(data$PTL[i]<=0){
	NptlWeights[i]<-data$BWT[i]
	}
}

## Pull out the birth weights from the mothers that have had pre-term labour and put the weights in their vector (PTLWeights)
	for (i in 1:nrow(data)) {
	if(data$PTL[i]>=1){
	PTLWeights[i]<-data$BWT[i]
	}
}

## Find standard deviation of the weights in each category
SD_PTL<- sd(PTLWeights, na.rm=TRUE)
SD_np<-sd(NptlWeights, na.rm=TRUE)

##Print the findings
cat('The standard deviation of the birth weight of children born to  mothers of premature births is', SD_PTL, 'grams. The standard deviation of the birth weight of children born to  mothers of premature births is', SD_np, 'grams. \n') 

### Question 2d

#### Determine how many women smoke total
smoke<-which(data$SMOKE>=1)
lsmoke<-length(smoke)

#### Determine how many women smoke and had pre mature births
pre_smoke<-which(data$SMOKE>=1 & data$PTL>=1)
lpre_smoke<-length(pre_smoke)

#### Divide number of women who smoke and had pre mature births by the total number of women who smoke
ans<- lpre_smoke/lsmoke

### Print findings
cat('The fraction of smoking mothers which have previously had premature births is', ans, '\n') 

