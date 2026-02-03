# C# Harjoitustehtävät: Luokat ja oliot

## 1. Perusluokan ja olion luonti
Luo Henkilo-luokka, jolla on seuraavat ominaisuudet:

- **Attribuutit**: Etunimi ja Sukunimi (julkisia merkkijonoja).
- **Konstruktori**: Ottaa vastaan etu- ja sukunimen ja asettaa ne attribuuteille.
- **Metodi**: `TulostaTiedot()`, joka tulostaa henkilon koko nimen muodossa:

```csharp
Henkilo: Etunimi Sukunimi
```

### Pääohjelmassa:
- Luo Henkilo-olio ja kutsu sen TulostaTiedot()-metodia.

---
## 2. Kapselointi: Ominaisuudet ja tietojen validointi
Muokkaa Henkilo-luokkaa seuraavasti:

- Muutetaan yksityisiksi kentiksi (`private string etunimi, sukunimi`).
- Lisätään julkiset ominaisuudet Etunimi ja Sukunimi, joissa:
  - set-osiossa varmista, ettei arvo ole tyhjä tai nul`. Jos on, heitä `ArgumentException`.

- Lisää Henkilo-luokkaan staattinen metodi `OnkoValidiNimi(string nimi)`, joka palauttaa true, jos nimi on kelvollinen (ei numeroita tai erikoismerkkejä).
- Käytä tätä set-ominaisuudessa ennen arvon asettamista.

- Lisää Henkilo-luokkaan staattinen metodi `OnkoValidiNimi(string nimi)`, joka palauttaa true, jos nimi on kelvollinen (ei numeroita tai erikoismerkkejä).
- Käytä tätä set-ominaisuudessa ennen arvon asettamista.

vinkit:
using System;
using System.Text.RegularExpressions;

 return Regex.IsMatch...

### Pääohjelmassa:
- Kokeile luoda henkilo, jonka nimi on tyhjä merkkijono tai sisältää erikoismerkkejä  → ohjelman pitäisi antaa virheilmoitus.
---
## 3. Periytyminen ja metodin ylikirjoittaminen
Luo Tyontekija-luokka, joka perii Henkilo-luokan ja lisää:

- **Yksityinen** palkka-kenttä (double-tyyppi).
- **Julkinen ominaisuus** Palkka, joka ei salli negatiivisia arvoja.
- **Konstruktori**, joka asettaa myos palkan arvon.
- **Metodin** `TulostaTiedot()` ylikirjoitus (`override`), joka tulostaa myos palkan.

- **Lisää rajapinta ITyoTehtava, jossa on void SuoritaTyo(), joka tulostaa:
```csharp
Tyontekijä [nimi] suorittaa tyotehtäväänsä.
```

### Pääohjelmassa:
- Luo `Tyontekija`-olio ja tulosta sen tiedot.


- Toteuta rajapinta Tyontekija-luokassa ja testaa sitä pääohjelmassa.-

---
## 4. Staattinen laskuri olioiden määrälle
Luo Auto-luokka, jossa:

- **Attribuutit** Merkki ja Malli (julkisia merkkijonoja).
- **Konstruktori**, joka ottaa nämä parametreina.
- **Staattinen muuttuja** `autoLaskuri`, joka seuraa luotujen autojen määrää.
- **Staattinen metodi** `TulostaAutojenMaara()`, joka tulostaa montako autoa on luotu.

### Pääohjelmassa:
- Luo kolme `Auto`-oliota.
- Kutsu `TulostaAutojenMaara()` varmistaaksesi, että laskuri toimii.

- **Lisää:**
- Tee `Auto`-luokasta **abstrakti** ja lisää **abstrakti metodi** `Aja()`, jonka perivät luokat toteuttavat:
  - `Sahkoauto`: "Sahkoauto liikkuu hiljaisesti."
  - `BensaAuto`: "Bensa-auto hurisee moottorin käydessä."

### Pääohjelmassa:
- Luo `Sahkoauto`- ja `BensaAuto`-oliot ja kutsu niille `Aja()`.

---
## 5. Metodien ylikuormitus ja ikälaskuri
Muokkaa `Henkilo`-luokkaa lisäämällä **syntymävuosi**:

- **Konstruktori**, joka ottaa myos syntymävuoden.
- **Metodien ylikuormitus** `TulostaTiedot()`:
  - `TulostaTiedot()` tulostaa vain nimen.
  - `TulostaTiedot(bool naytaIka)` tulostaa myos ian.

### Pääohjelmassa:
- Luo henkilo, joka syntyi vuonna 1990, ja testaa molempia metodiversioita.
