# 7.2.1 Kompositio - Kirjasto ja kirjat
class Kirja:
    def __init__(self, nimi, kirjailija):
        self.nimi = nimi
        self.kirjailija = kirjailija

class Kirjasto:
    def __init__(self):
        self.kirjat = []
    
    def lisaa_kirja(self, kirja):
        self.kirjat.append(kirja)
    
    def tulosta_kirjat(self):
        for kirja in self.kirjat:
            print(f"{kirja.nimi} - {kirja.kirjailija}")

kirjasto = Kirjasto()
kirjasto.lisaa_kirja(Kirja("1984", "George Orwell"))
kirjasto.lisaa_kirja(Kirja("Sinuhe egyptiläinen", "Mika Waltari"))
kirjasto.tulosta_kirjat()