BEGIN {py=1111;SPLIT=2000;} 

function div(s) {
  if (linelen + length(s) > SPLIT) {
    printf("\";\n");
    linelen = 0;
  }
  if (linelen == 0) {
    printf("Z%d=%c",lineno++,34);
  }
  linelen += length(s);
  printf("%s", s);
}

function divend(i) {
  if (linelen > 0) {
    printf("\";\n");
  }
  printf("Z=Z0");
  for(i=1;i<lineno;++i){
    printf(" Z%d",i);
  }
  printf(";\n");
}

function pr(len) {
  if (len>=100) {div(sprintf("S%d",len))}
  else if (len>=10) {div(sprintf("T%d",len))}
  else div(sprintf("%d",len));
}

$1 >=-75 && $1 <= 75 { 
  y=$1+0;x=$2+0; 
  # print "in",y,x
  if(py==1111||y!=py){
    if(len){pr(len)}
    div(sprintf(" %d %d ",y,x));
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
  divend();
} 
