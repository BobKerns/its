C INIT-- DUNGEON INITIALIZATION SUBROUTINE
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
	LOGICAL FUNCTION INIT(X)
	IMPLICIT INTEGER (A-Z)
	LOGICAL PROTCT
C
C PARSER OUTPUT
C
	LOGICAL PRSWON
	COMMON /PRSVEC/ PRSA,PRSI,PRSO,PRSWON,PRSCON
C
C PARSER STATE
C
	COMMON /ORPHS/ OFLAG,OACT,OSLOT,OPREP,ONAME
	COMMON /LAST/ LASTIT
C
C GAME STATE
C
	LOGICAL TELFLG
	COMMON /PLAY/ WINNER,HERE,TELFLG
	COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
	1	LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
C SCREEN OF LIGHT
C
	COMMON /SCREEN/ FROMDR,SCOLRM,SCOLAC
C
C MESSAGE INDEX
C
	COMMON /RMSG/ MLNT,RTEXT(1050)
C
C MISCELLANEOUS VARIABLES
C
	COMMON /STAR/ MBASE,STRBIT
	COMMON /VERS/ VMAJ,VMIN,VEDIT
	COMMON /TIME/ PLTIME,SHOUR,SMIN,SSEC
	COMMON /CHAN/ INPCH,OUTCH,DBCH
	COMMON /DEBUG/ DBGFLG,PRSFLG,GDTFLG
	COMMON /HYPER/ HFACTR
C
C ROOMS
C
	COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
	1	RACTIO(200),RVAL(200),RFLAG(200)
	INTEGER RRAND(200)
	EQUIVALENCE (RVAL,RRAND)
C
	COMMON /RFLAG/ RSEEN,RLIGHT,RLAND,RWATER,RAIR,
	1	RSACRD,RFILL,RMUNG,RBUCK,RHOUSE,RNWALL,REND
C
	COMMON /RINDEX/ WHOUS,LROOM,CELLA
	COMMON /RINDEX/ MTROL,MAZE1	
	COMMON /RINDEX/ MGRAT,MAZ15	
	COMMON /RINDEX/ FORE1,FORE3,CLEAR,RESER
	COMMON /RINDEX/ STREA,EGYPT,ECHOR
	COMMON /RINDEX/ TSHAF	
	COMMON /RINDEX/ BSHAF,MMACH,DOME,MTORC
	COMMON /RINDEX/ CAROU	
	COMMON /RINDEX/ RIDDL,LLD2,TEMP1,TEMP2,MAINT
	COMMON /RINDEX/ BLROO,TREAS,RIVR1,RIVR2,RIVR3,MCYCL
	COMMON /RINDEX/ RIVR4,RIVR5,FCHMP,FALLS,MBARR
	COMMON /RINDEX/ MRAIN,POG,VLBOT,VAIR1,VAIR2,VAIR3,VAIR4
	COMMON /RINDEX/ LEDG2,LEDG3,LEDG4,MSAFE,CAGER
	COMMON /RINDEX/ CAGED,TWELL,BWELL,ALICE,ALISM,ALITR
	COMMON /RINDEX/ MTREE,BKENT,BKVW,BKTWI,BKVAU,BKBOX
	COMMON /RINDEX/ CRYPT,TSTRS,MRANT,MREYE
	COMMON /RINDEX/ MRA,MRB,MRC,MRG,MRD,FDOOR
	COMMON /RINDEX/ MRAE,MRCE,MRCW,MRGE,MRGW,MRDW,INMIR
	COMMON /RINDEX/ SCORR,NCORR,PARAP,CELL,PCELL,NCELL
	COMMON /RINDEX/ CPANT,CPOUT,CPUZZ
C
C EXITS
C
	COMMON /EXITS/ XLNT,TRAVEL(900)
C
	COMMON /CURXT/ XTYPE,XROOM1,XSTRNG,XACTIO,XOBJ
	EQUIVALENCE (XFLAG,XOBJ)
C
	COMMON /XPARS/ XRMASK,XDMASK,XFMASK,XFSHFT,XASHFT,
	1	XELNT(4),XNORM,XNO,XCOND,XDOOR,XLFLAG
C
C OBJECTS
C
	COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
	1	OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
	2	OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
	3	OADV(220),OCAN(220),OREAD(220)
C
	COMMON /OROOM2/ R2LNT,O2(20),R2(20)
