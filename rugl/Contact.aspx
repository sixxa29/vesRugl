<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="rugl.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Þessa vantar far, help a borther out !</h3>
    <input type="text" class="form-control" id="search" placeholder="Leita að staðsetningu">

    <table id="passengersTable" class="table table-hover">
        <thead>
            <tr>
                <th>Frá</th>
                <th>Til</th>
            </tr>
        </thead>
        <tbody id="myPassengerBody">
        </tbody>
    </table>

    <script>

        function getRides(dataObject) {
            for (var i in dataObject.results) {
                var table = document.getElementById("myPassengerBody");
                var row = table.insertRow();
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = dataObject.results[i].from;
                cell2.innerHTML = dataObject.results[i].to;
            }
        }

        $.ajax({
            'url': 'http://apis.is/rides/samferda-passengers/',
            'type': 'GET',
            'dataType': 'json',
            'success': function (response) {
                getRides(response);
                searchTrips();
            }
        });

        function searchTrips() {
            var $rows = $('#passengersTable').find("tbody>tr");
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
