def count_words(sentence):
    punctuation="_,.:!&@$%^&"
    if sentence[0]=="'" and sentence[-1]=="'":
        sentence=sentence[1:-1]
    word_counter={}
    for p in punctuation:
        sentence=sentence.replace(p," ")
    word_list=sentence.split()
    for i in range(0,len(word_list)):
        if word_list[i][0]=="'" and word_list[i][-1]=="'":
            word_list[i]=word_list[i][1:-1]
        word_list[i]=word_list[i].lower()
    if "" in word_list:
        word_list.remove("")
    for word in word_list:
        if word in word_counter:
            word_counter.update({word:word_counter.get(word)+1})
        else:
            word_counter[word]=1
    return word_counter
