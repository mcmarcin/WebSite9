using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
       // RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
    }
    protected void RememberMe_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)

    {
        SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM Klient WHERE Login='" + UserName.Text + "' AND Haslo='" + Password.Text + "'", cnn);
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Pracownik WHERE Login='" + UserName.Text + "' AND Haslo='" + Password.Text + "'", cnn);

        SqlDataReader dr;
        SqlDataReader dr2;
        cnn.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        if (dr.HasRows)
        {
            Session["Login"] = UserName.Text;
            Session["ID"] = dr["ID_Klienta"].ToString();

            Response.Redirect("About.aspx");
        }
        else
        {
            BłędneLogowanie.Text = "NIEUDANE LOGOWANIE! Sprawdź wprowadzane dane!!";
            BłędneLogowanie.Visible = true;
        }
        dr.Close();

        dr2 = cmd2.ExecuteReader();
        dr2.Read();

        if (dr2.HasRows)
        {
            Session["Login2"] = UserName.Text;
            Session["ID"] = dr2["ID_Pracownika"].ToString();

            Response.Redirect("Dodaj_Samochod.aspx");
        }
        else
        {
            BłędneLogowanie.Text = "NIEUDANE LOGOWANIE! Sprawdź wprowadzane dane!!";
            BłędneLogowanie.Visible = true;
        }
        dr2.Close();

        cnn.Close();
    }
}
