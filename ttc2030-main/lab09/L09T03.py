txt = open("luvut.txt" , 'a')
sum = []
while True:
    luku = input("Anna kokonaisluku: ")
    if luku == "":
        break
    else:
        txt.write(f"\n{luku}")
        sum.append(luku)
        continue   


end = len(sum)
print("Syötit "+str(end)+" lukua")