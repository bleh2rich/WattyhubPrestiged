-- Obfuscated for skid protection but farmkartgui can be open sourced it doesnt really matter

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v82=0;local v83;while true do if (v82==0) then v83=v2(v0(v30,16));if v19 then local v99=0;local v100;while true do if (v99==1) then return v100;end if (v99==0) then v100=v5(v83,v19);v19=nil;v99=1;end end else return v83;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v84=(v31/((5 -3)^(v32-(2 -(1 + 0)))))%(2^(((v33-(1 -(0 + 0))) -(v32-(2 -1))) + (620 -(555 + 64)))) ;return v84-(v84%(932 -(857 + 74))) ;else local v85=(570 -(367 + 201))^(v32-((1805 -(282 + 595)) -(214 + 713))) ;return (((v31%(v85 + v85))>=v85) and 1) or 0 ;end end local function v21() local v34=(2907 -(226 + 1044)) -(1523 + 114) ;local v35;while true do if (v34==0) then v35=v1(v16,v18,v18);v18=v18 + 1 + 0 ;v34=1 -0 ;end if (v34==(1066 -(68 + (4341 -3344)))) then return v35;end end end local function v22() local v36,v37=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + 1 + 1 ;return (v37 * 256) + v36 ;end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + (960 -(892 + 65)) );v18=v18 + ((359 -(87 + 263)) -5) ;return (v41 * (31011612 -(14234576 -(67 + 113)))) + (v40 * 65536) + (v39 * (469 -213)) + v38 ;end local function v24() local v42=v23();local v43=v23();local v44=1 + 0 ;local v45=(v20(v43,1,49 -29 ) * ((2 + (0 -0))^(127 -95))) + v42 ;local v46=v20(v43,973 -(802 + 150) ,83 -52 );local v47=((v20(v43,32)==((443 -(416 + 26)) -0)) and  -((3 -2) + 0 + 0)) or (998 -(915 + 82)) ;if (v46==(0 -0)) then if (v45==(0 + 0)) then return v47 * (0 -0) ;else v46=1188 -(1069 + 118) ;v44=0 -0 ;end elseif (v46==(4477 -2430)) then return ((v45==(0 + 0)) and (v47 * ((1 -0)/((0 -0) + 0)))) or (v47 * NaN) ;end return v8(v47,v46-((2252 -(145 + 293)) -(368 + 423)) ) * (v44 + (v45/((6 -4)^(70 -(10 + 8))))) ;end local function v25(v48) local v49;if  not v48 then local v86=(1568 -(116 + 1022)) -(44 + 386) ;while true do if (v86==(1486 -(998 + 488))) then v48=v23();if (v48==(0 + 0)) then return "";end break;end end end v49=v3(v16,v18,(v18 + v48) -(1 + 0) );v18=v18 + v48 ;local v50={};for v65=773 -((836 -635) + 571) , #v49 do v50[v65]=v2(v1(v3(v49,v65,v65)));end return v6(v50);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v51=(function() return 561 -(79 + 482) ;end)();local v52=(function() return;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();while true do local v67=(function() return 0;end)();while true do if (v67==(1 -0)) then if (v51==0) then local v94=(function() return 0;end)();local v95=(function() return;end)();while true do if (v94~=0) then else v95=(function() return 0;end)();while true do if (0~=v95) then else v52=(function() return function(v163,v164,v165) local v166=(function() return 0;end)();local v167=(function() return;end)();while true do if (v166~=(0 -0)) then else v167=(function() return 0;end)();while true do if (v167~=0) then else local v183=(function() return 285 -(134 + 151) ;end)();while true do if (v183==0) then v163[v164-#"\\" ]=(function() return v165();end)();return v163,v164,v165;end end end end break;end end end;end)();v53=(function() return {};end)();v95=(function() return 1;end)();end if (v95==(1666 -(970 + 695))) then v54=(function() return {};end)();v55=(function() return {};end)();v95=(function() return 2;end)();end if (v95~=(3 -1)) then else v51=(function() return 1991 -(582 + 1408) ;end)();break;end end break;end end end break;end if ((0 -0)==v67) then if (v51==2) then v56[ #"91("]=(function() return v21();end)();for v101= #"~",v23() do local v102=(function() return v21();end)();if (v20(v102, #"{", #"~")==0) then local v120=(function() return 0;end)();local v121=(function() return;end)();local v122=(function() return;end)();local v123=(function() return;end)();local v124=(function() return;end)();while true do if (v120==2) then while true do if (v121==2) then local v171=(function() return 0;end)();local v172=(function() return;end)();while true do if ((0 -0)~=v171) then else v172=(function() return 0 -0 ;end)();while true do if ((1824 -(1195 + 629))==v172) then if (v20(v123, #",", #"|")~= #"[") then else v124[2 -0 ]=(function() return v58[v124[2]];end)();end if (v20(v123,243 -(187 + 54) ,782 -(162 + 618) )== #"!") then v124[ #"91("]=(function() return v58[v124[ #"91("]];end)();end v172=(function() return 1 + 0 ;end)();end if (v172~=1) then else v121=(function() return  #"xxx";end)();break;end end break;end end end if (v121== #"|") then local v173=(function() return 0 + 0 ;end)();local v174=(function() return;end)();while true do if (v173~=(0 -0)) then else v174=(function() return 0;end)();while true do if (v174==(0 -0)) then v124=(function() return {v22(),v22(),nil,nil};end)();if (v122==(1636 -(1373 + 263))) then local v187=(function() return 0;end)();while true do if ((1000 -(451 + 549))~=v187) then else v124[ #"xxx"]=(function() return v22();end)();v124[ #".dev"]=(function() return v22();end)();break;end end elseif (v122== #"}") then v124[ #"asd"]=(function() return v23();end)();elseif (v122==2) then v124[ #"gha"]=(function() return v23() -(2^(6 + 10)) ;end)();elseif (v122== #"asd") then local v192=(function() return 0;end)();local v193=(function() return;end)();while true do if (v192~=0) then else v193=(function() return 0;end)();while true do if (v193==0) then v124[ #"asd"]=(function() return v23() -((2 -0)^(26 -10)) ;end)();v124[ #"xnxx"]=(function() return v22();end)();break;end end break;end end end v174=(function() return 1385 -(746 + 638) ;end)();end if (v174~=(1 + 0)) then else v121=(function() return 2 -0 ;end)();break;end end break;end end end if (v121~= #"-19") then else if (v20(v123, #"asd", #"91(")== #",") then v124[ #"asd1"]=(function() return v58[v124[ #"0836"]];end)();end v53[v101]=(function() return v124;end)();break;end if (v121~=(341 -(218 + 123))) then else local v176=(function() return 0;end)();local v177=(function() return;end)();while true do if (v176~=(1581 -(1535 + 46))) then else v177=(function() return 0;end)();while true do if (v177~=0) then else v122=(function() return v20(v102,2 + 0 , #"xxx");end)();v123=(function() return v20(v102, #"xnxx",1 + 5 );end)();v177=(function() return 561 -(306 + 254) ;end)();end if (v177==(1 + 0)) then v121=(function() return  #"}";end)();break;end end break;end end end end break;end if (v120~=1) then else v123=(function() return nil;end)();v124=(function() return nil;end)();v120=(function() return 2;end)();end if (v120==(0 -0)) then local v135=(function() return 1467 -(899 + 568) ;end)();while true do if (v135==(1 + 0)) then v120=(function() return 2 -1 ;end)();break;end if (v135==0) then v121=(function() return 603 -(268 + 335) ;end)();v122=(function() return nil;end)();v135=(function() return 1;end)();end end end end end end for v103= #"}",v23() do v54,v103,v28=(function() return v52(v54,v103,v28);end)();end return v56;end if (v51==1) then local v97=(function() return 290 -(60 + 230) ;end)();local v98=(function() return;end)();while true do if (0==v97) then v98=(function() return 572 -(426 + 146) ;end)();while true do if (v98==(1 + 0)) then v58=(function() return {};end)();for v138= #"~",v57 do local v139=(function() return 1456 -(282 + 1174) ;end)();local v140=(function() return;end)();local v141=(function() return;end)();local v142=(function() return;end)();while true do if (v139==0) then local v180=(function() return 811 -(569 + 242) ;end)();while true do if (v180==(0 -0)) then v140=(function() return 0;end)();v141=(function() return nil;end)();v180=(function() return 1;end)();end if (v180==(1 + 0)) then v139=(function() return 1025 -(706 + 318) ;end)();break;end end end if (v139~=1) then else v142=(function() return nil;end)();while true do if (v140~=(1251 -(721 + 530))) then else v141=(function() return v21();end)();v142=(function() return nil;end)();v140=(function() return 1272 -(945 + 326) ;end)();end if (v140==(2 -1)) then if (v141== #"}") then v142=(function() return v21()~=(0 + 0) ;end)();elseif (v141==2) then v142=(function() return v24();end)();elseif (v141~= #"19(") then else v142=(function() return v25();end)();end v58[v138]=(function() return v142;end)();break;end end break;end end end v98=(function() return 2;end)();end if (v98==(702 -(271 + 429))) then v51=(function() return 2;end)();break;end if (v98~=(0 + 0)) then else v56=(function() return {v53,v54,nil,v55};end)();v57=(function() return v23();end)();v98=(function() return 1;end)();end end break;end end end v67=(function() return 1087 -(461 + 625) ;end)();end end end end local function v29(v59,v60,v61) local v62=v59[1289 -(993 + 295) ];local v63=v59[1 + 1 ];local v64=v59[1174 -(418 + 753) ];return function(...) local v68=v62;local v69=v63;local v70=v64;local v71=v27;local v72=1 + 0 ;local v73= -((4 -3) + 0);local v74={};local v75={...};local v76=v12("#",...) -(1 + 0) ;local v77={};local v78={};for v87=0,v76 do if (v87>=v70) then v74[v87-v70 ]=v75[v87 + (530 -(406 + 123)) ];else v78[v87]=v75[v87 + 1 ];end end local v79=(v76-v70) + (1770 -(1749 + 20)) ;local v80;local v81;while true do v80=v68[v72];v81=v80[1 + 0 ];if (v81<=(1325 -(1249 + 73))) then if (v81<=(1 + 0)) then if ((630<2127) and (v81>(1145 -(466 + 679)))) then v78[v80[755 -(239 + 514) ]]=v80[6 -3 ];else local v106=v80[(2 + 3) -3 ];local v107=v78[v80[1903 -(106 + (3123 -(797 + 532))) ]];v78[v106 + 1 + 0 ]=v107;v78[v106]=v107[v80[2 + 2 ]];end elseif ((v81==(5 -3)) or (1938==2514)) then local v111=0 -0 ;local v112;while true do if ((4255>=55) and (4962>1721) and (v111==(114 -(4 + 80 + 30)))) then v112=v80[586 -(57 + 527) ];v78[v112]=v78[v112](v13(v78,v112 + (1428 -(41 + 1386)) ,v73));break;end end else do return;end end elseif ((2999>1156) and (802<=4833) and (v81<=(108 -(17 + 30 + 56)))) then if ((2087==2087) and (v81==(3 + 1))) then local v113=0 -0 ;local v114;local v115;local v116;local v117;while true do if (v113==(2 -1)) then v73=(v116 + v114) -((392 -225) -(122 + 44)) ;v117=(1202 -(373 + 829)) -0 ;v113=6 -4 ;end if (v113==(2 + (731 -(476 + 255)))) then for v136=v114,v73 do local v137=0 + 0 ;while true do if (v137==(0 -0)) then v117=v117 + (66 -(30 + 35)) ;v78[v136]=v115[v117];break;end end end break;end if (v113==0) then v114=v80[2 + 0 ];v115,v116=v71(v78[v114](v13(v78,v114 + (1258 -(1043 + 214)) ,v80[11 -(1138 -(369 + 761)) ])));v113=1213 -(323 + 889) ;end end else v78[v80[5 -(2 + 1) ]]=v61[v80[583 -(361 + 219) ]];end elseif (v81<=(326 -(53 + 267))) then v78[v80[2]]();elseif (v81>7) then local v125=0 + 0 ;local v126;local v127;local v128;local v129;local v130;while true do if ((2350>1155) and ((415 -(15 + 398))==v125)) then v78[v130 + (983 -(18 + 964)) ]=v129;v78[v130]=v129[v80[14 -10 ]];v72=v72 + 1 + 0 ;v80=v68[v72];v78[v80[2 + 0 ]]=v80[3];v72=v72 + (851 -((36 -16) + 830)) ;v125=3 + 0 ;end if (v125==5) then v78[v130]=v78[v130](v13(v78,v130 + 1 ,v73));v72=v72 + ((240 -113) -((354 -(64 + 174)) + 2 + 8)) ;v80=v68[v72];v78[v80[1 + 1 ]]();v72=v72 + (739 -((802 -260) + (532 -(144 + 192)))) ;v80=v68[v72];v125=6;end if ((4029<=4853) and ((v125==1) or (4445<4149))) then v80=v68[v72];v78[v80[3 -(217 -(42 + 174)) ]]=v61[v80[1 + 2 ]];v72=v72 + 1 + 0 ;v80=v68[v72];v130=v80[1 + 1 ];v129=v78[v80[7 -4 ]];v125=4 -2 ;end if ((v125==(1555 -(1126 + 425))) or (516>3434)) then v73=(v128 + v130) -(406 -(118 + 216 + 71)) ;v126=0 -0 ;for v168=v130,v73 do v126=v126 + (1122 -(118 + 1003)) ;v78[v168]=v127[v126];end v72=v72 + 1 ;v80=v68[v72];v130=v80[5 -(3 + 0) ];v125=5;end if (((163 + 220) -(142 + 235))==v125) then do return;end break;end if (v125==3) then v80=v68[v72];v78[v80[9 -(1511 -(363 + 1141)) ]]=v80[1 + 2 ]~=(977 -(553 + 424)) ;v72=v72 + (1 -(1580 -(1183 + 397))) ;v80=v68[v72];v130=v80[2 + 0 ];v127,v128=v71(v78[v130](v13(v78,v130 + 1 ,v80[3 + (0 -0) ])));v125=3 + 0 + 1 ;end if ((4046>=3033) and ((0==v125) or (1818==85))) then v126=nil;v127,v128=nil;v129=nil;v130=nil;v78[v80[1 + 1 ]]=v61[v80[2 + 1 ]];v72=v72 + (2 -1) ;v125=2 -1 ;end end else v78[v80[(3 + 1) -2 ]]=v80[3]~=(0 + (1975 -(1913 + 62))) ;end v72=v72 + 1 ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O7470476574037F3O00682O7470733A2O2F676973742E67697468756275736572636F6E74656E742E636F6D2F626C2O654O682F37352O33306265313463353O663464303363663637333234353463303666622F7261772F663637663562332O66623530366366363036643036383635633961333830333263366530393766332F672E6C756100093O0012083O00013O00122O000100023O00202O00010001000300122O000300046O000400016O000100049O0000026O000100016O00017O00",v9(),...);
