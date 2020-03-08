BEGIN {py=1111} 

function pr(len) {
  if (len>=100) {printf("S%d",len)}
  else if (len>=10) {printf("T%d",len)}
  else printf("%d",len);
}

$1 >=-75 && $1 <= 75 { 
  y=$1+0;x=$2+0; 
  # print "in",y,x
  if(py==1111||y!=py){
    if(len){pr(len)}
    printf(" %d %d ",y,x);
    py=y;px=x;len=1
  } else {
      if(x==px+len){
        ++len;
      }else{
        pr(len); 
        pr(x-(px+len));
        px=x; len=1; 
      }
  }
}
END{
  if(len){pr(len);}
} 
