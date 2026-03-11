<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="registration.aspx.cs" Inherits="Center.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .registration-page-wrapper {
            min-height: 100vh;
        }

        .registration-intro {
            margin-top: 8px;
            margin-bottom: 10px;
        }

        .registration-title {
            font-size: 22px;
            font-weight: 700;
            color: #2c3e50;
            margin: 0;
        }

        .registration-subtitle {
            font-size: 13px;
            color: #7f8c8d;
            margin-top: 4px;
            margin-bottom: 0;
        }

        .registration-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            padding: 24px 24px 20px;
            /*            border-top: 5px solid #007388;*/
            margin-top: 22px;
        }

        .registration-section-title {
            font-size: 13px;
            font-weight: 600;
            color: #007388;
            text-transform: uppercase;
            letter-spacing: 0.7px;
            margin-bottom: 10px;
        }

        .registration-section-title span {
            font-weight: inherit;
        }

        .registration-form-row {
            margin-bottom: 18px;
        }

        .registration-form-row label {
            font-size: 13px;
            font-weight: 600;
            color: #4a4a4a;
            margin-bottom: 4px;
        }

        .registration-form-row .form-control,
        .registration-form-row select.form-control {
            border-radius: 8px;
            border-color: #d5dde5;
            font-size: 14px;
            padding: 8px 10px;
        }

        .registration-form-row .form-control:focus {
            border-color: #007388;
            box-shadow: 0 0 0 0.05rem rgba(0, 115, 136, 0.35);
        }

        .registration-required {
            font-size: 16px;
            color: #e74c3c;
        }

        .validation-error {
            font-size: 11px;
            margin-top: 2px;
            display: block;
        }

        .multiform {
            width: 100%;
        }

        /* Tweak legacy multiform styling inside registration card */
        .registration-card .multiform {
            margin: 0;
            padding: 0;
            background-color: transparent;
            box-shadow: none;
            border-radius: 0;
        }

        .registration-card .multiform .form-row {
            margin-bottom: 14px;
        }

        @media (max-width: 767px) {
            .registration-card {
                padding: 18px 16px 16px;
                margin-top: 16px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //$(document).ready(function () {
        //    function disableBack() { window.history.forward() }
        //    window.onload = disableBack();
        //    window.onpageshow = function (evt) { if (evt.persisted) disableBack() }
        //});

        function VaildDateTime(sender, args) {
            var Lbl_date = $('#<%=Lbl_date.ClientID %>');
            var Lbl_Time = $('#<%=Lbl_Time.ClientID %>');
            var isValid = false;
            if (Lbl_Time[0].innerText == '' && Lbl_Time[0].innerText == '') {
                isValid = false;
            } else if (Lbl_date[0].innerText == '') {
                isValid = false;
            } else if (Lbl_Time[0].innerText == '') {
                isValid = false;
            } else {
                isValid = true;
            }

            args.IsValid = isValid;
        }

        function SetHideLable(msgLabelID) {
            setTimeout(function() {
                $("#" + msgLabelID).hide();
            }, 10000, null);
        }

        function capFirst(oTextBox) {
            oTextBox.value = oTextBox.value[0].toUpperCase() + oTextBox.value.substring(1);
        }

        function SearchList() {
            var l = document.getElementById("ListBox1").value;
            var tb = document.getElementById("TextBox1").value;
            if (tb.value == "") {
                ClearSelection(l);
                DisabledDateTimeButton();
            } else {
                for (var i = 0; i < l.options.length; i++) {
                    if (l.options[i].value.toLowerCase().match(tb.value.toLowerCase())) {
                        l.options[i].selected = true;
                        DisabledDateTimeButton();
                        return false;
                    } else {
                        ClearSelection(l);
                        DisabledDateTimeButton();
                    }
                }
            }
        }

        function DisabledDateTimeButton() {
            var ListBox1 = document.getElementById('<%= ListBox1.ClientID %>');
            if (ListBox1 == null || ListBox1.selectedIndex == null || ListBox1.selectedIndex == -1) {
                $("#btnSelectDate").attr("disabled", "disabled");
            } else {
                $("#btnSelectDate").removeAttr("disabled");
                var date = document.getElementById('<%= Lbl_date.ClientID %>');
                if (date == null) {
                    document.getElementById("btnSelectDate").value = "Select Date and Time";
                } else {
                    document.getElementById("btnSelectDate").value = "Edit Date and Time";
                }

            }
        }

        function ClearSelection(lb) {
            lb.selectedIndex = -1;
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/asset/img/loader.gif" Height="50px" Width="50px" Style="position: fixed; top: 250px;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="upPaper" runat="server">
        <ContentTemplate>
            <div class="right_col registration-page-wrapper" role="main">
                <div class="container">
                    <!-- Breadcrumb -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <nav class="te-breadcrumb" aria-label="breadcrumb">
                                <ol>
                                    <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                    <li class="te-breadcrumb__active">Schedule New Exam</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <!-- Page intro -->
                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-1 col-md-12">
                            <div class="registration-intro">
                                <h2 class="registration-title">Follow Steps to Schedule New Exam</h2>
                                <p class="registration-subtitle">Enter candidate details and contact information to
                                    create a new exam registration.</p>
                            </div>
                        </div>
                    </div>

                    <input type="text" name="Address" id="RendomCode" runat="server" style="display: none;" />
                    <!-- <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-" style="text-align: center;">
                <button>Provides Details </button>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-" style="text-align: center;">
                <button>Provides Details </button>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-" style="text-align: center;">
                <button>Provides Details </button>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-" style="text-align: center;">
                <button>Provides Details </button>
            </div>
    
            <form class="multiform mt-5" >
              <fieldset class="provide details">

                <div class="form-row">
                    <div class="col-md-12">
                        <h1 class="header"><span>Personal Information ( * mandatory fields)
                        </span></h1>
                        <br>
                    </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="text" class="form-control" placeholder="First name">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="text" class="form-control" placeholder="Middle name">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="text" class="form-control" placeholder="Last name">
                  </div>
                </div>                    
                <div class="form-row pt-3">
                  <br>
                  <div class="col-md-12 ">
                    <h1 class="header">
                        <span>
                            Contact Information ( * mandatory fields)
                        </span>
                    </h1>
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="email" class="form-control" placeholder="Email Address">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="Mobile Number">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="Landline No">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="email" class="form-control" placeholder="Current Address">
                  </div>
                  
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="Permanent Address">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="Country">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="email" class="form-control" placeholder="State">
                  </div>
                  
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="City">
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-4">
                    <input type="number" class="form-control" placeholder="Postal Code">
                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-3">
                    <button> Prev</button>
                    <button>Submit</button>
                  </div>
                </div>
              </fieldset>
              <fieldset class="fill-exam">
                <div class="form-row">
                  <div class="col-md-12">
                      <h1 class="header"><span>Personal Information ( * mandatory fields)
                      </span></h1>
                      <br>
                  </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="First name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Middle name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
              </div>                    
              <div class="form-row pt-3">
                <br>
                <div class="col-md-12 ">
                  <h1 class="header">
                      <span>
                          Contact Information ( * mandatory fields)
                      </span>
                  </h1>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Email Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Mobile Number">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Landline No">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Current Address">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Permanent Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Country">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="State">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="City">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Postal Code">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <button> Prev</button>
                  <button>Submit</button>
                </div>
              </div>
              </fieldset>
              <fieldset class="review-details">
                <div class="form-row">
                  <div class="col-md-12">
                      <h1 class="header"><span>Personal Information ( * mandatory fields)
                      </span></h1>
                      <br>
                  </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="First name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Middle name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
              </div>                    
              <div class="form-row pt-3">
                <br>
                <div class="col-md-12 ">
                  <h1 class="header">
                      <span>
                          Contact Information ( * mandatory fields)
                      </span>
                  </h1>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Email Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Mobile Number">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Landline No">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Current Address">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Permanent Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Country">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="State">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="City">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Postal Code">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <button> Prev</button>
                  <button>Submit</button>
                </div>
              </div>
              </fieldset>
              <fieldset class="payment">
                <div class="form-row">
                  <div class="col-md-12">
                      <h1 class="header"><span>Personal Information ( * mandatory fields)
                      </span></h1>
                      <br>
                  </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="First name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Middle name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
              </div>                    
              <div class="form-row pt-3">
                <br>
                <div class="col-md-12 ">
                  <h1 class="header">
                      <span>
                          Contact Information ( * mandatory fields)
                      </span>
                  </h1>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Email Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Mobile Number">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Landline No">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="Current Address">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Permanent Address">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Country">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="email" class="form-control" placeholder="State">
                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="City">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <input type="number" class="form-control" placeholder="Postal Code">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <button> Prev</button>
                  <button>Submit</button>
                </div>
              </div>
              </fieldset>


            </form>
        </div> -->

                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-1 col-md-12">
                            <div class="registration-card">
                                <div class="registration-section-title">
                                    <h3>Personal & Contact Information </h3>
                                </div>
                                <div class="multiform mt-3">
                                    <div class="provide-details container-fluid" id="section1" runat="server">

                                        <!-- Personal Information -->
                                        <div class="registration-section mb-4">

                                            <div class="row">
                                                <div class="col-12">
                                                    <p class="registration-section-title">
                                                        Personal Information
                                                        <span>( * mandatory fields )</span>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row g-3 registration-form-row">

                                                <div class="col-12 col-md-6 col-lg-3">
                                                    <label class="form-label">First Name <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_first_name" runat="server" CssClass="form-control" placeholder="First Name" autocomplete="off" onchange="javascript:capFirst(this);" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_first_name" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />
                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">
                                                    <label class="form-label">Middle Name</label>

                                                    <asp:TextBox ID="txt_middle_name" runat="server" CssClass="form-control" placeholder="Middle Name" autocomplete="off" onchange="javascript:capFirst(this);" />
                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">
                                                    <label class="form-label">Last Name <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_last_name" runat="server" CssClass="form-control" placeholder="Last Name" autocomplete="off" onchange="javascript:capFirst(this);" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_last_name" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />
                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">
                                                    <label class="form-label">DOB <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_DOB" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="DOB" autocomplete="off" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_DOB" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />
                                                </div>

                                            </div>
                                        </div>


                                        <!-- Contact Information -->
                                        <div class="registration-section mb-4">

                                            <div class="row">
                                                <div class="col-12">
                                                    <p class="registration-section-title">
                                                        Contact Information
                                                        <span>( * mandatory fields )</span>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row g-3 registration-form-row">

                                                <div class="col-12 col-md-6 col-lg-3">

                                                    <label class="form-label">Email Address <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Email Address" autocomplete="off" onchange="UserOrEmailAvailability()" />

                                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txt_email" ErrorMessage="Invalid Email Format" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_email" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">

                                                    <label class="form-label">Mobile Number <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_mobile" runat="server" CssClass="form-control" placeholder="Mobile Number" MaxLength="15" autocomplete="off" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_mobile" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">

                                                    <label class="form-label">Phone Number</label>

                                                    <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="Landline No" MaxLength="15" autocomplete="off" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />

                                                </div>


                                                <div class="col-12 col-md-6 col-lg-3">

                                                    <label class="form-label">Gender</label>

                                                    <asp:DropDownList ID="ddGender" runat="server" CssClass="form-select">

                                                        <asp:ListItem Value="0">Gender*</asp:ListItem>
                                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                                        <asp:ListItem Value="F">Female</asp:ListItem>

                                                    </asp:DropDownList>

                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddGender" InitialValue="0" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>

                                            </div>
                                        </div>


                                        <!-- Address -->
                                        <div class="registration-section mb-4">

                                            <div class="row g-3">

                                                <div class="col-12 col-lg-4">

                                                    <label class="form-label">Current Address <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_address1" runat="server" CssClass="form-control" placeholder="Current Address" autocomplete="off" onchange="javascript:capFirst(this);" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_address1" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>


                                                <div class="col-12 col-lg-4">

                                                    <label class="form-label">Permanent Address</label>

                                                    <asp:TextBox ID="txt_address2" runat="server" CssClass="form-control" placeholder="Permanent Address" autocomplete="off" onchange="javascript:capFirst(this);" />

                                                </div>


                                                <div class="col-12 col-lg-4">

                                                    <label class="form-label">Select Country <span class="registration-required">*</span></label>

                                                    <asp:DropDownList ID="drop_country" runat="server" CssClass="form-select">

                                                        <asp:ListItem>Please select Country</asp:ListItem>

                                                    </asp:DropDownList>

                                                 <%--   <asp:RequiredFieldValidator 
                                                        ID="rfv_country" 
                                                        runat="server" 
                                                        ControlToValidate="drop_country" 
                                                        InitialValue="Please select Country" 
                                                        ErrorMessage="Required" 
                                                        ValidationGroup="aac" 
                                                        Display="Dynamic" 
                                                        ForeColor="Red"
                                                        /> --%>
                                                </div>

                                            </div>


                                            <div class="row g-3 mt-1">

                                                <div class="col-12 col-md-6 col-lg-4">

                                                    <label class="form-label">State <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_state" runat="server" CssClass="form-control" placeholder="State" autocomplete="off" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_state" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>


                                                <div class="col-12 col-md-6 col-lg-4">

                                                    <label class="form-label">City <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="City" autocomplete="off" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_city" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>


                                                <div class="col-12 col-md-6 col-lg-4">

                                                    <label class="form-label">Pincode <span class="registration-required">*</span></label>

                                                    <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control" placeholder="Postal Code" />

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_pincode" ErrorMessage="Required" ValidationGroup="aac" Display="Dynamic" ForeColor="Red" />

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Candidate ID -->
                                        <div class="row g-3 mb-4">

                                            <div class="col-12 col-lg-6">

                                                <p class="fw-semibold">
                                                    Candidate ID (Please Note Candidate ID before Proceeding)
                                                </p>

                                                <asp:TextBox ID="txt_Aadhar_Card1" runat="server" CssClass="form-control" MaxLength="12" placeholder="* Registration Number" ReadOnly="true" />

                                                <asp:TextBox ID="txt_Aadhar_Card" runat="server" CssClass="form-control" Visible="false" ReadOnly="true" />

                                            </div>

                                        </div>


                                        <!-- Status -->
                                        <div id="checkusernameoremail" runat="server" visible="false">
                                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                        </div>


                                        <!-- Buttons -->
                                        <div class="row mt-4">

                                            <div class="col-12 d-flex flex-wrap gap-2 justify-content-end">

                                                <asp:Button ID="back1" runat="server" Text="Previous" class="btn btn-outline-secondary" ValidationGroup="aacc" OnClick="RamHello1" />

                                                <asp:Button ID="next1" runat="server" Text="Next" class="btn crt-btn-signin" ValidationGroup="aac" OnClick="RamHello11" OnClientClick="abc()" />

                                                <asp:Button ID="Button3" runat="server" Text="Edit Record" Visible="false" class="btn btn-warning" OnClick="Button3_Click" />

                                                <asp:Button ID="Button4" runat="server" Text="Update Records" Visible="false" class="btn btn-success" ValidationGroup="aac" OnClick="Button4_Click" />

                                            </div>

                                        </div>

                                    </div>

                                    <div class="fill-exam container-fluid" id="section2" runat="server" visible="false">

                                        <!-- Section Title -->
                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <p class="registration-section-title">
                                                    Exam Information <span>( * mandatory fields )</span>
                                                </p>
                                            </div>
                                        </div>

                                        <!-- Test Center Information -->
                                        <div class="row g-3 mb-4">

                                            <div class="col-12 col-md-6">
                                                <label class="form-label">
                                                    Test Center Code
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <asp:TextBox ID="txtCenterName" runat="server" Visible="false" CssClass="form-control" ValidationGroup="a" required>
                                                </asp:TextBox>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <label class="form-label">
                                                    Test Center Location
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <asp:TextBox ID="txtcenterstate" runat="server" ReadOnly="true" Visible="false" CssClass="form-control">
                                                </asp:TextBox>
                                            </div>

                                        </div>


                                        <!-- Exam Selection -->
                                        <div class="row g-4 mb-4">

                                            <!-- Exam List -->
                                            <div class="col-12 col-lg-6" id="lstExam" runat="server">

                                                <label class="form-label mb-2">
                                                    Select Exam from List
                                                </label>

                                                <asp:ListBox ID="ListBox1" runat="server" Height="250px" CssClass="form-control" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
                                                </asp:ListBox>

                                            </div>


                                            <!-- Selected Exam Details -->
                                            <div class="col-12 col-lg-6">

                                                <label class="form-label mb-2">
                                                    <asp:Label ID="lnl" runat="server" Text="Exam Name" />
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <asp:TextBox ID="lbl_exam_name" runat="server" ReadOnly="true" Visible="false" CssClass="form-control" ClientIDMode="Static">
                                                </asp:TextBox>

                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="Exam Name" ReadOnly="true" onkeyup="return SearchList();">
                                                </asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ListBox1" ValidationGroup="a" ErrorMessage="Required">
                                                </asp:RequiredFieldValidator>


                                                <!-- Exam Fee -->
                                                <div class="mt-3">

                                                    <label class="form-label">
                                                        Exam Fees
                                                        <span class="text-danger">*</span>
                                                    </label>

                                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" Visible="true" placholder="$" required>
                                                    </asp:TextBox>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Date & Time Selection -->
                                        <div class="row mb-4">

                                            <div class="col-12">

                                                <label class="form-label fw-bold">
                                                    Select Date and Time
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <div class="mt-2">

                                                    <input id="btnSelectDate" type="button" class="btn btn-primary" value="Select Date and Time" data-toggle="modal" data-target="#myModal" onclick="SetRegistrstionDateTimePicker();" />

                                                </div>

                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="a" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ClientValidationFunction="VaildDateTime" />

                                            </div>

                                        </div>


                                        <!-- Selected Date Time -->
                                        <div class="row g-3 mb-4" id="date_time" runat="server" style="display: none;">

                                            <div class="col-12 col-md-6">

                                                <label class="form-label">
                                                    Exam Date
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <asp:Label ID="Lbl_date" runat="server" ClientIDMode="Static">
                                                </asp:Label>

                                            </div>


                                            <div class="col-12 col-md-6">

                                                <label class="form-label">
                                                    Exam Time
                                                    <span class="text-danger">*</span>
                                                </label>

                                                <asp:Label ID="Lbl_Time" runat="server">
                                                </asp:Label>

                                            </div>

                                        </div>


                                        <!-- Navigation Buttons -->
                                        <div class="row">

                                            <div class="col-12 d-flex justify-content-end gap-2 flex-wrap">

                                                <asp:Button ID="back2" runat="server" Text="Previous" class="btn btn-outline-secondary" OnClick="RamHello2" />

                                                <asp:Button ID="next2" runat="server" Text="Next" ValidationGroup="a" class="btn btn-primary" OnClick="RamHello22" />

                                            </div>

                                        </div>

                                    </div>
                                    <div class="modal fade" id="myModal" runat="server" clientidmode="Static">
                                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header te-card__header--accent">

                                                    <h5 id="test_center" class="modal-title" runat="server" clientidmode="Static"></h5>

                                                    <asp:Button ID="Button5" runat="server" Text="×" class="btn-close" data-dismiss="modal" aria-label="Close" OnClick="Btn_Close" OnClientClick="abc()" Style="" />

                                                </div>


                                                <!-- Modal Body -->
                                                <div class="modal-body">

                                                    <div class="container-fluid">

                                                        <!-- Date Selection -->
                                                        <div class="row align-items-center mb-3">

                                                            <div class="col-12 col-md-4">
                                                                <label class="form-label fw-semibold">
                                                                    Select Date
                                                                </label>
                                                            </div>

                                                            <div class="col-12 col-md-8">

                                                                <asp:TextBox ID="DateTextBox" runat="server" CssClass="form-control" Placeholder="Click Here to Select the Date" onchange="abc()" OnTextChanged="select_time" AutoPostBack="true" autocomplete="off">
                                                                </asp:TextBox>

                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="savetime" ControlToValidate="DateTextBox" ErrorMessage="Required" Display="Dynamic">
                                                                </asp:RequiredFieldValidator>

                                                            </div>

                                                        </div>


                                                        <!-- Time Slot Section -->
                                                        <div id="hide_time" class="row mt-3">

                                                            <div class="col-12 mb-2">
                                                                <h6 class="fw-bold">Time Slot</h6>
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <div class="d-flex flex-wrap gap-2"> 
                                                                    <asp:Repeater ID="RepDetails_Morning" runat="server"> 
                                                                        <ItemTemplate> 
                                                                            <asp:Button ID="Btn_time" runat="server" Text='<%#Eval("StartTime")%>' class="btn crt-btn-signin" Width="85px" 
                                                                                Style="
                                                                                margin-bottom: 4px; 
                                                                                background: #65ad75 !important; 
                                                                                border: 0;" 
                                                                                OnClick="btn_Select" />
                                                                         </ItemTemplate> 
                                                                    </asp:Repeater> 
                                                                </div> 
                                                            </div> 
                                                        </div> 
                                                        <!-- Action Section -->
                                                        <div class="row mt-4 align-items-center"> 
                                                            <div class="col-12 col-md-6">
                                                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="">
                                                                </asp:Label>
                                                            </div>

                                                            <div class="col-12 col-md-6 text-md-end">

                                                                <asp:Button ID="Btn_timesave" runat="server" Text="Save" class="crt-btn-signin btn-sm" 
                                                                    Style="	
                                                                    background: linear-gradient(90deg,  #0099b3, #007388); 
                                                                    color:#ffffff; 
                                                                    padding: 10px 26px; 
                                                                    border: 0;
                                                                    font-size: 16px;
                                                                    border-radius: 8px;
                                                                    box-shadow: 2px 3px 18px #20d5d57a;
                                                                    " 
                                                                    ValidationGroup="savetime" OnClick="Btn_SaveTime" />

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>



                                    <div class="review-details container-fluid" id="section3" runat="server" visible="false">

                                        <!-- Section Title -->
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <p class="registration-section-title">
                                                    Review Details <span>( * mandatory fields)</span>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row g-3">

                                            <!-- Exam -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Exam</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_exam_name1" runat="server"></asp:Label>
                                            </div>

                                            <!-- Register Number -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Register Number</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="txt_aadhar_card11" runat="server"></asp:Label>
                                            </div>

                                            <!-- Exam Date -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Exam Date</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_exam_date" runat="server"></asp:Label>
                                            </div>

                                            <!-- Exam Time -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Exam Time</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_exam_time" runat="server"></asp:Label>
                                            </div>

                                            <!-- Candidate Name -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Candidate Name</label>
                                            </div>
                                            <div class="col-md-6">

                                                <asp:Label ID="lbl_first_name" runat="server"></asp:Label>
                                                <asp:Label ID="lbl_middle_name" runat="server"></asp:Label>
                                                <asp:Label ID="lbl_last_name" runat="server"></asp:Label>

                                                <asp:TextBox ID="Txt_Name" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                                <asp:TextBox ID="txt_middle_name1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                                <asp:TextBox ID="txt_last_name1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>

                                            </div>

                                            <!-- DOB -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">DOB</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_Dob" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_Dob1" runat="server" Visible="false" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- Gender -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Gender</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_Gender" runat="server"></asp:Label>

                                                <asp:DropDownList ID="dd_Gender1" runat="server" Visible="false" CssClass="form-control" ClientIDMode="Static">

                                                    <asp:ListItem Value="0">Gender*</asp:ListItem>
                                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                                    <asp:ListItem Value="F">Female</asp:ListItem>

                                                </asp:DropDownList>

                                            </div>

                                            <!-- Email -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Email ID</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_email_address" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_email_address" runat="server" Visible="false" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- Mobile -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Mobile Number</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_Mobile_Number" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_Mobile_Number" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- Address -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_address1" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_address11" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- Country -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Country</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_country" runat="server"></asp:Label>

                                                <asp:DropDownList ID="dd_country" runat="server" Visible="false" CssClass="form-control">

                                                    <asp:ListItem>Please select Country</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>

                                            <!-- State -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">State</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_state" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_state1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- City -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">City</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_city" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_city1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- Pincode -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Pincode</label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lbl_postal_code" runat="server"></asp:Label>
                                                <asp:TextBox ID="txt_postal_code" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                        <!-- Edit Buttons -->
                                        <div class="row mt-4">
                                            <div class="col-12 d-flex gap-2 flex-wrap">

                                                <asp:Button ID="Button1" runat="server" Text="Edit Record" class="btn btn-success" OnClick="Button1_Click" />

                                                <asp:Button ID="Button2" runat="server" Text="Update Record" Visible="false" class="btn btn-success" OnClick="Button2_Click" />

                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel Record" Visible="false" class="btn btn-secondary" OnClick="btnCancel_Click" />

                                            </div>
                                        </div>

                                        <!-- Checkbox -->
                                        <div class="row mt-4">
                                            <div class="col-12">

                                                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />

                                                <span class="fw-bold">Check the box to proceed further.
                                                </span>

                                                <br />

                                                <asp:Label ID="Lbl_check" runat="server" ForeColor="Red">
                                                </asp:Label>

                                            </div>
                                        </div>

                                        <!-- Navigation -->
                                        <div class="row mt-4">
                                            <div class="col-12 d-flex justify-content-end gap-2">

                                                <asp:Button ID="back3" runat="server" Text="Previous" class="btn btn-secondary" ValidationGroup="aacc" OnClick="RamHello3" />

                                                <asp:Button ID="next3" runat="server" Text="Next" class="btn" Style="background-color: #2a3f54; color: white;" ValidationGroup="aacc" OnClick="RamHello33" />

                                            </div>
                                        </div>

                                    </div>

                                    <div class="payment container-fluid" id="section4" runat="server" visible="false">

                                        <!-- Section Title -->
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <p class="registration-section-title">
                                                    Payment <span>( * mandatory fields)</span>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row g-3 align-items-center">

                                            <!-- Voucher Label -->
                                            <div class="col-md-6">
                                                <label class="fw-bold">Enter Voucher Code</label>
                                            </div>

                                            <!-- Voucher Input -->
                                            <div class="col-md-6">

                                                <asp:Label ID="lblErrMsg" runat="server" CssClass="error text-danger">
                                                </asp:Label>

                                                <asp:TextBox ID="txtVoucherCode" runat="server" CssClass="form-control" placeholder="Enter Voucher Code">
                                                </asp:TextBox>

                                            </div>

                                        </div>

                                        <!-- Navigation Buttons -->
                                        <div class="row mt-4">
                                            <div class="col-12 d-flex justify-content-end gap-2">

                                                <asp:Button ID="back4" runat="server" Text="Previous" CssClass="btn btn-secondary" ValidationGroup="aacc" OnClick="RamHello4" />

                                                <asp:Button ID="next4" runat="server" Text="Pay" CssClass="btn" Style="background-color: #2a3f54; color: white;" OnClick="RamHello44" />

                                            </div>
                                        </div>

                                    </div>

                                    <section id="section5" runat="server" visible="false" class="container py-5">

                                        <div class="row justify-content-center text-center">

                                            <!-- Success Message -->
                                            <div class="col-12 mb-4">
                                                <asp:Label ID="Label1" runat="server" CssClass="fw-bold text-danger" Font-Size="22px" Text="Payment Successful">
                                                </asp:Label>
                                            </div>

                                            <!-- Action Button -->
                                            <div class="col-12">
                                                <a href="sechdule" class="btn btn-outline-primary">Schedule New Exam
                                                </a>
                                            </div>

                                        </div>

                                    </section>
                                    <!-- <script>
                  document.querySelector('.next-btn').addEventListener('click', function() {
                  document.querySelector('.provide-details').style.display = 'none';
                  document.querySelector('.fill-exam').style.display = 'block';
                  document.querySelector
                });

                document.querySelector('.prev-btn').addEventListener('click', function() {
                  document.querySelector('.fill-exam').style.display = 'none';
                  document.querySelector('.provide-details').style.display = 'block';
                });
            </script> -->

                                    <%--<script>
                                            // Function to show the current fieldset and hide others
                                            function showFieldset(current, next) {
                                            document.querySelector(current).style.display = 'none';
                                            document.querySelector(next).style.display = 'block';
                                            }

                                            // Add event listeners to Next buttons
                                            const nextButtons = document.querySelectorAll('.next-btn');
                                            nextButtons.forEach((button, index) => {
                                            button.addEventListener('click', function () {
                                            const fieldsets = ['.provide-details', '.fill-exam', '.review-details',
                                            '.payment'];
                                            if (index < fieldsets.length - 1) { showFieldset(fieldsets[index],
                                                fieldsets[index + 1]); } }); }); // Add event listeners to Previous
                                                buttons const prevButtons=document.querySelectorAll('.prev-btn');
                                                prevButtons.forEach((button, index)=> {
                                                button.addEventListener('click', function () {
                                                const fieldsets = ['.provide-details', '.fill-exam', '.review-details',
                                                '.payment'];
                                                if (index >= 0) {
                                                showFieldset(fieldsets[index + 1], fieldsets[index]);
                                                }
                                                });
                                                });
                                                </script>--%>
                                    <script type="text/javascript">
                                        function UserOrEmailAvailability() { //This function call on text change.             
                                            $.ajax({
                                                type: "POST",
                                                url: "registration.aspx/CheckEmail", // this for calling the web method function in cs code.  
                                                data: '{useroremail: "' + $("#<%=txt_email.ClientID%>")[0].value + '" }', // user name or email value  
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: OnSuccess,
                                                failure: function(response) {
                                                    SetDialogMessage(response, 'false');
                                                }
                                            });
                                        }

                                        // function OnSuccess  
                                        function OnSuccess(response) {
                                            var msg = $("#<%=lblStatus.ClientID%>")[0];
                                            switch (response.d) {
                                                case "true":
                                                    $.confirm({
                                                        title: '',
                                                        content: 'Email Id already exists. Do you want to continue ?',
                                                        buttons: {
                                                            Yes: function() {
                                                                window.location.href = "existing.aspx?email=" + $("#<%=txt_email.ClientID%>")[0].value;
                                                            },
                                                            No: function() {
                                                                $("#<%=txt_email.ClientID%>")[0].value = '';
                                                            }
                                                        }
                                                    });
                                                    break;
                                                case "exist":
                                                    $.confirm({
                                                        title: '',
                                                        content: 'This email id is registered wih us. Do you want to continue ?',
                                                        buttons: {
                                                            Yes: function() {
                                                                window.location.href = "existing.aspx?emailid=" + $("#<%=txt_email.ClientID%>")[0].value;
                                                            },
                                                            No: function() {
                                                                $("#<%=txt_email.ClientID%>")[0].value = '';
                                                            }
                                                        }
                                                    });
                                                    break;
                                            }
                                        }
                                    </script>
                                    <script type="text/javascript">
                                        function abc() {
                                            $('.modal-backdrop').remove()
                                            $(document.body).removeClass("modal-open");
                                        }

                                        function initDOBDatePicker() {
                                            $("#txt_DOB").datepicker({
                                                yearRange: "-100:+0",
                                                changeMonth: true,
                                                changeYear: true,
                                                dateFormat: "mm/dd/yy",
                                                maxDate: 0
                                            });
                                        }

                                        // On page load
                                        $(function() {
                                            initDOBDatePicker();
                                        });

                                        // After UpdatePanel postback
                                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                                        if (prm) {
                                            prm.add_endRequest(function() {
                                                initDOBDatePicker();
                                            });
                                        }

                                        function SetRegistrstionDateTimePicker() {

                                            var prm = Sys.WebForms.PageRequestManager.getInstance();
                                            if (prm != null) {
                                                prm.add_endRequest(function(sender, e) {
                                                    if (sender._postBackSettings.panelsToUpdate != null) {
                                                        $(".datepicker-orient-bottom").hide();
                                                    }
                                                });
                                            }
                                            $('#hide_time').hide();
                                            var Dates = [];
                                            var WeekEnds = [];
                                            var Maxdate = '';
                                            $.ajax({
                                                url: "registration.aspx/GetCenterDateTime",
                                                dataType: "json",
                                                type: "POST",
                                                async: false,
                                                contentType: "application/json; charset=utf-8",
                                                success: function(data) {
                                                    Dates = data.d[0].Dates.split(',');
                                                    WeekEnds = data.d[0].WeekEnds.split(',');
                                                    Maxdate = data.d[0].MaxDate;
                                                    SetRegistrationDatePicker(Dates, WeekEnds, Maxdate);
                                                },
                                                error: function() {}
                                            });
                                        }

                                        function SetRegistrationDatePicker(Dates, WeekEnds, Maxdate) {
                                            var minDate = new Date();
                                            $.ajax({
                                                url: "registration.aspx/GetDateNow",
                                                dataType: "json",
                                                type: "POST",
                                                async: false,
                                                contentType: "application/json; charset=utf-8",
                                                success: function(data) {
                                                    minDate = data.d;
                                                },
                                                error: function() {
                                                    minDate = new Date();
                                                }
                                            });

                                            $('#<%=DateTextBox.ClientID %>').datepicker({
                                                minDate: minDate,
                                                dateFormat: 'dd-MM-yy',
                                                maxDate: Maxdate,
                                                beforeShowDay: function(date) {
                                                    var string = jQuery.datepicker.formatDate('dd-MM-yy', date);
                                                    return [Dates.indexOf(string) == -1 && WeekEnds.indexOf(date.getDay().toString()) == -1]
                                                }
                                            });
                                        }
                                    </script>

                                </div>

                            </div>
                        </div>

                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>