# import string  # import the string module
# s = """Imagine a vast sheet of paper on which straight Lines, Triangles, Squares, Pentagons, Hexagons, and other figures, instead of remaining fixed in their places, move freely about, on or in the surface, but without the power of rising above or sinking below it, very much like shadows - only hard and with luminous edges - and you will then have a pretty correct notion of my country and countrymen. Alas, a few years ago, I should have said "my universe": but now my mind has been opened to higher views of things."""

# do not change any code above this line
# your code here
# s_lower = s.lower()
# print(s_lower)
# words = list()  # do not delete. this list must contain the list of words.

# your code goes here
# words = s_lower.split(' ')
# wordset = set()
# print(len(words))
# for each in words:
#    wordset.add(each)
# print(len(wordset))
# print(words)  # do not delete
# do not write any code past here

# word_freq = dict()

# your code goes here
# for each in words:
#    if each not in word_freq.keys():
#        word_freq[each] = 1
#    elif each in word_freq.keys():
#        word_freq[each] = word_freq[each] + 1

# print(word_freq)


# use the string.punctuation built-in python to create a list of all punctuations
# punctuation_list = list(string.punctuation)  # do not delete this

# print(words)
# w_clean = list()

# your code goes here
# w_clean = [word.strip(string.punctuation) for word in words]
# for each in w_clean:
#    if each in punctuation_list:
#        w_clean.remove(each)
#    elif each == "":
#        w_clean.remove(each)
# print(w_clean)
# print(len(w_clean))


import string
s = """Imagine a vast sheet of paper on which straight Lines, Triangles, Squares, Pentagons, Hexagons, and other figures, instead of remaining fixed in their places, move freely about, on or in the surface, but without the power of rising above or sinking below it, very much like shadows - only hard and with luminous edges - and you will then have a pretty correct notion of my country and countrymen. Alas, a few years ago, I should have said "my universe": but now my mind has been opened to higher views of things."""

s_lower = s.lower()
words = s_lower.split()

# create a set of all words
wordset = set(words)

# print the number of unique words
print(len(wordset))

# create a dictionary that counts the frequency of each word
word_freq = {}
for word in words:
    # remove any punctuation at the beginning or end of the word
    word = word.strip(string.punctuation)
    if word != "":
        if word not in word_freq:
            word_freq[word] = 1
        else:
            word_freq[word] += 1

print(word_freq)
