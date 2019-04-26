#load packages
library("tidyverse")
library("readxl")
library("rioja")
library("vegan")

####load data####
#coredata
core <- read_excel(path = "data/Alla kärnor.xlsx")
