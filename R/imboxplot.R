#' @title imboxplot

#' @param results results obtained from imenrich function
#' @param phenotype phenotype file from tested samples
#' @param id name of the phenotype column to be stratified
#' @param fontsize size of the font in the graph
#' @usage data(data)
#' @usage data(phenotype)
#' @usage data(im)
#' @usage res<-imenrich(data,im,method="zscore")
#' @usage imboxplot(res,phenotype,id="group",fontsize=14)
#' @examples data(data)
#' @examples data(phenotype)
#' @examples data(im)
#' @examples res<-imenrich(data,im,method="zscore")
#' @examples imboxplot(res,phenotype,id="group",fontsize=14)



imboxplot<-function(res,phenotype,id="group",fontsize=12){
  if(!require(ggplot2)){install.packages("ggplot2")}
  library(ggplot2)
  if(!require(dplyr)){install.packages("dplyr")}
  library(dplyr)
  if(!require(tidyr)){install.packages("tidyr")}
  library(tidyr)
  res<-as.data.frame(res)
  res$geneset<-row.names(res)
  res%>%relocate(geneset)->res

  res%>%pivot_longer(!geneset,names_to = "sample",values_to = "enrichment")->long
  phenotype$sample<-row.names(phenotype)
  phenotype%>%full_join(long,by="sample")->all
  ggplot(all,aes(x=get(id),y=enrichment,fill=get(id)))+
  geom_boxplot()+xlab(id)+ylab("Expression enrichment scores")+
  geom_jitter()+
  facet_wrap(~geneset,ncol=3)+theme_bw(base_size = fontsize)+
  scale_x_discrete(guide = guide_axis(angle = 90))+theme(legend.position="none")+
  scale_fill_manual(values = c("gold","plum","lightblue", "lightgreen", "lightcoral"))
  }





