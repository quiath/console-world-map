
function gety(py){return int(-sin(py/90*3.1415927/2)*H/2+H/2);}
function getx(px,py){return int(sin((x+t)/90*3.1415927/2)*W/4*cos(py/90*3.1415927/2)+W/2);}
function globe(t,w,nw) {
  
  #system("tput clear");
  #system("tput cup 0 0");
  printf("\033[1;1H");
  #system("tput setaf 2");
  printf("\033[92;40m"); # bgreen on black
  split("", wm);

  i=1;
  st=1;
  while(i<=nw) {
   if (st) {
     st=0;
     py=0+w[i];
     px=0+w[i+1];
     #on=1;
     i+=2;
   } else {
     st=1;
     s=w[i];
     slen=length(s);
     j=1;
     while(j<=slen){ 
      tok=substr(s,j,1);
      if("h"<=tok&&tok<="z"){j++}else{tok=substr(s,j,2);j+=2}
      len=dec[tok];
      t1=substr(s,j,1);
      t2=substr(s,j+1,1);
      if(t1=="."){currc=lastc;j++}
      else if(t1 in dhex){
          if(t2 in dhex){j+=2;currc=lastc=dhex[t1 t2]}else{j++;currc=lastc=dhex[t1]}
      } else currc=0;
      
      if(D)print "debug",py,px,len,currc,lastc,tok,s
      
      if (currc>0) {
        for(x=px;x<px+len;++x){
          #wm[(75+wy)" "(180+wx)]=":";continue;
          
          shifted=(x+180+t)%360;
          if (shifted<90||shifted>270)continue;
          wy=gety(py);#int(-sin(py/90*3.1415927/2)*H/2+H/2);
          #wy=int(H-(py+LAT)/LAT2*H);
          wx=getx(px,py);#int(sin((x+t)/90*3.1415927/2)*W/4*cos(py/90*3.1415927/2)+W/2);
          #wx=int(((x+180+t)%360)/360*W);
          #wm[wy" "wx]=(currc==C)?"\033[41mX\033[40m":":";
          wm[wy" "wx]=(currc==C)?"\033[91m:\033[92m":":";
          #print py, px, wy, wx;
        }
      }
      px+=len;
      #on=1-on;
     }
     i++;
     
   }
  }


  #n=split("KEF 64.0 -22.6 YQX 48.9 -54.6 YVR 49.2 -123.2 YYC 51.1 -114.0 YYZ 43.7 -79.6 LOS 6.6 3.3 TUN 36.9 10.2 BRU 50.9 4.5 FRA 50.0 8.6 DUS 51.3 6.8 MUC 48.4 11.8 TXL 52.6 13.3 HEL 60.3 25.0 MAN 53.4 -2.3 LGW 51.1 -0.2 LHR 51.5 -0.5 STN 51.9 0.2 AMS 52.3 4.8 DUB 53.4 -6.3 CPH 55.6 12.7 OSL 60.1 11.1 KRK 50.1 19.8 ARN 59.7 17.9 JNB -26.1 28.2 LAD -8.9 13.2 LPA 27.9 -15.4 CMN 33.4 -7.6 ADD 9.0 38.8 CAI 30.1 31.4 BCN 41.3 2.1 MAD 40.5 -3.6 CDG 49.0 2.5 ORY 48.7 2.4 CTA 37.5 15.1 MXP 45.6 8.7 FCO 41.8 12.2 MLA 35.9 14.5 VIE 48.1 16.6 LIS 38.8 -9.1 ZRH 47.5 8.5 AYT 36.9 30.8 MEX 19.4 -99.1 APW -13.8 -172.0 AKL -37.0 174.8 JED 21.7 39.2 RUH 25.0 46.7 DXB 25.3 55.4 GUM 13.5 144.8 TPE 25.1 121.2 NRT 35.8 140.4 CTS 42.8 141.7 FUK 33.6 130.5 HND 35.6 139.8 CJU 33.5 126.5 GMP 37.6 126.8 MNL 14.5 121.0 AEP -34.6 -58.4 USH -54.8 -68.3 BSB -15.9 -47.9 GIG -22.8 -43.3 GRU -23.4 -46.5 CGH -23.6 -46.7 SCL -33.4 -70.8 IPC -27.2 -109.4 BOG 4.7 -74.1 LIM -12.0 -77.1 MVD -34.8 -56.0 CCS 10.6 -67.0 VVO 43.4 132.1 IEV 50.4 30.5 LED 59.8 30.3 SVO 56.0 37.4 KZN 55.6 49.3 BOM 19.1 72.9 CMB 7.2 79.9 HKG 22.3 113.9 DEL 28.6 77.1 BLR 13.2 77.7 UPG -5.1 119.6 CGK -6.1 106.7 KUL 2.7 101.7 SIN 1.4 104.0 BNE -27.4 153.1 MEL -37.7 144.8 PER -31.9 116.0 SYD -33.9 151.2 PEK 40.1 116.6 CAN 23.4 113.3 SZX 22.6 113.8 KMG 25.1 102.9 XMN 24.5 118.1 HGH 30.2 120.4 SHA 31.2 121.3 CTU 30.6 103.9 PVG 31.1 121.8 BOS 42.4 -71.0 PHX 33.4 -112.0 SFO 37.6 -122.4 LAX 33.9 -118.4 EWR 40.7 -74.2 DCA 38.9 -77.0 FLL 26.1 -80.2 SLC 40.8 -112.0 IAH 30.0 -95.3 MIA 25.8 -80.3 SEA 47.4 -122.3 DTW 42.2 -83.4 TPA 28.0 -82.5 DFW 32.9 -97.0 ATL 33.6 -84.4 LGA 40.8 -73.9 IAD 38.9 -77.5 HNL 21.3 -157.9 SAN 32.7 -117.2 MDW 41.8 -87.8 DEN 39.9 -104.7 PHL 39.9 -75.2 ANC 61.2 -150.0 JFK 40.6 -73.8 ORD 42.0 -87.9 BWI 39.2 -76.7 MSP 44.9 -93.2 CLT 35.2 -80.9 LAS 36.1 -115.2 MCO 28.4 -81.3 BKK 13.7 100.7 ICN 37.5 126.5 ATH 37.9 23.9 EZE -34.8 -58.5 PMI 39.6 2.7 DRW -12.4 130.9 DME 55.4 37.9 NBO -1.3 36.9 DOH 25.3 51.6 HLE -16.0 -5.6 DSS 14.7 -17.1 IST 41.3 28.8",a);
    n=0;

  split("", m);
   
  for (i=1;i<=n;i += 3) {
    x=a[i+2];
    y=a[i+1];
    shifted=(x+180+t)%360;
    if (shifted<90||shifted>270)continue;
    py=gety(y);
    px=getx(x,y);

    #py=int(H-(a[i+1]+LAT)/LAT2*H);
    #px=int(((a[i+2]+180+t)%360)/360*W);
    m[py" "px]=a[i];
    #printf(" %s %d %d",a[i], py, px);
  }
  i=0;

#  while (i<W*H-1) {
#    x=i%W; y=int(i/W);
#    k=y" "x;
#    if(k in m) {
#      printf("%s", m[k]);
#      i+=3;
#    } else {
#      printf(" ");
#      i+=1;
#    }
#  }
  
  e="";
  while (i<W*H-1) {
    x=i%W; y=int(i/W);
    k=y" "x;
    if(k in m) {
      e=e "\033[37m" m[k] "\033[32m";
      i+=3;
    } else {
      if (k in wm) { e=e wm[k];} else { e=e" ";}
      i+=1;
    }
    #if(x==W-1)e=e"\n";
  }
  printf("%s", e);


}

