
celsius=10
fahrenheitt=38

def celToFah(celsius):
    fahrenheit = celsius*1.8+32
    return round(fahrenheit,1)

def FahToCel(fahrenheitt):
    celcius = (fahrenheitt-32)*0.55
    return round(celcius,1)



print(celToFah(celsius))
print(FahToCel(fahrenheitt))