function abs(x){if(x<0)return -x;return x}
function max(x,y){return(x>y)?x:y;}
function min(x,y){return(x<y)?x:y;}
function hitsegup(x0,y0,x1,y1,x2,y2){
if(x1>x2)return hitsegup_impl(x0,y0,x2,y2,x1,y1);
return hitsegup_impl(x0,y0,x1,y1,x2,y2);
}
function hitsegup_impl(x0,y0,x1,y1,x2,y2,    yc){
#print "h",x0,y0,x1,y1,x2,y2
if(abs(x1-x2)<0.000001){if(x1<=x&&x<x2&&max(y1,y2)<y0)return 1;return 0};
if(x1>x0||x2<=x0){return 0;}
#b=y1-(y2-y1)*x1/(x2-x1);
yc=y1+(y2-y1)/(x2-x1)*(x0-x1);
#print(x0, y0, yc, (yc<y0));
if(yc<y0)return 1;
return 0;
}
BEGIN {pc=1}
/name :/ { name=$3 $4 $5 $6;++nc;c[nc]=name}
/type :.*Polygon/ { type=$3; if(verbose)print name,type;st=0}
/^ *$/ {if(st>0){++st;if(st==3){if(verbose)print "----";last[pc]=pp;++pc}}} 
/^[-]*[0-9]/ {if(verbose)print $1 "," $2;st=1;++pp;if(pc in first){}else{first[pc]=pp; polyname[pc]=name; bmaxx[pc]=0+$1;bminx[pc]=0+$1; bmaxy[pc]=0+$2;bminy[pc]=0+$2;  }
	px[pp]=0+$1;py[pp]=0+$2;   bmaxx[pc]=max(0+$1,bmaxx[pc]);bminx[pc]=min(0+$1,bminx[pc]); bmaxy[pc]=max(0+$2,bmaxy[pc]);bminy[pc]=min(0+$2,bminy[pc]);}
END{
	
	
	for (y=75;y>=-75;y--){
	#for (y=60;y>=60;y--){
	for (x=-179;x<=180;x++){
	#for (x=-179+59;x<=-179+59;x++){
	s=".";
	for (i in first) {
	
		if(x<bminx[i]||x>bmaxx[i]||y<bminy[i]||y>bmaxy[i])continue;
	
		n=last[i]-first[i]+1;
		fi=first[i];
		cnt=0;
		for(k=0;k<n;++k){
		  m=(k+1)%n;
		  cnt+=hitsegup(x,y,px[fi+k],py[fi+k],px[fi+m],py[fi+m]);
		}
		if(cnt%2==1){
			#print("poly id", i, first[i], last[i], polyname[i], cnt);	
			s=substr(polyname[i],1,1);
			break;
		}
	}
	if (gen_points) {if(s!=".")print y,x}
	else printf("%s", s);
	}
	printf("\n");
	}
}
