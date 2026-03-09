<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="search-record.aspx.cs" Inherits="Center.search_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Candidate History</h2>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top: 32px;">
                    <div class="card" style="background-color: #e6e6e626;">


                        <div class="body" style="padding: 35px;">
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for="">Candidate ID:</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Candidate Name :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Email ID:</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Mobile Number :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>



                        </div>



                        <div class="header" style="border: 1px solid #646761; background-color: #646761; color: white;">
                            <h2 style="color: white; font-size: 18px; padding: 11px 19px;">Exam Details
                            </h2>

                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>Registration Number</th>
                                            <th>Exam Code</th>
                                            <th>Exam Name</th>
                                            <th>Exam Date & Time</th>
                                            <th>Exam Status</th>
                                            <th>Result Status</th>
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
                                                    <td><%#Eval("exam_date") %> <%#Eval("exam_time") %></td>
                                                    <td>
                                                        <asp:Label ID="lbl_testing_exam_date111" runat="server" Text='<%#Eval("Examstatus") %>' ForeColor='<%# (Eval("Examstatus").Equals("Waiting to get hold of")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' /></td>
                                                    <td>
                                                        <asp:Label ID="lbl_testing_exam_date" runat="server" Text='<%#Eval("Result_Pass_or_Fail") %>' ForeColor='<%# (Eval("Result_Pass_or_Fail").Equals("Fail")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' /></td>
                                                    <td><%#Eval("center_name") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                                <center>
                                    <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" /></center>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>
</asp:Content>
