<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
    <%@ MasterType VirtualPath="~/Site.Master" %>
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
        <p><asp:Label ID="Label1" runat="server" Font-Bold="True" Visible="False" ForeColor="Red"></asp:Label><asp:Label ID="Label2" runat="server" Font-Bold="True" Visible="False" ForeColor="Red"></asp:Label>
        </p>
                 
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID_Samochodu" DataSourceID="SqlDataSource1" CssClass=".textDA" 
            Width="1300px" AllowPaging="True" onrowcommand="GridView1_RowCommand" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
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
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID_Samochodu" CssClass=".textDA" Width="1300px" 
            DataSourceID="SqlDataSource2" Visible="False" AllowPaging="True" 
            onrowcommand="GridView2_RowCommand" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID_Samochodu" HeaderText="Id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Samochodu" />
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
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>


        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" Width="1300px" 
            DataKeyNames="ID_Samochodu" DataSourceID="SqlDataSource4" Visible="False" AllowPaging="True" 
            onrowcommand="GridView4_RowCommand" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID_Samochodu" HeaderText="Id" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Samochodu" />
                <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Typ" HeaderText="Typ" SortExpression="Typ" />
                <asp:BoundField DataField="Rok_Produkcji" HeaderText="Rok produkcji" 
                    SortExpression="Rok_Produkcji" />
                <asp:BoundField DataField="Pojemnosc_Silnika" HeaderText="Pojemność silnika" 
                    SortExpression="Pojemnosc_Silnika" />
                <asp:BoundField DataField="Paliwo" HeaderText="Paliwo" 
                    SortExpression="Paliwo" />
                <asp:BoundField DataField="Kolor" HeaderText="Kolor" SortExpression="Kolor" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="ID_Pracownika" HeaderText="ID pracownika" 
                    SortExpression="ID_Pracownika" />
                     <asp:TemplateField HeaderText="Usuń">
                    <ItemTemplate>
                        <asp:Button ID="Button2" CommandArgument='<%# Container.DataItemIndex %>' runat="server" CausesValidation="false" 
                        CommandName="usun"  Text="Usuń" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

         





        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="1300px"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Typ" HeaderText="Typ" SortExpression="Typ" />
                <asp:BoundField DataField="Rok_Produkcji" HeaderText="Rok produkcji" 
                    SortExpression="Rok_Produkcji" />
                <asp:BoundField DataField="Pojemnosc_Silnika" HeaderText="Pojemność silnika" 
                    SortExpression="Pojemnosc_Silnika" />
                <asp:BoundField DataField="Paliwo" HeaderText="Paliwo" 
                    SortExpression="Paliwo" />
                <asp:BoundField DataField="Kolor" HeaderText="Kolor" SortExpression="Kolor" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString5 %>" 
            SelectCommand="SELECT [Marka], [Model], [Typ], [Rok_Produkcji], [Pojemnosc_Silnika], [Paliwo], [Kolor], [Opis] FROM [Samochod] ORDER BY [Marka]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString6 %>" 
            SelectCommand="SELECT * FROM [Samochod] ORDER BY [Marka]"></asp:SqlDataSource>
    </p>
      </fieldset> 
</asp:Content>
