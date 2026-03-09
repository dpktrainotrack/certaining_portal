<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="manage-seats.aspx.cs" Inherits="Center.manage_seats" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main">
            <div class="container">
                <!-- ===== Breadcrumb Navigation ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Seat Management</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div
                                class="te-card__header te-card__header--accent d-flex justify-content-between align-items-center">
                                <div class="">
                                    <i class="fa fa-check-square-o"></i>
                                    <span>Manage Seats (<asp:Label ID="lblSeatCount" runat="server"></asp:Label>)</span>
                                </div>
                                <a href="javascript:void(0);" class="te-btn-primary"
                                    style="text-decoration: none; font-size: 0.9rem;" data-toggle="modal"
                                    data-target="#dvManageSeats" onclick="ClearSeat();">
                                    <i class="fa fa-plus-circle"></i> Add Seats
                                </a>
                            </div>
                            <div class="te-card__body te-card__body--flush seat-management">
                                <div class="table-responsive">
                                    <table class="table te-table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Seats</th>
                                                <th>Status</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbManageSeat" runat="server">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function BindManageSeatRepeater(data) {
                var strManageSeat = "";
                var tbManageSeat = $('#<%=tbManageSeat.ClientID %>');
                var lblSeatCount = $('#<%=lblSeatCount.ClientID %>');
                tbManageSeat.html('');
                lblSeatCount.html(data.d.length);
                for (var i = 0; i < data.d.length; i++) {
                    strManageSeat = "<tr>" +
                        "<td>" + data.d[i].SeatCount + "</td>" +
                        "<td>" + data.d[i].SeatName + "</td>" +
                        "<td><span class='te-label " + (data.d[i].SeatStatus == 'Active' ? 'bg-success' : 'bg-danger') + " text-white'>" + data.d[i].SeatStatus + "</span></td>" +
                        "<td class='text-center'>" +
                        "  <div class='d-flex justify-content-center gap-2'>" +
                        "    <button type='button' class='te-btn-view' title='Edit' data-toggle='modal' data-target='#dvManageSeats' onclick='BindSeatData(" + data.d[i].SeatId + ");'><i class='fa fa-pencil'></i></button>" +
                        "    <button type='button' class='te-btn-view bg-danger text-white' title='Delete' onclick='DeleteSeatData(" + data.d[i].SeatId + ");' style='border-color: transparent;'><i class='fa fa-trash'></i></button>" +
                        "  </div>" +
                        "</td>" +
                        "</tr>";
                    tbManageSeat.append(strManageSeat);
                }
            }
        </script>
    </asp:Content>