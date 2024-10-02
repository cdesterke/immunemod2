# immunemod2
## immunemod2: R-package which allows to compute immune score based on expression of molecules grouped in nine distinct classes of immune modulation functions

### compatible with Bioconductor >=3.18 and compilated with R 4.4.1




### package installation
```r
library(devtools)
install_github("cdesterke/immunemod2")
```
### description
immunemod2 is a R-package based on nine genesets implicated in immune modulation extracted from the the study: "immune landscape of cancer" (Thorsson et al. 2018).



### immunemod2 scoring based on GSVA algorithm: function "imenrich"
```r
library(immunemod2)
data(data)
data(phenotype)
data(im)
res<-imenrich(data,im,method="zscore")
head(res[,1:4])
```
![res](https://github.com/cdesterke/immunemod2/blob/main/imenrich.png)


### heatmap of the immunemod2 enrichments: function "imheatmap"
```r
library(immunemod2)
data(data)
data(phenotype)
data(im)
res<-imenrich(data,im,method="zscore")
imheatmap(res,phenotype,scale="row",fontsize=10)
```
![res](https://github.com/cdesterke/immunemod2/blob/main/heatmap.png)

### boxplot of the immunemod2 enrichments: function "imboxplot"
```r
library(immunemod2)
data(data)
data(phenotype)
data(im)
res<-imenrich(data,im,method="zscore")
imboxplot(res,phenotype,id="group",fontsize=14)
```
![res](https://github.com/cdesterke/immunemod2/blob/main/boxplot.png)


### differential expression score of the immunemod2 enrichments: function "imdes"
```r
data(data)
data(pheno)
data(im)
res<-imenrich(data,im,method="zscore")
imdes.results<-imdes(res,phenotype$group,control="low")
head(imdes.results)
```
![res](https://github.com/cdesterke/immunemod2/blob/main/imdes.png)

### volcanoplot on results of "imdes" analyses: function "imvol"
```r
data(data)
data(phenotype)
data(im)
res<-imenrich(data,im,method="plage")
imdes.results<-imdes(res,phenotype$group,control="low")
imvol(imdes.results,nb=9,fc=0.5,p=0.05,size=4,alpha=1)
```
![res](https://github.com/cdesterke/immunemod2/blob/main/volcano.png)

### selection of gene expressions in a genset for nested analyses : function "imset"
```r
data(data)
data(im)
names(im)
df<-imset(im,data,geneset="Inhibitory")
head(df[,1:5])
```

![res](https://github.com/cdesterke/immunemod2/blob/main/imset.png)

## immunemod2 package used in :

> Christophe Desterke, Yao Xiang, Rima Elhage, Clémence Duruel, Yunhua Chang, Ahmed Hamaï 2023. "Ferroptosis Inducers Upregulate PD-L1 in Recurrent Triple-Negative Breast Cancer".Cancers (Basel). 2023 Dec 28;16(1):155. https://doi.org/10.3390/cancers16010155.

## REFERENCES
> Thorsson, Vésteinn, David L. Gibbs, Scott D. Brown, Denise Wolf, Dante S. Bortone, Tai-Hsien Ou Yang, Eduard Porta-Pardo, et al. 2018. « The Immune Landscape of Cancer ». Immunity 48 (4): 812-830.e14. https://doi.org/10.1016/j.immuni.2018.03.023.
