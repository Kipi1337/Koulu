text = open("nimet.txt","r")
d = dict()
for rivi in text:
    rivi = rivi.strip()
    rivi = rivi.lower()
    sanat = rivi.split(" ")
    for sana in sanat:
        if sana in d:
            d[sana] = d[sana] + 1
        else:
            d[sana] = 1
for x in list(d.keys()):
    print(x,"=", d[x],"kertaa")