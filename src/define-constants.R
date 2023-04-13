#############################################################################################
# This script allows defining all the file constants used by the other scripts and functions.
# This include both file names and folder names.
# 
# 07/2015 Israel Mendonça (v1)
# 09/2015 Vincent Labatut (v2)
# 04/2019 Nejat Arinik
#############################################################################################


#############################################################################################
# Folders
#############################################################################################
# main folder
#MAIN.FOLDER <- "."
MAIN.FOLDER <- "/home/samuel/MultiNetVotes"
# external libraries folder
LIB.FOLDER <- file.path(MAIN.FOLDER,"lib")
# general input folder
IN.FOLDER <- file.path(MAIN.FOLDER,"in")
	# folder containing the score matrices
	SCORE.FOLDER <- file.path(IN.FOLDER,"score")
# general ouput folder
OUT.FOLDER <- file.path(MAIN.FOLDER,"out")
	# output folder for everything not network-related
	OVERALL.FOLDER <- file.path(IN.FOLDER,"_overall")
	# output folder for the domain-related overall files
	DOMAINS.FOLDER <- file.path(OVERALL.FOLDER,"_domains")
	# output folder for the MEP-related overall files
	MEPS.FOLDER <- file.path(OVERALL.FOLDER,"_meps")
	# PILS folder (temporary)
	PILS.FOLDER <- file.path(OUT.FOLDER,"pils")
	# folder containing the vote stats
	VOTES.FOLDER <- file.path(OUT.FOLDER,"votes")
	# folder containing the MEP behavior stats
	BEHAVIOR.FOLDER <- file.path(OUT.FOLDER,"behavior")
	# folder containing the turnout stats
	TURNOUT.FOLDER <- file.path(OUT.FOLDER,"turnout")
	# folder containing the agreement measures
	AGREEMENT.FOLDER <- file.path(OUT.FOLDER,"agreement")
	# folder containing the extracted networks
	NETWORKS.FOLDER <- file.path(OUT.FOLDER,"networks")
	# folder containing the estimated partitions
	PARTITIONS.FOLDER <- file.path(OUT.FOLDER,"partitions")
	
	# folder containing the rollcall-wise networks
	ROLLCALL.NETWORKS.FOLDER <- file.path(OUT.FOLDER,"rollcall-networks")
	# folder containing the partitions corresponding to the rollcall-wise networks
	ROLLCALL.PARTITIONS.FOLDER <- file.path(OUT.FOLDER,"rollcall-partitions")
	
	# folder containing the partitions corresponding to the rollcall-wise networks
	ROLLCALL.CLUSTERING.FOLDER <- file.path(OUT.FOLDER,"rollcall-clustering")

	
	
		
#############################################################################################
# Files
#############################################################################################
## overall tables created during the preprocessing
	ALL.VOTES.FILE		<- file.path(OVERALL.FOLDER,"all-votes.csv")
	ROLCALL.DETAILS.FILE	<- file.path(OVERALL.FOLDER,"rollcall-details.csv")
	GROUP.LINES.FILE	<- file.path(OVERALL.FOLDER,"group-lines.csv")
	MEP.DETAILS.FILE	<- file.path(OVERALL.FOLDER,"mep-details.csv")
	MEP.BEHAVIOR.FILE	<- file.path(OVERALL.FOLDER,"mep-behavior.csv")
	DOMAIN.DETAILS.FILE <- file.path(OVERALL.FOLDER,"dom-details.csv")
	ROLLCALL.DOMAINS.FILE 	<- file.path(OVERALL.FOLDER,"rollcall-domains.csv")
# graph files
	SIGNED.FILE <- "signed"
	UNSIGNED.FILE <- "unsigned"
	POSITIVE.FILE <- "positive"
	COMP.NEGATIVE.FILE <- "compneg"
# partitioning related files 
	EXEC.TIME.FILENAME = "exec-time.txt"
# roll-call clustering related files
	SILH.SCORES.FILE.PREFIX = "silhouette-scores"
	SIM.MATRIX.FILE.PREFIX = "sim-matrix"


