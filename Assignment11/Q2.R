x <- c(3.24,4.39,5.24,3.83,3.50,3.75,4.06,3.83,3.54,3.20,4.28,3.65,3.01,4.69,3.32)
mu <- 3.5
mux <- mean(x)
sigmax <- sd(x)/sqrt(length(x))
t <- (mux-mu)/sigmax
t
n=10000
arr <- seq(0, t, length=n)
fvalue <- numeric()
fsum=0
i=0
df=14
for(xval in arr){
  fsum=fsum+(3-(-1)^i)*(gamma((df+1)/2)/(sqrt(pi*df)*gamma(df/2)*(1+xval^2/df)^((df+1)/2)))
  fvalue[i+1]=gamma((df+1)/2)/(sqrt(pi*df)*gamma(df/2)*(1+xval^2/df)^((df+1)/2))
  i=i+1
}
fsum
fsum*((arr[2]-arr[1])/3)
rs=fsum*((arr[2]-arr[1])/3)
r=rs*2
r1=1-r
p=r1/2
p
plot(arr, fvalue)
