luku1 = int(input("Montako kokonaislukua luodaan: "))
print("Montako lukua: ",luku1)

loop = 0
indeksi = 0
for item in range(luku1):
    indeksi = item*10
    loop += 1
    print(str(loop)+". luku: "+str(indeksi))