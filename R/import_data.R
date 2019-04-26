#load packages
library("tidyverse")
library("readxl")
library("rioja")
library("vegan")

####load data####
#coredata
core <- read_excel(path = "data/Alla kärnor.xlsx")

core_thin <- core %>% 
  gather(key = taxa, value = count, -(Site:`Total counted valves`)) %>%
  filter(count > 0)

#dictionary
dictionary <- read_excel(path = "data/CleanTaxa.xls")
dictionary <- dictionary %>% 
  replace_na(list(subspecies = "", variety = "", form = "")) %>% 
  mutate(taxa = paste(genus, species, subspecies), 
         taxa = trimws(taxa)
         ) %>% 
  select(taxonCode, taxa)

#join dictionary to core_thin
cover_thin <- core_thin %>% 
  left_join(dictionary) %>% #, by = c("taxa" = "lenastaxa")
  group_by(Site, Sample, `Depth (cm below seafloor)`, `Age (CE)`, taxonCode) %>% 
  summarise(count = sum(count))

#load molten species data


#load molten environment data


#merge molten data taxonomy??


#analogue::timetrack

#diagnostics - analogue distances etc

#transfer function