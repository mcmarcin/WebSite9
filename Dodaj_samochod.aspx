<%@ Page Title="Dodaj Samochód" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dodaj_samochod.aspx.cs" Inherits="Dodaj_samochod" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .textDA
        {
            margin-top: 0px;
        }
    </style>
    </asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
       <fieldset class="accountInfo">
        <legend>Podaj dane dotyczące nowego samochodu</legend>
     <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="failureNotification" 
       ValidationGroup="WprowadzanieSamochoduValidationGroup"/> 
         
    <p>
        <asp:Label ID="MarkaLabel" runat="server" Text="Marka">Marka:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Marka" runat="server" CssClass=".textDA" Height="20px" 
            Width="200px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="MarkaRequired" runat="server" ControlToValidate="Marka" 
              CssClass="failureNotification" ErrorMessage="Podaj marke wprowadzanego samochodu!" ToolTip="Name is required."  
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="ModelLabel" runat="server" Text="Model">Model:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Model" runat="server" CssClass=".textDA" Height="20px" 
            Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ModelRequired" runat="server" ControlToValidate="Model" 
              CssClass="failureNotification" ErrorMessage="Podaj model wprowadzanego samochodu!" 
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="TypLabel" runat="server" Text="Typ">Typ:</asp:Label>&nbsp&nbsp
        <asp:DropDownList ID="TypList" runat="server" CssClass=".textDA" Height="20px" 
            Width="90px">
            <asp:ListItem>Kabriolet</asp:ListItem>
            <asp:ListItem>Sport / Coupe</asp:ListItem>
            <asp:ListItem>Hatchback</asp:ListItem>
            <asp:ListItem>Sedan</asp:ListItem>
            <asp:ListItem>Kombi</asp:ListItem>
        </asp:DropDownList>
    </p>
     <p>
        <asp:Label ID="RokProdukcjiLabel" runat="server" Text="RokProdukcji">Rok produkcji:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="RokProdukcji" runat="server" CssClass=".textDA" Height="20px" 
            Width="50px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RokProdukcjiRequired" runat="server" ControlToValidate="RokProdukcji" 
              CssClass="failureNotification" ErrorMessage="Wprowadź rocznik samochodu!" 
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
     <p>
        <asp:Label ID="PojemnoscSilnikaLabel" runat="server" Text="PojemnoscSilnika">Pojemność silnika:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="PojemnoscSilnika" runat="server" CssClass=".textDA" Height="20px" 
            Width="50px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PojemnoscSilnikaRequired" runat="server" ControlToValidate="PojemnoscSilnika" 
              CssClass="failureNotification" ErrorMessage="Wprowadź pojemność silnika samochodu!" 
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
     <p>
        <asp:Label ID="PaliwoLabel" runat="server" Text="Paliwo">Paliwo:</asp:Label>&nbsp&nbsp
         <asp:DropDownList ID="PaliwoList" runat="server" CssClass=".textDA" Height="20px" 
            Width="90px">
            <asp:ListItem>Benzyna</asp:ListItem>
            <asp:ListItem>Diesel</asp:ListItem>
        </asp:DropDownList>
    </p>
     <p>
        <asp:Label ID="KolorLabel" runat="server" Text="Kolor">Kolor:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Kolor" runat="server" CssClass=".textDA" Height="20px" 
            Width="70px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="KolorRequired" runat="server" ControlToValidate="Kolor" 
              CssClass="failureNotification" ErrorMessage="Podaj kolor wprowadzanego samochodu!" 
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
     <p>
        <asp:Label ID="OpisLabel" runat="server" Text="Opis">Dodatkowe wyposażenie:</asp:Label>&nbsp&nbsp
        <asp:TextBox ID="Opis" runat="server" CssClass=".textDA" Height="40px" 
            Width="700px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="OpisRequired" runat="server" ControlToValidate="Opis" 
              CssClass="failureNotification" ErrorMessage="Wprowadż opis wyposażenia samochodu!" 
              ValidationGroup="WprowadzanieSamochoduValidationGroup">*</asp:RequiredFieldValidator>
    </p>
      <p>
        <asp:Button ID="Button1" CommandName="MoveNext" runat="server" Text="Dodaj samochód" ValidationGroup="WprowadzanieSamochoduValidationGroup"
            onclick="Button1_Click"  CssClass=".textDA" />
    </p>
     
    </fieldset>

</asp:Content>
