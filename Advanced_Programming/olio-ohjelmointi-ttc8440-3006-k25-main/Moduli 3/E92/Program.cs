using System;
using System.Text.RegularExpressions;

class Henkilo
{
    private string etunimi;
    private string sukunimi;

    public string Etunimi
    {
        get { return etunimi; }
        set
        {
            if (string.IsNullOrWhiteSpace(value) || !OnkoValidiNimi(value))
                throw new ArgumentException("Virheellinen etunimi.");
            etunimi = value;
        }
    }

    public string Sukunimi
    {
        get { return sukunimi; }
        set
        {
            if (string.IsNullOrWhiteSpace(value) || !OnkoValidiNimi(value))
                throw new ArgumentException("Virheellinen sukunimi.");
            sukunimi = value;
        }
    }

    public Henkilo(string etunimi, string sukunimi)
    {
        Etunimi = etunimi;
        Sukunimi = sukunimi;
    }

    public void TulostaTiedot()
    {
        Console.WriteLine($"Henkilo: {Etunimi} {Sukunimi}");
    }

    public static bool OnkoValidiNimi(string nimi)
    {
        return Regex.IsMatch(nimi, "^[a-zA-ZäöåÄÖÅ]+$");
    }
}

class Program
{
    static void Main()
    {
        try
        {
            Henkilo henkilo = new Henkilo("Matti", "Meikäläinen");
            henkilo.TulostaTiedot();
        }
        catch (Exception e)
        {
            Console.WriteLine("Virhe: " + e.Message);
        }
    }
}
