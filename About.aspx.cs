using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            this.Master.LabelLoginText = "Jesteś zalogowany jako klient!   Witaj :" + Session["Login"].ToString();
            this.Master.FindControl("LabelLogin").Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
        }
        if (Session["Login2"] != null)
        {
            this.Master.LabelLoginText = "Jesteś zalogowany jako pracownik!   Witaj :" + Session["Login2"].ToString();
            this.Master.FindControl("LabelLogin").Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = true;
        }
        if (Session["Login"] == null && Session["Login2"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "usun")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            string value = row.Cells[0].Text;

            SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
            SqlCommand usunkrotke = new SqlCommand("DELETE FROM Rezerwacja WHERE ID_Rezerwacji='" + value + "'  ", cnn);
            cnn.Open();
            usunkrotke.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("About.aspx");
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "usun")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];
            string value = row.Cells[0].Text;

            SqlConnection cnn = new SqlConnection("Data Source=BAZYL;Initial Catalog=Wyp_Samochodow;Integrated Security=True");
            SqlCommand usunkrotke = new SqlCommand("DELETE FROM Rezerwacja WHERE ID_Rezerwacji='" + value + "'  ", cnn);
            cnn.Open();
            usunkrotke.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("About.aspx");
        }
    }
}
