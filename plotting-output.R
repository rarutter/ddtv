#!/usr/bin/env Rscript

# Copyright 2013 
# Mostly Helene Genet & Colin Tucker, with some touchups by Tobey Carman
# Spatial Ecology Lab
# University of Alaska Fairbanks

# This script is designed to ...
# inputs...
# outputs...

library(argparse)

d <- paste('This script reads a whole bunch of csv files that were generated',
           'with output-extract.R. This script plots the variables and places',
           'the resulting plots in a folder (identified by the "--output-id"',
           'option).', sep=' ')
parser <- ArgumentParser(description=d)
                          # Looks like some of the fancier options like the
                          # formatter_class are not available yet...
                         
h <- paste('A path (absolute or relative) to a directory of csv files that',
           'were generated using output-extract.R.', sep=' ')
            
parser$add_argument('--generated-csv-dir', required=TRUE, 
                    metavar='PATH', help=h)

parser$add_argument('--run-mode', default='all', metavar='M', nargs='+',
                    help='Which run mode you are processing. (default: all)')

h <- paste('A unique name to identify this set of generated plots (pdfs)',
           'All the generated plots will end up in a folder with this name in',
           'the current directory (wherever you call this script from).', 
           sep=' ')
parser$add_argument('--output-id', metavar='ID', help=h)
       
args <- parser$parse_args()             

# save the location the script was called from...
callingdir <- getwd()

# working directory
print("Setting the working directory...")
setwd(args$generated_csv_dir)

# ENTER MODEL VERSION == subdirectory to output to
print("Setting up the directory we will output pdfs into...")
dir.create(file.path(callingdir, args$output_id))

#Store which runmode to process
run <- args$run_mode
index <- 1 #To allow for easy looping through runmodes in the future.

# --- N CYCLE PLOTS ---
pdf(file.path(callingdir, args$output_id, "Ncycle.pdf"))
par(mfrow=c(3,4), oma=c(0.1,0.1,0,0), mai=c(.3,.3,.25,.25), cex.main=0.9, cex.axis=0.75)
fname<-paste('./bgc_yly_NMOBIL_',run[index],'.csv',sep='')
nmob<-read.csv(fname)
plot(nmob[102:2081,2],nmob[102:2081,4], type="l", xlab="", ylab="", main="Nmobile")

fname<-paste('./bgc_yly_NRESORB_',run[index],'.csv',sep='')
#nreso<-read.csv('./bgc_yly_NRESORB_all.csv')
nreso<-read.csv(fname)
plot(nreso[102:2081,2],nreso[102:2081,4], type="l", xlab="", ylab="", main="Nresorb")

fname<-paste('./bgc_yly_NUPTAKESALL_',run[index],'.csv',sep='')
#nupsall<-read.csv('./bgc_yly_NUPTAKESALL_all.csv')
nupsall<-read.csv(fname)
plot(nupsall[102:2081,2],nupsall[102:2081,4], type="l", xlab="", ylab="", main="Nuptakesall")

fname<-paste('./bgc_yly_NUPTAKEL_',run[index],'.csv',sep='')
#nupl<-read.csv('./bgc_yly_NUPTAKEL_all.csv')
nupl<-read.csv(fname)
plot(nupl[102:2081,2],nupl[102:2081,4], type="l", xlab="", ylab="", main='Nuptakel')

fname<-paste('./bgc_yly_VEGNSUM_',run[index],'.csv',sep='')
#vns<-read.csv('./bgc_yly_VEGNSUM_all.csv')
vns<-read.csv(fname)
plot(vns[102:2081,2],vns[102:2081,4], type="l", xlab="", ylab="", main= "VegNsum")

fname<-paste('./bgc_yly_NETNMIN_',run[index],'.csv',sep='')
#nnmin<-read.csv('./bgc_yly_NETNMIN_all.csv')
nnmin<-read.csv(fname)
plot(nnmin[102:2081,2],nnmin[102:2081,4], type="l", xlab="", ylab="", main="NetNmin")

fname<-paste('./bgc_yly_LTRFALNALL_',run[index],'.csv',sep='')
#ltrN<-read.csv('./bgc_yly_LTRFALNALL_all.csv')
ltrN<-read.csv(fname)
plot(ltrN[102:2081,2],ltrN[102:2081,4], type="l", xlab="", ylab="", main="LtrfalNall")

