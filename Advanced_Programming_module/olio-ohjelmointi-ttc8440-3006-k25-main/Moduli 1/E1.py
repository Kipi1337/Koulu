# Ensin määritellään luokka ja __init__ metodilla luodaan olio alkuarvoista, jotka määritellään heti luomis vaiheessa. self viittaa olioiden luomis osiossa oleviin muuttujiin.

class Henkilo:
    def __init__(self, nimi, ika):
        self.nimi = nimi
        self.ika = ika
    
    def esittele(self):
        print(f"Hei, nimeni on {self.nimi} ja olen {self.ika} vuotta vanha.")

# Olioiden luominen
henkilo1 = Henkilo("Anna", 25)
henkilo2 = Henkilo("Matti", 30)

# Metodin kutsuminen molemmille olioille
henkilo1.esittele()
henkilo2.esittele()
