BEGIN {
    D=0;
    py=1111;
    for (i=0;i<20;++i){
        encs[i]=sprintf("%c",i+97+6);
        for (j=0;j<20;++j) {
            encd[j*20+i]=sprintf("%c%c",j+65+6,i+65+6);
        }
    }
    pr_cid=-1;
} 

# encoding
# ghijklmnopqrstuvwxyz
# 01234567890123456789
# GHIJKLMNOPQRSTUVWXYZ

# 1 16
# h10 
# 2 15
# i0f
# 20 1
# HG

# . same
# nothing water
# number

function pr(len,cid,reset,        s) {

    #if(len<20)printf("%s%02x",encs[len],cid);
    #else printf("%s%02x",encd[len],cid);
    
    s="";
    if(pr_cid==cid){s="."}
    else if(cid>0){s=sprintf("%x",cid);}
    

    if(len<20)printf("%s%s",encs[len],s);
    else printf("%s%s",encd[len],s);
    if (D){print "\ndebug",len,cid,pr_cid;} 
    
    if (reset) {
        pr_cid=-1;
    } else if (cid>0) {
        pr_cid=cid;
    }
   
}

/^[ ]*$/ {next}

$1 >=-75 && $1 <= 75 { 
  y=$1+0;x=$2+0; 
  if(D)print "in",$0
  
  if(py==1111||y!=py){
    if(len){pr(len,cid,1)}
    printf(" %d %d ",y,x);
    py=y;px=x;len=1;cid=0+$3;cc=$4;cn=$5; 
  } else {
      
      
          if($3==cid&&x==px+len){
            ++len;
          }else{
            pr(len,cid); 
            if(x-(px+len))pr(x-(px+len),0);
            px=x; len=1;cid=0+$3;cc=$4;cn=$5; 
          }
      
  }
}
END{
  if(len){pr(len,cid);}
  printf("\n")
} 
