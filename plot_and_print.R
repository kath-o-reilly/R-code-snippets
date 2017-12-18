# print seperate pdf files of plots within ggplot2

library(ggplot2)
source("~/Dropbox (VERG)/Dropbox/Zika/Rfiles/multiplot.r")
# use the diamonds data

g1 <- ggplot(diamonds,aes(carat,price)) +
  geom_point()
g2 <- ggplot(diamonds,aes(depth)) +
  geom_histogram()

pdf("plot.pdf",height=5,width=3)
multiplot(g1,g2,cols=1)
dev.off()

# what if wanted a subplot for each "cut?"
cut_vals <- names(table(diamonds$cut))
for(i in 1:length(cut_vals)){
  tmp <- subset(diamonds,cut==cut_vals[i])
  
  # same plot different data...
  g1 <- ggplot(tmp,aes(carat,price)) +
    geom_point()
  g2 <- ggplot(tmp,aes(depth)) +
    geom_histogram()
  
  # now rename the file according to the loop index
  pdf(paste0("plot",cut_vals[i],".pdf"),height=5,width=3)
  multiplot(g1,g2,cols=1)
  dev.off()
}