C
	COMMON /OINDEX/ GARLI,FOOD,GUNK,COAL,MACHI,DIAMO,TCASE,BOTTL
	COMMON /OINDEX/ WATER,ROPE,KNIFE,SWORD,LAMP,BLAMP,RUG
	COMMON /OINDEX/	LEAVE,TROLL,AXE
	COMMON /OINDEX/ RKNIF,KEYS,ICE,BAR
	COMMON /OINDEX/ COFFI,TORCH,TBASK,FBASK,IRBOX
	COMMON /OINDEX/ GHOST,TRUNK,BELL,BOOK,CANDL
	COMMON /OINDEX/ MATCH,TUBE,PUTTY,WRENC,SCREW,CYCLO,CHALI
	COMMON /OINDEX/ THIEF,STILL,WINDO,GRATE,DOOR
	COMMON /OINDEX/ HPOLE,LEAK,RBUTT,RAILI
	COMMON /OINDEX/ POT,STATU,IBOAT,DBOAT,PUMP,RBOAT
	COMMON /OINDEX/ STICK,BUOY,SHOVE,BALLO,RECEP,GUANO
	COMMON /OINDEX/ BROPE,HOOK1,HOOK2,SAFE,SSLOT,BRICK,FUSE
	COMMON /OINDEX/ GNOME,BLABE,DBALL,TOMB
	COMMON /OINDEX/ LCASE,CAGE,RCAGE,SPHER,SQBUT
	COMMON /OINDEX/ FLASK,POOL,SAFFR,BUCKE,ECAKE,ORICE,RDICE,BLICE
	COMMON /OINDEX/ ROBOT,FTREE,BILLS,PORTR,SCOL,ZGNOM
	COMMON /OINDEX/ EGG,BEGG,BAUBL,CANAR,BCANA
	COMMON /OINDEX/ YLWAL,RDWAL,PINDR,RBEAM
	COMMON /OINDEX/ ODOOR,QDOOR,CDOOR,NUM1,NUM8
	COMMON /OINDEX/ WARNI,CSLIT,GCARD,STLDR
	COMMON /OINDEX/ HANDS,WALL,LUNGS,SAILO,AVIAT,TEETH
	COMMON /OINDEX/ ITOBJ,EVERY,VALUA,OPLAY,WNORT,GWATE,MASTER
C
C CLOCK INTERRUPTS
C
	LOGICAL*1 CFLAG
	COMMON /CEVENT/ CLNT,CTICK(25),CACTIO(25),CFLAG(25)
C
C VILLAINS AND DEMONS
C
	LOGICAL THFFLG,SWDACT,THFACT
	COMMON /HACK/ THFPOS,THFFLG,THFACT,SWDACT,SWDSTA
	COMMON /VILL/ VLNT,VILLNS(4),VPROB(4),VOPPS(4),VBEST(4),VMELEE(4)
C
C ADVENTURERS
C
	COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
	1	AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
	COMMON /AINDEX/ PLAYER,AROBOT,AMASTR
C
C FLAGS
C
	LOGICAL*1 TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
	LOGICAL*1 DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
	LOGICAL*1 MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
	LOGICAL*1 EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
	LOGICAL*1 GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
	LOGICAL*1 GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
	LOGICAL*1 MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
	LOGICAL*1 FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
	1	DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
	2	MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
	3	EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
	4	GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
	5	GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
	6	MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
	7	FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ BTIEF,BINFF
	COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
	COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
	COMMON /FINDEX/ MDIR,MLOC,POLEUF
	COMMON /FINDEX/ QUESNO,NQATT,CORRCT
	COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
	LOGICAL*1 FLAGS(46)
	INTEGER SWITCH(22)
	EQUIVALENCE (FLAGS(1),TROLLF)
	EQUIVALENCE (SWITCH(1),BTIEF)
C INIT, PAGE 2
C
C FIRST CHECK FOR PROTECTION VIOLATION
C
	IF(PROTCT(X)) GO TO 10000		
	TYPE 10100				
