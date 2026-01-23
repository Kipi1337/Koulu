myError = ValueError("Ei täällä nosteta")

class saldo:
    def __init__(self):
        self.massit=2000
        print("Tililläsi on "+str(self.massit))

    def talleta(self):
        amount = int(input("Anna talletettavien eurojen määrä: "))
        if (amount < 0):
            raise myError
        cents = float(input("Anna senttien määrä: "))
        if (cents < 0):
            raise myError
        self.massit += amount
        self.massit += cents/100
        print("Talletit "+str(amount)+" euroa "+str(cents)+" senttiä")
        print("Tililläsi on "+str(self.massit)+"€")


s = saldo()
s.talleta()