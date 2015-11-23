<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <fieldset class="accountInfo">
        <legend>Przeglądaj rezerwacje.</legend>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             Width="900px" DataSourceID="SqlDataSource1">
             <Columns>
                 <asp:BoundField DataField="ID_Klienta" HeaderText="ID_Klienta" 
                     SortExpression="ID_Klienta" Visible="False" />
                 <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                 <asp:BoundField DataField="Model" HeaderText="Model" 
                     SortExpression="Model" />
                 <asp:BoundField DataField="Data_Wypozyczenia" HeaderText="Data wypożyczenia" 
                     SortExpression="Data_Wypozyczenia" DataFormatString='{0:d}' />
                 <asp:BoundField DataField="Data_Oddania" HeaderText="Data zwrotu" 
                     SortExpression="Data_Oddania" DataFormatString='{0:d}' />
                 <asp:BoundField DataField="ID_Samochodu" HeaderText="ID_Samochodu" 
                     SortExpression="ID_Samochodu" Visible="False" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString3 %>" 
             
             
             SelectCommand="SELECT Rezerwacja.ID_Klienta, Rezerwacja.Data_Wypozyczenia, Rezerwacja.Data_Oddania , Samochod.Marka, Samochod.Model, Rezerwacja.ID_Samochodu FROM Rezerwacja INNER JOIN Samochod ON Rezerwacja.ID_Samochodu = Samochod.ID_Samochodu" >
         </asp:SqlDataSource>
        </fieldset>
</asp:Content>
