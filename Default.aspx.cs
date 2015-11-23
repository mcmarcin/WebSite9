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
            int index = Convert.ToInt32(e.CommandArgument); 
            GridViewRow row = GridView1.Rows[index]; 
            string value = row.Cells[0].Text; 
            ID_Wiersza.Text = value;
            string value1 = (GridView1.Rows[index].FindControl("KalendarzDataOdTextBox") as TextBox).Text;
            string value2 = (GridView1.Rows[index].FindControl("KalendarzDataDoTextBox") as TextBox).Text;
            Data_od.Text = value1;
            Data_do.Text = value2;
           // foreach(GridViewRow Grd in GridView1.Rows)
           // {
            //    TextBox ddd = Grd.FindControl("KalendarzDataOdTextBox") as TextBox;
            //             
            //     Data_od.Text = ddd.Text;
                
          //  }
            SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
            SqlCommand dodajkrotkerezerwacja = new SqlCommand("insert into Rezerwacja(ID_Samochodu,ID_Klienta,Data_Wypozyczenia,Data_Oddania) values('" + ID_Wiersza.Text + "','2','" + Data_od.Text + "','" + Data_do.Text + "')", cnn);

            cnn.Open();
            dodajkrotkerezerwacja.ExecuteNonQuery();
            cnn.Close();

            Response.Redirect("About.aspx");
        }

    }
}
