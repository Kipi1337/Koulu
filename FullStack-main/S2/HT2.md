Tutki oheista ohjelmakoodia. Pohdi rivinumeroita apuna käyttäen (rivi riviltä),
miksi ohjelma (ja missä järjestyksessä ohjelma etenee)
tulostaa web-konsolille seuraavan tiedon: Pitsa kinkulla ja juustolla

<script>
    const myFunctionWithCallback = (p1, p2, callback) => {
        return callback(p1, p2)
    }

    const myFunc = (p1, p2) => `Pitsa ${p1} ja ${p2}`
    const result = myFunctionWithCallback('kinkulla', 'juustolla', myFunc)
    console.log(result)
</script>

emnsiksi myfunction ottaa const resultsista argumentit kinkulla ja juustolla, jonka jälkeen se palauttaa ne callback functiolle.
myFunc tulostaa `Pitsa ${p1} ja ${p2}` ja laittaa p1 ja p2 muuttujien tilalle argumentit jotka ovat callback funktiossa.
Tämän jälkeen funktio loggaa tulokset web konsolille