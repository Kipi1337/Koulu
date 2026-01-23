using System;
using System.Windows.Forms;

namespace E10
{
    public partial class Form1 : Form
    {
        private AutoManager autoManager;

        public Form1()
        {
            InitializeComponent();
            autoManager = new AutoManager();  // Create AutoManager instance
            LoadAutoList();  // Load cars into the ListBox
        }

        // Load car list from AutoManager and display it in the ListBox
        private void LoadAutoList()
        {
            lstAutot.Items.Clear();  // Clear the current list in the ListBox
            var autot = autoManager.HaeAutot();  // Get all cars
            foreach (var auto in autot)
            {
                lstAutot.Items.Add(auto);  // Add each car to the ListBox
            }
        }

        // Button click event to add a car
        private void BtnLisaa_Click(object sender, EventArgs e)
        {
            var merkki = txtMerkki.Text;  // Get the car brand from the text box
            var malli = txtMalli.Text;    // Get the car model from the text box
            var rekisterinumero = txtRekisterinumero.Text;  // Get the registration number

            // Check if all fields are filled
            if (!string.IsNullOrEmpty(merkki) && !string.IsNullOrEmpty(malli) && !string.IsNullOrEmpty(rekisterinumero))
            {
                var auto = new Auto(merkki, malli, rekisterinumero);  // Create a new car
                autoManager.LisaaAuto(auto);  // Add the car to the AutoManager
                LoadAutoList();  // Refresh the ListBox to show the updated list
            }
            else
            {
                MessageBox.Show("Kaikki kentät on täytettävä!");  // Show a message if any field is empty
            }
        }

        // Button click event to remove a selected car
        private void BtnPoista_Click(object sender, EventArgs e)
        {
            var selectedCar = lstAutot.SelectedItem as Auto;  // Get the selected car from the ListBox
            if (selectedCar != null)
            {
                autoManager.PoistaAuto(selectedCar);  // Remove the selected car from AutoManager
                LoadAutoList();  // Refresh the ListBox to show the updated list
            }
            else
            {
                MessageBox.Show("Valitse poistettava auto listalta.");  // Show a message if no car is selected
            }
        }
    }
}
