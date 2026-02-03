a = int(input("Anna numero 1-10 väliltä: "))

summa = 0
count = 0

for item in range(a):
    if a < 11:
        count += 1
        summa = count*count
        print("Luvun "+str(count)+" neliö on "+str(summa))
    else:
        break
