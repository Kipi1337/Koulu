
a = float(input("Anna ajetut kilometrit: "))
b = float(input("Anna keskikulutus: "))
c = float(input("Anna polttoaineen litrahinta: "))

def get_cost(a,b,c):
    "a=kilometrit"
    "b=keskikulutus"
    "c=litrahinta"
    result=round(a/100*b*c, 2)
    return(f'{result:.2f}')

print("Polttoaineen hinta: "+str(get_cost(a,b,c))+"€")