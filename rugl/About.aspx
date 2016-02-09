<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="rugl.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="margin:auto; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif"> Hitchhiker's Guide To Iceland </h2>
    <h3>Nýlegar ferðir í boði
    </h3>
    <p>Sláðu inn staðinn sem þú ert að ferðast frá:</p>


        <asp:textbox id="MyTextBox" text="Hello World" runat="server"></asp:textbox>
    <!--> HÉR ER TAFLAN.. </-->
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Til</th>
                    <th>Frá</th>
                </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td style="background-color: #CCFFCC;">
                    <asp:Label runat="server" ID="Label1"
                        Text='<%# Eval("to") %>' />
                </td>
                <td style="background-color: #CCFFCC;">
                    <asp:Label runat="server" ID="Label2"
                        Text='<%# Eval("from") %>' />
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <!--> HÉR ENDAR TAFLAN.. </-->

    
</asp:Content>