#############################################################################################
# Table column names
#############################################################################################
## raw data
COL.BIRTHDATE 	<- "Birth date"
COL.BIRTHPLACE 	<- "Birth place"
COL.COUNT		<- "Count"
COL.DATE		<- "Date"
COL.ROLLCALL.ID	<- "Rollcall Id"
COL.DOMAIN		<- "Domain"
COL.DOMID		<- "Domain Id"
COL.EP.ID 		<- "EP Id"			# official EP id of the MEP
COL.FIRSTNAME	<- "Firstname"
COL.FREQUENCY	<- "Frequency"
COL.FULLNAME	<- "Full name"
COL.GENDER		<- "Gender"
COL.GROUP		<- "Group"
COL.LASTNAME	<- "Lastname"
COL.MEPID		<- "MEP Id"			# EP id of the MEP, internal to NetVotes
COL.PARTY 		<- "Party"
COL.PERCENT		<- "Percent"
COL.RESULT		<- "Vote result"
COL.STATE		<- "State"
COL.TITLE		<- "Title"
COL.VOTE		<- "Vote"
COL.DOC.REF<- "Document Reference"
COL.FULL.TITLE	<- "Full title"
COL.EP.REF		<- "EP reference"
COL.REPORTER.ID	<- "Reporter ID"
COL.EP.URL		<- "EP URL"
COL.PERIODS		<- "Periods"
COL.RET.TITLE	<- "Retrieved title"
COL.EU.REGION	<- "Region"

COL.THEME.NAME 	<- "Theme Name"
COL.THEME.ID 	<- "Theme Id"
COL.IS.AMEND 	<- "isAmendment"
COL.EUROVOC 	<- "EuroVoc"
COL.EURLEX.CODE <- "EurLexDirCode"

# TODO MepGlobalId



#############################################################################################
# Roll-call clustering related variables
#############################################################################################
KMEDOIDS = "kmedoids"
COL.SILH.WIDTH = "sil_width"
COL.AVG.SILH = "avg.sil.score"
COL.K = "k"
COL.PARTITION = "partition"

#############################################################################################
# Vote values
#############################################################################################
VOTE.VALUES <- c()
VOTE.VALUES.SMPL <- c()
VOTE.FOR <- "For"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.FOR)
	VOTE.VALUES.SMPL <- c(VOTE.VALUES.SMPL,VOTE.FOR)
VOTE.ABST <- "Abstention"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.ABST)
VOTE.AGST <- "Against"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.AGST)
	VOTE.VALUES.SMPL <- c(VOTE.VALUES.SMPL,VOTE.AGST)
VOTE.NONE <- "NoVote"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.NONE)
VOTE.ABSENT <- "Absent"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.ABSENT)
VOTE.DOCABSENT <- "DocAbsent"
	VOTE.VALUES <- c(VOTE.VALUES, VOTE.DOCABSENT)
VOTE.OTHER <- "Other"
	VOTE.VALUES.SMPL <- c(VOTE.VALUES.SMPL,VOTE.OTHER)
VOTE.EXPRESSED <- "For/Against" # this is used just when dealing with turnouts

UNAVAILABLE.MEP.VOTE.ABSENT = "UNAVAILABLE"


#############################################################################################
# Behavior values
#############################################################################################
BEHAVIOR.VALUES <- c()
BEHAVIOR.LOYAL = "Loyal"
BEHAVIOR.VALUES <- c(BEHAVIOR.VALUES, BEHAVIOR.LOYAL)
BEHAVIOR.REBEL = "Rebel"
BEHAVIOR.VALUES <- c(BEHAVIOR.VALUES, BEHAVIOR.REBEL)


#############################################################################################
# Normalized policy domain names
#############################################################################################
DOMAIN.VALUES <- c()
DOMAIN.FULLNAMES <- c()
DOMAIN.ALL <- "_All"
DOMAIN.AFCO <- "AFCO"
	DOMAIN.FULLNAMES[DOMAIN.AFCO] <- "Constitutional Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.AFCO)
