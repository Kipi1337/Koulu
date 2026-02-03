# 6.5. Kokonaisvaltainen sovellus
class Tili:
    def __init__(self, tilinumero, saldo):
        self._tilinumero = tilinumero
        self.__saldo = saldo
    
    @property
    def saldo(self):
        return self.__saldo
    
    @saldo.setter
    def saldo(self, arvo):
        if arvo >= 0:
            self.__saldo = arvo
        else:
            print("Saldo ei voi olla negatiivinen.")
    
    def talleta(self, maara):
        if maara > 0:
            self.__saldo += maara
    
    def nosta(self, maara):
        if 0 < maara <= self.__saldo:
            self.__saldo -= maara
        else:
            print("Ei tarpeeksi saldoa tai virheellinen määrä.")

class Saastotili(Tili):
    def __init__(self, tilinumero, saldo, korkoprosentti):
        super().__init__(tilinumero, saldo)
        self.korkoprosentti = korkoprosentti
    
    def talleta(self, maara):
        if maara > 0:
            korko = maara * (self.korkoprosentti / 100)
            self.saldo += maara + korko

saastotili = Saastotili("FI987654321", 1000, 2)
saastotili.talleta(500)
saastotili.nosta(300)
print(saastotili.saldo)