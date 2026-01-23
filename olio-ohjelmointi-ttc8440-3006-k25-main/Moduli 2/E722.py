# 7.2.2 Kompositio - Ravintola ja ruokalista
class Ruoka:
    def __init__(self, nimi, hinta):
        self.nimi = nimi
        self.hinta = hinta

class Ravintola:
    def __init__(self):
        self.ruoat = []
    
    def lisaa_ruoka(self, ruoka):
        self.ruoat.append(ruoka)
    
    def tulosta_ruokalista(self):
        for ruoka in self.ruoat:
            print(f"{ruoka.nimi} - {ruoka.hinta}€")

ravintola = Ravintola()
ravintola.lisaa_ruoka(Ruoka("Pasta Carbonara", 12.90))
ravintola.lisaa_ruoka(Ruoka("Burger", 10.50))
ravintola.lisaa_ruoka(Ruoka("Pizza Margherita", 11.00))
ravintola.tulosta_ruokalista()

