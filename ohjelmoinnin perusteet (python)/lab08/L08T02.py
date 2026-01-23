rekkari = []
kakka = ""

while True:
    kari = str(input("anna rekisterinumero: "))
    if kari == kakka:
        break
    else:
        rekkari.append(kari)
        continue

print("Listassa on rekkarit: ")
rekkari.sort()
for nimi in rekkari:
    print(nimi)