DOMAIN.AFET <- "AFET"
	DOMAIN.FULLNAMES[DOMAIN.AFET] <- "Foreign Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.AFET)
	#DOMAIN.DROI <- "DROI"
		#DOMAIN.FULLNAMES[DOMAIN.DROI] <- "Human Rights"
		#DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.DROI)
	#DOMAIN.SEDE <- "SEDE"
		#DOMAIN.FULLNAMES[DOMAIN.SEDE] <- "Security and Defence"
		#DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.SEDE)
DOMAIN.AGRI <- "AGRI"
	DOMAIN.FULLNAMES[DOMAIN.AGRI] <- "Agriculture and Rural Development"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.AGRI)
DOMAIN.BUDG <- "BUDG"
	DOMAIN.FULLNAMES[DOMAIN.BUDG] <- "Budgets"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.BUDG)
DOMAIN.CONT <- "CONT"
	DOMAIN.FULLNAMES[DOMAIN.CONT] <- "Budgetary Control"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.CONT)
DOMAIN.CULT <- "CULT"
	DOMAIN.FULLNAMES[DOMAIN.CULT] <- "Culture and Education"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.CULT)
DOMAIN.DEVE <- "DEVE"
	DOMAIN.FULLNAMES[DOMAIN.DEVE] <- "Development"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.DEVE)
DOMAIN.ECON <- "ECON"
	DOMAIN.FULLNAMES[DOMAIN.ECON] <- "Economic and Monetary Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.ECON)
DOMAIN.EMPL <- "EMPL"
	DOMAIN.FULLNAMES[DOMAIN.EMPL] <- "Employment and Social Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.EMPL)
DOMAIN.ENVI <- "ENVI"
	DOMAIN.FULLNAMES[DOMAIN.ENVI] <- "Environment, Public Health and Food Safety"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.ENVI)
DOMAIN.FEMM <- "FEMM"
	DOMAIN.FULLNAMES[DOMAIN.FEMM] <- "Women's Rights and Gender Equality"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.FEMM)
DOMAIN.IMCO <- "IMCO"
	DOMAIN.FULLNAMES[DOMAIN.IMCO] <- "Internal Market and Consumer Protection"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.IMCO)
DOMAIN.INTA <- "INTA"
	DOMAIN.FULLNAMES[DOMAIN.INTA] <- "International Trade"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.INTA)
DOMAIN.ITRE <- "ITRE"
	DOMAIN.FULLNAMES[DOMAIN.ITRE] <- "Industry, Research and Energy"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.ITRE)
DOMAIN.JURI <- "JURI"
	DOMAIN.FULLNAMES[DOMAIN.JURI] <- "Legal Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.JURI)
DOMAIN.LIBE <- "LIBE"
	DOMAIN.FULLNAMES[DOMAIN.LIBE] <- "Civil Liberties, Justice and Home Affairs"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.LIBE)
DOMAIN.PECH <- "PECH"
	DOMAIN.FULLNAMES[DOMAIN.PECH] <- "Fisheries"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.PECH)
DOMAIN.PETI <- "PETI"
	DOMAIN.FULLNAMES[DOMAIN.PETI] <- "Petitions"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.PETI)
DOMAIN.REGI <- "REGI"
	DOMAIN.FULLNAMES[DOMAIN.REGI] <- "Regional Development"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.REGI)
DOMAIN.RIPE <- "RIPE"
	DOMAIN.FULLNAMES[DOMAIN.RIPE] <- "Internal regulations of the EP"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.RIPE)
DOMAIN.TRAN <- "TRAN"
	DOMAIN.FULLNAMES[DOMAIN.TRAN] <- "Transport and Tourism"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.TRAN)
DOMAIN.AUTR <- "AUTR"
	DOMAIN.FULLNAMES[DOMAIN.AUTR] <- "Other domains"
	DOMAIN.VALUES <- c(DOMAIN.VALUES,DOMAIN.AUTR)
	

