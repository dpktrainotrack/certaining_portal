<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="change-password.aspx.cs" Inherits="Center.change_password" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            /* Change Password Page Specific Styles */
            .password-header-section {
                background: linear-gradient(135deg, #007388 0%, #0099b3 100%);
                border-radius: 12px;
                padding: 30px;
                margin-bottom: 30px;
                color: white;
                box-shadow: 0 4px 15px rgba(0, 115, 136, 0.2);
            }

            .password-header-content {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .password-icon-wrapper {
                width: 70px;
                height: 70px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
            }

            .password-icon-wrapper i {
                font-size: 32px;
                color: white;
            }

            .password-info h1 {
                font-size: 26px;
                font-weight: 700;
                margin: 0 0 6px 0;
                color: white;
            }

            .password-info p {
                font-size: 14px;
                margin: 0;
                opacity: 0.9;
            }

            .password-form-card {
                background: white;
                border-radius: 12px;
                box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
                border: 1px solid #e9ecef;
                overflow: hidden;
            }

            .password-form-header {
                background: #f8fafb;
                padding: 18px 24px;
                border-bottom: 2px solid #e2e8f0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .password-form-header i {
                color: #007388;
                font-size: 20px;
            }

            .password-form-header h3 {
                margin: 0;
                font-size: 18px;
                font-weight: 600;
                color: #2c3e50;
            }

            .password-form-body {
                padding: 30px;
            }

            .password-form-group {
                margin-bottom: 24px;
            }

            .password-form-label {
                font-weight: 600;
                font-size: 14px;
                color: #2c3e50;
                margin-bottom: 8px;
                display: block;
            }

            .password-form-control {
                border: 1px solid #ced4da;
                border-radius: 8px;
                padding: 10px 14px;
                font-size: 14px;
                color: #495057;
                transition: all 0.2s ease;
                background-color: #fff;
                width: 100%;
            }

            .password-form-control:focus {
                border-color: #007388;
                box-shadow: 0 0 0 3px rgba(0, 115, 136, 0.15);
                outline: none;
            }

            .password-submit-btn {
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

            .password-submit-btn:hover {
                background: linear-gradient(135deg, #005f70, #007f94);
                box-shadow: 0 6px 20px rgba(0, 115, 136, 0.3);
                transform: translateY(-2px);
            }

            .password-message {
                padding: 12px 16px;
                border-radius: 8px;
                margin-bottom: 20px;
                font-weight: 500;
                font-size: 14px;
            }

            .password-message-error {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }

            .password-message-success {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }

            .validator-error {
                color: #dc3545;
                font-size: 12px;
                margin-top: 4px;
                display: block;
            }

            @media (max-width: 768px) {
                .password-header-content {
                    flex-direction: column;
                    text-align: center;
                }

                .password-form-body {
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
                                <li class="te-breadcrumb__active">Change Password</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Password Header Section -->
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="password-header-section">
                            <div class="password-header-content">
                                <div class="password-icon-wrapper">
                                    <i class="fa fa-lock"></i>
                                </div>
                                <div class="password-info">
                                    <h1>Change Password</h1>
                                    <p>Update your password to keep your account secure</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Password Form Card -->
                <div class="row">
                    <div class="col-12">
                        <div class="password-form-card">
                            <div class="password-form-header">
                                <i class="fa fa-key"></i>
                                <h3>Password Details</h3>
                            </div>
                            <div class="password-form-body">
                                <!-- Message Display Area -->
                                <div id="messageArea" runat="server" visible="false">
                                    <asp:Label ID="lblMessage" runat="server"
                                        CssClass="password-message password-message-error"></asp:Label>
                                </div>

                                <div class="password-form-row">
                                    <div class="password-form-col">
                                        <div class="password-form-group">
                                            <label class="password-form-label" for="<%=txtOldPassword.ClientID %>">
                                                Current Password
                                            </label>
                                            <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server"
                                                CssClass="password-form-control" placeholder="Enter current password"
                                                required />
                                            <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server"
                                                ValidationGroup="Vaild" ControlToValidate="txtOldPassword"
                                                ErrorMessage="Current password is required" CssClass="validator-error"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="password-form-row">
                                    <div class="password-form-col">
                                        <div class="password-form-group">
                                            <label class="password-form-label" for="<%=txtNewPassword.ClientID %>">
                                                New Password
                                            </label>
                                            <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"
                                                CssClass="password-form-control" placeholder="Enter new password"
                                                required />
                                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
                                                ValidationGroup="Vaild" ControlToValidate="txtNewPassword"
                                                ErrorMessage="New password is required" CssClass="validator-error"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="password-form-row">
                                    <div class="password-form-col">
                                        <div class="password-form-group">
                                            <label class="password-form-label" for="<%=txtConfirmPassword.ClientID %>">
                                                Confirm Password
                                            </label>
                                            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"
                                                CssClass="password-form-control" placeholder="Re-enter new password"
                                                required />
                                            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                                                ValidationGroup="Vaild" ControlToValidate="txtConfirmPassword"
                                                ErrorMessage="Please confirm your password" CssClass="validator-error"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cvPasswordMatch" ValidationGroup="Vaild"
                                                Display="Dynamic" runat="server" CssClass="validator-error"
                                                ErrorMessage="Passwords do not match"
                                                ControlToValidate="txtConfirmPassword"
                                                ControlToCompare="txtNewPassword"></asp:CompareValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="password-form-group mb-0">
                                    <asp:Button ID="btnSave" runat="server" Text="Update Password"
                                        ValidationGroup="Vaild" OnClick="btnSave_Click"
                                        CssClass="password-submit-btn" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            // Move validator messages to proper location
            $(document).ready(function () {
                $('.validator-error').each(function () {
                    var validator = $(this);
                    var input = $('#' + validator.attr('controltovalidate'));
                    input.on('input', function () {
                        validator.hide();
                    });
                });
            });
        </script>
    </asp:Content>