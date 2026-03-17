<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="dashboard.aspx.cs" Inherits="Center.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Modernized Summary Cards */
        .dash-stat-card {
            display: flex;
            align-items: center;
            padding: 25px;
            border-radius: 14px;
            background: white;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;

        }

        .dash-stat-card:hover {
            /* transform: translateY(-5px); */
            box-shadow: 0 15px 35px rgba(0, 115, 136, 0.15);
        }

        .dash-stat-card:nth-child(1) {
            border-bottom: 5px solid #00cdba;
            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card:nth-child(1) .icon {
            color: #00cdba;
            border: 2px solid #00cdba;
        }

        .dash-stat-card:nth-child(1)::after {
            /* border-bottom: 5px solid #00cdb95b; */
            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card:nth-child(2) {
            border-bottom: 5px solid #ff8100;
            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card:nth-child(2) .icon {
            color: #ff8100;
            border: 2px solid #ff8100;
        }

        .dash-stat-card:nth-child(2)::after {
            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card:nth-child(3) {
            border-bottom: 5px solid #0090f7;

            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card:nth-child(3) .icon {
            color: #0090f7;
            border: 2px solid #0090f7;
        }

        .dash-stat-card:nth-child(3)::after {
            /* background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05)); */
        }

        .dash-stat-card::after {
            position: absolute;
            content: "";
            height: 130px;
            width: 130px;
            background: linear-gradient(135deg, rgba(0, 115, 136, 0.1), rgba(0, 153, 179, 0.05));
            border-radius: 50%;
            right: -57px;
            top: -70px;
            z-index: 0;
            transition: transform 0.3s ease;
        }

        .dash-stat-card:hover::after {
            transform: scale(1.2);
        }

        .dash-stat-card .icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;


            font-size: 26px;
            z-index: 1;
        }

        .dash-stat-card .icon i {
            display: flex;
        }

        .dash-stat-card .content {
            margin-left: 15px;
            z-index: 1;
        }

        .dash-stat-card .text {
            font-size: 14px;
            font-weight: 600;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .dash-stat-card .number {
            font-size: 28px;
            font-weight: 700;
            color: #2c3e50;
            margin-top: 5px;
        }

        .dash-stat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .es-status {
            padding: 4px 6px;
            border-radius: 50px;
            opacity: 0.7;
            font-size: 11px;
            font-weight: 400;
        }
    </style>
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
                            <li class="te-breadcrumb__active">Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- ===== Summary Cards ===== -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="dash-stat-grid">

                        <!-- Today's Exam -->
                        <div class="dash-stat-card">
                            <div class="icon">
                                <i class="fi fi-rr-list-check"></i>
                            </div>
                            <div class="content">
                                <div class="text">Today's Exam</div>
                                <div class="number">
                                    <asp:Label ID="Lbl_todayexam" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <!-- Yesterday's Exam -->
                        <div class="dash-stat-card">
                            <div class="icon">
                                <i class="fi fi-rr-calendar-clock"></i>
                            </div>
                            <div class="content">
                                <div class="text">Yesterday's Exam</div>
                                <div class="number">
                                    <asp:Label ID="Lbl_yesterday" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <!-- Tomorrow's Exam -->
                        <div class="dash-stat-card">
                            <div class="icon">
                                <i class="fi fi-rr-calendar-check"></i>
                            </div>
                            <div class="content">
                                <div class="text">Tomorrow's Exam</div>
                                <div class="number">
                                    <asp:Label ID="Lbl_Tomorrow" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- ===== Recent Exams Table ===== -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="te-card">
                        <div class="te-card__header te-card__header--accent">
                            <i class="fa fa-history me-2"></i> Top 10 Recent Exam Details
                        </div>
                        <div class="te-card__body p-0">
                            <div class="table-responsive">
                                <table class="table te-table mb-0">
                                    <thead>
                                        <tr>
                                            <th>Candidate ID</th>
                                            <th style="width: 16%;">Registration Number</th>
                                            <th>Candidate Name</th>
                                            <th style="width: 19%;">Exam Name</th>
                                            <th>Exam Date & Time</th>
                                            <th>Exam Status</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="RepDetails" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%#Eval("common_id") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("aadhar_card") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("first_name") %>
                                                        <%#Eval("middle_name") %>
                                                        <%#Eval("last_name") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("exam_name") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("exam_date") %>
                                                        <br />
                                                        <small class="text-muted">
                                                            <%#Eval("exam_time") %>
                                                        </small>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" Text='<%#Eval("Examstatus").ToString()=="Waiting to get hold of" ? "Not Started" : Eval("Examstatus").ToString()=="Cancelled Exam" ? "Cancelled Exam" :"Completed" %>' CssClass=" es-status" style='<%# "background-color: " + (Eval("Examstatus").Equals("Waiting to get hold of") ? "hotpink" : (Eval("Examstatus").Equals("Cancelled Exam") ? "darkorange" : "#28a745")) + "; color: white;" %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="te-btn-view text-decoration-none d-inline-block" href='today-exam-details?RegistationId=<%#EncryptString(Eval("aadhar_card").ToString()) %>&ExamDate=<%#EncryptString(Eval("exam_date").ToString()) %>' style="line-height: 1.5;">View</a>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="7" style="padding: 0;">
                                                <div id="dvNoRecords" runat="server" visible="false">
                                                    <div class="text-center p-4">
                                                        <h5 class="te-error-msg m-0"><i class="fa fa-exclamation-circle me-2"></i> No
                                                            records are available.</h5>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- View All Actions -->
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex justify-content-center  py-4 d-none">
                                <a id="btnMoreRecord" runat="server" class="te-btn-primary text-decoration-none" href="all-candidate-records" style="min-width: 200px; padding: 12px 30px; border-radius: 30px; font-weight: 600; box-shadow: 0 4px 15px rgba(0, 115, 136, 0.2);">View All Candidate Records <i class="fa fa-arrow-right ms-2"></i>
                                </a>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</asp:Content>