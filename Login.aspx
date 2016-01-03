<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Zaloguj się
    </h2>
    <p>
        Podaj swój swoje dane logowania. 
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="False" 
            NavigateUrl="~/Account/Register.aspx">Zarejestruj się </asp:HyperLink>  jeżeli nie posiadasz konta w naszym serwisie.
    </p>
        <p>
            <asp:Label ID="BłędneLogowanie" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
        </p>
    <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Dane logowania</legend>

                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="Login jest wymagany." ToolTip="Login jest wymagany." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Hasło:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Hasło jest wymagane." ToolTip="Hasło jest wymagane." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server" 
                            oncheckedchanged="RememberMe_CheckedChanged"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Zapamiętaj mnie</asp:Label>
                    </p>
                    
                
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Zaloguj" 
                        ValidationGroup="LoginUserValidationGroup" onclick="LoginButton_Click"/>
               
                </p>
                </fieldset>
            </div>
</asp:Content>

