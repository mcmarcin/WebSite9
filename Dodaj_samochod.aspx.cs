using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Dodaj_samochod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        try
        {
            SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
            cnn.Open();
            SqlCommand cmd = new SqlCommand("insert into Samochod(Marka,Model,Typ,Rok_Produkcji,Pojemnosc_Silnika,Paliwo,Kolor,Opis,ID_Pracownika) values('" + Marka.Text + "','" + Model.Text + "','" + TypList.Text + "','" + RokProdukcji.Text + "','" + PojemnoscSilnika.Text + "','" + PaliwoList.Text + "','" + Kolor.Text + "','" + Opis.Text + "','1')", cnn);
            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        catch (Exception ex)
        {

        }
        Response.Redirect("Default.aspx");
    }
}