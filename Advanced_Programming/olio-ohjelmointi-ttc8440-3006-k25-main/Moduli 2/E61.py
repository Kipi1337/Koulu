# 6.1. Suojatun attribuutin käyttö
class Henkilo:
    def __init__(self, nimi, ika):
        self.nimi = nimi
        self._ika = ika
    
    def kasva_vuosi(self):
        self._ika += 1
    
    def nayta_tiedot(self):
        print(f"Nimi: {self.nimi}, Ik\u00e4: {self._ika} vuotta")

class Opiskelija(Henkilo):
    def kasva_vuosi(self):
        self._ika += 2

opiskelija = Opiskelija("Anna", 20)
opiskelija.kasva_vuosi()
opiskelija.nayta_tiedot()