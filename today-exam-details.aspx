<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="today-exam-details.aspx.cs" Inherits="Center.today_exam_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Exam Details</h2>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top: 32px;">
                    <div class="card" style="background-color: #e6e6e626; padding: 5px 22px;">
                        <div class="body" style="padding: 54px;">
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for="">Candidate ID:</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_CandidateID" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for="">Reg ID:</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_RegID" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Candidate Name :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_Name" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Email ID:</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_EmailId" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Mobile Number :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_Phoneno" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Address :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_Address" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Country :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_Country" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>State :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_State" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>City :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_City" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Postal Code :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_PostalCode" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Exam Code :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_ExamCode" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Exam Name :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_ExamName" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Exam Date :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_ExamDate" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Exam Time :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_Time" runat="server" Text="" />
                                </div>
                            </div>

                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Exam Status :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_ExamStatus" runat="server" Text="" />
                                </div>
                            </div>
                            <div class="row clearfix">

                                <div class="col-md-4" style="font-size: 20px;">
                                    <label for=""><b>Result Status :</b></label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lbl_ResultStatus" runat="server" Text="" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
