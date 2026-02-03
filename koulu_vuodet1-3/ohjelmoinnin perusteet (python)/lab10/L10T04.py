nimet = ["oispa","kakka","katossa","korvassa"]
print("Alkuperäinen lista: "+str(nimet))

try :
    nimet[4] = 'Polttoainejakeluasema'
except IndexError:
    res = "Element not in list !"

print(nimet)