BEGIN {
  N=N?N:360;

    for (i=0;i<20;++i){
        dec[sprintf("%c",i+97+6)]=i;
        for (j=0;j<20;++j) {
            dec[sprintf("%c%c",j+65+6,i+65+6)]=j*20+i;
        }
    }
    for(i=0;i<256;++i){
        dhex[sprintf("%x",i)]=i;
    }

  nw=split(" 75 -112 m1cmi.ij.ht.HHHY42JWl87HMHM.HLn.ik. 74 -124 o1cHIj.HVHW42JVk87HOHK. 73 -124 n1chi.mi.mi.il.ij.hk.hk.HHHT42JVk87th.qII.hl. 72 -125 l1ciq.hj.kk.mw.zHS42JVk87tk.ih.hk.hIN.rq. 71 -179 h87HHja8HRh1clt.ok.kx.zHN42hj.IMh77hi.HLj87qm.hIX.hHH.kh.HHh. 70 -162 HGa8ri1chi.px.ih.hl.mm.hr.tHS42IJm77i35i77HXl87hKM.rh. 69 -164 HKa8j1chz.km.ji.li.hk.hh.jk.lp.wHM42IJj77i35j77j35o87HKl.jk.iKU.ip. 68 -179 i87sHLa8HL1cnm.ki.hn.il.lh.io.sHH42IOh77n97m35r87ki.kHJ.hLL. 67 -179 m87qHJa8IZ1coq.qHG42INi77o97m35s87jh.iHL.iLL. 66 -178 p87iHNa8IU1csm.ik.px42ti4eil.HNi77p97n35k87mMZ. 65 -176 k87mHMa8IT1chj.ls.us42yp4eHLi77o97kk35l87ih.jMZ. 64 -160 HGa8IR1cjj.hi.on.ur42ym4eHMj77o97io35m87hNH. 63 -164 HKa8IQ1czk.hi.uo42IQk77n97jq35NO87 62 -165 HLa8IN1cth.hm.HJn42IOm77m97kp35MS87ir. 61 -165 ua8hq.IM1cxo.HHm42IOn77l97kn35MO87ji.ip. 60 -166 ha8hs.hj.mj.IL1cxo.kh.JQn77m97ki35lML87nk. 59 -162 pa8vk.IG1cwp.jj.JPk77hh.m97mk33LV87pi.mj. 58 -157 ja8HGi.IG1cvv.IXi3avl97oj33LT87xl. 57 -158 ia8ih.HGh.IJ1ctv.IVk3ari2cik97lm63LR87yn. 56 -160 ia8HMi.IJ1crw.IVi3asi2chh.i97nk61i63h14LP87yn. 55 -163 ha8HSIO1ckHG.IRh3ahk.qh2cih.oi87k61k14HY87i54JL87HGm. 54 -133 i1chIO.jHI.IOj4bki3apl2ahp80h61n14HQ87s54i87h54JH87hi.vl. 53 -129 IO1cjHJ.IMj4bil3akj76n2ap80o14HQ87x54II87l1fy87ti. 52 -127 IM1cjHJ.IMi4bin3aji76o2ap80n14ka6HM87z54IH87m1fx87ti. 51 -127 JP1chi.IRl3ahh38jdh76o2ah29o80sa6u87l54i87i54j87y54h87h54h87h54u87l6cx87o1ft87ih. 50 -128 j1chIY.pi.IWk38hdh62m2am29l80ua6q87HY54k87m6ci87q6cm87i6cj87p1ft87ii. 49 -125 i1chva8n1cma8HM1cii.ml.ISq38l2ak29l95xa6n87IH54HP6cu1fq87hi. 48 -124 ha8hHV.HI1cmn.IOs38l2akah48h95k48h86ia6i86h65ra6n87HZ54k1fHM6ci1fh6cs1fi87i1fl87ih. 47 -124 HZa8w1cia8k1cpi.IQp38j1diah50kal48m86i65oa6hq87HV54n1fHP6cv1fk87ji. 46 -123 IGa8t1cja8k1cii.IYo38i1dl50i96i46i48h93o86ia6jh.jr87lHP54o1fHM6cx1fk87 45 -123 IHa8o1cna8ij1cJHo38m50hi46j13h46i93o86kia6iq87kk54ka9HH54t1fy6ch1fh6cy1fl87lh53 44 -124 IIa8m1cna8ji1cJJp38h50hj.jh46j13j93k86h11h86ro87jl54ma9z54v1fw6cHG1fk87mk53 43 -124 IIa8k1coa8JHo32l38nj50kh13i6bh59h93l11tj3bk87kk54ra9n54i56l54w1fu6cHH1fhh87nk53 42 -124 IHa8i1csa8JGt32lh38ik50kh3i68k11ha2mi.ml3bi87ki9eh54ia9j9ema9k54ha9o56HK1fi6cHJ1fi82pi53 41 -124 ISa8JKi83n32oh50kk.ih3h68l41ha2iu.i6kbln9era9k56IP1fk82rh53 40 -124 IQa8JLi83o32oh50mh.jh3i41hh.iya2h6kbkp9ema9h9dl56IL1fij.j82si53 39 -123 IOa8JMi83n32xh50jj41jya2h4ch6i4chbkr9eja9m9dIK1foi82si53 38 -122 IMa8JOh83n32tk50lj41iya2l4ckj9eh4cp9eia9i9dh1j9dIK1fmi82i58rh53 37 -122 IMa8JOh83hl32ni2ehja1jh50mh41lta2i99i4dm4cjm.l9en1h9di1h7bIN1fkj58nk53 36 -121 IMa8JWo2eia1HMl99k4dw4ci9eo1l7bIK1fmj58ml53 35 -120 IKa8JQk64r2eia1ui41mh28im99l4du4cr1m7bh4aIH1fni58kn53 34 -118 IHa8JQm64p2eja1HLh5ck99l4dv4cp1k7bl4aII1fqk53hh. 33 -117 HYa8JRn64q2eja1HKj99o4du4cp1l7bl4aIH1fpi53hh. 32 -116 j67HTa8JRn64s2eha1l5ekl.qh4fj52h8ao4dt4cp1l7bk4aIJ1fph53 31 -116 i67ho.HKa8JSm64t2eha1n5ejk.k30hi.hi.h4fi52l8al4du4cl1o7bl4aII1f 30 -115 h67io.va8kh.hi.JSk64v2ev5eq30h4fi52m8al4dir4cl1n7bn4ai78HZ1f 29 -114 h67hs.la8ti.JQi64y2ev5eq30t8ah5air4cr7bo4ak78q1fi4aHL1f 28 -114 i67hs.ja8ui.JOk64y2ev5eq30ht8ajr4cp7bq4al78j1fi19h1fl4ah6aHJ1f 27 -114 i67ir.ia8vi.JNk64h89y2ev5ep30iu8aki4chn.m7bv4ak78h4aj19j4aj6aHI1f 26 -112 h67ir.ha8wh.JMi64k89i6ew2ev5eq30iu8ank4cp7by4ah10m4aj6aHH1f 25 -112 i67ir.zh12JJi64h89n6eu2ev5eq30jt8ah85ji4qk7by4ak10i4aj6aHI1f 24 -110 h67iq.KIi64i89l6ej69v2et5er30jt8ak4i7aqh7bHG4aj10j4aj6aHG1fjha3 23 -110 h67jp.uj26JKi64h89n6el69t2ei73i5eh9ao5er30ju8aj4k7aqz4ak10h4am6al1fhabr1fkha3 22 -105 o67th26jj.JHi64h89n6em69q2el73k9am5es8bjw8ak7aqHG4ah10hh.n6ai1fh5bkabn1f 21 -105 o67nk.oj26IYr6eo69m2eo73l9ak5et8biw8aj7ash4ahv.lo6aj5bkabih1f 20 -105 p67mj.qj26IYr6eo69k2ep73n9ah5eu8bju8aj7avu4amn6ah9ck5biabjh1f 19 -104 o67lk.vh47i2dITr6eq69r73o9au8bkq8ahael7avs4apk6ak9cj5bhabji1f 18 -102 u67rh51pi81IPr6eq69r73o9av8bjn8akaek7axq4arj6al9ch5bh9ch5bhabui7e 17 -100 p67i43h15JSr6eq69r73o9at8bi31kh8ajaeh8alaei7azp4ask6am9ci5bhabti7e 16 -97 i67hj.i43h15ih45JPj8do6ep69r73p9at8bj31jqaeHHn4auh6aih.n9ci5bhabri7e 15 -92 j43m45JMl8dh6et69s73p9au8bk31ioaeHKm4axh6an9ci5bhabsh7e 14 -91 i43h90j45i75JNk8dq69jft73p9au8bk34h31ilaeHMm4ayk9cj57h5bh57iabrj7e 13 -87 k75JNl8dn69mfi73l74h73k74h73o9au8bl34h31hiaeHPm4ayh6aj9cl57iabrh7eih. 12 -86 j75rh24hhaaITj3fj3dh69h3dk69nfher74o9aq8bh8ci8bm34i2bnh92HKk4azh6ajk57jabvh7e 11 -85 i75oj24kaaITn3dj69lfh3cjeq74h21o9aq8bh8ch8bo34h91kh.j92HKk4azh6akj57iabth7ehi. 10 -85 i25oj24qaaIOm3dk20ifj3ch9bieq74i21m9ai1bh8bi8cj8bh8ch8bi8ch8bo34m91i92HMj4azh9cliabsh7ejh. 9 -83 h25ij7chk24saaINj8fj3dl20j3ch9bheq74i21k9al1bh8bp8cr34k91i92HMi4ahi5fxh9clhabsh7enh. 8 -81 h7cih.l24saah44IMj8fh5dh3dm20j3ch9bheq74j21j9am1bp8ct34h91j92HPi5fxi9cHIk7e 7 -77 n24qaai44INj5dl20k3ch9bhep74k21q1bp8cs34j92HQi5fyh9cHKi7e 6 -77 q24maak44ih94IKj5dk20l3cjl74l21s1bp8cq34j92ISi70uh.nh7e 5 -77 q24naah17i44j94i38IJi5di20ih.h3cnj74m21r1bi22n8ch55p34k92INi49jj70rh18j70 4 -77 q24jaah17haaj17h44k94j38JGn21j1bs22j8cha5j55j34h55m92IPi49ij70qi.i49 3 -77 q24jaal17i44j94i38i17JGm21h1bi23s22ka5n55l92IRi49ii70pj.i49 2 -78 r24kaak17j44h94l17JGi40i39k23t22ka5m55l92ITj49hi70nj.j49 1 -79 h2fp24j17haaw17IZl39j23t22ka5m55k92IUk49nh.h70n49ih.mh. 0 -80 l2fl24HG17JGk39k23s22ka5n55i92IXk49mo.ih.nh. -1 -80 l2fh7dl24HJ17IVm39j23s22ja5ha4o55h92IYj49mo.ih.hh.ok. -2 -80 k2fj7dk24HL17IUl39i23t22h88la4m55IZk49mm.ji.ri.ij. -3 -80 j2fn7dh24HQ17IQh39k23u22hcna4j55JHl49km.ik.mi.ii.hm.h7f -4 -81 h7di2fo7dh24HR17IQk23u22hcoa4h55JJj49ph.kh.hh.qh.hn.j7foh. -5 -81 p7dHW17IOh2x22qa4JKi49uh.ih.uk.k7fmh. -6 -81 o7dHY17IOk2t22pa4JNi49HRj.m7fhi.kh. -7 -79 m7dHZ17INk2u22pa4JNm49HMj.m7fph8e -8 -79 m7dHZ17IOk2h22j2p22pa4JRk49HJk.i7fij.qh8e -9 -78 l7dHY17IOp2n22kb0na4JXh49nh.h9fuh49i7fji.sh8e -10 -78 m7dh17h7dk17h16HQ17IPp2m22lb0h6fla4KGh49jh.HJj7f -11 -77 n7di17j16HO17IRq2hb0k22lb0h6fla4h6d -12 -77 p7dk16HN17IRr2jb0h22lb0h6fm6dKSi9hh.li. -13 -76 o7dm16HK17IRp2nb0h22jb0i6fm6doh66KHm9li. -14 -76 o7do16HI17IRp2sb0i6fl6dnj66JWh9im.mi. -15 -75 m7dp16HI17IRp2pb0k6dh6fl6dnj66JUr9mk.HHhac -16 -74 l7dp16HI17IQq2ob0ib1j6dh6fl6dlk66JVt9kk. -17 -72 j7dr16z17IRh2h71p2lb0lb1m6dml66JTw9jk. -18 -70 h7ds16y17IRr71h1ah71h1anb1k6dol66JTHK9HRh36 -19 -70 i1er16y17ISo71m1amb1j6dpl66JSHL9 -20 -70 i1en16j84h16x17ITo71m1amb1i6dqk66JRHP9 -21 -70 i1em16l84x17IUn71n1alb1j6dol66JOHT9vh72 -22 -70 i1ei16h5j16l84w17IWl71q1aib1k6dol66JMHV9wh72 -23 -70 k1el5m84s17IYl71o1akafk6dok66JMHX9 -24 -70 j1en5m84o17JHl71n1alafk6dok66JMHY9 -25 -70 i1eq5k84n17JIl71hafl1amafi6dri66JNHZ9 -26 -70 i1er5j84h5l17JJl71hafi1aoafh98h6dKHIG9 -27 -70 i1eq5j84i5l17JKk71rafh98hafKHIG9 -28 -71 i1eu5n17JKk71tafKIHZ9 -29 -71 i1et5n17JMrafi60iafKJHZ9 -30 -71 i1es5n17JOqafh60iafKKHZ9 -31 -71 h1et5ia7l17JOtafKLHY9 -32 -71 h1es5la7i17JQrafKMt9kHG. -33 -71 h1es5la7h17JRpafKOp9qx. -34 -71 i1er5la7JSkafKTk9wh.hu. -35 -72 i1et5OUi9HGs.HIh79 -36 -72 i1et5PXr9HJh79 -37 -73 i1ev5PWq9HLh79 -38 -73 j1et5PYk9hi.HNk79 -39 -73 i1ep5RXk79 -40 -73 i1ep5RXi79 -41 -73 i1em5hi.QNh9hi.HKk79 -42 -74 j1en5QQj9HJj79 -43 -74 h1ehh.n5QQi9HJj79 -44 -73 i1em5RUk79 -45 -74 j1em5RTk79 -46 -74 j1ek5RUk79 -47 -74 j1el5 -48 -75 j1en5 -49 -75 j1el5MWi8 -50 -75 i1el5 -51 -75 j1ej5 -52 -75 k1ej5nh37hh. -53 -73 l1e -54 -73 l1eh5 -55 -71 k1ehh5 -64 -60 i7 -65 -63 h7 -66 -65 j7LVk.IMi.ph.HGh. -67 -67 j7LVo.HPi.rx.kHK. -68 -67 i7LRHJ.sJN. -69 -68 l7KXi.lHP.pJX. -70 -71 i7hm.JQh.lh.ik.pHZ.lKM. -71 -71 j7hm.JKJM.kKW. -72 -102 k7hh.HIm.hm.IQKG.jLG. -73 -103 l7ph.HGo.IMPL. -74 -121 i7lh.rIH.IMPJ. -75 -139 HR7ji.jHX.IMPJ.",w);
  for (t=0;t<N;++t) {
  #for (t=0;t<1;++t) {
    globe(t,w,nw);
    system("sleep 0.1");
  }
  
}
