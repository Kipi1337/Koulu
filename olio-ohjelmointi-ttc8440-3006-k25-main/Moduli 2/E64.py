# 6.4. Getter ja setter @property
class Lampomittari:
    def __init__(self, lampotila=0):
        self.__lampotila = lampotila
    
    @property
    def lampotila(self):
        return self.__lampotila
    
    @lampotila.setter
    def lampotila(self, arvo):
        if -50 <= arvo <= 100:
            self.__lampotila = arvo
        else:
            print("Virheellinen lämpötila-arvo.")

mittari = Lampomittari()
mittari.lampotila = 25
print(mittari.lampotila)
# mittari.lampotila = -100  # Testaus virheellisellä arvolla