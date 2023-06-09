#############################################################################################
# Generate graph objects and files using the agreement index values processed separately. 
# This script file is used for extracting a network from mutliple roll-call data. Because,
#	it handles the filtering step, if needed.
# 
# 07/2015 Israel Mendonça (v1)
# 11/2015 Vincent Labatut (v2)
# 04/2019 Nejat Arinik
#############################################################################################
library("igraph")

source("src/define-constants.R")
source("src/plot-tools/plot-networks.R")
source("src/prepare-data/filter-data.R")



#############################################################################################
# Generates the graph file (signed or unsigned version) for the specified data and parameters. The fonction record the
# graph using the Graphml format, as well as a format compatible with the pILS algorithm.
# 
# agreement: agreement indices for the considered MEPs.
# mep.details: MEP details, only for the considered MEPs.
# thresh: vector containing a inf and a sup thresholds. All agreement values between them are
#		  set to zero (i.e. ignored). A value NA for one threshold means it is estimated automatically.
#		  Value (0,0) means no thresholding at all.
# folder: folder (and beginning of the filename) for the produced graph files.
# graph.name: name of the graph in the graphml file.
# plot.formats: formats of the plot files.
#############################################################################################
extract.network <- function(agreement, mep.details, absences=NA, abstentions=NA, thresh=NA, folder, graph.name, plot.formats)
{	tlog("......Building network folder='",folder,"'")
	
	# replace NAs by zeros
	agreement[is.na(agreement)] <- 0
	
	# possibly estimate thresholds using k-means
	if(length(thresh)==1)
		thresh <- c(NA,NA)

	# splitting the negative weights
	if(is.na(thresh[1]))
	{	agr.vals <- agreement[upper.tri(agreement,diag=FALSE)]
		agr.vals <- agr.vals[agr.vals<0]
		if(length(unique(agr.vals))>2)
		{	#print(agr.vals)
			km <- kmeans(agr.vals,centers=2)
			bnds <- sapply(1:2, function(c) min(agr.vals[km$cluster==c]))
			thresh[1] <- max(bnds)
		}
		else
			thresh[1] <- 0
	}
	# splitting the positive weights
	if(is.na(thresh[2]))
	{	agr.vals <- agreement[upper.tri(agreement,diag=FALSE)]
		agr.vals <- agr.vals[agr.vals>0]
		if(length(unique(agr.vals))>2)
		{	#print(agr.vals)
			km <- kmeans(agr.vals,centers=2)
			bnds <- sapply(1:2, function(c) max(agr.vals[km$cluster==c]))
			thresh[2] <- min(bnds)
		}
		else
			thresh[2] <- 0
	}
	
	# filter agreement values
	agreement[agreement>=thresh[1] & agreement<=thresh[2]] <- 0
	
	
	# build network using igraph
	result <- graph.adjacency(adjmatrix=agreement, 		# use the agreement as the adjacency matrix
		mode="undirected", weighted=TRUE, diag=FALSE,	# ignore the diagonal of the agreement matrix
		add.colnames=NA, add.rownames="MEPid")			# use the id as node names
	result$name <- graph.name
	
	# check if network is empty
	if(ecount(result)==0)
		tlog("........WARNING: the signed graph contains no links >> not recorded")
	
	# if not empty (i.e. contains links)
	else
	{	# add MEP attributes
#		V(result)$Firstname <- mep.details[,COL.FIRSTNAME]
		firstnames <- iconv(mep.details[,COL.FIRSTNAME], to='ASCII//TRANSLIT')
		V(result)$Firstname <- firstnames		
#		V(result)$Lastname <- mep.details[,COL.LASTNAME]
		lastnames <- iconv(mep.details[,COL.LASTNAME], to='ASCII//TRANSLIT')
		V(result)$Lastname <- lastnames
		V(result)$Country <- mep.details[,COL.STATE]
		V(result)$Group <- mep.details[,COL.GROUP]
		V(result)$Region <- mep.details[,COL.EU.REGION]
		V(result)$MepGlobalId <- mep.details[,COL.MEPID]
		

#		result <- suppressWarnings(read.graph(file=file.path(folder,paste0(SIGNED.FILE,".graphml")), format="graphml"))

		#graph.base <- file.path(folder,SIGNED.FILE)
#		# plot graph and get spatial positions as nodal attributes
#		tlog("........Plotting network...")
#		result <- plot.network(g=result, plot.file=graph.base, format=plot.formats)
		
		
		# export the graph under the graphml format
		graph.file <- paste0(graph.name,".graphml")
		write.graph(graph=result, file=file.path(folder,graph.file), format="graphml")
		
		# also export the positive graph as an unsigned graph (when the original graph is signed)
		if(graph.name == SIGNED.FILE){	
			gp <- subgraph.edges(graph=result, eids=which(E(result)$weight>0), delete.vertices=FALSE)
			if(ecount(gp)==0)
				tlog("........WARNING: the positive graph does not contain any link >> not recorded")
			else
			{	graph.file <- file.path(folder,paste0(POSITIVE.FILE,".graphml"))
				write.graph(graph=gp, file=graph.file, format="graphml")
			}
		}
		
		# export using a format compatible with pILS
		t <- get.edgelist(graph=result) - 1	# start numbering nodes at zero
		t <- cbind(t,E(result)$weight)		# add weights as the third column
		graph.file <- paste0(graph.name,".G")
		write.table(data.frame(nrow(mep.details),nrow(t)), file=file.path(folder,graph.file), append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)	# write header
		write.table(t, file=file.path(folder,graph.file), append=TRUE, sep="\t", row.names=FALSE, col.names=FALSE)										# write proper graph
		
	}
}


