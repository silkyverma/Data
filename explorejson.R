library("RJSONIO")
datafile<-"/Users/wgiersche/workspaces/R-Tutorial1/racedata.json"
jsondata <- fromJSON(content = datafile)
head(jsondata$sensorEvents)
start_at<-3000
num_vals<-600
end_at<-start_at + num_vals
t0<-jsondata$sensorEvents[[start_at]]$timeStamp[[1]]
t_axis<-sapply(jsondata$sensorEvents[c(start_at:end_at)], function(x) as.numeric(x$timeStamp[[1]])-as.numeric(t0))
g_axis<-sapply(jsondata$sensorEvents[c(start_at:end_at)], function(x) x$gyr[[3]])
gvst<-data.frame(t_axis, g_axis)
ggplot(gvst, aes(x=t_axis, y=g_axis)) + geom_path()

