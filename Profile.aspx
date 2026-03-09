<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Center.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Profile</h2>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="form-container">
                        <div class="form1">
                            <div class="form-row">
                               <%-- <div class="col-md-12">
                                    <a href="/edit-profile.html" style="float: inline-end;">
                                        <i class="fa fa-pencil-square-o fa-3x" aria-hidden="true"></i>
                                    </a>

                                </div>--%>
                                <div class="col-md-5">
                                    <img src="/asset/img/center.png" height="315px" alt="" srcset="">
                                </div>
                                <div class="col-md-7">
                                    <div class="form-row">
                                        <div class="col-md-12">
                                            <h1 class="font-weight-bold" style="color: #2a3f54;" id="lbl_testing_id" runat="server" ></h1>
                                            <h5 style="color: red; display:none;">A Lead UX & UI designer based in Canada  </h5>
                                            <p style="display:none;">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quasi quam iusto animi eius adipisci debitis libero veritatis illum nesciunt saepe, harum ullam laboriosam reprehenderit nostrum magni, ipsa nulla deserunt laborum!</p>
                                        </div>
                                        <div class="col-md-5 profile">
                                            <div>
                                                <label for="">Center Name :</label>
                                                <span>
                                                    <asp:TextBox ID="txt_CenterName" runat="server" CssClass="form-control" required /></span>
                                            </div>

                                        </div>
                                        <div class="col-md-7 profile">
                                            <div>
                                                <label for="">Email ID :</label>
                                                <span>
                                                    <asp:TextBox ID="txt_EmailID" runat="server" CssClass="form-control" pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" required /></span>
                                            </div>
                                        </div>
                                        <div class="col-md-5 profile">
                                            <div>
                                                <label for="">Mobile Number :</label>
                                                <span>
                                                    <asp:TextBox ID="Txt_CenterPhoneNo" runat="server" CssClass="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required /></span>
                                            </div>

                                        </div>
                                        <div class="col-md-7 profile">
                                            <div>
                                                <label for="">Pin Code :</label>
                                                <span>
                                                    <asp:TextBox ID="Txt_PinCode" runat="server" CssClass="form-control" required /></span>
                                            </div>
                                        </div>
                                        <div class="col-md-12 profile">
                                            <div>
                                                <label for="">Address :</label>
                                                <span>
                                                    <asp:TextBox ID="txt_CenterAddress" TextMode="MultiLine" runat="server" CssClass="form-control" required /></span>
                                            </div>
                                        </div>
                                        <div class="col-md-12 profile">
                                            <div>
                                                <label for=""></label>
                                                <span><br />
                                                    <asp:Button class="btn btn-success btn-lg" runat="server" Text="Update Profile" OnClick="Update_Profile" />
                                                </span>
                                            </div>
                                        </div>
                                        <!-- <div class="col-md-6"> rahul</div> -->
                                    </div>
                                </div>

                            </div>
                            <!-- <h3 class="fourm-title">Search Candidate Details </h3> -->
                            <!-- <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="inputEmail4">First Name*</label>
                        <input type="text" class="form-control" id="text" placeholder="Write Your First Name*">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4">Last Name</label>
                        <input type="text" class="form-control" id="text" placeholder="Write Your Last Name">
                      </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email Id*</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Write Your Email Id*">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputphone">Phone Number*</label>
                            <input type="number" class="form-control" id="inputphone" placeholder="Write Your Phone Number*">
                        </div>
                    </div>                        -->
                            <br>
                            <!-- <button type="submit" class="btn btn-primary" style="width: 100%; border-radius: 25px;">Search</button> -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
