# 7.1.1 Polymorfismi - Asiakaspalvelujärjestelmä
from abc import ABC, abstractmethod

class Viestintakanava(ABC):
    @abstractmethod
    def kasittele_viesti(self, viesti):
        pass

class Sahkoposti(Viestintakanava):
    def kasittele_viesti(self, viesti):
        print(f"Sähköpostiviesti tallennettu tukijärjestelmään: '{viesti}'. Asiakaspalvelija vastaa pian.")

class Chat(Viestintakanava):
    def kasittele_viesti(self, viesti):
        print(f"Chat-asiakaspalvelija vastaa heti: '{viesti}'")

class Puhelin(Viestintakanava):
    def kasittele_viesti(self, viesti):
        print(f"Asiakaspalvelija vastaa puheluun ja sanoo: '{viesti}'")

viestintakanavat = [Sahkoposti(), Chat(), Puhelin()]
viesti = "Minulla on ongelma tilaukseni kanssa."
for kanava in viestintakanavat:
    kanava.kasittele_viesti(viesti)