df <- function(dtm, sentences, topic_number=5, words_pt=6, seed=0){
  library(sentixR)
  sentiment_topic<-vector()
  words<-unlist(sentences)
  df <- data.frame(id = c(1:length(words)), text = words)
  lda<-topicmodels::LDA(dtm, topic_number, control=list(seed=seed))
  model <- sentix::load.udpipe()
  totale<-sentix::sentix.df.sentiment(df$text, model)
  totale<-mean(totale$value)
  topic<-data.frame(topicmodels::terms(lda, k = words_pt))
  index=1
  for (col in names(topic)){
    for (i in 1:words_pt){
      sentences<-dplyr::filter(df, grepl(topic[[col]][[i]], text))
    }
    sentiment_topic[index]<-mean(sentix::sentix.df.sentiment(sentences$text, model)$value)
    index=index+1
  }
  index=1
  topicwords<-c("Totale")
  for(i in 2:(topic_number+1)){
    topic_column=paste("Topic.",index,sep="")
    topicwords[i]<-paste0(topic[[topic_column]], collapse=",")
    index=index+1
  }
  df_sentiment<-data.frame("TOPIC"=topicwords,"Value"=c(totale,sentiment_topic))
  return(df_sentiment)
}
