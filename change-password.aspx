<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="change-password.aspx.cs" Inherits="Center.change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Change Password</h2>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="form-container">
                        <div class="form1">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    <div class="form-row">
                                        <div class="col-md-4 profile">
                                            <div>
                                                <label for="">Old Password :</label>
                                                <span>
                                                    <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Vaild" ControlToValidate="txtOldPassword"
                                                        ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </span>
                                            </div>

                                        </div>
                                        <div class="col-md-4 profile">
                                            <div>
                                                <label for="">New Password :</label>
                                                <span>
                                                    <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Vaild" ControlToValidate="txtNewPassword"
                                                        ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                            </div>
                                        </div>
                                        <div class="col-md-4 profile">
                                            <div>
                                                <label for="">Confirm Password :</label>
                                                <span>
                                                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Vaild" ControlToValidate="txtConfirmPassword"
                                                        ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ValidationGroup="Vaild" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Both password should be same."
                                                        ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"></asp:CompareValidator></span>
                                            </div>

                                        </div>
                                        <div class="col-md-12 profile">
                                            <div>
                                                <label for=""></label>
                                                <span><br />
                                                    <%-- <asp:Button class="btn btn-success btn-lg" runat="server" Text="Update Profile" OnClick="Update_Profile" />--%>
                                                    <asp:Button ID="btnSave" runat="server" Text="Change Password" ValidationGroup="Vaild"
                                                        OnClick="btnSave_Click" class="btn btn-success btn-lg" />
                                                </span>
                                            </div>

                                        </div>
                                        <!-- <div class="col-md-6"> rahul</div> -->
                                    </div>
                                </div>

                            </div>
                            <br>
                            <!-- <button type="submit" class="btn btn-primary" style="width: 100%; border-radius: 25px;">Search</button> -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
