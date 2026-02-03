# 7.2.3 Kompositio - Joukkue ja pelaajat
class Pelaaja:
    def __init__(self, nimi, pelipaikka):
        self.nimi = nimi
        self.pelipaikka = pelipaikka

class Joukkue:
    def __init__(self):
        self.pelaajat = []
    
    def lisaa_pelaaja(self, pelaaja):
        self.pelaajat.append(pelaaja)
    
    def tulosta_pelaajat(self):
        for pelaaja in self.pelaajat:
            print(f"{pelaaja.nimi} - {pelaaja.pelipaikka}")

joukkue = Joukkue()
joukkue.lisaa_pelaaja(Pelaaja("Teemu Selänne", "Hyökkääjä"))
joukkue.lisaa_pelaaja(Pelaaja("Saku Koivu", "Hyökkääjä"))
joukkue.lisaa_pelaaja(Pelaaja("Mikko Rantanen", "Hyökkääjä"))
joukkue.tulosta_pelaajat()