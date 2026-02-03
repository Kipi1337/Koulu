class Laskuri:
    lukumaara = 0
    
    def __init__(self):
        Laskuri.lukumaara += 1
    
    @staticmethod
    def lukumaara_tiedot():
        print(f"Luotuja olioita: {Laskuri.lukumaara}")

# Luodaan kolme Laskuri-oliota
l1 = Laskuri()
l2 = Laskuri()
l3 = Laskuri()

# Kutsutaan staattista metodia
Laskuri.lukumaara_tiedot()