#############################################################################################
# Temporal constants
#############################################################################################
# TODO We might need to adapt that, these years seem quite arbitrary.
# Maybe switch to a sliding window based on plenary sessions.
DATE.STR.T7 <- c()
DATE.START.T7 <- list()
DATE.END.T7 <- list()
DATE.T7.Y1 <- "DATE.T7.Y1"
	DATE.START.T7[[DATE.T7.Y1]] 	<- as.Date("2016-03-23","%Y-%m-%d")
	DATE.END.T7[[DATE.T7.Y1]] 		<- as.Date("2016-07-07","%Y-%m-%d")
	DATE.STR.T7[DATE.T7.Y1] <- "2016-16"
DATE.T7.Y2 <- "DATE.T7.Y2"
	DATE.START.T7[[DATE.T7.Y2]] 	<- as.Date("2016-09-06","%Y-%m-%d")
	DATE.END.T7[[DATE.T7.Y2]] 		<- as.Date("2017-06-21","%Y-%m-%d")
	DATE.STR.T7[DATE.T7.Y2] <- "2016-17"
DATE.T7.Y3 <- "DATE.T7.Y3"
	DATE.START.T7[[DATE.T7.Y3]] 	<- as.Date("2017-09-05","%Y-%m-%d")
	DATE.END.T7[[DATE.T7.Y3]]		<- as.Date("2018-06-25","%Y-%m-%d")
	DATE.STR.T7[DATE.T7.Y3] <- "2017-18"
DATE.T7.Y4 <- "DATE.T7.Y4"
	DATE.START.T7[[DATE.T7.Y4]] 	<- as.Date("2018-09-05","%Y-%m-%d")
	DATE.END.T7[[DATE.T7.Y4]] 		<- as.Date("2019-06-27","%Y-%m-%d")
	DATE.STR.T7[DATE.T7.Y4] <- "2018-19"
DATE.T7.Y5 <- "DATE.T7.Y5"
	DATE.START.T7[[DATE.T7.Y5]] 	<- as.Date("2019-09-04","%Y-%m-%d")
	DATE.END.T7[[DATE.T7.Y5]] 		<- as.Date("2020-02-26","%Y-%m-%d")
	DATE.STR.T7[DATE.T7.Y5] <- "2019-20"
DATE.T7.TERM <- "DATE.T7.TERM"
	DATE.START.T7[[DATE.T7.TERM]]	<- DATE.START.T7[[DATE.T7.Y1]]
	DATE.END.T7[[DATE.T7.TERM]] 	<- DATE.END.T7[[DATE.T7.Y5]]
	DATE.STR.T7[DATE.T7.TERM] <- "Term"
DATE.T7.YEARS <- c(DATE.T7.Y1,DATE.T7.Y2,DATE.T7.Y3,DATE.T7.Y4,DATE.T7.Y5)


#############################################################################################
# Political groups (normalized names)
#############################################################################################
GROUP.VALUES <- c()
GROUP.FULLNAMES <- c()
GROUP.SMER <- "SMER"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.SMER)
	GROUP.FULLNAMES[GROUP.SMER] <- "SMER – sociálna demokracia"
GROUP.SNS <- "SNS"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.SNS)
	GROUP.FULLNAMES[GROUP.SNS] <- "Slovenská národná strana"
GROUP.SIET <- "#SIEŤ"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.SIET)
	GROUP.FULLNAMES[GROUP.SIET] <- "#SIEŤ"
GROUP.OLANO <- "OĽANO"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.OLANO)
	GROUP.FULLNAMES[GROUP.OLANO] <- "OBYČAJNÍ ĽUDIA a nezávislé osobnosti (OĽANO-NOVA)"
GROUP.MOST <- "MOST-HÍD"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.MOST)
	GROUP.FULLNAMES[GROUP.MOST] <- "MOST-HÍD"
GROUP.SAS <- "SaS"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.SAS)
	GROUP.FULLNAMES[GROUP.SAS] <- "Sloboda a Solidarita"
GROUP.LSNS <- "ĽSNS"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.LSNS)
	GROUP.FULLNAMES[GROUP.LSNS] <- "Kotleba - Ľudová strana Naše Slovensko"
GROUP.SMERODINA <- "SME RODINA"
	GROUP.VALUES <- c(GROUP.VALUES, GROUP.SMERODINA)
	GROUP.FULLNAMES[GROUP.SMERODINA] <- "SME RODINA - Boris Kollár"



