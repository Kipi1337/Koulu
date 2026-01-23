nimet = []

numero = 0

while numero < 3:
    try:
        nimet.append(input("anna nimi: "))
        numero = numero+1
    except:
        break

print("Listassa on nimet: ")
for nimi in nimet:
    print(nimi)
print("väärinpäin: ")
rev = nimet[::-1]
for item in rev:
    print(item)