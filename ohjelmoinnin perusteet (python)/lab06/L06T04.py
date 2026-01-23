tuomaripiste = [19,20,18,16,20]

for item in tuomaripiste:
    print("Hypyn pisteet: "+str(item))
for item in tuomaripiste:
    summa = sum(sorted(tuomaripiste)[1:-1])
print(summa)