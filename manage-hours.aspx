<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="manage-hours.aspx.cs" Inherits="Center.manage_hours" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            function BindManageHoursRepeater(data) {
                var strManageHours = "";
                var tbManageHours = $('#<%=tbManageHours.ClientID %>');
                var lblHourCount = $('#<%=lblHourCount.ClientID %>');
                tbManageHours.html('');
                lblHourCount.html(data.d.length);
                for (var i = 0; i < data.d.length; i++) {
                    strManageHours = "<tr>" +
                        "<td>" + data.d[i].HourCount + "</td>" +
                        "<td><span class='te-label bg-info text-white'>" + data.d[i].Holidays + "</span></td>" +
                        "<td>" + data.d[i].StartDate + "</td>" +
                        "<td>" + data.d[i].EndDate + "</td>" +
                        "<td>" + data.d[i].StartTime + "</td>" +
                        "<td>" + data.d[i].EndTime + "</td>" +
                        "<td>" + data.d[i].WeeklyOff + "</td>" +
                        "<td class='text-center'>" +
                        "  <div class='d-flex justify-content-center gap-2'>" +
                        "    <button type='button' class='te-btn-view' title='Edit' data-toggle='modal' data-target='#dvManageHours' onclick='BindHourData(" + data.d[i].HourId + ");'><i class='fa fa-pencil'></i></button>" +
                        "    <button type='button' class='te-btn-view bg-danger text-white' title='Delete' onclick='DeleteHourData(" + data.d[i].HourId + ");' style='border-color: transparent;'><i class='fa fa-trash'></i></button>" +
                        "  </div>" +
                        "</td>" +
                        "</tr>";
                    tbManageHours.append(strManageHours);
                }
            }
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main" style="height: 92vh;">
            <div class="container">
                <!-- ===== Breadcrumb Navigation ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Hours Management</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div
                                class="te-card__header te-card__header--accent d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center gap-2">
                                    <i class="fa fa-clock-o"></i>
                                    <span>Manage Hours (<asp:Label ID="lblHourCount" runat="server"></asp:Label>)</span>
                                </div>
                                <a href="javascript:void(0);" class="te-btn-primary"
                                    style="text-decoration: none; font-size: 0.9rem;" data-toggle="modal"
                                    data-target="#dvManageHours" onclick="ClearHours();">
                                    <i class="fa fa-plus-circle"></i> Add Hours
                                </a>
                            </div>
                            <div class="te-card__body te-card__body--flush seat-management">
                                <div class="table-responsive">
                                    <table class="table te-table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Sr. No.</th>
                                                <th>Type</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Start Time</th>
                                                <th>End Time</th>
                                                <th>Weekly Off Day(s)</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbManageHours" runat="server"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Content>