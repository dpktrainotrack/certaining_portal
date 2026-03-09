<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="voucher-request.aspx.cs" Inherits="Center.voucher_request" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- Un-commented and updated to use current rawgit link structure or reliable CDN -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.css"
            rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.min.js"></script>
        <style type="text/css">
            .multiselect-container,
            .dropdown-menu {
                height: 400px;
                overflow-y: auto;
                min-width: 290px;
                width: 100%;
            }

            .dropdown-menu>.active>a,
            .dropdown-menu>.active>a:hover,
            .dropdown-menu>.active>a:focus {
                background: #007388 !important;
                /* Updated to theme color */
                color: #fff !important;
            }

            /* Modernized Tabs Styling */
            .te-nav-tabs {
                border-bottom: 2px solid #e9ecef;
                display: flex;
                list-style: none;
                padding-left: 0;
                margin-bottom: 0;
            }

            .te-nav-tabs>li {
                margin-bottom: -2px;
            }

            .te-nav-tabs>li>a {
                display: block;
                padding: 12px 20px;
                color: #6c757d;
                font-weight: 600;
                text-decoration: none;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
            }

            .te-nav-tabs>li>a:hover {
                color: #007388;
                border-bottom-color: rgba(0, 115, 136, 0.3);
                background-color: transparent;
            }

            .te-nav-tabs>li.active>a,
            .te-nav-tabs>li.active>a:hover,
            .te-nav-tabs>li.active>a:focus {
                color: #007388;
                border-bottom-color: #007388;
                background-color: transparent;
            }

            .te-tab-content {
                padding: 30px;
            }

            .multiselect-native-select div.btn-group {
                min-width: 290px;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main" style="min-height: 102vh;">
            <div class="container">
                <!-- ===== Breadcrumb Navigation ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Voucher Request</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <script type="text/javascript">
                    function SetHideMessageVoucher(msgLabelID) {
                        setTimeout(function () {
                            $("#" + msgLabelID).hide();
                        }, 4000, null);
                    }

                    function Multiselect() {
                        $("#lstPaper").multiselect({
                            includeSelectAllOption: true,
                            nonSelectedText: 'Select Exams',
                            numberDisplayed: 1,
                            nSelectedText: 'exams selected',
                            allSelectedText: 'All exams selected',
                            selectAllText: 'Select all exams',
                            buttonClass: 'te-input bg-white w-100 text-start'
                        });

                        $("#lstAmount").multiselect({
                            includeSelectAllOption: true,
                            nonSelectedText: 'Select Amounts',
                            numberDisplayed: 1,
                            nSelectedText: 'amounts selected',
                            allSelectedText: 'All amounts selected',
                            selectAllText: 'Select all amounts',
                            buttonClass: 'te-input bg-white w-100 text-start'
                        });
                    }

                    function NumericValue() {
                        $(".txtnumeric").off("keypress keyup blur").on("keypress keyup blur", function (event) {
                            $(this).val($(this).val().replace(/[^\d].+/, ""));
                            if ($(this).val() == 0)
                                $(this).val('');
                            if ((event.which < 48 || event.which > 57)) {
                                event.preventDefault();
                            }
                        });
                    }

                    // Initial Load bindings
                    $(document).ready(function () {
                        Multiselect();
                        NumericValue();

                        // Hook into Tab Clicks to store the value
                        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                            var target = $(e.target).attr("href"); // activated tab
                            $('#hfActiveTab').val(target);
                        });
                    });

                    // Sys.WebForms hook for when the UpdatePanel finishes an AJAX request
                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    if (prm != null) {
                        prm.add_endRequest(function (sender, e) {
                            Multiselect();
                            NumericValue();

                            // Re-apply Active Tab logic after PostBack
                            var activeTab = $('#hfActiveTab').val();
                            if (activeTab) {
                                $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
                                // Ensure the content panes display correctly
                                $('.tab-pane').removeClass('in active show');
                                $(activeTab).addClass('in active show');
                            }
                        });
                    }
                </script>

                <asp:ScriptManager runat="server"></asp:ScriptManager>

                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div
                            style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: rgba(0,0,0,0.5);">
                            <div
                                style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background: white; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
                                <div class="spinner-border text-primary" role="status"
                                    style="color: #007388 !important; width: 3rem; height: 3rem;">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                                <div class="mt-2" style="color: #007388; font-weight: 600;">Processing Request...</div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <asp:UpdatePanel ID="upPanel" runat="server">
                    <ContentTemplate>
                        <!-- Hidden field to track the active tab across AJAX PostBacks -->
                        <asp:HiddenField ID="hfActiveTab" runat="server" ClientIDMode="Static"
                            Value="#pnlRequestExam" />

                        <div class="row mt-4">
                            <div class="col-12">
                                <!-- Alert Message Area -->
                                <div class="mb-3">
                                    <asp:Label ID="lblMessage" runat="server" Text=""
                                        CssClass="te-error-msg d-inline-block px-3 py-2 rounded" style="display:none;">
                                    </asp:Label>
                                </div>

                                <!-- Main Card -->
                                <div class="te-card">
                                    <!-- Tabs Header -->
                                    <div
                                        class="border-bottom px-3 pt-3 bg-light rounded-top d-flex justify-content-center">
                                        <ul class="nav te-nav-tabs">
                                            <li id="liRequestExam" runat="server" class="active"><a data-toggle="tab"
                                                    href="#pnlRequestExam">Voucher Request (via Exam)</a></li>
                                            <li id="liRequestAmount" runat="server"><a data-toggle="tab"
                                                    href="#pnlRequestAmount">Voucher Request (via Amount)</a></li>
                                        </ul>
                                    </div>

                                    <div class="tab-content te-tab-content d-flex justify-content-center">

                                        <!-- ================= TAB 1: Via Exam ================= -->
                                        <asp:Panel ID="pnlRequestExam" ClientIDMode="Static" runat="server"
                                            CssClass="tab-pane fade in active show">

                                            <!-- Selection Area -->
                                            <div id="dvExamSelection" runat="server"
                                                class="row align-items-center mb-4">
                                                <div class="col-12">
                                                    <div class="">
                                                        <label class="fw-bold mb-0">Exams <span
                                                                class="text-danger">*</span></label>
                                                    </div>

                                                    <asp:ListBox class="form-control" runat="server" ID="lstPaper"
                                                        ClientIDMode="Static" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                    <asp:RequiredFieldValidator ErrorMessage="Exams are required."
                                                        Display="Dynamic" ControlToValidate="lstPaper" runat="server"
                                                        ValidationGroup="VaildExam"
                                                        CssClass="text-danger small mt-1 d-block" />
                                                </div>
                                            </div>

                                            <!-- Repeated Items Area -->
                                            <asp:Repeater ID="rptExamDetails" runat="server">
                                                <ItemTemplate>
                                                    <div class="p-3 mb-3 bg-light rounded border">
                                                        <div class="row align-items-center mb-2">
                                                            <div class="col-md-3">
                                                                <label
                                                                    class="fw-bold mb-0 text-muted small text-uppercase">Exam
                                                                    Name</label>
                                                            </div>
                                                            <div class="col-md-9 text-dark">
                                                                <asp:Label ID="lblExamName" runat="server"
                                                                    Text='<%#Eval("ExamName").ToString() + " ( "+Eval("ExamCode").ToString() + " ) " %>'>
                                                                </asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row align-items-center mb-2">
                                                            <div class="col-md-3">
                                                                <label
                                                                    class="fw-bold mb-0 text-muted small text-uppercase">Exam
                                                                    Amount</label>
                                                            </div>
                                                            <div class="col-md-9">
                                                                $ <%#Eval("ExamAmount") %>
                                                            </div>
                                                        </div>

                                                        <div class="row align-items-center">
                                                            <div class="col-md-3">
                                                                <label
                                                                    class="fw-bold mb-0 text-muted small text-uppercase">Voucher
                                                                    Count <span class="text-danger">*</span></label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:TextBox runat="server"
                                                                    CssClass="te-input txtnumeric" ID="txtVoucherCount"
                                                                    placeholder="e.g. 5"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server"
                                                                    Display="Dynamic"
                                                                    ControlToValidate="txtVoucherCount"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ErrorMessage="Voucher count is required."
                                                                    ValidationGroup="VaildMail" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <!-- Message Area -->
                                            <div id="dvMessage" runat="server" visible="false" class="row mb-4 mt-4">
                                                <div class="col-md-3">
                                                    <label class="fw-bold">Message <span
                                                            class="text-danger">*</span></label>
                                                </div>
                                                <div class="col-md-7">
                                                    <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server"
                                                        CssClass="te-input" Rows="5"
                                                        placeholder="Enter any additional instructions or messages here...">
                                                    </asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                                        ControlToValidate="txtMessage"
                                                        CssClass="text-danger small mt-1 d-block"
                                                        ValidationGroup="VaildMail" ErrorMessage="Message is required.">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <!-- Actions -->
                                            <div class="row pb-4">

                                                <div class="col-md-12 d-flex gap-2">
                                                    <asp:Button runat="server" ID="btnNext" Text="Next Session details"
                                                        CssClass="te-btn-primary" ValidationGroup="VaildExam"
                                                        OnClick="btnNext_Click" />
                                                    <asp:Button runat="server" ID="btnSend" Text="Send Request"
                                                        CssClass="te-btn-primary" Visible="false"
                                                        ValidationGroup="VaildMail" OnClick="btnSend_Click" />
                                                    <asp:Button ID="btnReset" runat="server" Text="Reset Form"
                                                        OnClick="btnReset_Click"
                                                        CssClass="te-btn-view bg-danger text-white border-0">
                                                    </asp:Button>
                                                </div>
                                            </div>

                                        </asp:Panel>

                                        <!-- ================= TAB 2: Via Amount ================= -->
                                        <asp:Panel ID="pnlRequestAmount" ClientIDMode="Static" runat="server"
                                            CssClass="tab-pane fade">

                                            <!-- Selection Area -->
                                            <div id="dvAmountFirst" runat="server" class="row align-items-center mb-4">

                                                <div class="col-12">
                                                    <div class="">
                                                        <label class="fw-bold mb-0">Amount <span
                                                                class="text-danger">*</span></label>
                                                    </div>
                                                    <asp:ListBox class="form-control" runat="server" ID="lstAmount"
                                                        ClientIDMode="Static" SelectionMode="Multiple" Height="100px">
                                                    </asp:ListBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                        ErrorMessage="Amounts are required." Display="Dynamic"
                                                        ControlToValidate="lstAmount" runat="server"
                                                        ValidationGroup="VaildAmount"
                                                        CssClass="text-danger small mt-1 d-block" />
                                                </div>
                                            </div>

                                            <!-- Message Area Secondary -->
                                            <div id="dvAmountSecond" runat="server" visible="false">
                                                <asp:Repeater ID="rptAmountDetails" runat="server">
                                                    <ItemTemplate>
                                                        <div class="p-3 mb-3 bg-light rounded border">
                                                            <div class="row align-items-center mb-2">
                                                                <div class="col-md-3">
                                                                    <label
                                                                        class="fw-bold mb-0 text-muted small text-uppercase">Base
                                                                        Amount</label>
                                                                </div>
                                                                <div class="col-md-9 text-dark fw-bold">
                                                                    $ <asp:Label ID="lblAmount" runat="server"
                                                                        Text='<%#Eval("Amount") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row align-items-center">
                                                                <div class="col-md-3">
                                                                    <label
                                                                        class="fw-bold mb-0 text-muted small text-uppercase">Voucher
                                                                        Count <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox runat="server"
                                                                        CssClass="te-input txtnumeric"
                                                                        ID="txtVoucherCount" placeholder="e.g. 10">
                                                                    </asp:TextBox>
                                                                    <asp:RequiredFieldValidator runat="server"
                                                                        Display="Dynamic"
                                                                        ControlToValidate="txtVoucherCount"
                                                                        CssClass="text-danger small mt-1 d-block"
                                                                        ErrorMessage="Voucher count is required."
                                                                        ValidationGroup="VaildMailAmount" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <div class="row mb-4 mt-4">
                                                    <div class="col-md-3">
                                                        <label class="fw-bold">Message <span
                                                                class="text-danger">*</span></label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <asp:TextBox ID="txtMessageAmount" TextMode="MultiLine"
                                                            runat="server" CssClass="te-input" Rows="5"
                                                            placeholder="Enter any additional instructions or messages here...">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                                            ControlToValidate="txtMessageAmount"
                                                            CssClass="text-danger small mt-1 d-block"
                                                            ValidationGroup="VaildMailAmount"
                                                            ErrorMessage="Message is required.">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Actions -->
                                            <div class="row pb-4">
                                                <div class="col-12 d-flex gap-2">
                                                    <asp:Button runat="server" ID="btnAmount" Text="Next Configuration"
                                                        CssClass="te-btn-primary" ValidationGroup="VaildAmount"
                                                        OnClick="btnAmount_Click" />
                                                    <asp:Button runat="server" ID="btnSendAmount" Text="Send Request"
                                                        CssClass="te-btn-primary" Visible="false"
                                                        ValidationGroup="VaildMailAmount"
                                                        OnClick="btnSendAmount_Click" />
                                                    <asp:Button ID="btnResetAmount" runat="server" Text="Reset Form"
                                                        OnClick="btnResetAmount_Click"
                                                        CssClass="te-btn-view bg-danger text-white border-0">
                                                    </asp:Button>
                                                </div>
                                            </div>

                                        </asp:Panel>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Content>