fname<-paste('./bgc_yly_AVLNSUM_',run[index],'.csv',sep='')
#avln<-read.csv('./bgc_yly_AVLNSUM_all.csv')
avln<-read.csv(fname)
plot(avln[102:2081,2],avln[102:2081,4], type="l", xlab="", ylab="", main="AvlNsum")

fname<-paste('./bgc_yly_AVLNINPUT_',run[index],'.csv',sep='')
#avlnin<-read.csv('./bgc_yly_AVLNINPUT_all.csv')
avlnin<-read.csv(fname)
plot(avlnin[102:2081,2],avlnin[102:2081,4], type="l", xlab="", ylab="", main="AvlNinput")

fname<-paste('./bgc_yly_AVLNLOST_',run[index],'.csv',sep='')
#avlnlost<-read.csv('./bgc_yly_AVLNLOST_all.csv')
avlnlost<-read.csv(fname)
plot(avlnlost[102:2081,2],avlnlost[102:2081,4], type="l", xlab="", ylab="", main="AvlNlost")

fname<-paste('./bgc_yly_ORGNLOST_',run[index],'.csv',sep='')
#ornlost<-read.csv('./bgc_yly_ORGNLOST_all.csv')
ornlost<-read.csv(fname)
plot(ornlost[102:2081,2],ornlost[102:2081,4], type="l", xlab="", ylab="", main="OrgNlost")

dev.off()

# TEST C CYCLE
pdf(file.path(callingdir, args$output_id, "Ccycle.pdf"))
par(mfrow=c(3,4), oma=c(0.1,0.1,0,0), mai=c(.3,.3,.25,.25), cex.main=0.9, cex.axis=0.75)

fname<-paste('./bgc_yly_NEP_',run[index],'.csv',sep='')
#nep<-read.csv('./bgc_yly_NEP_all.csv')
nep<-read.csv(fname)
plot(nep[102:2081,2],nep[102:2081,4], type="l", xlab="", ylab="", main="NetEcoProd")

fname<-paste('./bgc_yly_NPPALL_',run[index],'.csv',sep='')
#npp<-read.csv('./bgc_yly_NPPALL_all.csv')
npp<-read.csv(fname)
plot(npp[102:2081,2],npp[102:2081,4], type="l", xlab="", ylab="", main="NetPrimProd")

fname<-paste('./bgc_yly_GPPALL_',run[index],'.csv',sep='')
#gpp<-read.csv('./bgc_yly_GPPALL_all.csv')
gpp<-read.csv(fname)
plot(gpp[102:2081,2],gpp[102:2081,4], type="l", xlab="", ylab="", main="GrsPrimProd")

fname<-paste('./bgc_yly_VEGCSUM_',run[index],'.csv',sep='')
#vcs<-read.csv('./bgc_yly_VEGCSUM_all.csv')
vcs<-read.csv(fname)
plot(vcs[102:2081,2],vcs[102:2081,4], type="l", xlab="", ylab="", main="VegCsum")

fname<-paste('./bgc_yly_LTRFALCALL_',run[index],'.csv',sep='')
#ltrC<-read.csv('./bgc_yly_LTRFALCALL_all.csv')
ltrC<-read.csv(fname)
plot(ltrC[102:2081,2],ltrC[102:2081,4], type="l", xlab="", ylab="", main="LtrfalCall")

fname<-paste('./bgc_yly_SOMCSHLW_',run[index],'.csv',sep='')
#somcs<-read.csv('./bgc_yly_SOMCSHLW_all.csv')
somcs<-read.csv(fname)
plot(somcs[102:2081,2],somcs[102:2081,4], type="l", xlab="", ylab="", main="SOMCSHLW")

fname<-paste('./bgc_yly_SOMCDEEP_',run[index],'.csv',sep='')
#somcd<-read.csv('./bgc_yly_SOMCDEEP_all.csv')
somcd<-read.csv(fname)
plot(somcd[102:2081,2],somcd[102:2081,4], type="l", xlab="", ylab="", main="SOMCDEEP")

fname<-paste('./bgc_yly_SOMCMINEA_',run[index],'.csv',sep='')
#somcma<-read.csv('./bgc_yly_SOMCMINEA_all.csv')
somcma<-read.csv(fname)
plot(somcma[102:2081,2],somcma[102:2081,4], type="l", xlab="", ylab="", main="SOMCMINEA")

