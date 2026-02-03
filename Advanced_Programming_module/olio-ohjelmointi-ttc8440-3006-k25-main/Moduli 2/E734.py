# 7.3.4 Opiskelijarekisteri ja iteroitavuus
class Opiskelija:
    def __init__(self, nimi):
        self.nimi = nimi

    def __str__(self):
        return self.nimi

class OpiskelijaRekisteri:
    def __init__(self):
        self.opiskelijat = []

    def lisaa_opiskelija(self, opiskelija):
        self.opiskelijat.append(opiskelija)

    def __iter__(self):
        return iter(self.opiskelijat)

# Luo rekisteri ja lisää opiskelijat
rekisteri = OpiskelijaRekisteri()
rekisteri.lisaa_opiskelija(Opiskelija("Laura"))
rekisteri.lisaa_opiskelija(Opiskelija("Matti"))
rekisteri.lisaa_opiskelija(Opiskelija("Kaisa"))

# Tulostetaan kaikki opiskelijat
for opiskelija in rekisteri:
    print(opiskelija)
