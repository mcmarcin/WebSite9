<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>
    <%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <fieldset class="accountInfo">
        <legend>Przeglądaj rezerwacje.</legend>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
             Width="1300px" DataSourceID="SqlDataSource2" AllowPaging="True" 
             onrowcommand="GridView2_RowCommand" BackColor="White" BorderColor="#999999" 
             BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Strikeout="False" 
             ForeColor="Black" GridLines="Vertical" >
             <AlternatingRowStyle BackColor="#CCCCCC" />
             <Columns>
                 <asp:BoundField DataField="ID_Rezerwacji" HeaderText="ID rezerwacji" 
                     InsertVisible="False" ReadOnly="True" SortExpression="ID_Rezerwacji" />
                 <asp:BoundField DataField="ID_Samochodu" HeaderText="ID samochodu" 
                     SortExpression="ID_Samochodu" />
                 <asp:BoundField DataField="ID_Klienta" HeaderText="ID klienta" 
                     SortExpression="ID_Klienta" />
                 <asp:BoundField DataField="Data_Wypozyczenia" HeaderText="Data wypożyczenia" 
                     SortExpression="Data_Wypozyczenia" />
                 <asp:BoundField DataField="Data_Oddania" HeaderText="Data oddania" 
                     SortExpression="Data_Oddania" />
                     <asp:TemplateField HeaderText="Usuń" >
                    <ItemTemplate>
                        <asp:Button ID="Button1" CommandArgument='<%# Container.DataItemIndex %>' runat="server" CausesValidation="false" 
                        CommandName="usun"  Text="Usuń" />
                    </ItemTemplate>
                </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <RowStyle HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString7 %>" 
             SelectCommand="SELECT * FROM [Rezerwacja] ORDER BY [ID_Rezerwacji]">
         </asp:SqlDataSource>
         
         
         
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             Width="1300px" DataSourceID="SqlDataSource1" AllowPaging="True" 
             onrowcommand="GridView1_RowCommand" BackColor="White" BorderColor="#999999" 
             BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Strikeout="False" 
             ForeColor="Black" GridLines="Vertical" >
             <AlternatingRowStyle BackColor="#CCCCCC" />
             <Columns>
                 <asp:BoundField DataField="ID_Rezerwacji" HeaderText="Id" InsertVisible="False" 
                     ReadOnly="True" SortExpression="ID_Rezerwacji" />
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
                 <asp:TemplateField HeaderText="Usuń" >
                    <ItemTemplate>
                        <asp:Button ID="Button1" CommandArgument='<%# Container.DataItemIndex %>' runat="server" CausesValidation="false" 
                        CommandName="usun"  Text="Usuń" />
                    </ItemTemplate>
                </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <RowStyle HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Wyp_SamochodowConnectionString3 %>" 
             
             
             
             SelectCommand="SELECT Rezerwacja.ID_Klienta, Rezerwacja.Data_Wypozyczenia, Rezerwacja.Data_Oddania, Samochod.Marka, Samochod.Model, Rezerwacja.ID_Samochodu, Rezerwacja.ID_Rezerwacji FROM Rezerwacja INNER JOIN Samochod ON Rezerwacja.ID_Samochodu = Samochod.ID_Samochodu WHERE (ID_Klienta = @ID)" >
         <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="ID" />
            </SelectParameters>
         </asp:SqlDataSource>
        </fieldset>
</asp:Content>
