import os.path

tallennus = '../../../../../../../'
tiedoston_nimi = "ayho"
completeName = os.path.join(tallennus, tiedoston_nimi+".txt")         
file1 = open(completeName, "w")
toFile = "isokasapupuja"
file1.write(toFile)
file1.close()