#revittiin valmis randomi pyyttonin kirjastosta
import random

count = 1
lottonumbers = []

#määriteltiin funktio lotto
def lotto():
    number = random.sample(range(1,40), 7)
    lottonumbers.append(number)

#lotolle kun funktio#
while True:
    lotto()
    count-=1
    if count == 0:
        break

txt = open("lotto.txt" , 'a')
txt.write(f"\n{str(lottonumbers)[2:-2]}")