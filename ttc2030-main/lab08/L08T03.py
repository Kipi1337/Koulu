arvosana = []

while True:
    try:
        arvo = int(input("Anna Arvosana välillä 0-5: "))
        if arvo >= 0 and arvo <= 5:
            arvosana.append(arvo)
            continue
        else:
            print("älä huijaa")
    except ValueError:
        break

# Tämä tulostaa listassa olevat arvosanat
# print("Listassa on arvosanat: ")
# for nimi in arvosana:
#    print(nimi)

print("arvosanoja on "+str(len(arvosana))+" kappaletta")
summa = sum(arvosana)
count = len(arvosana)
while True:
    try:
        keskiarvo = summa / count
        print("keskiarvo: ",keskiarvo)
        break
    except ZeroDivisionError:
        print("ei arvosanoja")
        break