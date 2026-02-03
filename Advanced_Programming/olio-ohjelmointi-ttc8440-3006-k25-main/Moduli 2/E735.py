# 7.3.5 Dynaaminen jonotusjärjestelmä
class Asiakas:
    def __init__(self, nimi):
        self.nimi = nimi

class Jonotusjarjestelma:
    def __init__(self):
        self.asiakkaat = []
    
    def lisaa_asiakas(self, asiakas):
        self.asiakkaat.append(asiakas)
    
    def palvele_asiakas(self):
        if self.asiakkaat:
            return self.asiakkaat.pop(0)
        return None
    
    def __iter__(self):
        return iter(self.asiakkaat)

jonotus = Jonotusjarjestelma()
jonotus.lisaa_asiakas(Asiakas("Matti Meikäläinen"))
jonotus.lisaa_asiakas(Asiakas("Liisa Virtanen"))
jonotus.lisaa_asiakas(Asiakas("Pekka Pouta"))

for asiakas in jonotus:
    print(asiakas.nimi)

print("Palvellaan asiakas...")
palveltu = jonotus.palvele_asiakas()
if palveltu:
    print(f"Palveltiin: {palveltu.nimi}")

print("Jäljellä olevat asiakkaat:")
for asiakas in jonotus:
    print(asiakas.nimi)
