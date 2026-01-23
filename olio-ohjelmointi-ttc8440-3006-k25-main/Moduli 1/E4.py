# Perusluokka Ajoneuvo
class Ajoneuvo:
    def __init__(self, merkki, malli):
        self.merkki = merkki
        self.malli = malli
    
    def tiedot(self):
        print(f"Ajoneuvo: {self.merkki} {self.malli}")

# Aliluokka Auto, joka perii Ajoneuvo-luokan
class Auto(Ajoneuvo):
    def __init__(self, merkki, malli, polttoaine):
        super().__init__(merkki, malli)
        self.polttoaine = polttoaine
    
    def auto_tiedot(self):
        self.tiedot()
        print(f"Polttoaine: {self.polttoaine}")

# Olion luominen
toyota_corolla = Auto("Toyota", "Corolla", "Bensiini")

# Metodin kutsuminen
toyota_corolla.auto_tiedot()