# create a list which contains political group names and their associated ids
GROUP.VALUES.BY.ID = seq(1:length(GROUP.VALUES))
POLITICAL.GROUP.SHAPE.ASS = lapply(GROUP.VALUES.BY.ID, function(id) id)
names(POLITICAL.GROUP.SHAPE.ASS) = GROUP.VALUES # in alphabetic order
#		"political.group.shape.ass":
#		$ALDE		$ECR		$EFD		$EPP		$Greens		$GUENGL		$NI		$SD
#		[1] 1		[1] 2		[1] 3		[1] 4		[1] 5		[1] 6		[1] 7	[1] 8



#############################################################################################
# Country names (using ISO codes)
#############################################################################################
COUNTRY.VALUES <- c()
COUNTRY.SHORTNAMES <- c()
COUNTRY.BB <- "Banskobystrický"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.BB)
	COUNTRY.SHORTNAMES[COUNTRY.BB] <- "BB"
COUNTRY.BA <- "Bratislavský"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.BA)
	COUNTRY.SHORTNAMES[COUNTRY.BA] <- "BA"
COUNTRY.KE <- "Košický"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.KE)
	COUNTRY.SHORTNAMES[COUNTRY.KE] <- "KE"
COUNTRY.NR <- "Nitriansky"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.NR)
	COUNTRY.SHORTNAMES[COUNTRY.NR] <- "NR"
COUNTRY.PO <- "Prešovský"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.PO)
	COUNTRY.SHORTNAMES[COUNTRY.PO] <- "PO"
COUNTRY.TN <- "Trenčiansky"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.TN)
	COUNTRY.SHORTNAMES[COUNTRY.TN] <- "TN"
COUNTRY.TT <- "Trnavský"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.TT)
	COUNTRY.SHORTNAMES[COUNTRY.TT] <- "TT"
COUNTRY.ZA <- "Žilinský"
	COUNTRY.VALUES <- c(COUNTRY.VALUES, COUNTRY.ZA)
	COUNTRY.SHORTNAMES[COUNTRY.ZA] <- "ZA"



	
	
#############################################################################################
# Region list
#############################################################################################	
EU.REGION.FOR.STATE = list()
EU.REGION.FOR.STATE[[COUNTRY.BB]] = "Central"
EU.REGION.FOR.STATE[[COUNTRY.BA]] = "Western"
EU.REGION.FOR.STATE[[COUNTRY.KE]] = "Eastern"
EU.REGION.FOR.STATE[[COUNTRY.NR]] = "Western"
EU.REGION.FOR.STATE[[COUNTRY.PO]] = "Eastern"
EU.REGION.FOR.STATE[[COUNTRY.TN]] = "Western"
EU.REGION.FOR.STATE[[COUNTRY.TT]] = "Western"
EU.REGION.FOR.STATE[[COUNTRY.ZA]] = "Central"


	
	
