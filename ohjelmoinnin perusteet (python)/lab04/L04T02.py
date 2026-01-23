a = int(input("Anna maanantain sademäärä: "))
b = int(input("Anna tiistain sademäärä: "))
c = int(input("Anna keskiviikon sademäärä: "))
d = int(input("Anna torstain sademäärä: "))
e = int(input("Anna perjantain sademäärä: "))
f = int(input("Anna lauantain sademäärä: "))
g = int(input("Anna sunnuntain sademäärä: "))

yht = [a, b, c, d, e, f, g]
sade = 0
for item in yht:
    if item > 0:
        sade += item

print("Sademäärä yhteensä: "+str(sade))