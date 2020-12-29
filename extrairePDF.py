#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
#from cStringIO import StringIO
from io import StringIO 
import codecs
import io
import sys
import os
import re
import pandas as pd
import requests

import nltk
import spacy
from spacy.matcher import Matcher

nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')



# load pre-trained model
nlp = spacy.load('en_core_web_sm')

# initialize matcher with a vocab
matcher = Matcher(nlp.vocab)

def extraireNom(resume_text):
    nlp_text = nlp(resume_text)
    
    # First name and Last name are always Proper Nouns
    pattern = [{'POS': 'PROPN'}, {'POS': 'PROPN'}]
    
    matcher.add('NAME', None, *pattern)
    
    matches = matcher(nlp_text)
    
    for match_id, start, end in matches:
        span = nlp_text[start:end]
        return span.text


def scraper():
   
    filepath = input("Entrez le nom du pdf à extraire les données : ")
     
    pages=None
    if not pages:
        pagenums = set()
    else:
        pagenums = set(pages)
    output = StringIO()
    manager = PDFResourceManager()
    converter = TextConverter(manager, output, laparams=LAParams())
    interpreter = PDFPageInterpreter(manager, converter)
    
    #fichier = 'CV.pdf'
    infile = open(filepath, 'rb')
    #infile = open(fichier, 'rb')
    for page in PDFPage.get_pages(infile, pagenums):
        interpreter.process_page(page)
    infile.close()
    converter.close()
    text = output.getvalue()
    output.close
    #print(text) 

    text_file = open("extrait.txt", "w")
    text = re.sub("\s\s+", " ", text)
    text_file.write("%s" % text)
    text_file.close()

    return text

    #sep_words()
    
    
    """
    save = input("Voulez-vous enregistrer les données extraites dans un fichier scrape.txt ? Ceci écrasera les données précédentes dans le fichier 'scrape.txt'. Tape y' pour yes or 'n' pour no.")
    if save == "y":
        text_file = open("scrape.txt", "w")
        text = re.sub("\s\s+", " ", text)
        text_file.write("%s" % text)
        text_file.close()
        prompt = input("Fichier enregistré avec succès ! Tapez 'c' pour continuer, ou 'q' pour quitter.")
        if prompt == "c":
            prompt2 = input("Aimeriez-vous extraire un autre fichier ? Tapez 'y' pour yes ou 'n' poure no.")
            if prompt2 == "y":
                scraper()
            if prompt2 == "n":
                prompt3 = input("Aimerais-tu.. \n 1. Enregistrer les fréquences des mots dans un fichier 'word_frequencies.csv' \n 2. Quitter le programme. \n Tapez 1, 2")
                if prompt3 == "1":
                    sep_words()
                #if prompt3 == "2":
                #    pos_graph()
                #if prompt3 == "3":
                #    date_scraper()
                if prompt3 == "2":
                    print("Bye!")
                    exit(0)
            if prompt == "q":
                print("Bye!")
                exit(0)
            else:
                print("Entrez svp une réponse valide")
        if save == "n":
            print("Bye!")
            exit(0)
        else:
            print("Entrez svp une réponse valide")
    """
    
def extract_names(txt):
    person_names = []

    for sent in nltk.sent_tokenize(txt):
        for chunk in nltk.ne_chunk(nltk.pos_tag(nltk.word_tokenize(sent))):
            if hasattr(chunk, 'label') and chunk.label() == 'PERSON':
                person_names.append(
                    ' '.join(chunk_leave[0] for chunk_leave in chunk.leaves())
                )

    return person_names

                
def sep_words():
    os.system("python sepwords.py")
    exit(0)     


def extract_mobile_number(text):
    phone = re.findall(re.compile(r'(?:(?:\+?([1-9]|[0-9][0-9]|[0-9][0-9][0-9])\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([0-9][1-9]|[0-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?'), text)
    
    if phone:
        number = ''.join(phone[0])
        if len(number) > 10:
            return '+' + number
        else:
            return number