#############################################################################################
# Partition measures for signed networks
#############################################################################################
GROUP.MEAS.VALUES <- c()
GROUP.MEAS.NAMES <- c()
GROUP.MEAS.MEAS <- list()
CORCLU.MEAS.VALUES <- c()
CORCLU.MEAS.NAMES <- c()
CORCLU.MEAS.BOUNDS <- list() #returns the inf and sup bounds of the measure
	# unweighted counts
	CORCLU.MEAS.IMB.UNW.CNT.NEG <- "unIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.CNT.NEG)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.CNT.NEG] <- "Unweighted Negative Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.CNT.NEG]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,length(E(g)$weight[E(g)$weight<0]))
	CORCLU.MEAS.IMB.UNW.CNT.POS <- "upIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.CNT.POS)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.CNT.POS] <- "Unweighted Positive Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.CNT.POS]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,length(E(g)$weight[E(g)$weight>=0]))
	CORCLU.MEAS.IMB.UNW.CNT.TOTAL <- "utIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.CNT.TOTAL)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.CNT.TOTAL] <- "Unweighted Total Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.CNT.TOTAL]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,length(E(g)$weight))
	CORCLU.MEAS.IMB.UNW.CNT <- "uIc"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.CNT)
	GROUP.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.CNT] <- "Unweighted Imbalance (counts)"
	GROUP.MEAS.MEAS[[CORCLU.MEAS.IMB.UNW.CNT]] <- c(CORCLU.MEAS.IMB.UNW.CNT.NEG,CORCLU.MEAS.IMB.UNW.CNT.POS,CORCLU.MEAS.IMB.UNW.CNT.TOTAL)
	# weighted counts
	CORCLU.MEAS.IMB.WGT.CNT.NEG <- "wnIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.CNT.NEG)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.CNT.NEG] <- "Weighted Negative Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.CNT.NEG]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,sum(abs(E(g)$weight[E(g)$weight<0])))
	CORCLU.MEAS.IMB.WGT.CNT.POS <- "wpIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.CNT.POS)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.CNT.POS] <- "Weighted Positive Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.CNT.POS]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,sum(abs(E(g)$weight[E(g)$weight>=0])))
	CORCLU.MEAS.IMB.WGT.CNT.TOTAL <- "wtIc"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.CNT.TOTAL)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.CNT.TOTAL] <- "Weighted Total Imbalance (count)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.CNT.TOTAL]] <- function(g) if(all(is.na(g))) c(0,NA) else c(0,sum(abs(E(g)$weight)))
	CORCLU.MEAS.IMB.WGT.CNT <- "wIc"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.CNT)
	GROUP.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.CNT] <- "Weighted Imbalance (counts)"
	GROUP.MEAS.MEAS[[CORCLU.MEAS.IMB.WGT.CNT]] <- c(CORCLU.MEAS.IMB.WGT.CNT.NEG,CORCLU.MEAS.IMB.WGT.CNT.POS,CORCLU.MEAS.IMB.WGT.CNT.TOTAL)
	# unweighted proportions
	CORCLU.MEAS.IMB.UNW.PROP.NEG <- "unIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.PROP.NEG)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.PROP.NEG] <- "Unweighted Negative Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.PROP.NEG]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.UNW.PROP.POS <- "upIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.PROP.POS)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.PROP.POS] <- "Unweighted Positive Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.PROP.POS]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.UNW.PROP.TOTAL <- "utIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.PROP.TOTAL)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.PROP.TOTAL] <- "Unweighted Total Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.UNW.PROP.TOTAL]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.UNW.PROP <- "uIp"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, CORCLU.MEAS.IMB.UNW.PROP)
	GROUP.MEAS.NAMES[CORCLU.MEAS.IMB.UNW.PROP] <- "Unweighted Imbalance (prop.)"
	GROUP.MEAS.MEAS[[CORCLU.MEAS.IMB.UNW.PROP]] <- c(CORCLU.MEAS.IMB.UNW.PROP.NEG,CORCLU.MEAS.IMB.UNW.PROP.POS,CORCLU.MEAS.IMB.UNW.PROP.TOTAL)
	# weighted proportions
	CORCLU.MEAS.IMB.WGT.PROP.NEG <- "wnIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.PROP.NEG)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.PROP.NEG] <- "Weighted Negative Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.PROP.NEG]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.WGT.PROP.POS <- "wpIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.PROP.POS)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.PROP.POS] <- "Weighted Positive Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.PROP.POS]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.WGT.PROP.TOTAL <- "wtIp"
	CORCLU.MEAS.VALUES <- c(CORCLU.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.PROP.TOTAL)
	CORCLU.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.PROP.TOTAL] <- "Weighted Total Imbalance (prop.)"
	CORCLU.MEAS.BOUNDS[[CORCLU.MEAS.IMB.WGT.PROP.TOTAL]] <- function(g) c(0,1)
	CORCLU.MEAS.IMB.WGT.PROP <- "wIp"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, CORCLU.MEAS.IMB.WGT.PROP)
	GROUP.MEAS.NAMES[CORCLU.MEAS.IMB.WGT.PROP] <- "Weighted Imbalance (prop.)"
	GROUP.MEAS.MEAS[[CORCLU.MEAS.IMB.WGT.PROP]] <- c(CORCLU.MEAS.IMB.WGT.PROP.NEG,CORCLU.MEAS.IMB.WGT.PROP.POS,CORCLU.MEAS.IMB.WGT.PROP.TOTAL)
