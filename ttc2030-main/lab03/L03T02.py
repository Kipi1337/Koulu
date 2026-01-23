a = int(input("Anna kokonaisluku: "))
b = int(input("Anna toinen kokonaisluku: "))
c = int(input("Anna kolmas kokonaisluku: "))

if (a >= b) and (a >= c) : 
    suurin = a

elif (b >= a) and (b >= c) :
    suurin = b

elif (c >= a) and (c >= b) :
    suurin = c

print("Numero",suurin,"on suurin")