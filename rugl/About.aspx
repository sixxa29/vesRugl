<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="rugl.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="margin: auto; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Hitchhiker's Guide To Iceland </h2>
    <h3>Nýlegar ferðir í boði
    </h3>
    <p>Sláðu inn staðinn sem þú ert að ferðast frá:</p>
    <input type="text" class="form-control" id="search" placeholder="Leita að fari til..">
    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>


    <table id="driversTable" class="table table-hover">
        <thead>
            <tr>
                <th>Frá
                </th>
                <th>Til
                </th>
            </tr>

        </thead>
        <tbody id="myDriverBody">
        </tbody>

    </table>


    <script>



        function getDrivers(dataObject) {
            for (var i in dataObject.results) {
                var tbody = document.getElementById("myDriverBody");
                var row = tbody.insertRow();
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = dataObject.results[i].from;
                cell2.innerHTML = dataObject.results[i].to;
                cell3.innerHTML = dataObject.results[i].date;
            }
        }

        $.ajax({
            'url': 'http://apis.is/rides/samferda-drivers/',
            'type': 'GET',
            'dataType': 'json',
            'success': function (response) {
                getDrivers(response);
                searchTrips();
            }
        });


        function searchTrips() {
            var $rows = $('#driversTable').find("tbody>tr");
            $('#search').keyup(function () {

                var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
                    reg = RegExp(val, 'i'),
                    text;

                $rows.show().filter(function () {
                    text = $(this).text().replace(/\s+/g, ' ');
                    return !reg.test(text);
                }).hide();
            });
        }



    </script>

</asp:Content>

