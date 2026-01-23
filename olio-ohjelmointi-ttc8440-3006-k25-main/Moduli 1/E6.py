class Kirja:
    def __init__(self, nimi, kirjailija, sivuja):
        self.nimi = nimi
        self.kirjailija = kirjailija
        self.sivuja = sivuja

class Kirjasto:
    def __init__(self):
        self.kirjat = [] # Lista, johon tallennetaan kirja
    
    def lisaa_kirja(self, kirja):
        self.kirjat.append(kirja) # Lisää annettu kirja kirjat listaan
    
    def tulosta_kirjat(self):
        print("Kirjaston kirjat:")
        for kirja in self.kirjat:
            print(f"{kirja.nimi}, kirjailija: {kirja.kirjailija}")

# Luodaan kirja
kirja1 = Kirja("Sinuhe Egyptiläinen", "Mika Waltari", 500)
kirja2 = Kirja("Tuntematon sotilas", "Väinö Linna", 300)

# Luodaan kirjasto ja lisätään kirjat siihen
kirjasto = Kirjasto()
kirjasto.lisaa_kirja(kirja1)
kirjasto.lisaa_kirja(kirja2)

# Tulostetaan kirjaston sisältö
kirjasto.tulosta_kirjat()
