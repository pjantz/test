library(raster)

source("C:/Share/pjantz/Scripts/LCCVP/handy_functions.R")

# Read multiband tiff to data frame
xx <- as.data.frame(getValues(brick("C:/Share/LCC-VP/Parks/GRSM/analysis/spruce_fir/inputs/clim_srad/biovars_1981-2010_srad_masked.tif")))

# Correlate rasters, omitting NA values
yy <- cor(xx, use = "pairwise.complete.obs")

# Variable names
vnam <- c("Ann Mean T","Mean Diurnal Range","Isothermality","T Seasonality",
         "Max T Warmest Month","Min T Coldest Month","T Annual Range","Mean T of Wettest Q",
         "Mean T of Driest Q","Mean T of Warmest Q","Mean T of Coldest Q","Annual Ppt",
         "Ppt of Wettest Month","Ppt of Driest Month","Ppt Seasonality","Ppt of Wettest Q",
         "Ppt of Driest Q","Ppt of Warmest Q","Ppt of Coldest Q","srad")

colnames(yy) <- vnam
rownames(yy) <- vnam

# Matrix plot of variable correlations ordered by principle components
circle.corr( yy, order = TRUE, bg = "gray50",
             col = colorRampPalette(c("blue","white","red"))(100) )
