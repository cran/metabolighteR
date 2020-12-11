## ---- include = FALSE, echo=FALSE---------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- load, eval=TRUE, echo=FALSE---------------------------------------------
suppressPackageStartupMessages(library(metabolighteR))

## ----install_cran, echo=TRUE, eval=FALSE--------------------------------------
#  install.packages('metabolighteR')
#  
#  remotes::install_github('wilsontom/metabolighteR')
#  
#  library(metabolighteR)

## ---- get_studies, echo=TRUE, eval=TRUE---------------------------------------
all_study_ids <- get_studies()

studies <- as.vector(all_study_ids$study)

head(studies)

## ---- get_study_info, echo=TRUE, eval=TRUE------------------------------------
# For the first five studies

study_titles <- purrr::map(studies[1:5], get_study_title)
names(study_titles) <- studies[1:5]

study_titles <- tibble::as_tibble(study_titles) %>% tidyr::gather()
names(study_titles) <- c('STUDY', 'Title')

study_tech <- get_study_tech()

study_tech_filter <- study_tech %>% dplyr::filter(STUDY %in% studies[1:5])

StudyInfoTable <-
  dplyr::left_join(study_titles, study_tech_filter, by = 'STUDY')

StudyInfoTable


## ---- file_list, echo=TRUE, eval=TRUE-----------------------------------------

studyFileList <- get_study_files(studies[1])

studyFileList

## ---- download_file, echo=TRUE, eval=TRUE-------------------------------------

fileContents_A <- download_study_file('MTBLS264', studyFileList$file[1])

head(fileContents_A)

fileContents_B <- download_study_file('MTBLS264', studyFileList$file[4])

head(fileContents_B)