fname<-paste('./bgc_yly_SOMCMINEC_',run[index],'.csv',sep='')
#somcmc<-read.csv('./bgc_yly_SOMCMINEC_all.csv')
somcmc<-read.csv(fname)
plot(somcmc[102:2081,2],somcmc[102:2081,4], type="l", xlab="", ylab="", main="SOMCMINEC")

fname<-paste('./bgc_yly_RHMOIST_',run[index],'.csv',sep='')
#rhm<-read.csv('./bgc_yly_RHMOIST_all.csv')
rhm<-read.csv(fname)
plot(rhm[102:2081,2],rhm[102:2081,4], type="l", xlab="", ylab="", main="RHMOIST")

fname<-paste('./bgc_yly_RHQ10_',run[index],'.csv',sep='')
#rhq<-read.csv('./bgc_yly_RHQ10_all.csv')
rhq<-read.csv(fname)
plot(rhq[102:2081,2],rhq[102:2081,4], type="l", xlab="", ylab="", main="RHQ10")

fname<-paste('./bgc_yly_SOILLTRFCN_',run[index],'.csv',sep='')
#soillcn<-read.csv('./bgc_yly_SOILLTRFCN_all.csv')
soillcn<-read.csv(fname)
plot(soillcn[102:2081,2],soillcn[102:2081,4], type="l", xlab="", ylab="", main="SoilLtrFCN")

dev.off()

# TEST ENV VARs
pdf(file.path(callingdir, args$output_id, "EnvVar.pdf"))
par(mfrow=c(3,4), oma=c(0.1,0.1,0,0), mai=c(.3,.3,.25,.25), cex.main=0.9, cex.axis=0.75)

fname<-paste('./env_yly_SNOWFALL_',run[index],'.csv',sep='')
#snow<-read.csv('./env_yly_SNOWFALL_all.csv')
snow<-read.csv(fname)
plot(snow[102:2081,2],snow[102:2081,5], type="l", xlab="", ylab="", main="SnowThick")

fname<-paste('./env_yly_RAINFALL_',run[index],'.csv',sep='')
#rain<-read.csv('./env_yly_RAINFALL_all.csv')
rain<-read.csv(fname)
plot(rain[102:2081,2],rain[102:2081,5], type="l", xlab="", ylab="", main="Rainfall")

fname<-paste('./env_yly_EETTOTAL_',run[index],'.csv',sep='')
#EET<-read.csv('./env_yly_EETTOTAL_all.csv')
EET<-read.csv(fname)
plot(EET[102:2081,2],EET[102:2081,5], type="l", xlab="", ylab="", main="EETTotal")

fname<-paste('./env_yly_PETTOTAL_',run[index],'.csv',sep='')
#PET<-read.csv('./env_yly_PETTOTAL_all.csv')
PET<-read.csv(fname)
plot(PET[102:2081,2],PET[102:2081,5], type="l", xlab="", ylab="", main="PETTotal")

fname<-paste('./env_yly_TAIR_',run[index],'.csv',sep='')
#Tair<-read.csv('./env_yly_TAIR_all.csv')
Tair<-read.csv(fname)
plot(Tair[102:2081,2],Tair[102:2081,5], type="l", xlab="", ylab="", main="Tair")

fname<-paste('./env_yly_SOILTAVE_',run[index],'.csv',sep='')
#Tsoil<-read.csv('./env_yly_SOILTAVE_all.csv')
Tsoil<-read.csv(fname)
plot(Tsoil[102:2081,2],Tsoil[102:2081,5], type="l", xlab="", ylab="", main="SoilTAve")

fname<-paste('./env_yly_SOILVWC_',run[index],'.csv',sep='')
#soilvwc<-read.csv('./env_yly_SOILVWC_all.csv')
soilvwc<-read.csv(fname)
plot(soilvwc[102:2081,2],soilvwc[102:2081,5], type="l", xlab="", ylab="", main="SoilVWC")

fname<-paste('./env_yly_RZTHAWPCT_',run[index],'.csv',sep='')
#rzthaw<-read.csv('./env_yly_RZTHAWPCT_all.csv')
rzthaw<-read.csv(fname)
plot(rzthaw[102:2081,2],rzthaw[102:2081,5], type="l", xlab="", ylab="", main="RootZoneThawPct")

fname<-paste('./env_yly_ALD_',run[index],'.csv',sep='')
#ALD<-read.csv('./env_yly_ALD_all.csv')
ALD<-read.csv(fname)
plot(ALD[102:2081,2],ALD[102:2081,5], type="l", xlab="", ylab="", main="ActiveLayerDepth")
dev.off()




