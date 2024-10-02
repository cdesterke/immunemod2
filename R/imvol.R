#' @title imvol

#' @param res results from limma deg analysis
#' @param nb number of gene names to write
#' @param fc fold change threshold
#' @param p p-value threshold
#' @param size size of the gene labels
#' @param alpha transparent points
#' @usage data(data)
#' @usage data(phenotype)
#' @usage data(im)
#' @usage res<-imenrich(data,im,method="zscore")
#' @usage imdes.results<-imdes(res,phenotype$group,control="low")
#' @usage imvol(imdes.results,nb=9,fc=0.5,p=0.05,size=4,alpha=1)
#' @examples data(data)
#' @examples data(phenotype)
#' @examples data(im)
#' @examples res<-imenrich(data,im,method="plage")
#' @examples imdes.results<-imdes(res,phenotype$group,control="low")
#' @examples imvol(imdes.results,nb=9,fc=0.01,p=0.5,size=4,alpha=1)


imvol<-function(res,nb=9,fc=0.5,p=0.05,size=3,alpha=1){
  # require libraries
  if(!require(ggplot2)){install.packages("ggplot2")}
  library(ggplot2)
  if(!require(ggrepel)){install.packages("ggrepel")}
  library(ggrepel)

  # add a column of NO UP DOWN
  res$diffexpressed <- "NO"
  res$diffexpressed[res$logFC> fc & res$P.Value < p] <- "UP"
  res$diffexpressed[res$logFC < -fc & res$P.Value < p] <- "DOWN"
  res$diffexpressed<-as.factor(res$diffexpressed)
  n<-length(levels(res$diffexpressed))
  # grep labels on row.names
  res$delabel<-row.names(res)

  # perform the graph 
  if (n==3){
    ggplot(data=res, aes(x=logFC, y=-log10(P.Value), col=diffexpressed, label=delabel)) +
    geom_point(alpha=alpha) +
    theme_minimal()+
    geom_text_repel(data=head(res, nb), aes(label=delabel),size=size) +
    scale_color_manual(values=c("#4697e1", "grey50", "#FF00FF")) +
    geom_vline(xintercept=c(-fc, fc), col="orange",linetype="dashed") +
    geom_hline(yintercept=-log10(p), col="orange",linetype="dashed") +
    theme(legend.position = "none")
    }

   else if (n==2){
    ggplot(data=res, aes(x=logFC, y=-log10(P.Value), col=diffexpressed, label=delabel)) +
    geom_point(alpha=alpha) +
    theme_minimal()+
    geom_text_repel(data=head(res, nb), aes(label=delabel),size=size) +
    scale_color_manual(values=c("#4697e1", "#FF00FF")) +
    geom_vline(xintercept=c(-fc, fc), col="orange",linetype="dashed") +
    geom_hline(yintercept=-log10(p), col="orange",linetype="dashed") +
    theme(legend.position = "none")
    }

   else if (n==1){
    ggplot(data=res, aes(x=logFC, y=-log10(P.Value), col=diffexpressed, label=delabel)) +
    geom_point(alpha=alpha) +
    theme_minimal()+
    geom_text_repel(data=head(res, nb), aes(label=delabel),size=size) +
    scale_color_manual(values=c("#FF00FF")) +
    geom_vline(xintercept=c(-fc, fc), col="orange",linetype="dashed") +
    geom_hline(yintercept=-log10(p), col="orange",linetype="dashed") +
    theme(legend.position = "none")
    }


}

