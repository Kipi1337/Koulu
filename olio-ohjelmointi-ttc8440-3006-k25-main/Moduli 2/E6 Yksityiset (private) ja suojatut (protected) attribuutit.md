# Yksityiset (private) ja suojatut (protected) attribuutit - Harjoitustehtävät

## 6.1. Tehtävä: Suojatun attribuutin käyttö**
### **Tavoite**
- Harjoitella **protected** (`_nimi`) attribuuttien käyttöä ja ymmärtää niiden merkitys.

### **Ohjeet**
1. Luo **`Henkilo`**-luokka, jolla on seuraavat ominaisuudet:
   - `nimi` (julkinen attribuutti).
   - `_ika` (suojattu attribuutti).
2. Toteuta metodi `kasva_vuosi()`, joka kasvattaa henkilön ikää yhdellä.
3. Luo aliluokka **`Opiskelija`**, joka perii `Henkilo`-luokan.
4. Tee metodin `kasva_vuosi()` ylikirjoitus niin, että opiskelijan ikä kasvaa **kahdella vuodella** kerrallaan.
5. Luo `Opiskelija`-olio ja käytä `kasva_vuosi()`-metodia.

Esimerkkituloste:
opiskelija = Opiskelija("Anna", 20)
opiskelija.kasva_vuosi()  # Kasvattaa iän kahdella vuodella
opiskelija.nayta_tiedot()  # Tulostaa: Nimi: Anna, Ikä: 22 vuotta


---

## **6.2. Tehtävä: Yksityisen attribuutin (private) käyttö**
### **Tavoite**
- Harjoitella **private** (`__nimi`) attribuutteja ja estää suora pääsy niihin.

### **Ohjeet**
1. Luo luokka **`Pankkitili`**, jossa on seuraavat ominaisuudet:
   - `tilinumero` (julkinen attribuutti).
   - `__saldo` (yksityinen attribuutti).
2. Luo metodit:
   - `talleta(maara)`, joka lisää rahaa tilille.
   - `nosta(maara)`, joka vähentää rahaa, jos saldo riittää.
   - `tulosta_saldo()`, joka näyttää nykyisen saldon.
3. Luo `Pankkitili`-olio ja yritä nostaa ja tallettaa rahaa.
4. 

***Testaa pankkitili-olio
tili = Pankkitili("FI123456789", 500)
tili.talleta(200)
tili.nosta(100)
tili.tulosta_saldo()

**Testaa myös, että saldoa ei voi muuttaa suoraan** (`__saldo = 1000` pitäisi aiheuttaa virheen).

---

## **6.3. Tehtävä: Getter- ja setter-metodit**
### **Tavoite**
- Oppia käyttämään **getter- ja setter-metodeja** yksityisten attribuuttien hallintaan.

### **Ohjeet**
1. Luo luokka **`Ajoneuvo`**, jossa on seuraavat attribuutit:
   - `merkki` (julkinen).
   - `__nopeus` (yksityinen).
2. Luo metodit:
   - `get_nopeus()`, joka palauttaa nopeuden.
   - `set_nopeus(nopeus)`, joka asettaa uuden nopeuden, mutta vain jos se on **positiivinen**.
3. Luo `Ajoneuvo`-olio ja käytä `set_nopeus()`-metodia muuttaaksesi nopeutta.
   Testaa myös negatiivisilla arvoilla auto.set_nopeus(-50)

---

## **6.4. Tehtävä: Getter ja setter @property**
### **Tavoite**
- Ymmärtää Pythonin moderni tapa käyttää **getter- ja setter-metodeja** ilman erillisiä funktioita.

### **Ohjeet**
1. Luo luokka **`Lämpömittari`**, jossa on seuraavat attribuutit:
   - `__lampotila` (yksityinen).
2. Lisää **`@property`-getter**, joka palauttaa lämpötilan.
3. Lisää **`@lampotila.setter`-setter**, joka sallii lämpötilan muuttamisen vain, jos se on **realistinen (-50°C – 100°C).**
4. Luo `Lämpömittari`-olio ja testaa lämpötilan asettamista ja lukemista.
   Testaa myös negatiivisilla arvoilla mittari.lampotila = -100

---

## **6.5. Tehtävä: Kokonaisvaltainen sovellus**
### **Tavoite**
- Käyttää **private, protected, getterit, setterit ja @property** yhdistettynä reaalimaailman sovellukseen.

### **Ohjeet**
1. Luo luokka **`Tili`**, joka mallintaa käyttäjän **pankkitiliä**.
   - `__saldo` (yksityinen).
   - `_tilinumero` (suojattu).
2. Lisää **getter- setter-metodit ja `@property`** saldoon.
   - **Estä negatiivinen saldo.**
3. Luo aliluokka **`Säästötili`**, joka **lisää korot saldoon** aina, kun talletus tehdään.
4. Luo `Säästötili`-olio ja testaa **talletuksia ja nostoja**. 