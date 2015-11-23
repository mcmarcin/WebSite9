<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <h2>
        Przeglądaj dostępne samochody!
    </h2>
    <fieldset class="accountInfo">
    <legend>Wprowadź dane wyszukiwania !</legend>
        <asp:Label ID="WyszukajMarkaLabel" runat="server" Text="Wprowadź markę auta:">Wprowadź markę auta:</asp:Label>
        <asp:TextBox ID="WyszukajMarka" runat="server" CssClass=".textDA" Height="20px" 
            Width="70px"></asp:TextBox><asp:TextBox ID="ID_Wiersza" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="Data_od" runat="server" Visible="False"></asp:TextBox><asp:TextBox
                ID="Data_do" runat="server" Visible="False"></asp:TextBox>
        <asp:Button ID="WyszukajMarkaButton" runat="server" Text="Wyszukaj" 
             onclick="WyszukajMarkaButton_Click" />
            </fieldset>
             <fieldset class="accountInfo">
             <legend>Baza dostępnych samochodów</legend>
        <p>
            <asp:Button ID="WyswietlWszystkieButton" runat="server" Text="Pokaż wszystkie" onclick="WyswietlWszystkieButton_Click"/>
        </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID_Samochodu" DataSourceID="SqlDataSource1" CssClass=".textDA" 
            Width="900px" AllowPaging="True" onrowcommand="GridView1_RowCommand" onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID_Samochodu" HeaderText="Id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Samochodu" />
                <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Typ" HeaderText="Nadwozie" SortExpression="Typ" />
                <asp:BoundField DataField="Rok_Produkcji" HeaderText="Rocznik" 
                    SortExpression="Rok_Produkcji" />
                <asp:BoundField DataField="Pojemnosc_Silnika" HeaderText="Pojemność" 
                    SortExpression="Pojemnosc_Silnika" />
                <asp:BoundField DataField="Paliwo" HeaderText="Paliwo" 
                    SortExpression="Paliwo" />
                <asp:BoundField DataField="Kolor" HeaderText="Kolor" SortExpression="Kolor" />
                <asp:BoundField DataField="Opis" HeaderText="Wyposażenie" 
                    SortExpression="Opis" />
                <asp:TemplateField HeaderText="Data od">
                    <ItemTemplate>
                        <asp:TextBox ID="KalendarzDataOdTextBox" runat="server"  Width="70px" ></asp:TextBox>
                        <asp:ImageButton ID="KalendarzDataOdImageButton" runat="server" Height="25px" 
                 ImageUrl="~/images.jpg" Width="25px" />
                 <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                 Format="yyyy-MM-dd" PopupButtonID="KalendarzDataOdImageButton" PopupPosition="BottomRight" 
                 TargetControlID= "KalendarzDataOdTextBox"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data do">
                    <ItemTemplate>
                        <asp:TextBox ID="KalendarzDataDoTextBox" runat="server" Width="70px">
                        </asp:TextBox><asp:ImageButton ID="KalendarzDataDoImageButton" runat="server" Height="25px" 
                 ImageUrl="~/images.jpg" Width="25px" />
                 <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                 Format="yyyy-MM-dd" PopupButtonID="KalendarzDataDoImageButton" PopupPosition="BottomRight" 
                 TargetControlID="KalendarzDataDoTextBox" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rezerwuj">
                    <ItemTemplate>
                        <asp:Button ID="Button2" CommandArgument='<%# Container.DataItemIndex %>' runat="server" CausesValidation="false" 
                        CommandName="rezerwuj"  Text="Rezerwuj" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID_Samochodu" CssClass=".textDA" Width="900px" 
            DataSourceID="SqlDataSource2" Visible="False">
            <Columns>
                <asp:BoundField DataField="ID_Samochodu" HeaderText="ID_Samochodu" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Samochodu" 
                    Visible="False" />
                <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Typ" HeaderText="Nadwozie" SortExpression="Typ" />
                <asp:BoundField DataField="Rok_Produkcji" HeaderText="Rocznik" 
                    SortExpression="Rok_Produkcji" />
                <asp:BoundField DataField="Pojemnosc_Silnika" HeaderText="Pojemność silnika" 
                    SortExpression="Pojemnosc_Silnika" />
                <asp:BoundField DataField="Paliwo" HeaderText="Paliwo" 
                    SortExpression="Paliwo" />
                <asp:BoundField DataField="Kolor" HeaderText="Kolor" SortExpression="Kolor" />
                <asp:BoundField DataField="Opis" HeaderText="Opis wyposażenia" 
                    SortExpression="Opis" />
                <asp:TemplateField HeaderText="Rezerwuj">
                    <ItemTemplate>
                        <asp:Button ID="Button3" runat="server" Text="Rezerwuj" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString2 %>" 
            
            SelectCommand="SELECT [ID_Samochodu], [Marka], [Model], [Typ], [Rok_Produkcji], [Pojemnosc_Silnika], [Paliwo], [Kolor], [Opis] FROM [Samochod] WHERE ([Marka] LIKE @Marka)">
            <SelectParameters>
                <asp:ControlParameter ControlID="WyszukajMarka" Name="Marka" 
                    PropertyName="Text" Type="String" ConvertEmptyStringToNull="False" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString %>" 
            
            SelectCommand="SELECT [ID_Samochodu], [Marka], [Typ], [Rok_Produkcji], [Pojemnosc_Silnika], [Paliwo], [Kolor], [Opis], [Model] FROM [Samochod]">
        </asp:SqlDataSource>
    </p>
      </fieldset> 
</asp:Content>
