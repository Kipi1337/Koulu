
a = float(input("Anna kilometri määrä: "))
b = float(input("Anna keskikulutus: "))
def get_fuel(a,b):
    "a=kilometrit"
    "b=keskikulutus"
    "c=vastaus kulunut aine"
    result = round(a/100*b, 1)
    return(result)

print("Kulunut aine: "+str(get_fuel(a,b)))