
oppilaat = []

numero = 0

while True:
    nimet=input("anna oppilaan nimi: ")
    if nimet=="":
        break
    else:
        oppilaat.append(nimet)
        numero = numero+1
        
print("Listassa on nimet: ")
pilkku = ', '.join(oppilaat)
print(pilkku)

print("Oppilaiden määrä: "+str(numero))