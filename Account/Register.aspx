<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Account_Register" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
                        Zarejestruj nowe konto, aby móc korzystać z wypożyczalni !
                    </h2>
                    <p>
                       Wypełnij poniższy formularz.
                    </p>
                       <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Dane użytkownika</legend>
                            <p>
                                <asp:Label ID="ImieLabel" runat="server" AssociatedControlID="Imie">Imie:</asp:Label>
                                <asp:TextBox ID="Imie" runat="server" CssClass="textEntry" AutoPostBack="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ImieRequired" runat="server" ControlToValidate="Imie" 
                                     CssClass="failureNotification" ErrorMessage="Podanie imienia jest wymagane." ToolTip="Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="NazwiskoLabel" runat="server" AssociatedControlID="Nazwisko">Nazwisko:</asp:Label>
                                <asp:TextBox ID="Nazwisko" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NazwiskoRequired" runat="server" ControlToValidate="Nazwisko" 
                                     CssClass="failureNotification" ErrorMessage="Podanie nazwiska jest wymagane." ToolTip="Surname is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="TelefonLabel" runat="server" AssociatedControlID="Telefon">Telefon:</asp:Label>
                                <asp:TextBox ID="Telefon" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="TelefonRequired" runat="server" ControlToValidate="Telefon" 
                                     CssClass="failureNotification" ErrorMessage="Podanie numeru kontaktowego jest wymagane." ToolTip="Miejsce Zamieszkania jest wymagane." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="Kod pocztowy jest wymagany." ToolTip="Kod pocztowy jest wymagany." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="LoginLabel" runat="server" AssociatedControlID="Login">Login:</asp:Label>
                                <asp:TextBox ID="Login" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LoginRequired" runat="server" ControlToValidate="Login" 
                                     CssClass="failureNotification" ErrorMessage="Podaj login." ToolTip="UserName is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="HasloLabel" runat="server" AssociatedControlID="Haslo">Hasło:</asp:Label>
                                <asp:TextBox ID="Haslo" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="HasloRequired" runat="server" ControlToValidate="Haslo" 
                                     CssClass="failureNotification" ErrorMessage="Podaj hasło." ToolTip="Password is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PotwierdzHasloLabel" runat="server" AssociatedControlID="PotwierdzHaslo">Potwierdź hasło:</asp:Label>
                                <asp:TextBox ID="PotwierdzHaslo" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="PotwierdzHaslo" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Kontrola poprawności - konieczne jest powtórzenie hasła." ID="PotwierdzHasloRequired" runat="server" 
                                     ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="SprawdzenieHasla" runat="server" ControlToCompare="Haslo" ControlToValidate="PotwierdzHaslo" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="Błąd powtórzenia hasła!"
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="UzytkownikLabel" runat="server" AssociatedControlID="Uzytkownik">Status użytkownika.</asp:Label>
                                <asp:DropDownList ID="Uzytkownik" runat="server"> <asp:ListItem Selected="True">Klient</asp:ListItem>
                                <asp:ListItem>Pracownik</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="UtworzUzytkownikaButton" runat="server" CommandName="MoveNext" Text="Utwórz użytkownika" 
                                 ValidationGroup="RegisterUserValidationGroup" 
                                onclick="UtworzUzytkownikarButton_Click"/>
                        </p>

                    </div>
</asp:Content>

