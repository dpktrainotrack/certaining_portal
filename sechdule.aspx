<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="sechdule.aspx.cs" Inherits="Center.sechdule" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .schedule-opt-card {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 50px 20px;
                border-radius: 16px;
                background: #ffffff;
                border: 2px solid transparent;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
                text-decoration: none;
                color: #333;
                height: 100%;
                cursor: pointer;
            }

            .schedule-opt-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 35px rgba(0, 115, 136, 0.15);
                border-color: #007388;
                text-decoration: none;
                color: #007388;
            }

            .schedule-opt-card i {
                font-size: 56px;
                color: #007388;
                margin-bottom: 24px;
                transition: transform 0.3s ease;
            }

            .schedule-opt-card:hover i {
                transform: scale(1.1);
            }

            .schedule-opt-card h3 {
                font-size: 24px;
                font-weight: 600;
                margin: 0;
                color: inherit;
            }

            .schedule-opt-card p {
                color: #6c757d;
                margin-top: 15px;
                font-size: 15px;
                text-align: center;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col " role="main" style="height: 92vh;">
            <div class="container">
                <!-- ===== Breadcrumb Navigation ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Schedule Exam</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- ===== Content ===== -->
                <div class="row mt-5 justify-content-center align-items-center" style="min-height: 50vh;">
                    <!-- New Candidate -->
                    <div class="col-lg-5 col-md-6 mb-4">
                        <a href="registration" class="schedule-opt-card">
                            <i class="fa fa-user-plus"></i>
                            <h3>New Candidate</h3>
                            <p>Register a new candidate profile and seamlessly schedule an upcoming exam for them.</p>
                        </a>
                    </div>

                    <!-- Existing Candidate -->
                    <div class="col-lg-5 col-md-6 mb-4">
                        <a href="existing" class="schedule-opt-card">
                            <i class="fa fa-users"></i>
                            <h3>Existing Candidate</h3>
                            <p>Search for a previously registered candidate in the database to schedule a new exam.</p>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </asp:Content>