#' @title imset

#' @param im geneset of immune modulation genes
#' @param data transcriptome dataset
#' @param geneset names of the selected im geneset
#' @usage data(res)
#' @usage data(im)
#' @usage names(im)
#' @usage df<-imset(im,data,geneset="Inhibitory")
#' @usage head(df[,1:5])
#' @examples data(data)
#' @examples data(im)
#' @examples names(im)
#' @examples df<-imset(im,data,geneset="Inhibitory")
#' @examples head(df[,1:5])





imset<-function(im=im,data,geneset="Co-inhibitor"){
  if(!require(dplyr)){install.packages("dplyr")}
  library(dplyr)
  vector<-im[[get("geneset")]]
  process<-data[base::rownames(data) %in% vector,]
  return(process)
}