10100	FORMAT(' There appears before you a threatening figure clad
	1 all over'/' in heavy black armor.  His legs seem like the
	2 massive trunk'/' of the oak tree.  His broad shoulders and
	3 helmeted head loom'/' high over your own puny frame, and
	4 you realize that his powerful'/' arms could easily crush the
	5 very life from your body.  There'/' hangs from his belt a
	6 veritable arsenal of deadly weapons:'/' sword, mace, ball
	7 and chain, dagger, lance, and trident.'/' He speaks with a
	8 commanding voice:'//20X,'"You shall not pass."'//' As
	9 he grabs you by the neck all grows dim about you.')
	CALL EXIT
C
C NOW START INITIALIZATION PROPER
C
10000	INIT=.FALSE.				
	MMAX=1050				
	OMAX=220
	RMAX=200
	VMAX=4
	AMAX=4
	CMAX=25
	FMAX=46
	SMAX=22
	XMAX=900
	R2MAX=20
	DIRMAX=15
C
	MLNT=0					
	OLNT=0
	RLNT=0
	VLNT=0
	ALNT=0
	CLNT=0
	XLNT=1
	R2LNT=0
C
	LTSHFT=10				
	MXSCOR=LTSHFT
	EGSCOR=0
	EGMXSC=0
	MXLOAD=100
	RWSCOR=0
	DEATHS=0
	MOVES=0
	PLTIME=0
	MUNGRM=0
	HS=0
	PRSA=0					
	PRSI=0
	PRSO=0
	PRSCON=1
	OFLAG=0					
	OACT=0
	OSLOT=0
	OPREP=0
	ONAME=0
	THFFLG=.FALSE.				
	THFACT=.TRUE.				
	SWDACT=.FALSE.				
	SWDSTA=0				
C
	RECNO=1					
	MBASE=0					
	INPCH=5					
	OUTCH=5					
	DBCH=2					
C INIT, PAGE 3
C
C INIT ALL ARRAYS.
C
	DO 5 I=1,CMAX				
	  CFLAG(I)=.FALSE.
	  CTICK(I)=0
	  CACTIO(I)=0
5	CONTINUE
C
	DO 10 I=1,FMAX				
	  FLAGS(I)=.FALSE.
10	CONTINUE
	BUOYF=.TRUE.				
	EGYPTF=.TRUE.
	CAGETF=.TRUE.
	MR1F=.TRUE.
	MR2F=.TRUE.
	FOLLWF=.TRUE.
	DO 12 I=1,SMAX				
	  SWITCH(I)=0
12	CONTINUE
	ORMTCH=4				
	LCELL=1
	PNUMB=1
	MDIR=270
	MLOC=MRB
	CPHERE=10
C
	DO 15 I=1,R2MAX			
	  R2(I)=0
	  O2(I)=0
15	CONTINUE
C
	DO 20 I=1,XMAX			
	  TRAVEL(I)=0
20	CONTINUE
C
	DO 30 I=1,VMAX				
	  VOPPS(I)=0
	  VPROB(I)=0
	  VILLNS(I)=0
	  VBEST(I)=0
	  VMELEE(I)=0
30	CONTINUE
C
	DO 40 I=1,OMAX				
	  ODESC1(I)=0
	  ODESC2(I)=0
	  ODESCO(I)=0
	  OREAD(I)=0
	  OACTIO(I)=0
	  OFLAG1(I)=0
	  OFLAG2(I)=0
	  OFVAL(I)=0
	  OTVAL(I)=0
	  OSIZE(I)=0
	  OCAPAC(I)=0
	  OCAN(I)=0
	  OADV(I)=0
	  OROOM(I)=0
40	CONTINUE
C
	RDESC2=0				
	DO 50 I=1,RMAX				
	  RDESC1(I)=0
	  RACTIO(I)=0
	  RFLAG(I)=0
	  RVAL(I)=0
	  REXIT(I)=0
50	CONTINUE
C
	DO 60 I=1,MMAX				
	  RTEXT(I)=0
60	CONTINUE
C
	DO 70 I=1,AMAX				
	  AROOM(I)=0
	  ASCORE(I)=0
	  AVEHIC(I)=0
	  AOBJ(I)=0
	  AACTIO(I)=0
	  ASTREN(I)=0
	  AFLAG(I)=0
70	CONTINUE
C
	DBGFLG=0
	PRSFLG=0
	GDTFLG=0
C
	FROMDR=0				
	SCOLRM=0
	SCOLAC=0
C INIT, PAGE 4
C
C NOW RESTORE FROM EXISTING INDEX FILE.
C
	OPEN(UNIT=1,NAME='DINDX.DAT',TYPE='OLD',READONLY,
	1	FORM='FORMATTED',ACCESS='SEQUENTIAL',ERR=1900)
	READ(1,130) I,J,K			
	IF((I.NE.VMAJ).OR.(J.NE.VMIN))
	1	GO TO 1925			

	OPEN(UNIT=DBCH,NAME='DTEXT.DAT',TYPE='OLD',READONLY,
	1	FORM='UNFORMATTED',ACCESS='DIRECT',
	2	RECORDSIZE=19,DISPOSE='SAVE',ERR=1950)

D	TYPE 150
D150	FORMAT(' RESTORING FROM "DINDX.DAT"')
	READ(1,130) MXSCOR,STRBIT,EGMXSC
	READ(1,130) RLNT,RDESC2,RDESC1,REXIT,RACTIO,RVAL,RFLAG
	READ(1,130) XLNT,TRAVEL
	READ(1,130) OLNT,ODESC1,ODESC2,ODESCO,OACTIO,OFLAG1,OFLAG2,
	1	OFVAL,OTVAL,OSIZE,OCAPAC,OROOM,OADV,OCAN,
	2	OREAD
	READ(1,130) R2LNT,O2,R2
	READ(1,130) CLNT,CTICK,CACTIO
	READ(1,135) CFLAG
	READ(1,130) VLNT,VILLNS,VPROB,VOPPS,VBEST,VMELEE
	READ(1,130) ALNT,AROOM,ASCORE,AVEHIC,AOBJ,AACTIO,ASTREN,AFLAG
	READ(1,130) MBASE,MLNT,RTEXT
C
	CLOSE(UNIT=1)
	GO TO 1025				
C
130	FORMAT(I8)
135	FORMAT(L4)
C INIT, PAGE 5
C
C THE INTERNAL DATA BASE IS NOW ESTABLISHED.
C SET UP TO PLAY THE GAME.
C
1025	CALL ITIME(SHOUR,SMIN,SSEC)		
	CALL IDATE(I,J,K)
	CALL INIRND(I.OR.J.OR.K,SHOUR.OR.SMIN.OR.SSEC)
C
	WINNER=PLAYER
	THFPOS=OROOM(THIEF)
	BLOC=OROOM(BALLO)
	HERE=AROOM(WINNER)
	LASTIT=AOBJ(PLAYER)
	INIT=.TRUE.
C
D	TYPE 1050,RLNT,RMAX,XLNT,XMAX,OLNT,OMAX,MLNT,MMAX,
D	1	VLNT,VMAX,ALNT,AMAX,CLNT,CMAX,R2LNT,R2MAX
D1050	FORMAT(' USED:'/1X,I5,' OF',I5,' ROOMS'/
D	11X,I5,' OF',I5,' EXITS'/
D	21X,I5,' OF',I5,' OBJECTS'/
D	31X,I5,' OF',I5,' MESSAGES'/
D	41X,I5,' OF',I5,' VILLAINS'/
D	51X,I5,' OF',I5,' ADVENTURERS'/
D	61X,I5,' OF',I5,' CLOCK EVENTS'/
D	71X,I5,' OF',I5,' ROOM2 SLOTS')
D	TYPE 1150,MXSCOR,EGMXSC,RECNO,RDESC2,MBASE,STRBIT
D1150	FORMAT(' MAX SCORE=',I5/' EG SCORE=',I5/
D	1' MAX RECNO=',I5/' RDESC2 BASE=',I5/
D	1' MELEE START=',I5/' STAR MASK=',I7)
D	PAUSE 1
C
	RETURN
C INIT, PAGE 6
C
C ERRORS-- INIT FAILS.
C
1900	TYPE 910				
	TYPE 980
	RETURN
1925	TYPE 920,I,J,K,VMAJ,VMIN,VEDIT		
	TYPE 980
	RETURN
1950	TYPE 960				
	TYPE 980
	RETURN
910	FORMAT(' I can''t open "DINDX.DAT".')
920	FORMAT(' "DINDX.DAT" is version ',I1,'.',I1,A1,'.'/
	1	' I require version ',I1,'.',I1,A1,'.')
960	FORMAT(' I can''t open "DTEXT.DAT".')
980	FORMAT(' Suddenly a sinister, wraithlike figure appears before
	1 you'/' seeming to float in the air.  In a low, sorrowful voice
	2 he says,'/' "Alas, the very nature of the world has changed,
	3 and the dungeon'/' cannot be found.  All must now pass away."
	4  Raising his oaken staff'/' in farewell, he fades into the
	5 spreading darkness.  In his place'/' appears a tastefully
	6 lettered sign reading:'//23X,'INITIALIZATION FAILURE'//
	7' The darkness becomes all encompassing, and your vision fails.')
C
	END
C PROTCT-- CHECK FOR USER VIOLATION
C
C THIS ROUTINE SHOULD BE MODIFIED IF YOU WISH TO ADD SYSTEM
C DEPENDANT PROTECTION AGAINST ABUSE.
C
C AT THE MOMENT, PLAY IS PERMITTED UDER ALL CIRCUMSTANCES.
C
	LOGICAL FUNCTION PROTCT(X)
	IMPLICIT INTEGER(A-Z)
C
	PROTCT=.TRUE.
	RETURN
	END

