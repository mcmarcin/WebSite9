using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            this.Master.LabelLoginText = "Jesteś zalogowany jako klient!   Witaj :" + Session["Login"].ToString();
            this.Master.FindControl("LabelLogin").Visible = true;
            GridView3.Visible = false;
        }
           
        if (Session["Login2"] != null)
        {
            this.Master.LabelLoginText = "Jesteś zalogowany jako pracownik!   Witaj :" + Session["Login2"].ToString();
            this.Master.FindControl("LabelLogin").Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = true;
            WyszukajMarkaButton.Visible = false;
            WyswietlWszystkieButton.Visible = false;
            WyszukajMarkaLabel.Visible = false;
            WyszukajMarka.Visible = false; 
        }
        if (Session["Login"] == null && Session["Login2"] == null)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
            WyszukajMarkaButton.Visible = false;
            WyswietlWszystkieButton.Visible = false;
            WyszukajMarkaLabel.Visible = false;
            WyszukajMarka.Visible = false; 
        }
    }
    protected void WyszukajMarkaButton_Click(object sender, EventArgs e)
    {
       
            GridView1.Visible = false;
            GridView2.Visible = true;
       
    }

    protected void WyswietlWszystkieButton_Click(object sender, EventArgs e)
    {
      
            GridView1.Visible = true;
            GridView2.Visible = false;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "rezerwuj")
        {

            // foreach(GridViewRow Grd in GridView1.Rows)
            // {
            //    TextBox ddd = Grd.FindControl("KalendarzDataOdTextBox") as TextBox;
            //             
            //     Data_od.Text = ddd.Text;
           
            //  }
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            string value = row.Cells[0].Text;
            ID_Wiersza.Text = value;
            string value1 = (GridView1.Rows[index].FindControl("KalendarzDataOdTextBox") as TextBox).Text;
            string value2 = (GridView1.Rows[index].FindControl("KalendarzDataDoTextBox") as TextBox).Text;
            Data_od.Text = value1;
            Data_do.Text = value2;
          
            if (Data_od.Text == "" || Data_do.Text == "")

            {
                Label1.Visible = true;
                Label1.Text = "Wprowadż daty !";
                Label2.Visible = false;
            
            }
            else
            {
                SqlConnection cnn1 = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM Rezerwacja WHERE ID_Samochodu='" + ID_Wiersza.Text + "' AND (((Data_Wypozyczenia <= '" + Data_od.Text + "' AND Data_Oddania >= '" + Data_od.Text + "') OR (Data_Wypozyczenia <= '" + Data_do.Text + "'  AND Data_Oddania >= '" + Data_do.Text + "')) OR (Data_Wypozyczenia >='" + Data_od.Text + "' AND Data_Oddania <= '" + Data_do.Text + "' ))  ", cnn1);
                SqlDataReader dr1;
                cnn1.Open();

                dr1 = cmd1.ExecuteReader();
                dr1.Read();

                if (dr1.HasRows)
                {
                    Label1.Visible = false;
                    Label2.Visible = true;
                    Label2.Text = "Samochód w tym przedziale czasu został już zarezerwowany ! Prosimy o zmianę terminu lub wybór innego modelu..";
                   
                }
                else
                {

                    Label1.Visible = false;
                    Label2.Visible = false;
                    SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
                    SqlCommand dodajkrotkerezerwacja = new SqlCommand("insert into Rezerwacja(ID_Samochodu,ID_Klienta,Data_Wypozyczenia,Data_Oddania) values('" + ID_Wiersza.Text + "','" + Session["ID"].ToString() + "','" + Data_od.Text + "','" + Data_do.Text + "')", cnn);

                    cnn.Open();
                    dodajkrotkerezerwacja.ExecuteNonQuery();
                    cnn.Close();

                    Response.Redirect("About.aspx");
                }
                dr1.Close();
                cnn1.Close();
            }
            
        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "rezerwuj")
        {

            // foreach(GridViewRow Grd in GridView1.Rows)
            // {
            //    TextBox ddd = Grd.FindControl("KalendarzDataOdTextBox") as TextBox;
            //             
            //     Data_od.Text = ddd.Text;

            //  }
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];
            string value = row.Cells[0].Text;
            ID_Wiersza.Text = value;
            string value1 = (GridView2.Rows[index].FindControl("KalendarzDataOdTextBox") as TextBox).Text;
            string value2 = (GridView2.Rows[index].FindControl("KalendarzDataDoTextBox") as TextBox).Text;
            Data_od.Text = value1;
            Data_do.Text = value2;

            if (Data_od.Text == "" || Data_do.Text == "")
            {
                Label1.Visible = true;
                Label1.Text = "Wprowadż daty !";
                Label2.Visible = false;

            }
            else
            {
                SqlConnection cnn1 = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM Rezerwacja WHERE ID_Samochodu='" + ID_Wiersza.Text + "' AND (((Data_Wypozyczenia <= '" + Data_od.Text + "' AND Data_Oddania >= '" + Data_od.Text + "') OR (Data_Wypozyczenia <= '" + Data_do.Text + "'  AND Data_Oddania >= '" + Data_do.Text + "')) OR (Data_Wypozyczenia >='" + Data_od.Text + "' AND Data_Oddania <= '" + Data_do.Text + "' ))  ", cnn1);
                SqlDataReader dr1;
                cnn1.Open();

                dr1 = cmd1.ExecuteReader();
                dr1.Read();

                if (dr1.HasRows)
                {
                    Label1.Visible = false;
                    Label2.Visible = true;
                    Label2.Text = "Samochód w tym przedziale czasu został już zarezerwowany ! Prosimy o zmianę terminu lub wybór innego modelu..";

                }
                else
                {

                    Label1.Visible = false;
                    Label2.Visible = false;
                    SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
                    SqlCommand dodajkrotkerezerwacja = new SqlCommand("insert into Rezerwacja(ID_Samochodu,ID_Klienta,Data_Wypozyczenia,Data_Oddania) values('" + ID_Wiersza.Text + "','" + Session["ID"].ToString() + "','" + Data_od.Text + "','" + Data_do.Text + "')", cnn);

                    cnn.Open();
                    dodajkrotkerezerwacja.ExecuteNonQuery();
                    cnn.Close();

                    Response.Redirect("About.aspx");
                }
                dr1.Close();
                cnn1.Close();
            }

        }

    }
    protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "usun")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView4.Rows[index];
            string value = row.Cells[0].Text;

            SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
            SqlCommand usunkrotke = new SqlCommand("DELETE FROM Rezerwacja WHERE ID_Samochodu='" + value + "'  ", cnn);
            SqlCommand usunkrotke1 = new SqlCommand("DELETE FROM Samochod WHERE ID_Samochodu='" + value + "'  ", cnn);
            cnn.Open();
            usunkrotke.ExecuteNonQuery();
            usunkrotke1.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("Default.aspx");
        }
    }
}
