-- Obfuscated for skid protection but farmkartgui can be open sourced it doesnt really matter

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v6=string.rep;local v186=table.concat;local v259=table.insert;local v260=math.ldexp;local v111=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v86=0;while true do if (v86==0) then v19=v0(v3(v30,1,1));return "";end end else local v87=0;local v88;while true do if (v87==0) then v88=v2(v0(v30,16));if v19 then local v123=0;local v124;while true do if (1==v123) then return v124;end if (v123==0) then v124=v6(v88,v19);v19=nil;v123=1;end end else return v88;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v89=(v31/(2^(v32-(2 -1))))%((5 -3)^(((v33-(1 -(877 -(282 + 595)))) -(v32-(2 -1))) + (620 -((2192 -(1523 + 114)) + 64)))) ;return v89-(v89%(932 -(857 + 67 + 7))) ;else local v90=(570 -(367 + 201))^(v32-((1322 -394) -(214 + 713))) ;return (((v31%(v90 + v90))>=v90) and (1 + 0)) or (0 + 0) ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=1065 -(68 + 997) ;local v36;local v37;while true do if (v35==(1 + 0)) then return (v37 * (1526 -((414 -188) + 1044))) + v36 ;end if (v35==(0 -0)) then v36,v37=v1(v16,v18,v18 + ((353 -(87 + 263)) -1) );v18=v18 + 2 ;v35=118 -(32 + 85) ;end end end local function v23() local v38=180 -(49 + 18 + (1110 -(915 + 82))) ;local v39;local v40;local v41;local v42;while true do if (v38==(1 + 0)) then return (v42 * 16777216) + (v41 * (160901 -95365)) + (v40 * (189 + 67)) + v39 ;end if ((0 -0)==v38) then v39,v40,v41,v42=v1(v16,v18,v18 + (955 -(802 + 150)) );v18=v18 + (10 -6) ;v38=1 -0 ;end end end local function v24() local v43=v23();local v44=v23();local v45=2 -1 ;local v46=(v20(v44,1,12 + 8 ) * ((2 -0)^(1219 -(1069 + 118)))) + v43 ;local v47=v20(v44,47 -(1512 -(998 + 488)) ,67 -36 );local v48=((v20(v44,6 + 26 )==(1 -0)) and  -(1 + 0)) or (792 -(117 + 251 + 347 + 76)) ;if (v47==0) then if (v46==(0 -0)) then return v48 * (18 -(10 + 8)) ;else v47=(775 -(201 + 571)) -2 ;v45=442 -(416 + (1164 -(116 + 1022))) ;end elseif (v47==2047) then return ((v46==0) and (v48 * (((12 -9) -2)/(0 + 0)))) or (v48 * NaN) ;end return v260(v48,v47-(1809 -786) ) * (v45 + (v46/((440 -(145 + 293))^(482 -(44 + 386))))) ;end local function v25(v49) local v50=(0 -0) + 0 ;local v51;local v52;while true do if (2==v50) then v52={};for v111=1, #v51 do v52[v111]=v2(v1(v3(v51,v111,v111)));end v50=10 -7 ;end if (v50==(10 -7)) then return v186(v52);end if (v50==0) then v51=nil;if  not v49 then v49=v23();if (v49==(859 -(814 + 45))) then return "";end end v50=2 -1 ;end if (v50==((1081 -(1020 + 60)) + 0)) then v51=v3(v16,v18,(v18 + v49) -((1424 -(630 + 793)) + 0) );v18=v18 + v49 ;v50=887 -(261 + 624) ;end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=(function() return function(v91,v92,v93,v94,v95,v96,v97,v98) local v91=(function() return 0;end)();local v92=(function() return;end)();local v94=(function() return;end)();while true do if (v91==0) then local v117=(function() return 1384 -(746 + 638) ;end)();while true do if ((0 + 0)==v117) then v92=(function() return v93();end)();v94=(function() return nil;end)();v117=(function() return 1 -0 ;end)();end if (1~=v117) then else v91=(function() return  #"[";end)();break;end end end if (v91== #"{") then if (v92== #"<") then v94=(function() return v93()~=(0 + 0) ;end)();elseif (v92==2) then v94=(function() return v95();end)();elseif (v92== #"xnx") then v94=(function() return v96();end)();end v97[v98]=(function() return v94;end)();break;end end return v91,v92,v93,v94,v95,v96,v97,v98;end;end)();local v54=(function() return function(v99,v100,v101) local v102=(function() return 0;end)();local v103=(function() return;end)();while true do if (v102==(574 -(507 + 67))) then v103=(function() return 1581 -(1535 + 46) ;end)();while true do if (v103==(1749 -(1013 + 736))) then local v125=(function() return 0;end)();while true do if (v125==(0 + 0)) then local v133=(function() return 0 -0 ;end)();while true do if (v133~=(0 -0)) then else v99[v100-#"}" ]=(function() return v101();end)();return v99,v100,v101;end end end end end end break;end end end;end)();local v55=(function() return {};end)();local v56=(function() return {};end)();local v57=(function() return {};end)();local v58=(function() return {v55,v56,nil,v57};end)();local v59=(function() return v23();end)();local v60=(function() return {};end)();for v68= #",",v59 do FlatIdent_9147D,Type,v21,Cons,v24,v25,v60,v68=(function() return v53(FlatIdent_9147D,Type,v21,Cons,v24,v25,v60,v68);end)();end v58[ #"xnx"]=(function() return v21();end)();for v69= #"{",v23() do local v70=(function() return v21();end)();if (v20(v70, #"]", #",")==(0 -0)) then local v106=(function() return 0 -0 ;end)();local v107=(function() return;end)();local v108=(function() return;end)();local v109=(function() return;end)();local v110=(function() return;end)();while true do if (v106==0) then local v121=(function() return 0 -0 ;end)();while true do if (v121~=(1 + 0)) then else v106=(function() return 2 -1 ;end)();break;end if (v121==(0 -0)) then v107=(function() return 0;end)();v108=(function() return nil;end)();v121=(function() return 1;end)();end end end if (v106==(287 -(134 + 151))) then while true do if (v107~=(290 -(60 + 230))) then else local v126=(function() return 572 -(426 + 146) ;end)();local v127=(function() return;end)();while true do if (v126==(0 + 0)) then v127=(function() return 1456 -(282 + 1174) ;end)();while true do if (v127==0) then v108=(function() return v20(v70,2, #"xnx");end)();v109=(function() return v20(v70, #"http",6);end)();v127=(function() return 1;end)();end if (1==v127) then v107=(function() return  #"}";end)();break;end end break;end end end if (v107~=2) then else local v128=(function() return 1665 -(970 + 695) ;end)();local v129=(function() return;end)();while true do if (v128~=(0 -0)) then else v129=(function() return 1990 -(582 + 1408) ;end)();while true do if (v129==(3 -2)) then v107=(function() return  #"-19";end)();break;end if (v129==0) then if (v20(v109, #",", #"!")~= #"|") then else v110[2]=(function() return v60[v110[2 -0 ]];end)();end if (v20(v109,1 + 1 ,7 -5 )== #"|") then v110[ #"gha"]=(function() return v60[v110[ #"xxx"]];end)();end v129=(function() return 1825 -(1195 + 629) ;end)();end end break;end end end if (v107~= #",") then else local v130=(function() return 0 -0 ;end)();local v131=(function() return;end)();while true do if ((1271 -(945 + 326))~=v130) then else v131=(function() return 0 -0 ;end)();while true do if (v131==1) then v107=(function() return 243 -(187 + 54) ;end)();break;end if (v131==(780 -(162 + 618))) then v110=(function() return {v22(),v22(),nil,nil};end)();if (v108==(0 + 0)) then local v173=(function() return 0;end)();local v174=(function() return;end)();while true do if (v173==0) then v174=(function() return 0 + 0 ;end)();while true do if (v174~=(1086 -(461 + 625))) then else v110[ #"xnx"]=(function() return v22();end)();v110[ #"?id="]=(function() return v22();end)();break;end end break;end end elseif (v108== #"]") then v110[ #"-19"]=(function() return v23();end)();elseif (v108==(3 -1)) then v110[ #"nil"]=(function() return v23() -((2 -0)^(2 + 14)) ;end)();elseif (v108== #"91(") then local v182=(function() return 0;end)();local v183=(function() return;end)();while true do if (v182~=(1288 -(993 + 295))) then else v183=(function() return 1636 -(1373 + 263) ;end)();while true do if (v183==(0 + 0)) then v110[ #"xnx"]=(function() return v23() -(2^(1016 -(451 + 549))) ;end)();v110[ #"0313"]=(function() return v22();end)();break;end end break;end end end v131=(function() return 1 + 0 ;end)();end end break;end end end if (v107~= #"xxx") then else if (v20(v109, #"gha", #"nil")~= #"<") then else v110[ #"http"]=(function() return v60[v110[ #"0836"]];end)();end v55[v69]=(function() return v110;end)();break;end end break;end if (v106==(1 -0)) then local v122=(function() return 0 + 0 ;end)();while true do if (v122~=(0 + 0)) then else v109=(function() return nil;end)();v110=(function() return nil;end)();v122=(function() return 1;end)();end if (v122~=(1 -0)) then else v106=(function() return 1 + 1 ;end)();break;end end end end end end for v71= #"[",v23() do v56,v71,v28=(function() return v54(v56,v71,v28);end)();end return v58;end local function v29(v62,v63,v64) local v65=v62[530 -(406 + 123) ];local v66=v62[1771 -(1749 + 20) ];local v67=v62[1 + 2 ];return function(...) local v72=v65;local v73=v66;local v74=v67;local v75=v27;local v76=1323 -(1249 + 73) ;local v77= -(1 + 0);local v78={};local v79={...};local v80=v12("#",...) -(2 -1) ;local v81={};local v82={};for v104=0,v80 do if (v104>=v74) then v78[v104-v74 ]=v79[v104 + ((1 + 1) -1) ];else v82[v104]=v79[v104 + (1901 -((1083 -(553 + 424)) + 1794)) ];end end local v83=(v80-v74) + (1 -0) + 0 ;local v84;local v85;while true do local v105=0;while true do if ((2996>=2654) and (v105==(0 + 0 + 0))) then v84=v72[v76];v85=v84[2 -1 ];v105=1;end if ((3978>2104) and (v105==(2 -1))) then if (v85<=(120 -(4 + 110))) then if (v85<=(586 -(57 + 0 + 527))) then if (v85<=((831 + 596) -(41 + 1386))) then local v135=v84[105 -(17 + 86) ];local v136=v82[v84[3 + 0 ]];v82[v135 + 1 ]=v136;v82[v135]=v136[v84[8 -4 ]];elseif (v85>(2 -1)) then v82[v84[168 -(122 + 44) ]]=v84[5 -2 ];else v82[v84[6 -4 ]]=v64[v84[3 + 0 ]];end elseif ((2995>1541) and (v85<=(1 + 3))) then if (v85>(5 -2)) then v82[v84[67 -(30 + 35) ]]();else local v146=v84[2 + 0 ];local v147,v148=v75(v82[v146](v13(v82,v146 + (1258 -(1043 + 214)) ,v84[11 -8 ])));v77=(v148 + v146) -(1213 -(323 + 378 + 511)) ;local v149=0 -0 ;for v167=v146,v77 do v149=v149 + (581 -(361 + 219)) ;v82[v167]=v147[v149];end end elseif (v85>5) then v82[v84[322 -(31 + 22 + 267) ]]=v84[1 + (4 -2) ];else do return;end end elseif (v85<=((1175 -753) -(15 + 398))) then if ((3249>953) and (v85<=(989 -(18 + 964)))) then local v140=v84[7 -5 ];v82[v140]=v82[v140](v13(v82,v140 + 1 + 0 ,v77));elseif ((v85==(6 + 2)) or (3273>4573)) then v82[v84[4 -2 ]]=v64[v84[853 -(20 + 830) ]];else local v154=v84[2 + 0 ];v82[v154]=v82[v154](v13(v82,v154 + (127 -(116 + 10)) ,v77));end elseif ((v85<=11) or (3151<1284)) then if (v85==10) then local v156=0;local v157;local v158;local v159;local v160;while true do if ((v156==(1 + 0)) or (1850==1529)) then v77=(v159 + v157) -(739 -(542 + 196)) ;v160=0 -0 ;v156=1 + 0 + 1 ;end if (v156==(0 + 0)) then v157=v84[9 -7 ];v158,v159=v75(v82[v157](v13(v82,v157 + 1 + 0 ,v84[3])));v156=2 -(754 -(239 + 514)) ;end if (v156==(4 -2)) then for v175=v157,v77 do v160=v160 + (1552 -(1126 + 150 + 275)) ;v82[v175]=v158[v160];end break;end end else do return;end end elseif (v85>(417 -(118 + 287))) then v82[v84[7 -5 ]]();else local v161=v84[1123 -(118 + 1003) ];local v162=v82[v84[3]];v82[v161 + (2 -1) ]=v162;v82[v161]=v162[v84[381 -(142 + 235) ]];end v76=v76 + (4 -3) ;break;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q7470476574037F3Q00682Q7470733A2Q2F676973742E67697468756275736572636F6E74656E742E636F6D2F626C2Q654Q682F362Q323537346266353Q39613538332Q373564656163643366382Q373635382F7261772F36353137393864382Q6362326664306235663833663162646133652Q3264336236623235663736322F682E6C756100083Q0012013Q00013Q001201000100023Q00202Q000100010003001202000300044Q0003000100034Q00095Q00022Q000D3Q000100012Q000B3Q00017Q00",v111(),...);
