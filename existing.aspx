<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="existing.aspx.cs" Inherits="Center.existing" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main">
            <div class="container">

                <!-- ===== Breadcrumb ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Existing Candidate</li>
                            </ol>
                        </nav>
                    </div>
                </div>

            </div>

            <!-- ========== Section 1: Center Search ========== -->
            <div class="container" id="fromcenter" runat="server">
                <div class="row">

                    <!-- ===== Search Card ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header">
                                <i class="fa fa-search"></i>
                                <span>Search Candidates</span>
                            </div>
                            <div class="te-card__body">
                                <div class="form-row row gy-4">
                                    <div class="form-group col-lg-5 col-12">
                                        <label class="te-label">Search By</label>
                                        <div class="relative">
                                            <asp:DropDownList ID="DropDownList1" runat="server"
                                                CssClass="form-control te-select">
                                                <asp:ListItem Value="1">First Name</asp:ListItem>
                                                <asp:ListItem Value="2">Last Name</asp:ListItem>
                                                <asp:ListItem Value="3">Registation Number</asp:ListItem>
                                                <asp:ListItem Value="4">Candidate ID</asp:ListItem>
                                                <asp:ListItem Value="5">Mobile Number</asp:ListItem>
                                                <asp:ListItem Value="6">Email-ID</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="select-drop-icon">
                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-5 col-12">
                                        <label class="te-label">Enter Detail</label>
                                        <asp:TextBox ID="txt_name" runat="server"
                                            placeholder="Enter the details for the selected field"
                                            CssClass="form-control te-input" />
                                    </div>
                                    <div class="form-group col-md-2 d-flex align-items-end">
                                        <div>
                                            <asp:Button ID="btn_search" runat="server" Text="Search"
                                                OnClick="Search_Record" CssClass="te-btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ===== Table Section ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header te-card__header--accent">
                                <i class="fa fa-users"></i>
                                <span>Candidate List</span>
                            </div>
                            <div class="te-card__body te-card__body--flush">
                                <div class="table-responsive">
                                    <table class="table te-table">
                                        <thead>
                                            <tr>
                                                <th>Candidate ID</th>
                                                <th>Candidate Name</th>
                                                <th>Email ID</th>
                                                <th>Mobile Number</th>
                                                <th>Address</th>
                                                <th>Country</th>
                                                <th>State</th>
                                                <th>City</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RepDetails" runat="server"
                                                OnItemCommand="RepDetails_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="common_id" runat="server"
                                                                Text='<%#Eval("common_id") %>' />
                                                        </td>
                                                        <td>
                                                            <%#Eval("first_name") %>
                                                                <%#Eval("middle_name") %>
                                                                    <%#Eval("last_name") %>
                                                        </td>
                                                        <td><%#Eval("email_address") %></td>
                                                        <td><%#Eval("mobile_number") %></td>
                                                        <td><%#Eval("address1") %></td>
                                                        <td><%#Eval("country") %></td>
                                                        <td><%#Eval("state") %></td>
                                                        <td><%#Eval("city") %></td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" CssClass="btn te-btn-view"
                                                                runat="server" Text="Continue" CommandName="Edit"><i
                                                                    class="fa fa-arrow-right"></i>
                                                                Continue</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <div class="col-md-6 te-error-msg" id="div1" runat="server" visible="false">
                                        <h3 style="color: red; text-align: right;">No Record Found</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- ========== Section 2: Online Search (hidden by default) ========== -->
            <div class="container" id="fromonline" runat="server" visible="false">
                <div class="row">

                    <!-- ===== Search Card ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header">
                                <i class="fa fa-search"></i>
                                <span>Search Candidates</span>
                            </div>
                            <div class="te-card__body">
                                <div class="form-row row gy-4">
                                    <div class="form-group col-lg-5 col-12">
                                        <label class="te-label">Search By</label>
                                        <div class="relative">
                                            <asp:DropDownList ID="DropDownList2" runat="server"
                                                CssClass="form-control te-select show-tick">
                                                <asp:ListItem Value="1">First Name</asp:ListItem>
                                                <asp:ListItem Value="2">Last Name</asp:ListItem>
                                                <asp:ListItem Value="3">Registation Number</asp:ListItem>
                                                <asp:ListItem Value="4">Candidate ID</asp:ListItem>
                                                <asp:ListItem Value="5">Mobile Number</asp:ListItem>
                                                <asp:ListItem Value="6">Email-ID</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="select-drop-icon">
                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-5 col-12">
                                        <label class="te-label">Enter Detail</label>
                                        <asp:TextBox ID="TextBox1" runat="server"
                                            placeholder="Enter the details for the selected field"
                                            CssClass="form-control te-input" />
                                    </div>
                                    <div class="form-group col-md-2 d-flex align-items-end">
                                        <div>
                                            <asp:Button ID="Button1" runat="server" Text="Search"
                                                OnClick="Search_Record" CssClass="te-btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ===== Table Section ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header te-card__header--accent">
                                <i class="fa fa-users"></i>
                                <span>Candidate List</span>
                            </div>
                            <div class="te-card__body te-card__body--flush">
                                <div class="table-responsive">
                                    <table class="table te-table">
                                        <thead>
                                            <tr>
                                                <th>Candidate Name</th>
                                                <th>Email ID</th>
                                                <th>Mobile Number</th>
                                                <th>Address</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RepDetails1" runat="server"
                                                OnItemCommand="RepDetails1_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="lbl_id" runat="server" Visible="false"
                                                            Text='<%#Eval("code") %>' />
                                                        <td>
                                                            <%#Eval("FirstName") %>
                                                                <%#Eval("MiddleName") %>
                                                                    <%#Eval("LastName") %>
                                                        </td>
                                                        <td><%#Eval("Email") %></td>
                                                        <td><%#Eval("Phone") %></td>
                                                        <td><%#Eval("Address") %></td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" CssClass="btn te-btn-view"
                                                                runat="server" Text="Continue" CommandName="Edit"><i
                                                                    class="fa fa-arrow-right"></i>
                                                                Continue</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <div class="col-md-6 te-error-msg" id="div2" runat="server" visible="false">
                                        <h3 style="color: red; text-align: right;">No Record Found</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </asp:Content>
