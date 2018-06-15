library(shiny)
library("neuralnet")
library("data.table")
library("caret")
library("rpart")
library("dplyr")
library("Scale")
library("pracma")
library("DT")


shinyServer(function(input, output) {
  #data 
  arddata<-read.csv("/home/suhas_kashyap/Downloads/vegpred/data/ardata.csv",sep = '\t')
  dt <- fread("/home/suhas_kashyap/Downloads/vegpred/data/ardata.csv",select=c(4,5,6))
  df1<-as.data.frame(arddata)
  dt1<-as.data.frame(dt)
  
  #sampling with srm without replacement
  samplesize<- 0.60 * nrow(dt)
  set.seed(80)
  index<-sample( seq_len ( nrow (dt) ), size<-samplesize )
  ab<-scale(index)
  trainNN <- dt[index,]
  testNN <- dt[-index,]
  
  #model train and verification
  lm.fit <- glm(Avg_Price~., data=trainNN)
  summary(lm.fit)
  pr.lm <- predict(lm.fit,testNN)
  MSE.lm <- sum((pr.lm - testNN$Avg_Price)^2)/nrow(testNN)
  
  #normalization
  maxs <- apply(dt, 2, max)
  mins <- apply(dt, 2, min)
  scaled <- as.data.frame(scale(dt, center = mins, scale = maxs - mins))
  train_ <- scaled[index,]
  test_ <- scaled[-index,]
  #build neural network
  set.seed(2)
 
  
  NN<-neuralnet(Avg_Price~Maxtrade_Price+Mintrade_Price, train_, hidden=2, linear.output=T)
  p<-renderPlot({plot(NN)})

  
  library("neuralnet")
  
  predict_testNN<-neuralnet::compute(NN, test_[,c(1:2)])
  predict_testNN = (predict_testNN$net.result * (max(dt$Avg_Price) - min(dt$Avg_Price))) + min(dt$Avg_Price)
plot(test_$Avg_Price, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")
  #abline(0,1)
  
  predict_testNN1<-neuralnet::compute(NN, scaled[,c(1:2)])
  predict_testNN1 = (predict_testNN1$net.result * (max(dt$Avg_Price) - min(dt$Avg_Price))) + min(dt$Avg_Price)
  output$scaledGraph<-renderPlot({plot(scaled$Avg_Price, predict_testNN1, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")})
  
  
  
  
  #abline(0,1)
  b<-as.data.frame(predict_testNN1)
  df1$Predicted_Value<-predict_testNN1
  
  
DiffRating<-plot(df1$Date, df1$Predicted_Value, ylab = "predicted rating NN", xlab = "real rating")
  
  
  # Calculate Root Mean Square Error (RMSE)
  RMSE.NN = (sum((test_$Avg_Price - predict_testNN)^2) / nrow(dt)) ^ 0.5
  
  df1$prediction
  Birur<-df1[1:287,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Koppa<-df1[288:739,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Sringeri<-df1[740:1196,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Tarikere<-df1[1197:1428,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Channagiri<-df1[1429:1684,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Bhadravathi<-df1[1685:1896,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Hosanagara<-df1[1897:2221,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Sagara<-df1[2222:3012,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Shivamogga<-df1[3013:4346,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Thirthahalli<-df1[4347:4833,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  Shikaripura<-df1[4834:4914,c('Date','Branch','Product','Maxtrade_Price','Mintrade_Price','Predicted_Value')]
  
  output$table1<-renderTable(Birur)
  output$table2<-renderTable(Koppa)
  output$table3<-renderTable(Sringeri)
  output$table4<-renderTable(Tarikere)
  output$table5<-renderTable(Channagiri)
  output$table6<-renderTable(Bhadravathi)
  output$table7<-renderTable(Hosanagara)
  output$table8<-renderTable(Sagara)
  output$table9<-renderTable(Shivamogga)
  output$table10<-renderTable(Thirthahalli)
  output$table11<-renderTable(Shikaripura)


 
 
 #   output$mytable = DT::renderDataTable({sub1})
  })
 
 
  

