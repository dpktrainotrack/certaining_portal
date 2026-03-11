<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="candidate-history.aspx.cs" Inherits="Center.candidate_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="height: 84vh;">
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

            <div class="row mt-4">
                <!-- Search Form -->
                <div class="col-12 mb-4">
                    <div class="te-card">
                        <div class="te-card__header ">
                            <i class="fa fa-search me-2"></i> Search Candidate Details
                        </div>
                        <div class="te-card__body">
                            <div class="row form-row mb-3 gy-4">
                                <div class="col-xl-2 col-lg-6 col-12 form-group">
                                    <label class="te-label">First Name*</label>
                                    <asp:TextBox ID="txt_first_name1" runat="server" Placeholder="First Name" class="form-control te-input" />
                                </div>
                                <div class="col-xl-2 col-lg-6 col-12 form-group">
                                    <label class="te-label">Last Name</label>
                                    <asp:TextBox ID="txt_last_name1" runat="server" Placeholder="Last Name" class="form-control te-input" />
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label class="te-label">Email Id*</label>
                                    <asp:TextBox ID="txt_search" runat="server" Placeholder="Email" class="form-control te-input" />
                                </div>
                                <div class="col-xl-3 col-lg-6 col-12 form-group">
                                    <label class="te-label">Phone Number*</label>
                                    <asp:TextBox ID="txt_phone_number1" runat="server" Placeholder="Mobile Number" class="form-control te-input" />
                                </div>
                                <div class="col-xl-2 col-lg-6 col-12 form-group d-flex align-items-end">
                                    <div class="d-inline">
                                        <asp:Button ID="btn_search" runat="server" Text="Search" class="te-btn-primary" OnClick="Locate_Record" ValidationGroup="Search" />
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <!-- Record Table -->
                <div id="dvRecordTable" class="col-lg-12 col-md-12 col-sm-12" runat="server" visible="false">
                    <div class="te-card">
                        <div class="te-card__header">
                            <i class="fa fa-list me-2"></i> Search Results
                        </div>
                        <div class="te-card__body p-0">
                            <div class="table-responsive">
                                <table class="table te-table mb-0">
                                    <thead>
                                        <tr>
                                            <th>Candidate ID</th>
                                            <th>Candidate Name</th>
                                            <th>Email Id</th>
                                            <th>Mobile Number</th>
                                            <th>City</th>
                                            <th>State</th>
                                            <th>Country</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="RepDetails" runat="server" OnItemCommand="RepDetails_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server" ID="Lbl_common_id1" Text='<%#Eval("common_id") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="Label1" Text='<%#Eval("first_name") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="Label2" Text='<%#Eval("middle_name") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="Label3" Text='<%#Eval("last_name") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="Label4" Text='<%#Eval("email_address") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="Label5" Text='<%#Eval("mobile_number") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("city") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("state") %>
                                                    </td>
                                                    <td>
                                                        <%#Eval("country") %>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:LinkButton ID="LinkButton1" class="te-btn-view d-inline-block text-decoration-none" runat="server" Text="Exam Detail" CommandName="Edit" style="line-height: 1.5;"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <asp:Label ID="lbl_error" runat="server" Text="" CssClass="te-error-msg" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>