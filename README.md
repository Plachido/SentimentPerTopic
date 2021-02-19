# SentimentPerTopic
Sentiment per topic calculation for italian text. Needs `tm`'s `DocumentTermMatrix` and a sentences vector generated with `syuzhet`'s `get_sentences`. The calculation is made with the [`sentixR`](https://github.com/valeriobasile/sentixR) package, while the topics are generated with `topicmodels`'s `lda` and `terms` functions. In order to take into account only some of the given sentences, `dplyr`'s `filter` function gets called.

## USAGE
### Parameters:
* dtm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;an object of class `DocumentTermMatrix`
* sentences&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a character vector of sentences made with `get_sentences`.
* topic_number  the number of topics to search for.
* words_pt      number of words to consider relevant for each topic.
* seed          seed used for the inizialization of VEM algorithm (implemented in `lda`).
```
spt(dtm, sentences, topic_number=5, words_pt=6, seed=0) #seed is used to initialize LDA 
```
## RETURN VALUE
The functions returns a `data.frame` containing two columns, one containing the terms of each topic and one with the sentiment value.
