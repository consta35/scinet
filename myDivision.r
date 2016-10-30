### Question 1a
divisible.by<- function (x,y) {
	if(x%%y<=0) { # if x divided by y equals 0
	print (TRUE) # 'TRUE' is printed
	} 
	else{print(FALSE)} # if x divided by y does not equal 0, False is printed
}

### Question 1b
divisible.within.range<- function(x,y,z) {
	for (i in (x:y)){ # for every value in the range of x and y
		if (i%%z==0){ #if that value divided by z equals zero
		print(as.list(c(i)))} # that value will be printed in a list
		}
		}