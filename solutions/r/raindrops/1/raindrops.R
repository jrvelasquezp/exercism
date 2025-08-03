raindrops <- function(number) {
  text<-NULL
  c1<-"Pling"
  c2<-"Plang"
  c3<-"Plong"
  if(number<3){
    text<-as.character(number)
  } else if(number%%3==0 | number%%5==0 | number%%7==0) {
    if (number%%3==0) {
      text<-paste(text,c1,sep="")
    }
    if (number%%5==0) {
      text<-paste(text,c2,sep="")
    } 
    if (number%%7==0) {
      text<-paste(text,c3,sep="")
    }
  } else {
   text<-as.character(number)
  }
  print(text)
}
