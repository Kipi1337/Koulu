# 7.3.1 Kirjasto ja iteroitavat kirjat
class Kirja:
    def __init__(self, nimi, kirjailija):
        self.nimi = nimi
        self.kirjailija = kirjailija

class KirjastoIteroitava:
    def __init__(self):
        self.kirjat = []
    
    def lisaa_kirja(self, kirja):
        self.kirjat.append(kirja)
    
    def __iter__(self):
        return iter(self.kirjat)

# Luo kirjasto-olio
kirjasto = KirjastoIteroitava()

# Lisää kirjoja kirjastoon
kirjasto.lisaa_kirja(Kirja("1984", "George Orwell"))
kirjasto.lisaa_kirja(Kirja("Sinuhe egyptiläinen", "Mika Waltari"))
kirjasto.lisaa_kirja(Kirja("Linnake", "Dan Brown"))

# Käy läpi kaikki kirjat ja tulosta niiden tiedot
for kirja in kirjasto:
    print(f"{kirja.nimi} - {kirja.kirjailija}")
