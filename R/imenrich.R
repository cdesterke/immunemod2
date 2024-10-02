#' @title imenrich

#' @param data transcriptome matrix
#' @param im immune modulation genesets
#' @param method GSVA method of enrichment: "gsva", "ssgsea", "zscore", "plage"
#' @usage data(data)
#' @usage data(phenotype)
#' @usage data(im)
#' @usage res<-imenrich(data,im,method="zscore")
#' @usage head(res[,1:6])
#' @examples data(data)
#' @examples data(phenotype)
#' @examples data(im)
#' @examples res<-imenrich(data,im,method="zscore")
#' @examples head(res[,1:6])


imenrich<-function(data,im,method="zscore"){
 if(!require(GSVA))
   {if (!require("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
   BiocManager::install("GSVA")}
  library(GSVA)
  
  data<-as.matrix(data)

  if(method=="zscore"){
  param<-zscoreParam(data,im)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }
  else if(method=="gsva"){
  param<-gsvaParam(data,im)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="ssgsea"){
  param<-ssgseaParam(data,im)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="plage"){
  param<-plageParam(data,im)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else{
  print("Input method is wrong ! (gsva, ssgsea, plage or zscore)")
  }

}



