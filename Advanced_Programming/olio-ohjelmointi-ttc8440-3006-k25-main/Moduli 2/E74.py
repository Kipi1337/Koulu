import nltk
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.sentiment import SentimentIntensityAnalyzer
from textblob import TextBlob
from collections import Counter

# Lataa tarvittavat resurssit
nltk.download('punkt')
nltk.download('punkt_tab')
nltk.download('averaged_perceptron_tagger')
nltk.download('vader_lexicon')
nltk.download('stopwords')
nltk.download('wordnet')

# Abstrakti yliluokka
class Tekstianalyysi:
    def analysoi(self, teksti):
        raise NotImplementedError("Tätä metodia tulee ylikirjoittaa aliluokissa.")

# ArtikkeliAnalyysi: laskee lauseiden määrän
class ArtikkeliAnalyysi(Tekstianalyysi):
    def analysoi(self, teksti):
        lauseet = sent_tokenize(teksti)
        print(f"Artikkelissa on {len(lauseet)} lausetta.")

# TwiittiAnalyysi: laskee sanojen määrän
class TwiittiAnalyysi(Tekstianalyysi):
    def analysoi(self, teksti):
        sanat = word_tokenize(teksti)
        print(f"Twiitissä on {len(sanat)} sanaa.")

# MielipideAnalyysi: sentimenttianalyysi
class MielipideAnalyysi(Tekstianalyysi):
    def analysoi(self, teksti):
        sia = SentimentIntensityAnalyzer()
        tulos = sia.polarity_scores(teksti)
        print(f"Tekstin mielipideanalyysi:\nPositiivisuus: {tulos['pos']}, Negatiivisuus: {tulos['neg']}, Neutraalius: {tulos['neu']}")

# SanaluokkaAnalyysi: tunnistaa sanaluokat
class SanaluokkaAnalyysi(Tekstianalyysi):
    def analysoi(self, teksti):
        sanat = word_tokenize(teksti)
        sanaluokat = nltk.pos_tag(sanat)
        print("Sanaluokkien tunnistus:", sanaluokat)

# Uusi analyysimenetelmä: AvainsanaAnalyysi
class AvainsanaAnalyysi(Tekstianalyysi):
    def analysoi(self, teksti):
        sanat = word_tokenize(teksti)
        sanat = [sana.lower() for sana in sanat if sana.isalpha()]
        frekvenssit = Counter(sanat)
        yleisimmat = frekvenssit.most_common(5)
        print("Avainsanat:", yleisimmat)

# Chatbot, joka analysoi käyttäjän syöttämän tekstin
class NLPChatbot:
    def __init__(self):
        self.analysoija = MielipideAnalyysi()

    def keskustele(self):
        while True:
            teksti = input("Syötä lause analysoitavaksi (tai kirjoita 'lopeta' poistuaksesi): ")
            if teksti.lower() == "lopeta":
                print("Chatbot lopettaa.")
                break
            self.analysoija.analysoi(teksti)

# Analyysien suorittaminen
if __name__ == "__main__":
    ohjelma = [ArtikkeliAnalyysi(), TwiittiAnalyysi(), MielipideAnalyysi(), SanaluokkaAnalyysi(), AvainsanaAnalyysi()]
    
    testiteksti = "Today is a great day. I love programming and learning new things!"
    print("\nAnalysoidaan teksti:\n", testiteksti, "\n")
    
    for analyysi in ohjelma:
        analyysi.analysoi(testiteksti)
    
    # Käynnistetään chatbot
    chatbot = NLPChatbot()
    chatbot.keskustele()
