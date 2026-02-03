# OSA 1

# Määritellään muuttuja ja asetetaan alkuarvoksi 123
arvo = 123
IO.puts(arvo)

# Kysy käyttäjältä syöte
käyttäjän_syöte = IO.gets("Syötä tekstiä: ") |> String.trim()

# Lisätään teksti "You said that: " käyttäjän syötteeseen
yhdistetty_teksti = "You said that: " <> käyttäjän_syöte

# Tulosta yhdistetty teksti konsoliin
IO.puts(yhdistetty_teksti)


# OSA 2

# Laske 154 jaettuna 78:lla
tulos = 154 / 78
IO.puts(tulos)

# Pyöristä tulos lähimpään kokonaislukuun
pyöristetty_tulos = round(tulos)
IO.puts(pyöristetty_tulos)

# Ota tuloksesta vain kokonaisosa
kokonaisosa = trunc(tulos)
IO.puts(kokonaisosa)


# OSA 3

# Kysy käyttäjältä tekstirivi ja poista ylimääräiset rivinvaihdot
käyttäjän_syöte = IO.gets("Syötä tekstiä: ") |> String.trim()

# Tulosta käyttäjän syöttämän tekstin merkkien määrä
IO.puts(String.length(käyttäjän_syöte))

# Tulosta käyttäjän syöttämä teksti käänteisessä järjestyksessä
IO.puts(String.reverse(käyttäjän_syöte))

# Korvaa käyttäjän syöttämässä tekstissä sana "foo" sanalla "bar"
korvattu_teksti = String.replace(käyttäjän_syöte, "foo", "bar")
IO.puts(korvattu_teksti)


# OSA 4

# Määritä anonyymi funktio, joka ottaa kolme parametria ja laskee niiden tulon
kerro = fn a, b, c -> a * b * c end

# Kysy käyttäjältä kolme numeroa ja anna ne funktiolle
IO.puts("Syötä kolme numeroa:")
num1 = IO.gets("Numero 1: ") |> String.trim() |> String.to_integer()
num2 = IO.gets("Numero 2: ") |> String.trim() |> String.to_integer()
num3 = IO.gets("Numero 3: ") |> String.trim() |> String.to_integer()

# Tulosta tulo
IO.puts(kerro.(num1, num2, num3))

# Määritä anonyymi funktio, joka yhdistää kaksi listaa ja palauttaa tuloksen
yhdistä_listat = fn lista1, lista2 -> lista1 ++ lista2 end

# Kutsu listojen yhdistämisfunktiota ja tulosta
lista1 = [1, 2, 3]
lista2 = [4, 5, 6]
IO.puts(inspect(yhdistä_listat.(lista1, lista2)))

# Määritä tuple, jossa on elementit :ok ja :fail
tuple = {:ok, :fail}

# Lisätään tupleen elementti ":canceled" ja tulostus
yhdistetty_tuple = Tuple.append(tuple, :canceled)
IO.puts(inspect(yhdistetty_tuple))
