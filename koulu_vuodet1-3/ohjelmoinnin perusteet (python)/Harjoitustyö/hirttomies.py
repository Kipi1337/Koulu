import time
nimi = input("kerro nimesi: ")

print("Tervetuloa hirsipuu peliin! "+nimi+".")
time.sleep(1)
print("Seuraavaksi syötä elämien määrä ja arvattava sana.")
time.sleep(1)

arvaukset = ""
väärät = []
#halutessasi voit muokata elämäpisteiden määrää
while True:
    elämä = int(input("Syötä elämien määrä: "))
    if elämä <= 0:
        print("elämä ei voi olla nolla")
    else:
        break

#muuttamalla sanan perässä hipsujen sisällä olevaa sanaa voit vaihtaa arvattavan sanan mieleiseksi
sana = input("Syötä arvattava sana: ")
time.sleep(1)
print("Aloita arvaaminen")

while elämä > 0:
    voitto = 0
    for kirjain in sana:
        if kirjain in arvaukset:
            time.sleep(0.1)
            print(kirjain,end="")
        else:
            print("_",end="")
            voitto += 1
    if voitto == 0:
        print(" Voitit!")
        break
    kirjain = input(" arvaa kirjain: ")
    if len(kirjain) > 1:
        time.sleep(0.1)
        print("vain yksi kirjain")
        continue
    arvaukset += kirjain
    if kirjain not in sana:
        elämä -= 1
        väärät.append(kirjain)
        time.sleep(.5)
        kollaasi = ("[{0}]".format(', '.join(map(str, väärät))))
        print("Arvasit väärin, väärät kirjaimet: "+str(kollaasi)[1:-1])
        time.sleep(.5)
        print("sinulla on "+str(elämä)+" elämää")
        time.sleep(.3)
        if elämä == 0:
            print("hävisit")
input("")