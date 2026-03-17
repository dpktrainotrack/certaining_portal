<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="search-record.aspx.cs" Inherits="Center.search_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .es-status {
            padding: 4px 10px;
            border-radius: 50px;
            opacity: 0.9;
            font-size: 11px;
            font-weight: 500;
            display: inline-block;
        }
        .candidate-info-label {
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .candidate-info-value {
            font-size: 15px;
            color: #2c3e50;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <!-- ===== Breadcrumb Navigation ===== -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav class="te-breadcrumb" aria-label="breadcrumb">
                        <ol>
                            <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                            <li class="te-breadcrumb__active">Candidate History</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- ===== Candidate Details Card ===== -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="te-card mb-4">
                        <div class="te-card__header te-card__header--accent">
                            <i class="fa fa-user me-2"></i> Candidate Details
                        </div>
                        <div class="te-card__body p-4">
                            <div class="row">
                                <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                                    <div class="text-muted text-uppercase candidate-info-label">Candidate ID</div>
                                    <div class="candidate-info-value mt-1">
                                        <strong><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                                    <div class="text-muted text-uppercase candidate-info-label">Candidate Name</div>
                                    <div class="candidate-info-value mt-1">
                                        <strong><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></strong>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 mb-3 mb-sm-0">
                                    <div class="text-muted text-uppercase candidate-info-label">Email ID</div>
                                    <div class="candidate-info-value mt-1">
                                        <strong><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></strong>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="text-muted text-uppercase candidate-info-label">Mobile Number</div>
                                    <div class="candidate-info-value mt-1">
                                        <strong><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== Exam Details Table ===== -->
            <div class="row">
                <div class="col-12">
                    <div class="te-card">
                        <div class="te-card__header te-card__header--accent">
                            <i class="fa fa-history me-2"></i> Exam Details
                        </div>
                        <div class="te-card__body p-0">
                            <div class="table-responsive">
                                <table class="table te-table mb-0 js-basic-example dataTable" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Registration Number</th>
                                            <th>Exam Code</th>
                                            <th>Exam Name</th>
                                            <th>Exam Date & Time</th>
                                            <th class="text-center">Exam Status</th>
                                            <th class="text-center">Result Status</th>
                                            <th>Center Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("aadhar_card") %></td>
                                                    <td><%#Eval("exam_code") %></td>
                                                    <td><%#Eval("exam_name") %></td>
                                                    <td>
                                                        <%#Eval("exam_date") %><br />
                                                        <small class="text-muted"><%#Eval("exam_time") %></small>
                                                    </td>
                                                    <td class="text-center align-middle">
                                                        <asp:Label ID="lbl_testing_exam_date111" runat="server" Text='<%#Eval("Examstatus") %>' CssClass="es-status" style='<%# "background-color: " + (Eval("Examstatus").Equals("Waiting to get hold of") ? "hotpink" : (Eval("Examstatus").Equals("Cancelled Exam") ? "darkorange" : "#28a745")) + "; color: white;" %>' />
                                                    </td>
                                                    <td class="text-center align-middle">
                                                        <asp:Label ID="lbl_testing_exam_date" runat="server" Text='<%#Eval("Result_Pass_or_Fail") %>' CssClass="es-status" style='<%# "background-color: " + (Eval("Result_Pass_or_Fail").Equals("Fail") ? "#dc3545" : "#28a745") + "; color: white;" %>' />
                                                    </td>
                                                    <td><%#Eval("center_name") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <div class="text-center p-3">
                                    <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
