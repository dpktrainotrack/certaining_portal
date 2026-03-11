<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="today-exam-details.aspx.cs" Inherits="Center.today_exam_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .exam-page-wrapper {
            min-height: 100vh;
        }

        .exam-details-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            padding: 30px 30px 24px;
            border-top: 5px solid #007388;
        }

        .exam-details-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #eef2f5;
            padding-bottom: 10px;
        }

        .exam-details-title {
            font-size: 20px;
            font-weight: 700;
            color: #2c3e50;
            margin: 0;
        }

        .exam-details-subtitle {
            font-size: 13px;
            color: #7f8c8d;
            margin-top: 4px;
        }

        .exam-details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px 32px;
        }

        .exam-section-title {
            font-size: 13px;
            font-weight: 600;
            color: #007388;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin: 18px 0 8px;
        }

        .exam-field {
            display: flex;
            flex-direction: column;
        }

        .exam-field-label {
            font-size: 13px;
            font-weight: 600;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 4px;
        }

        .exam-field-value {
            font-size: 15px;
            color: #2c3e50;
            font-weight: 500;
            word-break: break-word;
        }

        .exam-status-pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
            color: #ffffff;
            background: #007388;
        }

        @media (max-width: 767px) {
            .exam-details-card {
                padding: 20px 18px 18px;
            }

            .exam-details-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col exam-page-wrapper" role="main">
        <div class="container">
            <!-- Breadcrumb -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav class="te-breadcrumb" aria-label="breadcrumb">
                        <ol>
                            <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                            <li class="te-breadcrumb__active">Today Exam Details</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- Exam Details Card -->
            <div class="row" style="margin-top: 24px;">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1">
                    <div class="exam-details-card te-card">
                        <div class="exam-details-header">
                            <div>
                                <h3 class="exam-details-title">Today Exam Details</h3>
                                <p class="exam-details-subtitle">Review candidate information and exam schedule for today.</p>
                            </div>
                        </div>

                        <div class="exam-details-body">
                            <!-- Candidate & Registration -->
                            <div class="exam-section-title">Candidate Information</div>
                            <div class="exam-details-grid">
                                <div class="exam-field">
                                    <span class="exam-field-label">Candidate ID</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_CandidateID" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Registration ID</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_RegID" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Candidate Name</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_Name" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>

                            <!-- Contact -->
                            <div class="exam-section-title">Contact Details</div>
                            <div class="exam-details-grid">
                                <div class="exam-field">
                                    <span class="exam-field-label">Email ID</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_EmailId" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Mobile Number</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_Phoneno" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field" style="grid-column: 1 / -1;">
                                    <span class="exam-field-label">Address</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_Address" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>

                            <!-- Location -->
                            <div class="exam-section-title">Location</div>
                            <div class="exam-details-grid">
                                <div class="exam-field">
                                    <span class="exam-field-label">Country</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_Country" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">State</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_State" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">City</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_City" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Postal Code</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_PostalCode" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>

                            <!-- Exam Details -->
                            <div class="exam-section-title">Exam Details</div>
                            <div class="exam-details-grid">
                                <div class="exam-field">
                                    <span class="exam-field-label">Exam Code</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_ExamCode" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Exam Name</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_ExamName" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Exam Date</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_ExamDate" runat="server" Text="" />
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Exam Time</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_Time" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>

                            <!-- Status -->
                            <div class="exam-section-title">Status</div>
                            <div class="exam-details-grid">
                                <div class="exam-field">
                                    <span class="exam-field-label">Exam Status</span>
                                    <span class="exam-field-value">
                                        <span class="exam-status-pill">
                                            <asp:Label ID="lbl_ExamStatus" runat="server" Text="" style="color: white" />
                                        </span>
                                    </span>
                                </div>
                                <div class="exam-field">
                                    <span class="exam-field-label">Result Status</span>
                                    <span class="exam-field-value">
                                        <asp:Label ID="lbl_ResultStatus" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
