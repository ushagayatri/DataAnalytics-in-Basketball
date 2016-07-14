str(basketball)

 # Load data

 head(basketball, 3)

 # log transform 
 #log transformation to the continuous variables  
 log.bb <- log(basketball[, 4:6])
 bb.players <- basketball[, 1]
 
 # apply PCA - set center and scale. 
  #call to prcomp to standardize the variables prior to the application of PCA
 
 bb.pca <- prcomp(log.bb,
                  center = TRUE,
                  scale. = TRUE)
 
 # print method of PCA
 #it returns the standard deviation of each of the 3 PCs, 
#these are the coefficients of the linear combinations of the continuous variables.
 
 print(bb.pca)
 
 # plot method
# The plot method returns a plot of the variances (y-axis) associated with the PCs (x-axis). 
#The Figure below is useful to decide how many PCs to retain for further analysis.
#In this simple case with only 3 PCs this is not a hard task 
#and we can see that the first two PCs explain most of the variability in the data.
 
 plot(bb.pca, type = "l")
 
 # summary method
 #The summary method describe the importance of the PCs. 
 #The first row describe again the standard deviation associated with each PC.
 #The second row shows the proportion of the variance in the data explained by each component
 #while the third row describe the cumulative proportion of explained variance. 
 #We can see there that the first two PCs accounts for more than {95\%} of the variance of the data.
 
 summary(bb.pca)
 
 # Predict PCs
 predict(bb.pca, 
         newdata=tail(log.bb, 2))
 
 
  library(devtools)
 install_github("ggbiplot", "vqv")
 
 library(ggbiplot)
 length(bb.pca)
 length(bb.players)
 
 g <- ggbiplot(bb.pca, choices = 1:2, obs.scale = 1, var.scale = 1, 
                bb.players , ellipse = TRUE, 
               circle = TRUE)
 g <- g + scale_color_discrete(name = '')
 g <- g + theme(legend.direction = 'vertical', 
                legend.position = 'top')
 print(g)
 