C LIGHTP-	LIGHT PROCESSOR
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
	LOGICAL FUNCTION LIGHTP(OBJ)
	IMPLICIT INTEGER (A-Z)
	LOGICAL QON
C
C PARSER OUTPUT
C
	LOGICAL PRSWON
	COMMON /PRSVEC/ PRSA,PRSI,PRSO,PRSWON,PRSCON
C
C GAME STATE
C
	LOGICAL TELFLG
	COMMON /PLAY/ WINNER,HERE,TELFLG
C
C OBJECTS
C
	COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
	1	OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
	2	OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
	3	OADV(220),OCAN(220),OREAD(220)
C
	COMMON /OFLAGS/ VISIBT,READBT,TAKEBT,DOORBT,TRANBT,FOODBT,
	1	NDSCBT,DRNKBT,CONTBT,LITEBT,VICTBT,BURNBT,FLAMBT,
	2	TOOLBT,TURNBT,ONBT
	COMMON /OFLAGS/ FINDBT,SLEPBT,SCRDBT,TIEBT,CLMBBT,ACTRBT,
	1	WEAPBT,FITEBT,VILLBT,STAGBT,TRYBT,NOCHBT,OPENBT,
	2	TCHBT,VEHBT,SCHBT
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
	COMMON /CINDEX/ CEVCUR,CEVMNT,CEVLNT,CEVMAT,CEVCND,
	1	CEVBAL,CEVBRN,CEVFUS,CEVLED,CEVSAF,CEVVLG,
	2	CEVGNO,CEVBUC,CEVSPH,CEVEGH,
	3	CEVFOR,CEVSCL,CEVZGI,CEVZGO,CEVSTE,
	5	CEVMRS,CEVPIN,CEVINQ,CEVFOL

C
C VERBS
C
	COMMON /VINDEX/ CINTW,DEADXW,FRSTQW,INXW,OUTXW
	COMMON /VINDEX/ WALKIW,FIGHTW,FOOW
	COMMON /VINDEX/ MELTW,READW,INFLAW,DEFLAW,ALARMW,EXORCW
	COMMON /VINDEX/ PLUGW,KICKW,WAVEW,RAISEW,LOWERW,RUBW
	COMMON /VINDEX/ PUSHW,UNTIEW,TIEW,TIEUPW,TURNW,BREATW
	COMMON /VINDEX/ KNOCKW,LOOKW,EXAMIW,SHAKEW,MOVEW,TRNONW,TRNOFW
	COMMON /VINDEX/ OPENW,CLOSEW,FINDW,WAITW,SPINW,BOARDW,UNBOAW,TAKEW
	COMMON /VINDEX/ INVENW,FILLW,EATW,DRINKW,BURNW
	COMMON /VINDEX/ MUNGW,KILLW,ATTACW,SWINGW
	COMMON /VINDEX/ WALKW,TELLW,PUTW,DROPW,GIVEW,POURW,THROWW
	COMMON /VINDEX/ DIGW,LEAPW,STAYW,FOLLOW
	COMMON /VINDEX/ HELLOW,LOOKIW,LOOKUW,PUMPW,WINDW
	COMMON /VINDEX/ CLMBW,CLMBUW,CLMBDW,TRNTOW
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
C
C FUNCTIONS AND DATA
C
	QON(R)=(OFLAG1(R).AND.ONBT).NE.0
C LIGHTP, PAGE 2
C
	LIGHTP=.TRUE.				
	FLOBTS=FLAMBT+LITEBT+ONBT
	IF(OBJ.NE.CANDL) GO TO 20000		
	IF(ORCAND.NE.0) GO TO 19100		
	ORCAND=1				
	CTICK(CEVCND)=50			
C
19100	IF(PRSI.EQ.CANDL) GO TO 10		
	IF(PRSA.NE.TRNOFW) GO TO 19200		
	I=513					
	IF(QON(CANDL)) I=514			
	CFLAG(CEVCND)=.FALSE.			
	OFLAG1(CANDL)=OFLAG1(CANDL).AND. .NOT.ONBT
	CALL RSPEAK(I)
	RETURN
C
19200	IF((PRSA.NE.BURNW).AND.(PRSA.NE.TRNONW)) GO TO 10
	IF((OFLAG1(CANDL).AND.LITEBT).NE.0) GO TO 19300
	CALL RSPEAK(515)			
	RETURN
C
19300	IF(PRSI.NE.0) GO TO 19400		
	CALL RSPEAK(516)			
	PRSWON=.FALSE.
	RETURN
C
19400	IF((PRSI.NE.MATCH).OR. .NOT.QON(MATCH)) GO TO 19500
	I=517					
	IF(QON(CANDL)) I=518			
	OFLAG1(CANDL)=OFLAG1(CANDL).OR.ONBT	
	CFLAG(CEVCND)=.TRUE.			
	CALL RSPEAK(I)
	RETURN
C
19500	IF((PRSI.NE.TORCH).OR. .NOT.QON(TORCH)) GO TO 19600
	IF(QON(CANDL)) GO TO 19700		
	CALL NEWSTA(CANDL,521,0,0,0)		
	RETURN
C
19600	CALL RSPEAK(519)			
	RETURN
C
19700	CALL RSPEAK(520)			
	RETURN
C
20000	IF(OBJ.NE.MATCH) CALL BUG(6,OBJ)
	IF((PRSA.NE.TRNONW).OR.(PRSO.NE.MATCH)) GO TO 20500
	IF(ORMTCH.NE.0) GO TO 20100		
	CALL RSPEAK(183)			
	RETURN
C
20100	ORMTCH=ORMTCH-1				
	OFLAG1(MATCH)=OFLAG1(MATCH).OR.FLOBTS
	CTICK(CEVMAT)=2				
	CALL RSPEAK(184)
	RETURN
C
20500	IF((PRSA.NE.TRNOFW).OR.((OFLAG1(MATCH).AND.ONBT).EQ.0))
	1	GO TO 10			
	OFLAG1(MATCH)=OFLAG1(MATCH).AND. .NOT.FLOBTS
	CTICK(CEVMAT)=0
	CALL RSPEAK(185)
	RETURN
C
C HERE FOR FALSE RETURN
C
10	LIGHTP=.FALSE.
	RETURN
	END

