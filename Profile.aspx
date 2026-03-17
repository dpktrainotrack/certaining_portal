<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs"
    Inherits="Center.Profile" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            /* Profile Page Specific Styles */
            .profile-header-section {
                background: linear-gradient(135deg, #007388 0%, #0099b3 100%);
                border-radius: 12px;
                padding: 30px;
                margin-bottom: 30px;
                color: white;
                box-shadow: 0 4px 15px rgba(0, 115, 136, 0.2);
            }

            .profile-header-content {
                display: flex;
                align-items: center;
                gap: 30px;
            }

            .profile-avatar-container {
                flex-shrink: 0;
            }

            .profile-avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 4px solid rgba(255, 255, 255, 0.3);
                object-fit: cover;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            }

            .profile-info h1 {
                font-size: 28px;
                font-weight: 700;
                margin: 0 0 8px 0;
                color: white;
            }

            .profile-info p {
                font-size: 14px;
                margin: 0;
                opacity: 0.9;
            }

            .profile-form-card {
                background: white;
                border-radius: 12px;
                box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
                border: 1px solid #e9ecef;
                overflow: hidden;
            }

            .profile-form-header {
                background: #f8fafb;
                padding: 18px 24px;
                border-bottom: 2px solid #e2e8f0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .profile-form-header i {
                color: #007388;
                font-size: 20px;
            }

            .profile-form-header h3 {
                margin: 0;
                font-size: 18px;
                font-weight: 600;
                color: #2c3e50;
            }

            .profile-form-body {
                padding: 30px;
            }

            .profile-form-group {
                margin-bottom: 24px;
            }

            .profile-form-label {
                font-weight: 600;
                font-size: 14px;
                color: #2c3e50;
                margin-bottom: 8px;
                display: block;
            }

            .profile-form-control {
                border: 1px solid #ced4da;
                border-radius: 8px;
                padding: 10px 14px;
                font-size: 14px;
                color: #495057;
                transition: all 0.2s ease;
                background-color: #fff;
                width: 100%;
            }

            .profile-form-control:focus {
                border-color: #007388;
                box-shadow: 0 0 0 3px rgba(0, 115, 136, 0.15);
                outline: none;
            }

            .profile-form-textarea {
                min-height: 100px;
                resize: vertical;
            }

            .profile-submit-btn {
                background: linear-gradient(135deg, #007388, #0099b3);
                color: white;
                border: none;
                border-radius: 25px;
                padding: 12px 32px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                letter-spacing: 0.5px;
                box-shadow: 0 4px 15px rgba(0, 115, 136, 0.2);
            }

            .profile-submit-btn:hover {
                background: linear-gradient(135deg, #005f70, #007f94);
                box-shadow: 0 6px 20px rgba(0, 115, 136, 0.3);
                transform: translateY(-2px);
            }

            .profile-form-row {
                display: flex;
                gap: 20px;
                margin-bottom: 24px;
            }

            .profile-form-col {
                flex: 1;
            }

            @media (max-width: 768px) {
                .profile-header-content {
                    flex-direction: column;
                    text-align: center;
                }

                .profile-form-row {
                    flex-direction: column;
                    gap: 0;
                }

                .profile-form-body {
                    padding: 20px;
                }
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main">
            <div class="container">
                <!-- Breadcrumb Navigation -->
                <div class="row">
                    <div class="col-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Profile Header Section -->
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="profile-header-section">
                            <div class="profile-header-content">
                                <div class="profile-avatar-container">
                                    <img src="/asset/img/center.png" alt="Center Logo" class="profile-avatar" />
                                </div>
                                <div class="profile-info">
                                    <h1 id="lbl_testing_id" runat="server">Center Profile</h1>
                                    <p>Manage your center information and contact details</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Profile Form Card -->
                <div class="row">
                    <div class="col-12">
                        <div class="profile-form-card">
                            <div class="profile-form-header">
                                <i class="fa fa-building"></i>
                                <h3>Center Information</h3>
                            </div>
                            <div class="profile-form-body">
                                <div class="profile-form-row">
                                    <div class="profile-form-col">
                                        <div class="profile-form-group">
                                            <label class="profile-form-label" for="<%=txt_CenterName.ClientID %>">
                                                Center Name
                                            </label>
                                            <asp:TextBox ID="txt_CenterName" runat="server"
                                                CssClass="profile-form-control" placeholder="Enter center name"
                                                required />
                                        </div>
                                    </div>
                                    <div class="profile-form-col">
                                        <div class="profile-form-group">
                                            <label class="profile-form-label" for="<%=txt_EmailID.ClientID %>">
                                                Email Address
                                            </label>
                                            <asp:TextBox ID="txt_EmailID" runat="server" CssClass="profile-form-control"
                                                placeholder="Enter email address"
                                                pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="profile-form-row">
                                    <div class="profile-form-col">
                                        <div class="profile-form-group">
                                            <label class="profile-form-label" for="<%=Txt_CenterPhoneNo.ClientID %>">
                                                Mobile Number
                                            </label>
                                            <asp:TextBox ID="Txt_CenterPhoneNo" runat="server"
                                                CssClass="profile-form-control" placeholder="Enter mobile number"
                                                onkeypress='return event.charCode >= 48 && event.charCode <= 57'
                                                required />
                                        </div>
                                    </div>
                                    <div class="profile-form-col">
                                        <div class="profile-form-group">
                                            <label class="profile-form-label" for="<%=Txt_PinCode.ClientID %>">
                                                Pin Code
                                            </label>
                                            <asp:TextBox ID="Txt_PinCode" runat="server" CssClass="profile-form-control"
                                                placeholder="Enter pin code" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="profile-form-group">
                                    <label class="profile-form-label" for="<%=txt_CenterAddress.ClientID %>">
                                        Complete Address
                                    </label>
                                    <asp:TextBox ID="txt_CenterAddress" TextMode="MultiLine" runat="server"
                                        CssClass="profile-form-control profile-form-textarea"
                                        placeholder="Enter complete address" required />
                                </div>

                                <div class="profile-form-group mb-0">
                                    <asp:Button class="profile-submit-btn" runat="server" Text="Update Profile"
                                        OnClick="Update_Profile" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>