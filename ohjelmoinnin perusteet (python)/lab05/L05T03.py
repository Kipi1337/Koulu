
a = int(input("Anna kokonaisluku: "))
b = int(input("Anna toinen kokonaisluku: "))
c = int(input("Anna kolmas kokonaisluku: "))

def average(a,b,c):
    sum = (a+b+c)
    result = round(sum/3, 1)
    return result

print(average(a,b,c))

