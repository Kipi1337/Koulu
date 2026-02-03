# 7.3.2 Joukkue ja pelaajat dynaamisesti
class Pelaaja:
    def __init__(self, nimi, pelipaikka):
        self.nimi = nimi
        self.pelipaikka = pelipaikka

    def __str__(self):
        return f"{self.nimi} - {self.pelipaikka}"

class Joukkue:
    def __init__(self):
        self.pelaajat = []

    def lisaa_pelaaja(self, pelaaja):
        self.pelaajat.append(pelaaja)

    def __iter__(self):
        return iter(self.pelaajat)

# Luo joukkue ja lisää pelaajat
joukkue = Joukkue()
joukkue.lisaa_pelaaja(Pelaaja("Mikko", "Hyökkääjä"))
joukkue.lisaa_pelaaja(Pelaaja("Janne", "Maalivahti"))
joukkue.lisaa_pelaaja(Pelaaja("Petri", "Puolustaja"))

# Tulostetaan kaikki pelaajat
for pelaaja in joukkue:
    print(pelaaja)
