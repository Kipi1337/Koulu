# 6.3. Getter- ja setter-metodit
class Ajoneuvo:
    def __init__(self, merkki, nopeus):
        self.merkki = merkki
        self.__nopeus = nopeus
    
    def get_nopeus(self):
        return self.__nopeus
    
    def set_nopeus(self, nopeus):
        if nopeus >= 0:
            self.__nopeus = nopeus
        else:
            print("Nopeuden täytyy olla positiivinen.")

auto = Ajoneuvo("Toyota", 100)
auto.set_nopeus(120)
print(auto.get_nopeus())
# auto.set_nopeus(-50)  # Testaus negatiivisella arvolla