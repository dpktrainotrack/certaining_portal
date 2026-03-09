<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="upcoming-exam.aspx.cs" Inherits="Center.upcoming_exam" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main" style="height: 92vh;">
            <div class="container">

                <!-- ===== Breadcrumb ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Upcoming Exam</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- ===== Search Card ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header">
                                <i class="fa fa-search"></i>
                                <span>Search Candidates</span>
                            </div>
                            <div class="te-card__body">
                                <div class="form-row row gy-4">
                                    <div class="form-group col-lg-3 col-12">
                                        <label class="te-label">Select Date</label>
                                        <asp:TextBox ID="txtDate" AutoCompleteType="Disabled" autocomplete="off"
                                            Style="cursor: text !important;" Placeholder="Click Here to Select the Date"
                                            OnTextChanged="txtDate_TextChanged" AutoPostBack="true" ValidationGroup="a"
                                            runat="server" CssClass="form-control te-input"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-lg-3 col-12">
                                        <label class="te-label">Search By</label>
                                        <div class="relative">
                                            <asp:DropDownList ID="ddlSearch" runat="server"
                                                CssClass="form-control te-select">
                                                <asp:ListItem Value="first_name" Text="First Name"></asp:ListItem>
                                                <asp:ListItem Value="Last_name" Text="Last Name"></asp:ListItem>
                                                <asp:ListItem Value="aadhar_card" Text="Registation Number">
                                                </asp:ListItem>
                                                <asp:ListItem Value="common_id" Text="Candidate ID"></asp:ListItem>
                                                <asp:ListItem Value="mobile_number" Text="Mobile Number"></asp:ListItem>
                                                <asp:ListItem Value="email_address" Text="Email-ID"></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="select-drop-icon">
                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 col-12">
                                        <label class="te-label">Enter Detail</label>
                                        <asp:TextBox ID="txtSearch" runat="server"
                                            placeholder="Enter the details for the selected field"
                                            CssClass="form-control te-input" />
                                    </div>
                                    <div class="form-group col-md-2 d-flex align-items-end">
                                        <div>
                                            <asp:Button ID="btnSearch" runat="server" Text="Search"
                                                OnClick="Search_Record" CssClass="te-btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ===== Table Section ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header te-card__header--accent">
                                <i class="fa fa-table"></i>
                                <span>Upcoming Exam Schedule</span>
                            </div>
                            <div class="te-card__body te-card__body--flush">
                                <div class="table-responsive">
                                    <table class="table te-table">
                                        <thead>
                                            <tr>
                                                <th>Candidate ID</th>
                                                <th>Registration Number</th>
                                                <th>Candidate Name</th>
                                                <th>Exam Name</th>
                                                <th>Exam Date &amp; Time</th>
                                                <th>Result Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptExamDetails" runat="server"
                                                OnItemCommand="rptExamDetails_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" ID="Lbl_common_id1"
                                                                Text='<%#Eval("common_id") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label runat="server" ID="Lbl_common_id"
                                                                Text='<%#Eval("aadhar_card") %>'></asp:Label>
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
                                                            <asp:Label runat="server" ID="Lbl_exam_date"
                                                                Text='<%#Eval("exam_date") %>'></asp:Label>
                                                            <%#Eval("exam_time") %>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_testing_exam_date111" runat="server"
                                                                Text='<%#Eval("Examstatus").ToString()=="Waiting to get hold of" ? "Not Started" :"Completed" %>'
                                                                ForeColor='<%# (Eval("Examstatus").Equals("Waiting to get hold of")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' />
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" CssClass="btn te-btn-view"
                                                                runat="server" Text="View" CommandName="Edit"><i
                                                                    class="fa fa-eye"></i> View</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <div id="dvNoRecords" runat="server" visible="false" class="te-error-msg">
                                        No records are available.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var txtDate = $('#<%=txtDate.ClientID %>');
                txtDate.datepicker({
                    changeMonth: true,
                    changeYear: true,
                    inline: true,
                    minDate: 1,
                    dateFormat: 'dd-MM-yy',
                    setDate: 1
                });
            });
        </script>
    </asp:Content>