#############################################################################################
# Generates all possible networks for all time periods and domains, for the specified thresholds 
# and agreement scores. 
#
# mep.details: description of each MEP.
# thresh: vector containing a inf and a sup thresholds. All agreement values between them are
#		  set to zero (i.e. ignored). A value NA for one threshold means it is estimated automatically.
#		  Value (0,0) means no thresholding at all.
# score.file: files describing the scores to use when processing the inter-MEP agreement
#			  (without the .txt extension).
# domains: political domains to consider when processing the data.
# dates: time periods to consider when processing the data.
# country: member state currently processed (or NA if none in particular).
# group: political gorup currently processed (or NA if none in particular).
# plot.formats: formats of the plot files.
#############################################################################################
extract.networks <- function(mep.details, thresh=NA, score.file, domains, dates, country, group, plot.formats)
{	# setup graph title
	if(is.na(country))
		if(is.na(group))
			mode.str <- ""
		else
			mode.str <- paste0(" - group=",group)
	else
		mode.str <- paste0(" - country=",country)
	base.graph.name <- paste0("MEP agreement - score=",score.file,mode.str)
	
	# consider each domain individually (including all domains at once)
#	for(dom in domains)
	foreach(dom=domains) %dopar% 
	{	source("src/define-imports.R")
		
		# setup agreement folder
		agr.folder <- get.agreement.path(score=score.file,country,group,domain=dom)
		
		# consider each time period (each individual year as well as the whole term)
		for(date in dates)
		{	tlog("....Extracting network for domain ",dom," and period ",DATE.STR.T7[date])
			
			# setup graph title
			graph.name <- paste0(base.graph.name," - domain=",dom," - period=",DATE.STR.T7[date],
					" - neg.tresh=",thresh[1]," - pos.tresh=",thresh[2])
			folder <- get.networks.path(score=score.file,thresh,country,group,domain=dom,period=date)
			dir.create(folder, recursive=TRUE, showWarnings=FALSE)
			
			# load agreement index file
			table.file <- file.path(agr.folder,paste0(DATE.STR.T7[date],"-agreement.csv"))
			if(!file.exists(table.file))
				tlog("......WARNING: Agreement file ",table.file," not found >> not necessarily an error: maybe not enough data to process agreement")
			else
			{	# retrieve agreement
				agreement <- as.matrix(read.csv2(file=table.file, row.names=1))
				mep.ids <- as.integer(rownames(agreement))
				idx <- match(mep.ids,mep.details[,COL.MEPID])
				# build and record network
				extract.network(agreement, mep.details[idx,], absences=NA, thresh, folder, graph.name, plot.formats)
			}
		}
	}
}


#############################################################################################
# Generates all networks for the whole dataset, by country and by political group, for the 
# specified thresholds and agreement scores. 
#
# mep.details: description of each MEP.
# thresh: vector containing a inf and a sup thresholds. All agreement values between them are
#		  set to zero (i.e. ignored). A value NA for one threshold means it is estimated automatically.
#		  Value (0,0) means no thresholding at all.
# domains: political domains to consider when processing the data.
# dates: time periods to consider when processing the data.
# everything: whether to process all data without distinction of country or political group.
# countries: member states to consider separately when processing the data.
# groups: political groups to consider separately when processing the data.
# plot.formats: formats of the plot files.
#############################################################################################
extract.all.networks <- function(mep.details, thresh=NA, score.file, domains, dates, everything, countries, groups, plot.formats)
{	tlog("***************************************************")
	tlog("****** EXTRACTING NETWORKS")
	tlog("***************************************************")
	
	# extract networks for all data
	if(everything)
	{	tlog("..Extract networks for all data")
		extract.networks(mep.details, thresh, score.file, domains, dates, country=NA, group=NA, plot.formats)
	}
	
	# networks by political group
	tlog("..Extract networks by group")
	for(group in groups)
	{	tlog("....Extract networks for group ",group)
		
		# select data
		filtered.mep.ids <- filter.meps.by.group(mep.details,group)
		idx <- match(filtered.mep.ids,mep.details[,COL.MEPID])
		grp.meps <- mep.details[idx,]
		
		# extract networks
		extract.networks(grp.meps, thresh, score.file, domains, dates, country=NA, group, plot.formats)
	}
	
	# networks by home country
	tlog("..Extract networks by country")
	for(country in countries)
	{	tlog("....Extract networks for country ",country)
		
		# select data
		filtered.mep.ids <- filter.meps.by.country(mep.details,country)
		idx <- match(filtered.mep.ids,mep.details[,COL.MEPID])
		cntr.meps <- mep.details[idx,]
		
		# extract networks
		extract.networks(cntr.meps, thresh, score.file, domains, dates, country, group=NA, plot.formats)
	}
}
