awk -v W=`tput cols` -v H=`tput lines` 'function gety(py){return int(-sin(py/90*3.1415927/2)*H/2+H/2);} function getx(px,py){return int(sin((x+t)/90*3.1415927/2)*W/4*cos(py/90*3.1415927/2)+W/2);} function globe(t,w,nw){system("tput cup 0 0"); system("tput setaf 2");split("", wm);i=1; st=1; while(i<=nw){ if(st){ st=0; py=0+w[i]; px=0+w[i+1]; on=1; i+=2; } else{ st=1; s=w[i]; slen=length(s); j=1; while(j<=slen){ tok=substr(s,j,1); if(tok=="S"){len=0+substr(s,j+1,3); j+=4;} else if(tok=="T"){len=0+substr(s,j+1,2); j+=3;} else{len=0+tok;j++;} if(on){ for(x=px;x<px+len;++x){ shifted=(x+180+t)%360; if(shifted<90||shifted>270)continue; wy=gety(py);wx=getx(px,py);wm[wy " " wx] = ":";}}px+=len;on=1-on;}i++;}}n=split("KEF 64.0 -22.6 YQX 48.9 -54.6 YVR 49.2 -123.2 YYC 51.1 -114.0 YYZ 43.7 -79.6 LOS 6.6 3.3 TUN 36.9 10.2 BRU 50.9 4.5 FRA 50.0 8.6 DUS 51.3 6.8 MUC 48.4 11.8 TXL 52.6 13.3 HEL 60.3 25.0 MAN 53.4 -2.3 LGW 51.1 -0.2 LHR 51.5 -0.5 STN 51.9 0.2 AMS 52.3 4.8 DUB 53.4 -6.3 CPH 55.6 12.7 OSL 60.1 11.1 KRK 50.1 19.8 ARN 59.7 17.9 JNB -26.1 28.2 LAD -8.9 13.2 LPA 27.9 -15.4 CMN 33.4 -7.6 ADD 9.0 38.8 CAI 30.1 31.4 BCN 41.3 2.1 MAD 40.5 -3.6 CDG 49.0 2.5 ORY 48.7 2.4 CTA 37.5 15.1 MXP 45.6 8.7 FCO 41.8 12.2 MLA 35.9 14.5 VIE 48.1 16.6 LIS 38.8 -9.1 ZRH 47.5 8.5 AYT 36.9 30.8 MEX 19.4 -99.1 APW -13.8 -172.0 AKL -37.0 174.8 JED 21.7 39.2 RUH 25.0 46.7 DXB 25.3 55.4 GUM 13.5 144.8 TPE 25.1 121.2 NRT 35.8 140.4 CTS 42.8 141.7 FUK 33.6 130.5 HND 35.6 139.8 CJU 33.5 126.5 GMP 37.6 126.8 MNL 14.5 121.0 AEP -34.6 -58.4 USH -54.8 -68.3 BSB -15.9 -47.9 GIG -22.8 -43.3 GRU -23.4 -46.5 CGH -23.6 -46.7 SCL -33.4 -70.8 IPC -27.2 -109.4 BOG 4.7 -74.1 LIM -12.0 -77.1 MVD -34.8 -56.0 CCS 10.6 -67.0 VVO 43.4 132.1 IEV 50.4 30.5 LED 59.8 30.3 SVO 56.0 37.4 KZN 55.6 49.3 BOM 19.1 72.9 CMB 7.2 79.9 HKG 22.3 113.9 DEL 28.6 77.1 BLR 13.2 77.7 UPG -5.1 119.6 CGK -6.1 106.7 KUL 2.7 101.7 SIN 1.4 104.0 BNE -27.4 153.1 MEL -37.7 144.8 PER -31.9 116.0 SYD -33.9 151.2 PEK 40.1 116.6 CAN 23.4 113.3 SZX 22.6 113.8 KMG 25.1 102.9 XMN 24.5 118.1 HGH 30.2 120.4 SHA 31.2 121.3 CTU 30.6 103.9 PVG 31.1 121.8 BOS 42.4 -71.0 PHX 33.4 -112.0 SFO 37.6 -122.4 LAX 33.9 -118.4 EWR 40.7 -74.2 DCA 38.9 -77.0 FLL 26.1 -80.2 SLC 40.8 -112.0 IAH 30.0 -95.3 MIA 25.8 -80.3 SEA 47.4 -122.3 DTW 42.2 -83.4 TPA 28.0 -82.5 DFW 32.9 -97.0 ATL 33.6 -84.4 LGA 40.8 -73.9 IAD 38.9 -77.5 HNL 21.3 -157.9 SAN 32.7 -117.2 MDW 41.8 -87.8 DEN 39.9 -104.7 PHL 39.9 -75.2 ANC 61.2 -150.0 JFK 40.6 -73.8 ORD 42.0 -87.9 BWI 39.2 -76.7 MSP 44.9 -93.2 CLT 35.2 -80.9 LAS 36.1 -115.2 MCO 28.4 -81.3 BKK 13.7 100.7 ICN 37.5 126.5 ATH 37.9 23.9 EZE -34.8 -58.5 PMI 39.6 2.7 DRW -12.4 130.9 DME 55.4 37.9 NBO -1.3 36.9 DOH 25.3 51.6 HLE -16.0 -5.6 DSS 14.7 -17.1 IST 41.3 28.8",a);split("", m);for(i=1;i<=n;i += 3){ x=a[i+2]; y=a[i+1]; shifted=(x+180+t)%360; if(shifted<90||shifted>270)continue; py=gety(y); px=getx(x,y);m[py " " px] = a[i];} i=0;e=""; while(i<W*H-1){ x=i%W; y=int(i/W); k=y " " x; if(k in m){ e = e "\033[37m" m[k] "\033[32m"; i+=3; } else{ if(k in wm){ e = e ":" ;} else{ e = e " ";} i+=1; } } printf("%s", e);}BEGIN{N=N?N:360;nw=split("-75 -146 11113T3223111T32112T42212S1792 -74 -138 7131318141135T36111T442S1793 -73 -127 4121241914414141512151171T432S181111 -72 -103 861T1441351T464T78211T982 -71 -102 31111T201123251T4951313T65222T963 -70 -71 11342T5418T10124613T3711131T86513 -69 -71 11242T6815133T10326T27236T76212 -68 -70 12113T9525311T1716183T66216 -67 -67 112S10858416T1172T11T183T242 -66 -67 213S111341T292T1122117143T2014 -65 -65 211S1144T45381T211 -64 -63 6 -63 -59 3 -55 -71 115 -54 -72 224 -53 -73 412 -52 -74 21472 -51 -75 2113165 -50 -75 11222 -49 -73 151S134111 -48 -75 1214111S1322 -47 -75 12152 -46 -75 22131S2324 -45 -74 12133S230221 -44 -74 21151S232121 -43 -74 21151S2102T20312 -42 -73 362S207112T22111 -41 -74 18112S205111T24114 -40 -71 16111S205212T23212 -39 -73 11181S2071T26212 -38 -73 112721111S1968T26131 -37 -73 111S20915122T245 -36 -71 2T131S1941T101T223 -35 -72 111T121S1723T174T101T222 -34 -69 1T106T704T9312221T124T121T202 -33 -71 3T10142T69136T8713694T131 -32 -71 1T12142T68291T86184411121T141 -31 -70 1T1212121T681T111T841T12212T191 -30 -71 111T11341T6619211T832T371 -29 -70 1T201T6527213T831T371 -28 -71 111T12171T632118131T811T381 -27 -70 2T10551T621T152T811T381 -26 -68 1T13241T6115373T802T381 -25 -70 1T1212151T611511453T103T662T371 -24 -68 261112262T6424241227221T651T372 -23 -70 1914282T571T12131317131T651T361 -22 -67 2111143T11111T541T134317131T652T342T152 -21 -70 1111122T211T5215271312171T702T331T143 -20 -68 15132T161T521T13141118231T673T291T152 -19 -70 11165T171T501T13151128141T693T252 -18 -70 3T101T171T491821111612271T762T231T302 -17 -71 111T102T171T4921131211541424151T722T15251T302 -16 -180 2S1051417111T68372512212323142T722T1222131T211T103 -15 -75 15181T211T481T17322414222T731T1123131T202 -14 -76 16271T711T17123416211T745515113T202 -13 -76 17153T211T491T15224T11211T75212424111 -12 -77 18132T251T491711223235172T803134111 -11 -70 11121T271T491874611T90643 -10 -78 1521311T77183314242T79122T17144T102 -9 -73 21132T291T46272513251T7652111T1524483 -8 -79 151T371T46231316561T706161494212111T102 -7 -79 151T381T451368181T661122111T231422183 -6 -81 261T381T45131318182T652111111T211317542 -5 -80 171T352T45321T12181T645T11212T1012131312422 -4 -81 463T311T484T13281T6212181112582119153 -3 -80 11261T311T48132T1226112T6113144112211261211611163 -2 -80 22124T2521111T47511T13291T59222424113721411211182 -1 -80 14331T20131T511311111T1232161T621425125622122 0 -80 2143222T14113T5323221T111325112T5522144582214 1 -78 181144542T571111311T1213281T531334621223112 2 -78 291223116T6011611T1128142T50122115111312181 3 -77 1912231112112T58254T1153211T5421311821111 4 -77 19123142121T4111313545131161343311231T471211121T10212 5 -77 19153111112T4211121143121514144718131T311T1411123T1211351 6 -77 155521211T432123125411121T10271T141T29111T174T13245 7 -81 212411193T45551111173237163T111T30131T163T206 8 -83 831T112T451244111119112214281T13211T25411T1611141T11145 9 -85 8121383T453111133148433121611914111T273T17243T1023212 10 -85 3712229T4512125111211926311311112751112T24121T18235T10215 11 -86 487T51421112135T10171936335T231T2223111229115 12 -87 221T11111T52216314351326292116442T22141T18541T12222 13 -91 711T6666311342571T1314314T25151T173113211T104 14 -92 21214T6514284T11181T13833T241T2223114T123 15 -97 22227T6613431449191T1512182T20161T132216112T10111 16 -99 222221111T6947172T101T20111323143T262T111135113T10211 17 -102 384T1024133T481T301T212274113T16182T101213212T14111 18 -155 1T5117513831T10T481T521316262T251T1012133121393 19 -156 3T48271512199T521T1749171T13121T1111121T141T1217141121324 20 -156 2T4917161227212T562T10152T1217111T10122T162T113T1324162221122 21 -159 4T50171741136T5721111T1916131T17111T182T121T1311311644581 22 -159 1T4822271T128T60112T111T141T10131213121T1513191T18651166342 23 -110 221T23321T60213T2111111T19121T131211282T191242261T11121 24 -112 32191T182T611215111T123T252T117T10221T1612431T19112 25 -112 5T101T15212T6212121T161T1518112T1223512111131T1742122T20111 26 -113 31193T1411112T626T171T24111T13214411152T1482121 27 -115 213T10111T14141T63132T161T233T12212315262911211112233T211 28 -114 4712132T12111T67311T161T224T11211T102917222241122T231 29 -115 47556311211T69212T141T1516111117114T107616121T103T242 30 -116 562T14621T753T1127331312111319211T10141714112T381 31 -116 112111212T231T71151T11242214912112251T122444131T42182 32 -117 113T321T70162861144T1032171T121814222T4117212 33 -118 2T372T692517122T2321162T131823131T4118214 34 -120 3T402T691417211T13171134131T14181111411T402531612 35 -120 1T441T6877111T124554132T1437142T4116121211241 36 -121 1T442T667121312122253361611811262126212T44331217121 37 -122 1T452T662525215124421T1254224124T12T4251321611111 38 -123 2T453T6436171362511T17311412262211212T422212212T102 39 -123 1T463T641116172561221T17631913511T442121211T122 40 -124 1T49211T62351724T1591433213715414T433211391 41 -124 1T40294T594511242221222151212312T1121142242134111T242T2149311 42 -124 1T4041171T6117354212641511151131143236132111312T152134212T185511121 43 -124 1T411245222T5511511321212212T13T102114131T1038251T141T151T201124222 44 -124 1T41152611112T611732521124331111271323142T171T133T15111T171911111 45 -123 1T3927212221411T6424T10622213922341T2227111T18212T151112142 46 -124 1T392T113431143T51161192364169312T361T254T1314123 47 -124 111T343T153213216T471117823341111737221T3111141T245T101111171 48 -125 4T17197T191224242T4721171431823T10161T38211T26121T11121114221 49 -128 71122212121612112T2582114T471323311321125T1511153T364611196239111T122 50 -128 4T582111222T50414125652T10392613111T1821341133135714171T12112 51 -127 1T471T204T4522336727832T1411111111211T18121T1311211T17151T13211T12111 52 -132 21111T45121T221T45121113241718164T262T361T21141T15111T141 53 -133 221T461T252T4512113113113518262T271T12221T43311T11222T12141 54 -164 2T294T47121T211T486127715121142T29131212321T5821221T17111 55 -163 6T263T4131232T162T5169511623212T382T84151 56 -160 1111111T212T412T111T141T54221911111125512S126162 57 -158 7T182T39111T131T70311844147S1101T17152 58 -161 11322T155T382T1427431T563711221425221S12325131 59 -166 2145124412313T561T11111T67142T107S11312122112241221131 60 -167 4T11222112112T441T1617141T1511112T5414222111112S130231211111 61 -166 2T141T692711121T16161T45162413181S1251212292 62 -169 132T7011261151524T15161T461T1113191S1312T12111 63 -171 435T691211213722131T12191T18123T2412171127161S1401 64 -180 1445115T7042412227111T101T111T1611161T23112712142311212S1364 65 -179 4311311T7811352124211T121T124T11111112122T2418221413123 66 -178 122214114T201T5349141112371T181T102212111T2817151316512T233 67 -174 192T47111245112117341332171T101T201T451116151T102141111T223 68 -180 121T103T262T192111112153531112131444111T132T19221T422111431T141216313116232T941T101 69 -163 2T17111123212113511131151112216111232121491T115T241T43332121321T231221332T85211121121211121 70 -180 111T1643312111111T133224771111111114113816122T12211T246T411112222T21122815111T561T20152T1017111 71 -180 211T202T291112212713133121222T13111T163T27121T45131T2211111T10111231241T462221113T10161T20111 72 -125 153211211111121111115114146T192T293T72221T13121121112T421519281 73 -124 263552313431311111111T191T32211T72211T121T101111111T2521122311211T10212 74 -124 122213221912522112113T211T35111T73121T271T222T27111312111 75 -121 13243132111131321121113T211T372T731113121T222111131T153T212721111",w);for(t=0;t<360;++t){globe(t,w,nw); system("sleep 0.1");}} '
