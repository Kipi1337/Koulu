luku1 = int(input("Anna luku: "))
luku2 = int(input("Anna luku: "))
luku3 = int(input("Anna luku: "))
luku4 = int(input("Anna luku: "))
luku5 = int(input("Anna luku: "))

luku = [luku1, luku2, luku3, luku4, luku5]
summa = 0
for item in luku:
    if item > 0:
        summa += item

print("Lukujen summa on : "+str(summa))