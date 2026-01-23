import random

# listataan vaihtoehdot listaan
vaihtoehdot = ["kivi","sakset","paperi"]

# tehdään pelaajalle syöte ja botille random funktio
while True:
    player = input("Kivi, sakset vai paperi?: ")
    botti = random.choice(vaihtoehdot)
    print("Pelaaja valitsi: "+player)
    print("botti valitsi: "+botti)
# vaihtoehdot ja lopputulokset
    if player == botti:
        print("Tasapeli")
    elif player == "kivi":
        if botti == "sakset":
            print("Kivi rikkoo sakset. Voitit")
        else:
            print("paperi peittää kiven. Hävisit")
    elif player == "sakset":
        if botti == "paperi":
            print("sakset leikkaa paperin. Voitit")
        else:
            print("kivi tuhoaa sakset. Hävisit")
    elif player == "paperi":
        if botti == "kivi":
            print("paperi peittää kiven. Voitit")
        else:
            print("sakset leikkaa paperin. Hävisit")
#uusipeli
    uusipeli= input("uusi peli? y/n: ")
    if uusipeli.lower() != "y":
        break