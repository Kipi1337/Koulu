# 6.2. Yksityisen attribuutin käyttö
class Pankkitili:
    def __init__(self, tilinumero, saldo):
        self.tilinumero = tilinumero
        self.__saldo = saldo
    
    def talleta(self, maara):
        self.__saldo += maara
    
    def nosta(self, maara):
        if maara <= self.__saldo:
            self.__saldo -= maara
        else:
            print("Ei tarpeeksi saldoa.")
    
    def tulosta_saldo(self):
        print(f"Saldo: {self.__saldo} euroa")

tili = Pankkitili("FI123456789", 500)
tili.talleta(200)
tili.nosta(100)
tili.tulosta_saldo()