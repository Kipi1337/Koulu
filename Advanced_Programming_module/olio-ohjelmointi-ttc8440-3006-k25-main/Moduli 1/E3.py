class Auto:
    def __init__(self, merkki, malli):
        self.merkki = merkki
        self.malli = malli
        self.nopeus = 0
    
    def kiihdyta(self, maara):
        self.nopeus += maara
    
    def jarruta(self, maara):
        self.nopeus -= maara
        if self.nopeus < 0:
            self.nopeus = 0
    
    def tulosta_tiedot(self):
        print(f"Auto: {self.merkki} {self.malli}, nopeus: {self.nopeus} km/h.")

# Olion luominen
tesla = Auto("Tesla", "Model 3")

# Auton kiihdyttäminen ja jarruttaminen
tesla.kiihdyta(50)
tesla.tulosta_tiedot()

tesla.jarruta(20)
tesla.tulosta_tiedot()
