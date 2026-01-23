print("lasketaan e potenssiin x eli e**x")

while True:
    a=input("anna x:")
    if a.isdigit():
        x=int(a)
        break
    else:
        print("x:n pitää olla kokonaisluku")


summa=1
osoittaja=1
nimittaja=1
for y in range(1,1000):
    osoittaja=osoittaja*x
    nimittaja=nimittaja*y
    try:
         summa=summa+osoittaja/nimittaja
    except:
        print("overflow")
        print(summa)
        print(osoittaja)
        print(nimittaja)
        break

print("e**",x,"=",summa)