PART.MEAS.VALUES <- CORCLU.MEAS.VALUES
PART.MEAS.NAMES <- CORCLU.MEAS.NAMES
PART.MEAS.BOUNDS <- CORCLU.MEAS.BOUNDS	


	
#############################################################################################
# Partition measures for unsigned networks
#############################################################################################
COMDET.MEAS.VALUES <- c()
COMDET.MEAS.NAMES <- c()
COMDET.MEAS.BOUNDS <- list()
	# unweighted modularity
	COMDET.MEAS.MOD.UNW.NEG <- "unM"
	COMDET.MEAS.VALUES <- c(COMDET.MEAS.VALUES, COMDET.MEAS.MOD.UNW.NEG)
	COMDET.MEAS.NAMES[COMDET.MEAS.MOD.UNW.NEG] <- "Unweighted negative modularity"
	COMDET.MEAS.BOUNDS[[COMDET.MEAS.MOD.UNW.NEG]] <- function(g) c(-0.5,1)
	COMDET.MEAS.MOD.UNW.POS <- "upM"
	COMDET.MEAS.VALUES <- c(COMDET.MEAS.VALUES, COMDET.MEAS.MOD.UNW.POS)
	COMDET.MEAS.NAMES[COMDET.MEAS.MOD.UNW.POS] <- "Unweighted positive modularity"
	COMDET.MEAS.BOUNDS[[COMDET.MEAS.MOD.UNW.POS]] <- function(g) c(-0.5,1)
	COMDET.MEAS.MOD.UNW <- "uM"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, COMDET.MEAS.MOD.UNW)
	GROUP.MEAS.NAMES[COMDET.MEAS.MOD.UNW] <- "Unweighted Modularity"
	GROUP.MEAS.MEAS[[COMDET.MEAS.MOD.UNW]] <- c(COMDET.MEAS.MOD.UNW.NEG,COMDET.MEAS.MOD.UNW.POS)
	# weighted modularity
	COMDET.MEAS.MOD.WGT.NEG <- "wnM"
	COMDET.MEAS.VALUES <- c(COMDET.MEAS.VALUES, COMDET.MEAS.MOD.WGT.NEG)
	COMDET.MEAS.NAMES[COMDET.MEAS.MOD.WGT.NEG] <- "Weighted negative modularity"
	COMDET.MEAS.BOUNDS[[COMDET.MEAS.MOD.WGT.NEG]] <- function(g) c(-0.5,1)
	COMDET.MEAS.MOD.WGT.POS <- "wpM"
	COMDET.MEAS.VALUES <- c(COMDET.MEAS.VALUES, COMDET.MEAS.MOD.WGT.POS)
	COMDET.MEAS.NAMES[COMDET.MEAS.MOD.WGT.POS] <- "Weighted positive modularity"
	COMDET.MEAS.BOUNDS[[COMDET.MEAS.MOD.WGT.POS]] <- function(g) c(-0.5,1)
	COMDET.MEAS.MOD.WGT <- "wM"
	GROUP.MEAS.VALUES <- c(GROUP.MEAS.VALUES, COMDET.MEAS.MOD.WGT)
	GROUP.MEAS.NAMES[COMDET.MEAS.MOD.WGT] <- "Weighted Modularity"
	GROUP.MEAS.MEAS[[COMDET.MEAS.MOD.WGT]] <- c(COMDET.MEAS.MOD.WGT.NEG,COMDET.MEAS.MOD.WGT.POS)
PART.MEAS.VALUES <- c(PART.MEAS.VALUES,COMDET.MEAS.VALUES)
PART.MEAS.NAMES <- c(PART.MEAS.NAMES,COMDET.MEAS.NAMES)
PART.MEAS.BOUNDS <- c(PART.MEAS.BOUNDS,COMDET.MEAS.BOUNDS)


