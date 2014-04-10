NNI <- function(jsoninput) {
  
  require(jsonlite)
  require(maptools)
  require(spatstat)
  require(sp)
  require(rgdal)
  
  fnargs <- fromJSON(jsoninput)
  nmp <- SpatialPoints(fnargs)
  
  #Convert the generic sp format into spatstat's pp format
  nm_ppp <- as(nmp, "ppp")
  
  
  #Compute NNI
  nni <- nnfun(nm_ppp)
  
  #Compute G test statistics
  
  clarkevans.test(nm_ppp)
  
}