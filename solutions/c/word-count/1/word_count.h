#ifndef WORD_COUNT_H
#define WORD_COUNT_H

#define MAX_WORDS                                                              \
   20   // at most MAX_WORDS can be found in the test input string
#define MAX_WORD_LENGTH 50   // no individual word can exceed this length

// results structure
typedef struct word_count_word {
   char text[MAX_WORD_LENGTH +
             1];   // allow for the string to be null-terminated
   int count;
} word_count_word_t;

#define EXCESSIVE_LENGTH_WORD -1
#define EXCESSIVE_NUMBER_OF_WORDS -2

// count_words - routine to classify the unique words and their frequency in a
// sentence inputs:
//    sentence =  a null-terminated string containing that is analyzed
//
// outputs:
//    words = allocated structure to record the words found and their frequency
//    uniqueWords - number of words in the words structure
//           returns a negative number if an error.
//           words will contain the results up to that point.
int count_words(const char *sentence, word_count_word_t *words);
// first_non_space_at - returns the position of the first alphanumeric character 
// returns 0 if there are not leading spaces, or the position of the first 
// alphanumeric character.
int first_non_space_at(const char *sentence);
// first_non_space_at - this function does almost the same than the previous one, 
// but checks for the last alphanumeric character. Returns the position of the 
// last non_space character
int last_non_space_at(const char *sentence);
char *remove_quotation(char *sentence);
int unique_word(char *word, word_count_word_t *word_list, int size);

#endif
