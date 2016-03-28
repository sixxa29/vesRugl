<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="rugl._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="./Content/default.css" rel="stylesheet" type="text/css" />
    <video autoplay loop muted poster="./images/MASTERCODE.png" class="videoplayback">
        <source src="./images/island-video.mp4" type="video/mp4" />
    </video>



    <div class="overlay">
        <div class="">
            <div class="plate">
                <p class="shadow text1">Hitchhiker's</p>
                <p class="script subtitle fancy"><span>guide to</span></p>
                <p class="shadow text2">Iceland</p>
            </div>
        </div>

        <div class="row">

            <div class="col-md-4">
                <h2>Skoða för í boði</h2>
                <p>
                    Hitchhiker's Guide To Iceland er stærsti skutlaravefur landins og hér auglýsa ótalmargir eftir ferðafélaga hvar sem er á landinu. Vantar þig far? Smeltu hér til að skoða mögulegar ferðir sem í boði eru.
                </p>
                <p>
                    <a class="btn btn-default" href="/About">Finna far</a>
                </p>
            </div>

            <div class="col-md-4">
                <h2>Bjóða far</h2>
                <p>
                    Ert þú að ferðast langa leið einn en langar í einhvern ferðafélaga með þér? Smelltu hér til að bjóða upp á ferð.
                </p>
                <p>
                    <a class="btn btn-default" href="/Contact">Bjóða far</a>
                </p>
            </div>
            <!--
        <div class="col-md-4">
            <h2>Meira um okkur</h2>
            <p>
                 Nánari upplysingar um allt sem liggur að baki þessara frábæru síðu.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    !-->
        </div>
    </div>
</asp:Content>
