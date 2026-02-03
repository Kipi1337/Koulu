namespace E10
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;
        
        // Declare the controls as private fields of the form.
        private TextBox txtMerkki;
        private TextBox txtMalli;
        private TextBox txtRekisterinumero;
        private Button BtnLisaa;
        private Button BtnPoista;
        private ListBox lstAutot;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Text = "Auto Hallinta";

            // TextBox for Merkki (Car Brand)
            this.txtMerkki = new System.Windows.Forms.TextBox();
            this.txtMerkki.Location = new System.Drawing.Point(12, 30);
            this.txtMerkki.Name = "txtMerkki";
            this.txtMerkki.Size = new System.Drawing.Size(200, 20);
            this.txtMerkki.TabIndex = 0;

            // Label for Merkki
            Label lblMerkki = new Label();
            lblMerkki.Location = new Point(12, 10);
            lblMerkki.Text = "Merkki (Car Brand)";
            lblMerkki.AutoSize = true;
            this.Controls.Add(lblMerkki);

            // TextBox for Malli (Car Model)
            this.txtMalli = new System.Windows.Forms.TextBox();
            this.txtMalli.Location = new System.Drawing.Point(12, 75);
            this.txtMalli.Name = "txtMalli";
            this.txtMalli.Size = new System.Drawing.Size(200, 20);
            this.txtMalli.TabIndex = 1;

            // Label for Malli
            Label lblMalli = new Label();
            lblMalli.Location = new Point(12, 55);
            lblMalli.Text = "Malli (Car Model)";
            lblMalli.AutoSize = true;
            this.Controls.Add(lblMalli);

            // TextBox for Rekisterinumero (Car Registration Number)
            this.txtRekisterinumero = new System.Windows.Forms.TextBox();
            this.txtRekisterinumero.Location = new System.Drawing.Point(12, 120);
            this.txtRekisterinumero.Name = "txtRekisterinumero";
            this.txtRekisterinumero.Size = new System.Drawing.Size(200, 20);
            this.txtRekisterinumero.TabIndex = 2;

            // Label for Rekisterinumero
            Label lblRekisterinumero = new Label();
            lblRekisterinumero.Location = new Point(12, 100);
            lblRekisterinumero.Text = "Rekisterinumero (Car Registration)";
            lblRekisterinumero.AutoSize = true;
            this.Controls.Add(lblRekisterinumero);

            // Button for adding a car
            this.BtnLisaa = new System.Windows.Forms.Button();
            this.BtnLisaa.Location = new System.Drawing.Point(230, 30);
            this.BtnLisaa.Name = "BtnLisaa";
            this.BtnLisaa.Size = new System.Drawing.Size(75, 23);
            this.BtnLisaa.TabIndex = 3;
            this.BtnLisaa.Text = "Lisää Auto";
            this.BtnLisaa.UseVisualStyleBackColor = true;
            this.BtnLisaa.Click += new System.EventHandler(this.BtnLisaa_Click);

            // Button for removing a car
            this.BtnPoista = new System.Windows.Forms.Button();
            this.BtnPoista.Location = new System.Drawing.Point(230, 70);
            this.BtnPoista.Name = "BtnPoista";
            this.BtnPoista.Size = new System.Drawing.Size(75, 23);
            this.BtnPoista.TabIndex = 4;
            this.BtnPoista.Text = "Poista Auto";
            this.BtnPoista.UseVisualStyleBackColor = true;
            this.BtnPoista.Click += new System.EventHandler(this.BtnPoista_Click);

            // ListBox to display cars
            this.lstAutot = new System.Windows.Forms.ListBox();
            this.lstAutot.Location = new System.Drawing.Point(12, 160);
            this.lstAutot.Name = "lstAutot";
            this.lstAutot.Size = new System.Drawing.Size(300, 200);
            this.lstAutot.TabIndex = 5;

            // Add all controls to the form
            this.Controls.Add(this.txtMerkki);
            this.Controls.Add(this.txtMalli);
            this.Controls.Add(this.txtRekisterinumero);
            this.Controls.Add(this.BtnLisaa);
            this.Controls.Add(this.BtnPoista);
            this.Controls.Add(this.lstAutot);
        }
    }
}
