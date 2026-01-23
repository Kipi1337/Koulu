class Koiranpentu:
    def __init__(self, nimi, ika, paino):
        self.nimi = nimi
        self.ika = ika
        self.paino = paino
    
    def kasva(self, kuukaudet):
        self.ika += kuukaudet
        self.paino += 0.5 * kuukaudet
    
    def tulosta_tiedot(self):
        print(f"Koiran nimi: {self.nimi}, ikä: {self.ika} kuukautta, paino: {self.paino:.1f} kg.")

# Olion luominen
rex = Koiranpentu("Rex", 3, 5.0)

# Koiran kasvattaminen ja tietojen tulostaminen
rex.kasva(4)
rex.tulosta_tiedot()
