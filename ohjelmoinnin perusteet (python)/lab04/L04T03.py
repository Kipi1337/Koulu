loppu = 0
summa = 0
numerot = 0
while True:
    try:
        num = int(input("Anna kokonaisluku: "))
        numerot = numerot+1
        summa = summa+num
    except ValueError:
        break

print("Lukuja annettu: "+str(numerot))
print("Lukujen summa: "+str(summa))
 