using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {

    }
    private bool Porownaj(string string1, string string2)
    {
        return String.Compare(string1, string2, true, System.Globalization.CultureInfo.InvariantCulture) == 0 ? true : false;
    }
    protected void UtworzUzytkownikarButton_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
        SqlCommand dodajkrotkeklient = new SqlCommand("insert into Klient(Imie,Nazwisko,Telefon,Email,Login,Haslo) values('" + Imie.Text + "','" + Nazwisko.Text + "','" + Telefon.Text + "','" + Email.Text + "','" + Login.Text + "','" + Haslo.Text + "')", cnn);
        SqlCommand dodajkrotkepracownik = new SqlCommand("insert into Pracownik(Imie,Nazwisko,Telefon,Email,Stanowisko,Login,Haslo) values('" + Imie.Text + "','" + Nazwisko.Text + "','" + Telefon.Text + "','" + Email.Text + "','Specialista','" + Login.Text + "','" + Haslo.Text + "')", cnn);

        cnn.Open();
        if (this.Porownaj(Uzytkownik.Text, "Klient"))
        {
            dodajkrotkeklient.ExecuteNonQuery();
        }
        else
        {
            dodajkrotkepracownik.ExecuteNonQuery();
        }
        cnn.Close();
       
        Response.Redirect("About.aspx");
    }
}