def extract_email(email):
    email = re.findall("([^@|\s]+@[^@]+\.[^@|\s]+)", email)
    if email:
        try:
            return email[0].split()[0].strip(';')
        except IndexError:
            return None


# load pre-trained model
nlp = spacy.load('en_core_web_sm')

def extract_skills(resume_text):
    nlp_text = nlp(resume_text)
    noun_chunks = nlp_text.noun_chunks


    # removing stop words and implementing word tokenization
    tokens = [token.text for token in nlp_text if not token.is_stop]
    
    # reading the csv file
    data = pd.read_csv("skills.csv") 
    
    # extract values
    skills = list(data.columns.values)
    
    skillset = []
    
    # check for one-grams (example: python)
    for token in tokens:
        if token.lower() in skills:
            skillset.append(token)
    
    # check for bi-grams and tri-grams (example: machine learning)
    for token in noun_chunks:
        token = token.text.lower().strip()
        if token in skills:
            skillset.append(token)
    
    return [i.capitalize() for i in set([i.lower() for i in skillset])]

nltk.download('stopwords')

# you may read the database from a csv file or some other database
SKILLS_DB = [
    'machine learning',
    'data science',
    'python',
    'word',
    'excel',
    'English',
]

def skill_exists(skill):
    url = f'https://api.promptapi.com/skills?q={skill}&count=1'
    headers = {'apikey': 'YOUR API KEY'}
    response = requests.request('GET', url, headers=headers)
    result = response.json()

    if response.status_code == 200:
        return len(result) > 0 and result[0].lower() == skill.lower()
    raise Exception(result.get('message'))


def competences(input_text):
    stop_words = set(nltk.corpus.stopwords.words('english'))
    word_tokens = nltk.tokenize.word_tokenize(input_text)

    # remove the stop words
    filtered_tokens = [w for w in word_tokens if w not in stop_words]

    # remove the punctuation
    filtered_tokens = [w for w in word_tokens if w.isalpha()]

    # generate bigrams and trigrams (such as artificial intelligence)
    bigrams_trigrams = list(map(' '.join, nltk.everygrams(filtered_tokens, 2, 3)))

    # we create a set to keep the results in.
    found_skills = set()

    # we search for each token in our skills database
    for token in filtered_tokens:
        if token.lower() in SKILLS_DB:
            found_skills.add(token)
    """
    for token in filtered_tokens:
        if skill_exists(token.lower()):
            found_skills.add(token)
    """

    # we search for each bigram and trigram in our skills database
    for ngram in bigrams_trigrams:
        if ngram.lower() in SKILLS_DB:
            found_skills.add(ngram)
    
    """for ngram in bigrams_trigrams:
        if skill_exists(ngram.lower()):
            found_skills.add(ngram)
    """
    return found_skills


RESERVED_WORDS = [
    'school',
    'college',
    'univers',
    'academy',
    'faculty',
    'institute',
    'faculdades',
    'Schola',
    'schule',
    'lise',
    'lyceum',
    'lycee',
    'polytechnic',
    'kolej',
    'ünivers',
    'okul',
]

def extract_education(input_text):
    organizations = []

    # first get all the organization names using nltk
    for sent in nltk.sent_tokenize(input_text):
        for chunk in nltk.ne_chunk(nltk.pos_tag(nltk.word_tokenize(sent))):
            if hasattr(chunk, 'label') and chunk.label() == 'ORGANIZATION':
                organizations.append(' '.join(c[0] for c in chunk.leaves()))

    # we search for each bigram and trigram for reserved words
    # (college, university etc...)
    education = set()
    for org in organizations:
        for word in RESERVED_WORDS:
            if org.lower().find(word) >= 0:
                education.add(org)

    return education

            
        
#print(scraper())

if __name__ == '__main__':
    text = scraper()
    #print(text)
    names = extract_names(text)
    print(names)
    print(extract_mobile_number(text))
    print(extract_email(text))
    print(competences(text))
    print(extract_education(text))
    #print(extract_skills(text))

    #if names:
    #    print(names)  # noqa: T001