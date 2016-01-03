using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] == null && Session["Login2"] == null)
        {
            Wyloguj.Visible = false;
            Zaloguj.Visible = true;
        }
        else
        {
            Wyloguj.Visible = true;
            Zaloguj.Visible = false;
        }
    }

    protected void Zaloguj_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void Wyloguj_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("~/Default.aspx");
    }

    public string LabelLoginText
    {
        get
        {
            return LabelLogin.Text;
        }
        set
        {
            LabelLogin.Text = value;
        }
    }
}