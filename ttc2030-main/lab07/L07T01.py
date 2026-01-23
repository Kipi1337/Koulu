import random
class Pelikortti:
    maa = "Pata, Hertta, Ruutu, Risti"
    arvo = 2-14

kortti1 = Pelikortti()
kortti1.maa = "Risti "
kortti1.arvo = random.randint(2,14)
print(str(kortti1.maa)+str(kortti1.arvo))

kortti2 = Pelikortti()
kortti2.maa = "Pata "
kortti2.arvo = random.randint(2,14)
print(str(kortti2.maa)+str(kortti2.arvo))

kortti3 = Pelikortti()
kortti3.maa = "Hertta "
kortti3.arvo = random.randint(2,14)
print(str(kortti3.maa)+str(kortti3.arvo))

kortti4 = Pelikortti()
kortti4.maa = "Ruutu "
kortti4.arvo = random.randint(2,14)
print(str(kortti4.maa)+str(kortti4.arvo))

kortti5 = Pelikortti()
kortti5.maa = "Risti "
kortti5.arvo = random.randint(2,14)
print(str(kortti5.maa)+str(kortti5.arvo))