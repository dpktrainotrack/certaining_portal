<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Center.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            }
            else if (Lbl_date[0].innerText == '') {
                isValid = false;
            }
            else if (Lbl_Time[0].innerText == '') {
                isValid = false;
            }
            else {
                isValid = true;
            }

            args.IsValid = isValid;
        }

        function SetHideLable(msgLabelID) {
            setTimeout(function () {
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
            }
            else {
                for (var i = 0; i < l.options.length; i++) {
                    if (l.options[i].value.toLowerCase().match(tb.value.toLowerCase())) {
                        l.options[i].selected = true;
                        DisabledDateTimeButton();
                        return false;
                    }
                    else {
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
            }
            else {
                $("#btnSelectDate").removeAttr("disabled");
                var date = document.getElementById('<%= Lbl_date.ClientID %>');
                if (date == null) {
                    document.getElementById("btnSelectDate").value = "Select Date and Time";
                }
                else { document.getElementById("btnSelectDate").value = "Edit Date and Time"; }

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
            <div class="right_col" role="main" style="min-height: 102vh;">
                <div class="container">
                    <div class="row">
                        <h2 class="header" style="margin-left: 10px;">Follow Steps to Schedule New Exam

                        </h2>


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
                        <div class="multiform mt-5">
                            <div class="provide-details" id="section1" runat="server">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <p>Personal Information ( * mandatory fields)</p>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="">First Name: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_first_name" runat="server" onChange="javascript:capFirst(this);" placeholder="First Name" CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txt_first_name" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Middle Name<span style="font-size: 18px; color: red;"></span> </label>
                                        <asp:TextBox ID="txt_middle_name" runat="server" onChange="javascript:capFirst(this);" placeholder="Middle Name" CssClass="form-control" autocomplete="off" />

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Last Name: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_last_name" runat="server" onChange="javascript:capFirst(this);" placeholder="Last Name" CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txt_last_name" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">DOB: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_DOB" runat="server" ClientIDMode="Static" placeholder="DOB" CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ControlToValidate="txt_DOB" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-12">
                                        <p>Contact Information ( * mandatory fields) </p>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Email Address: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <%--<input class="form-control" type="email" name="" id="" placeholder="Email Address">--%>
                                        <asp:TextBox ID="txt_email" runat="server" placeholder="Email Address" onchange="UserOrEmailAvailability()" CssClass="form-control" autocomplete="off" />
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="txt_email" ValidationGroup="aac" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="txt_email" ValidationGroup="aac" runat="server" ForeColor="Red" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Mobile Number: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <%--<input class="form-control" type="number" name="" id="" placeholder="Mobile Number">--%>
                                        <asp:TextBox ID="txt_mobile" runat="server" placeholder="Mobile Number" CssClass="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' autocomplete="off" MaxLength="15" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txt_mobile" ValidationGroup="aac" runat="server" ForeColor="Red" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Phone Number: <span style="font-size: 18px; color: red;"></span></label>
                                        <asp:TextBox ID="txt_phone" runat="server" placeholder="Landline No" CssClass="form-control" autocomplete="off" onkeypress='return event.charCode >= 48 && event.charCode <= 57' MaxLength="15" />

                                    </div>
                                    <div class="col-md-3">
                                        <label for="">Gender: <span style="font-size: 18px; color: red;"></span></label>
                                        <asp:DropDownList ID="ddGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">Gender*</asp:ListItem>
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="ddGender" InitialValue="0" runat="server" ErrorMessage="Required" Display="Dynamic" ValidationGroup="aac" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="">Current Address: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_address1" runat="server" onChange="javascript:capFirst(this);" placeholder="Current Address " CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txt_address1" ValidationGroup="aac" ForeColor="Red" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                        <label for="">Permanent Address: <span style="font-size: 18px; color: red;"></span></label>
                                        <asp:TextBox ID="txt_address2" runat="server" onChange="javascript:capFirst(this);" placeholder="Permanent Address" CssClass="form-control" autocomplete="off" />
                                    </div>
                                    <div class="col-md-4">
                                        <label for="">Select Country:<span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:DropDownList ID="drop_country" runat="server" CssClass="form-control">
                                            <asp:ListItem>Please select Country</asp:ListItem>
                                            <asp:ListItem>  AF:Afghanistan  </asp:ListItem>
                                            <asp:ListItem>  AX:Åland Islands    </asp:ListItem>
                                            <asp:ListItem>  AL:Albania  </asp:ListItem>
                                            <asp:ListItem>  DZ:Algeria  </asp:ListItem>
                                            <asp:ListItem>  AS:American Samoa   </asp:ListItem>
                                            <asp:ListItem>  AD:Andorra  </asp:ListItem>
                                            <asp:ListItem>  AO:Angola   </asp:ListItem>
                                            <asp:ListItem>  AI:Anguilla </asp:ListItem>
                                            <asp:ListItem>  AQ:Antarctica   </asp:ListItem>
                                            <asp:ListItem>  AG:Antigua and Barbuda  </asp:ListItem>
                                            <asp:ListItem>  AR:Argentina    </asp:ListItem>
                                            <asp:ListItem>  AM:Armenia  </asp:ListItem>
                                            <asp:ListItem>  AW:Aruba    </asp:ListItem>
                                            <asp:ListItem>  AU:Australia    </asp:ListItem>
                                            <asp:ListItem>  AT:Austria  </asp:ListItem>
                                            <asp:ListItem>  AZ:Azerbaijan   </asp:ListItem>
                                            <asp:ListItem>  BS:Bahamas  </asp:ListItem>
                                            <asp:ListItem>  BH:Bahrain  </asp:ListItem>
                                            <asp:ListItem>  BD:Bangladesh   </asp:ListItem>
                                            <asp:ListItem>  BB:Barbados </asp:ListItem>
                                            <asp:ListItem>  BY:Belarus  </asp:ListItem>
                                            <asp:ListItem>  BE:Belgium  </asp:ListItem>
                                            <asp:ListItem>  BZ:Belize   </asp:ListItem>
                                            <asp:ListItem>  BJ:Benin    </asp:ListItem>
                                            <asp:ListItem>  BM:Bermuda  </asp:ListItem>
                                            <asp:ListItem>  BT:Bhutan   </asp:ListItem>
                                            <asp:ListItem>  BO:Bolivia  </asp:ListItem>
                                            <asp:ListItem>  BA:Bosnia and Herzegovina   </asp:ListItem>
                                            <asp:ListItem>  BW:Botswana </asp:ListItem>
                                            <asp:ListItem>  BV:Bouvet Island    </asp:ListItem>
                                            <asp:ListItem>  BR:Brazil   </asp:ListItem>
                                            <asp:ListItem>  IO:British Indian Ocean Territory   </asp:ListItem>
                                            <asp:ListItem>  BN:Brunei Darussalam    </asp:ListItem>
                                            <asp:ListItem>  BG:Bulgaria </asp:ListItem>
                                            <asp:ListItem>  BF:Burkina Faso </asp:ListItem>
                                            <asp:ListItem>  BI:Burundi  </asp:ListItem>
                                            <asp:ListItem>  KH:Cambodia </asp:ListItem>
                                            <asp:ListItem>  CM:Cameroon </asp:ListItem>
                                            <asp:ListItem>  CA:Canada   </asp:ListItem>
                                            <asp:ListItem>  CV:Cape Verde   </asp:ListItem>
                                            <asp:ListItem>  KY:Cayman Islands   </asp:ListItem>
                                            <asp:ListItem>  CF:Central African Republic </asp:ListItem>
                                            <asp:ListItem>  TD:Chad </asp:ListItem>
                                            <asp:ListItem>  CL:Chile    </asp:ListItem>
                                            <asp:ListItem>  CN:China    </asp:ListItem>
                                            <asp:ListItem>  CX:Christmas Island </asp:ListItem>
                                            <asp:ListItem>  CC:Cocos (Keeling) Islands  </asp:ListItem>
                                            <asp:ListItem>  CO:Colombia </asp:ListItem>
                                            <asp:ListItem>  KM:Comoros  </asp:ListItem>
                                            <asp:ListItem>  CG:Congo    </asp:ListItem>
                                            <asp:ListItem>  CD:Congo, The Democratic Republic of The    </asp:ListItem>
                                            <asp:ListItem>  CK:Cook Islands </asp:ListItem>
                                            <asp:ListItem>  CR:Costa Rica   </asp:ListItem>
                                            <asp:ListItem>  CI:Cote D'ivoire    </asp:ListItem>
                                            <asp:ListItem>  HR:Croatia  </asp:ListItem>
                                            <asp:ListItem>  CU:Cuba </asp:ListItem>
                                            <asp:ListItem>  CY:Cyprus   </asp:ListItem>
                                            <asp:ListItem>  CZ:Czech Republic   </asp:ListItem>
                                            <asp:ListItem>  DK:Denmark  </asp:ListItem>
                                            <asp:ListItem>  DJ:Djibouti </asp:ListItem>
                                            <asp:ListItem>  DM:Dominica </asp:ListItem>
                                            <asp:ListItem>  DO:Dominican Republic   </asp:ListItem>
                                            <asp:ListItem>  EC:Ecuador  </asp:ListItem>
                                            <asp:ListItem>  EG:Egypt    </asp:ListItem>
                                            <asp:ListItem>  SV:El Salvador  </asp:ListItem>
                                            <asp:ListItem>  GQ:Equatorial Guinea    </asp:ListItem>
                                            <asp:ListItem>  ER:Eritrea  </asp:ListItem>
                                            <asp:ListItem>  EE:Estonia  </asp:ListItem>
                                            <asp:ListItem>  ET:Ethiopia </asp:ListItem>
                                            <asp:ListItem>  FK:Falkland Islands (Malvinas)  </asp:ListItem>
                                            <asp:ListItem>  FO:Faroe Islands    </asp:ListItem>
                                            <asp:ListItem>  FJ:Fiji </asp:ListItem>
                                            <asp:ListItem>  FI:Finland  </asp:ListItem>
                                            <asp:ListItem>  FR:France   </asp:ListItem>
                                            <asp:ListItem>  GF:French Guiana    </asp:ListItem>
                                            <asp:ListItem>  PF:French Polynesia </asp:ListItem>
                                            <asp:ListItem>  TF:French Southern Territories  </asp:ListItem>
                                            <asp:ListItem>  GA:Gabon    </asp:ListItem>
                                            <asp:ListItem>  GM:Gambia   </asp:ListItem>
                                            <asp:ListItem>  GE:Georgia  </asp:ListItem>
                                            <asp:ListItem>  DE:Germany  </asp:ListItem>
                                            <asp:ListItem>  GH:Ghana    </asp:ListItem>
                                            <asp:ListItem>  GI:Gibraltar    </asp:ListItem>
                                            <asp:ListItem>  GR:Greece   </asp:ListItem>
                                            <asp:ListItem>  GL:Greenland    </asp:ListItem>
                                            <asp:ListItem>  GD:Grenada  </asp:ListItem>
                                            <asp:ListItem>  GP:Guadeloupe   </asp:ListItem>
                                            <asp:ListItem>  GU:Guam </asp:ListItem>
                                            <asp:ListItem>  GT:Guatemala    </asp:ListItem>
                                            <asp:ListItem>  GG:Guernsey </asp:ListItem>
                                            <asp:ListItem>  GN:Guinea   </asp:ListItem>
                                            <asp:ListItem>  GW:Guinea-bissau    </asp:ListItem>
                                            <asp:ListItem>  GY:Guyana   </asp:ListItem>
                                            <asp:ListItem>  HT:Haiti    </asp:ListItem>
                                            <asp:ListItem>  HM:Heard Island and Mcdonald Islands    </asp:ListItem>
                                            <asp:ListItem>  VA:Holy See (Vatican City State)    </asp:ListItem>
                                            <asp:ListItem>  HN:Honduras </asp:ListItem>
                                            <asp:ListItem>  HK:Hong Kong    </asp:ListItem>
                                            <asp:ListItem>  HU:Hungary  </asp:ListItem>
                                            <asp:ListItem>  IS:Iceland  </asp:ListItem>
                                            <asp:ListItem>  IN:India    </asp:ListItem>
                                            <asp:ListItem>  ID:Indonesia    </asp:ListItem>
                                            <asp:ListItem>  IR:Iran, Islamic Republic of    </asp:ListItem>
                                            <asp:ListItem>  IQ:Iraq </asp:ListItem>
                                            <asp:ListItem>  IE:Ireland  </asp:ListItem>
                                            <asp:ListItem>  IM:Isle of Man  </asp:ListItem>
                                            <asp:ListItem>  IL:Israel   </asp:ListItem>
                                            <asp:ListItem>  IT:Italy    </asp:ListItem>
                                            <asp:ListItem>  JM:Jamaica  </asp:ListItem>
                                            <asp:ListItem>  JP:Japan    </asp:ListItem>
                                            <asp:ListItem>  JE:Jersey   </asp:ListItem>
                                            <asp:ListItem>  JO:Jordan   </asp:ListItem>
                                            <asp:ListItem>  KZ:Kazakhstan   </asp:ListItem>
                                            <asp:ListItem>  KE:Kenya    </asp:ListItem>
                                            <asp:ListItem>  KI:Kiribati </asp:ListItem>
                                            <asp:ListItem>  KP:Korea, Democratic People's Republic of   </asp:ListItem>
                                            <asp:ListItem>  KR:Korea, Republic of   </asp:ListItem>
                                            <asp:ListItem>  KW:Kuwait   </asp:ListItem>
                                            <asp:ListItem>  KG:Kyrgyzstan   </asp:ListItem>
                                            <asp:ListItem>  LA:Lao People's Democratic Republic </asp:ListItem>
                                            <asp:ListItem>  LV:Latvia   </asp:ListItem>
                                            <asp:ListItem>  LB:Lebanon  </asp:ListItem>
                                            <asp:ListItem>  LS:Lesotho  </asp:ListItem>
                                            <asp:ListItem>  LR:Liberia  </asp:ListItem>
                                            <asp:ListItem>  LY:Libyan Arab Jamahiriya   </asp:ListItem>
                                            <asp:ListItem>  LI:Liechtenstein    </asp:ListItem>
                                            <asp:ListItem>  LT:Lithuania    </asp:ListItem>
                                            <asp:ListItem>  LU:Luxembourg   </asp:ListItem>
                                            <asp:ListItem>  MO:Macao    </asp:ListItem>
                                            <asp:ListItem>  MK:Macedonia The Former Yugoslav Republic of </asp:ListItem>
                                            <asp:ListItem>  MG:Madagascar   </asp:ListItem>
                                            <asp:ListItem>  MW:Malawi   </asp:ListItem>
                                            <asp:ListItem>  MY:Malaysia </asp:ListItem>
                                            <asp:ListItem>  MV:Maldives </asp:ListItem>
                                            <asp:ListItem>  ML:Mali </asp:ListItem>
                                            <asp:ListItem>  MT:Malta    </asp:ListItem>
                                            <asp:ListItem>  MH:Marshall Islands </asp:ListItem>
                                            <asp:ListItem>  MQ:Martinique   </asp:ListItem>
                                            <asp:ListItem>  MR:Mauritania   </asp:ListItem>
                                            <asp:ListItem>  MU:Mauritius    </asp:ListItem>
                                            <asp:ListItem>  YT:Mayotte  </asp:ListItem>
                                            <asp:ListItem>  MX:Mexico   </asp:ListItem>
                                            <asp:ListItem>  FM:Micronesia, Federated States of  </asp:ListItem>
                                            <asp:ListItem>  MD:Moldova, Republic of </asp:ListItem>
                                            <asp:ListItem>  MC:Monaco   </asp:ListItem>
                                            <asp:ListItem>  MN:Mongolia </asp:ListItem>
                                            <asp:ListItem>  ME:Montenegro   </asp:ListItem>
                                            <asp:ListItem>  MS:Montserrat   </asp:ListItem>
                                            <asp:ListItem>  MA:Morocco  </asp:ListItem>
                                            <asp:ListItem>  MZ:Mozambique   </asp:ListItem>
                                            <asp:ListItem>  MM:Myanmar  </asp:ListItem>
                                            <asp:ListItem>  NA:Namibia  </asp:ListItem>
                                            <asp:ListItem>  NR:Nauru    </asp:ListItem>
                                            <asp:ListItem>  NP:Nepal    </asp:ListItem>
                                            <asp:ListItem>  NL:Netherlands  </asp:ListItem>
                                            <asp:ListItem>  AN:Netherlands Antilles </asp:ListItem>
                                            <asp:ListItem>  NC:New Caledonia    </asp:ListItem>
                                            <asp:ListItem>  NZ:New Zealand  </asp:ListItem>
                                            <asp:ListItem>  NI:Nicaragua    </asp:ListItem>
                                            <asp:ListItem>  NE:Niger    </asp:ListItem>
                                            <asp:ListItem>  NG:Nigeria  </asp:ListItem>
                                            <asp:ListItem>  NU:Niue </asp:ListItem>
                                            <asp:ListItem>  NF:Norfolk Island   </asp:ListItem>
                                            <asp:ListItem>  MP:Northern Mariana Islands </asp:ListItem>
                                            <asp:ListItem>  NO:Norway   </asp:ListItem>
                                            <asp:ListItem>  OM:Oman </asp:ListItem>
                                            <asp:ListItem>  PK:Pakistan </asp:ListItem>
                                            <asp:ListItem>  PW:Palau    </asp:ListItem>
                                            <asp:ListItem>  PS:Palestinian Territory, Occupied  </asp:ListItem>
                                            <asp:ListItem>  PA:Panama   </asp:ListItem>
                                            <asp:ListItem>  PG:Papua New Guinea </asp:ListItem>
                                            <asp:ListItem>  PY:Paraguay </asp:ListItem>
                                            <asp:ListItem>  PE:Peru </asp:ListItem>
                                            <asp:ListItem>  PH:Philippines  </asp:ListItem>
                                            <asp:ListItem>  PN:Pitcairn </asp:ListItem>
                                            <asp:ListItem>  PL:Poland   </asp:ListItem>
                                            <asp:ListItem>  PT:Portugal </asp:ListItem>
                                            <asp:ListItem>  PR:Puerto Rico  </asp:ListItem>
                                            <asp:ListItem>  QA:Qatar    </asp:ListItem>
                                            <asp:ListItem>  RE:Reunion  </asp:ListItem>
                                            <asp:ListItem>  RO:Romania  </asp:ListItem>
                                            <asp:ListItem>  RU:Russian Federation   </asp:ListItem>
                                            <asp:ListItem>  RW:Rwanda   </asp:ListItem>
                                            <asp:ListItem>  SH:Saint Helena </asp:ListItem>
                                            <asp:ListItem>  KN:Saint Kitts and Nevis    </asp:ListItem>
                                            <asp:ListItem>  LC:Saint Lucia  </asp:ListItem>
                                            <asp:ListItem>  PM:Saint Pierre and Miquelon    </asp:ListItem>
                                            <asp:ListItem>  VC:Saint Vincent and The Grenadines </asp:ListItem>
                                            <asp:ListItem>  WS:Samoa    </asp:ListItem>
                                            <asp:ListItem>  SM:San Marino   </asp:ListItem>
                                            <asp:ListItem>  ST:Sao Tome and Principe    </asp:ListItem>
                                            <asp:ListItem>  SA:Saudi Arabia </asp:ListItem>
                                            <asp:ListItem>  SN:Senegal  </asp:ListItem>
                                            <asp:ListItem>  RS:Serbia   </asp:ListItem>
                                            <asp:ListItem>  SC:Seychelles   </asp:ListItem>
                                            <asp:ListItem>  SL:Sierra Leone </asp:ListItem>
                                            <asp:ListItem>  SG:Singapore    </asp:ListItem>
                                            <asp:ListItem>  SK:Slovakia </asp:ListItem>
                                            <asp:ListItem>  SI:Slovenia </asp:ListItem>
                                            <asp:ListItem>  SB:Solomon Islands  </asp:ListItem>
                                            <asp:ListItem>  SO:Somalia  </asp:ListItem>
                                            <asp:ListItem>  ZA:South Africa </asp:ListItem>
                                            <asp:ListItem>  GS:South Georgia and The South Sandwich Islands </asp:ListItem>
                                            <asp:ListItem>  ES:Spain    </asp:ListItem>
                                            <asp:ListItem>  LK:Sri Lanka    </asp:ListItem>
                                            <asp:ListItem>  SD:Sudan    </asp:ListItem>
                                            <asp:ListItem>  SR:Suriname </asp:ListItem>
                                            <asp:ListItem>  SJ:Svalbard and Jan Mayen   </asp:ListItem>
                                            <asp:ListItem>  SZ:Swaziland    </asp:ListItem>
                                            <asp:ListItem>  SE:Sweden   </asp:ListItem>
                                            <asp:ListItem>  CH:Switzerland  </asp:ListItem>
                                            <asp:ListItem>  SY:Syrian Arab Republic </asp:ListItem>
                                            <asp:ListItem>  TW:Taiwan, Province of China    </asp:ListItem>
                                            <asp:ListItem>  TJ:Tajikistan   </asp:ListItem>
                                            <asp:ListItem>  TZ:Tanzania, United Republic of </asp:ListItem>
                                            <asp:ListItem>  TH:Thailand </asp:ListItem>
                                            <asp:ListItem>  TL:Timor-leste  </asp:ListItem>
                                            <asp:ListItem>  TG:Togo </asp:ListItem>
                                            <asp:ListItem>  TK:Tokelau  </asp:ListItem>
                                            <asp:ListItem>  TO:Tonga    </asp:ListItem>
                                            <asp:ListItem>  TT:Trinidad and Tobago  </asp:ListItem>
                                            <asp:ListItem>  TN:Tunisia  </asp:ListItem>
                                            <asp:ListItem>  TR:Turkey   </asp:ListItem>
                                            <asp:ListItem>  TM:Turkmenistan </asp:ListItem>
                                            <asp:ListItem>  TC:Turks and Caicos Islands </asp:ListItem>
                                            <asp:ListItem>  TV:Tuvalu   </asp:ListItem>
                                            <asp:ListItem>  UG:Uganda   </asp:ListItem>
                                            <asp:ListItem>  UA:Ukraine  </asp:ListItem>
                                            <asp:ListItem>  AE:United Arab Emirates </asp:ListItem>
                                            <asp:ListItem>  GB:United Kingdom   </asp:ListItem>
                                            <asp:ListItem>  US:United States    </asp:ListItem>
                                            <asp:ListItem>  UM:United States Minor Outlying Islands </asp:ListItem>
                                            <asp:ListItem>  UY:Uruguay  </asp:ListItem>
                                            <asp:ListItem>  UZ:Uzbekistan   </asp:ListItem>
                                            <asp:ListItem>  VU:Vanuatu  </asp:ListItem>
                                            <asp:ListItem>  VE:Venezuela    </asp:ListItem>
                                            <asp:ListItem>  VN:Viet Nam </asp:ListItem>
                                            <asp:ListItem>  VG:Virgin Islands, British  </asp:ListItem>
                                            <asp:ListItem>  VI:Virgin Islands, U.S. </asp:ListItem>
                                            <asp:ListItem>  WF:Wallis and Futuna    </asp:ListItem>
                                            <asp:ListItem>  EH:Western Sahara   </asp:ListItem>
                                            <asp:ListItem>  YE:Yemen    </asp:ListItem>
                                            <asp:ListItem>  ZM:Zambia   </asp:ListItem>
                                            <asp:ListItem>  ZW:Zimbabwe </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="drop_country" Display="Dynamic" ForeColor="Red" InitialValue="Please select Country" ErrorMessage="Required" ValidationGroup="aac"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                        <label for="">State: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_state" runat="server" placeholder="State" CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" ControlToValidate="txt_state" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                        <label for="">City: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_city" runat="server" placeholder="City" CssClass="form-control" autocomplete="off" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ControlToValidate="txt_city" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                        <label for="">Pincode: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:TextBox ID="txt_pincode" runat="server" placeholder="Postal Code" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ControlToValidate="txt_pincode" ForeColor="Red" ValidationGroup="aac" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-12">
                                        <p>Candidate ID (Please Note Candidate ID before Proceeding) </p>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_Aadhar_Card1" runat="server" class="form-control" MaxLength="12" placeholder="* Registration Number" ReadOnly="true" CssClass="form-control" />
                                        <asp:TextBox ID="txt_Aadhar_Card" runat="server" ReadOnly="true" Visible="false" CssClass="form-control" />
                                    </div>
                                    <div id="checkusernameoremail" runat="server" visible="false">
                                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-12">
                                        <!-- <button type="button" class="prev-btn" style="float: inline-end;">Previous</button> -->
                                        <%--   <button type="button" class="next-btn" style="float: inline-end; background-color: #2a3f54; color: white;">Next</button>--%>
                                        <asp:Button ID="next1" type="button" runat="server" Text="Next" class="btn btn-md btn-success" ValidationGroup="aac" Style="float: inline-end; background-color: #2a3f54; color: white;" OnClick="RamHello11" OnClientClick="abc()" />

                                        <asp:Button ID="back1" type="button" runat="server" Text="Previous" class="btn btn-md btn-success" Style="float: inline-end;" ValidationGroup="aacc" OnClick="RamHello1" />
                                        <asp:Button ID="Button3" type="button" runat="server" Text="Edit Record" class="btn btn-md btn-success" Visible="false" OnClick="Button3_Click" />
                                        <asp:Button ID="Button4" type="button" Visible="false" runat="server" Text="Update Records" ValidationGroup="aac" class="btn  btn-md btn-success" OnClick="Button4_Click" />

                                    </div>

                                </div>
                            </div>
                            <div class="fill-exam" id="section2" runat="server" visible="false">
                                <div class="form-row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <p>Exam Information ( * mandatory fields)</p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="col-md-6">
                                            <label for="">Test Center Code: <span style="font-size: 18px; color: red;">*</span> </label>
                                            <%-- <input class="form-control" type="text" name="" id="" disabled placeholder="BTC1134">--%>
                                            <asp:TextBox ID="txtCenterName" runat="server" ValidationGroup="a" Visible="false" CssClass="form-control" required></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="">Test Center Location: <span style="font-size: 18px; color: red;">*</span> </label>
                                            <asp:TextBox ID="txtcenterstate" runat="server" ReadOnly="true" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="col-md-6" id="lstExam" runat="server">
                                            <label style="margin-bottom: 12px;">Select Exam from List</label>
                                            <asp:ListBox ID="ListBox1" AutoPostBack="true" Height="250px" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" CssClass="form-control" border="1px solid #8bc34a;"></asp:ListBox>

                                        </div>
                                        <div class="col-md-6">
                                            <label for="" style="margin-bottom: 12px;">
                                                <asp:Label ID="lnl" runat="server" Text="Exam Name" />
                                                : <span style="font-size: 18px; color: red;">*</span></label>
                                            <%--<label for="">Select Your Exam: <span style="font-size: 18px; color: red;">*</span> </label>
<select class="form-control" id="exampleFormControlSelect1">
    <option value="" disabled selected>Select Your Exam</option>
    <option>Certaining Certified Big Data Professional</option>
    <option>Certaining Certified Business Analyst</option>
    <option>Certaining Certified Customer Experience Professional</option>
    <option>Certaining Certified DevOps Professional</option>
    <option>Certaining Certified Digital Marketing Professional</option>
</select>--%>
                                            <asp:TextBox ID="lbl_exam_name" runat="server" ReadOnly="true" Visible="false" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" CssClass="form-control" ClientIDMode="Static" placeholder="Exam Name" onkeyup="return SearchList();" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="a" ControlToValidate="ListBox1" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            <br />
                                            <label for="">Exam Fees: <span style="font-size: 18px; color: red;">*</span> </label>
                                            <asp:TextBox ID="txtAmount" runat="server" Visible="true" ReadOnly="true" CssClass="form-control" placholder="$" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <label for="" style="margin-bottom: 12px; margin-top: 12px;"><b>Select Date and Time :  <span style="font-size: 18px; color: red;">*</span></b></label>
                                        <input id="btnSelectDate" type="button" class="btn btn-md btn-success" data-toggle="modal" data-target="#myModal" value="Select Date and Time" onclick="SetRegistrstionDateTimePicker();"></input>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="Required" ValidationGroup="a"
                                            ForeColor="Red" ClientValidationFunction="VaildDateTime" />
                                    </div>
                                </div>
                                <!-- <div class="col-md-4">
                  <label for="">Exam Date: <span style="font-size: 18px; color: red;">*</span> </label>
                  <input type="date" class="form-control placeholder" id="calendar" onfocus="removePlaceholder()" onblur="addPlaceholder()" placeholder="Select a date">
                </div> -->
                                <div class="col-lg-12 col-md-12 col-sm-12" id="date_time" runat="server" style="display: none;">
                                    <div class="col-md-6">
                                        <label for="">Exam Date: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:Label ID="Lbl_date" runat="server" ClientIDMode="Static" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="">Exam Time: <span style="font-size: 18px; color: red;">*</span> </label>
                                        <asp:Label ID="Lbl_Time" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12" style="float: inline-end;">
                                    <asp:Button ID="next2" type="button" runat="server" Text="Next" ValidationGroup="a" class="btn btn-md btn-success" Style="float: inline-end; background-color: #2a3f54; color: white;" OnClick="RamHello22" />
                                    <asp:Button ID="back2" type="button" runat="server" Text="Previous" class="btn btn-md btn-success" Style="float: inline-end;" OnClick="RamHello2" />
                                    <%--<button type="button" class="next-btn" style="float: inline-end; background-color: #2a3f54; color: white;">Next</button>
<button type="button" class="prev-btn">Previous</button>--%>
                                </div>
                                <!-- <button  type="button" class="prev-btn">Previous</button>tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" -->
                            </div>

                            <div class="modal fade" id="myModal" runat="server" clientidmode="Static">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #2a3f54 !important;">
                                            <%--<h5 class="modal-title" id="exampleModalLabel" style="color: white;">Select Date & Time</h5>--%>
                                            <h5 id="test_center" class="modal-title" runat="server" style="color: white;" clientidmode="Static" />
                                            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true" style="color: white;">&times;</span>
                                                </button>--%>
                                            <asp:Button ID="Button5" class="close" data-dismiss="modal" aria-label="Close" runat="server" Text="×" Style="background-color: red; color: white; padding: 2px 7px; border: 2px solid red; opacity: 1; border-radius: 50%;" OnClick="Btn_Close" OnClientClick="abc()" />
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-6 ms-auto">
                                                        <h5>Select Date </h5>
                                                    </div>
                                                    <div class="col-md-6 ms-auto">
                                                        <asp:TextBox ID="DateTextBox" Placeholder="Click Here to Select the Date" runat="server" CssClass="form-control" onchange="abc()" OnTextChanged="select_time" AutoPostBack="true" autocomplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="savetime" ControlToValidate="DateTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <%-- <input type="date" class="form-control" id="text" placeholder="Enter the details for the selected field">--%>
                                                    </div>
                                                    <div id="hide_time" class="col-md-12" style="margin-top: 11px;">
                                                        <div class="col-md-2 ms-auto mt-3">
                                                            <h5>Time Slot</h5>
                                                        </div>

                                                        <div class="col-md-10 mt-3">

                                                            <%-- <div class="inline">
                                                                <input type="submit" name="ctl00$ContentPlaceHolder1$RepDetails_Morning$ctl00$Btn_time" value="9:00 AM" id="ctl00_ContentPlaceHolder1_RepDetails_Morning_ctl00_Btn_time" class="btn btn-primary" style="width: 85px; margin-bottom: 2px;">
                                                            </div>--%>
                                                            <asp:Repeater ID="RepDetails_Morning" runat="server">
                                                                <ItemTemplate>
                                                                    <div class="inline">
                                                                        <asp:Button ID="Btn_time" class="btn btn-primary" Width="85px" Style="margin-bottom: 2px;" runat="server" Text='<%#Eval("StartTime")%>' OnClick="btn_Select" />
                                                                        <%--<input type="submit" name="ctl00$ContentPlaceHolder1$RepDetails_Morning$ctl01$Btn_time" value="9:30 AM" id="ctl00_ContentPlaceHolder1_RepDetails_Morning_ctl01_Btn_time" class="btn btn-primary" style="width: 85px; margin-bottom: 2px;">--%>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mt-3" style="text-align: end;">
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                        <asp:Button ID="Btn_timesave" class="btn-primary btn-sm" Style="border-radius: 15px;" runat="server" Text="Save" ValidationGroup="savetime" OnClick="Btn_SaveTime" />
                                                        <%--<button class="btn-primary btn-sm" style="border-radius: 15px; background-color: red; border-color: red;">Reset</button>
                                                            <button class="btn-primary btn-sm" style="border-radius: 15px;">Submit</button>--%>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="review-details" visible="false" id="section3" runat="server">
                                <div class="form-row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <p>Review Details ( * mandatory fields)</p>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 d-flex  ">
                                        <h5 style="font-weight: bold;">Exam
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <h2>
                                            <asp:Label ID="lbl_exam_name1" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 d-flex  ">
                                        <h5 style="font-weight: bold;">Register Number
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <h2>
                                            <asp:Label ID="txt_aadhar_card11" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 d-flex ">
                                        <h5 style="font-weight: bold;">Exam Date
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_exam_date" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">Exam Time
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_exam_time" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 ">
                                        <h5 style="font-weight: bold;">Candidate Name</h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_first_name" runat="server"></asp:Label>
                                            <asp:Label ID="lbl_middle_name" runat="server"></asp:Label>
                                            <asp:Label ID="lbl_last_name" runat="server"></asp:Label>
                                            <asp:TextBox ID="Txt_Name" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txt_middle_name1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txt_last_name1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">DOB
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_Dob" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_Dob1" runat="server" Visible="false" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">Gender
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_Gender" runat="server" Text=""></asp:Label>
                                            <asp:DropDownList ID="dd_Gender1" runat="server" class="form-control" ClientIDMode="Static">
                                                <asp:ListItem Value="0">Gender*</asp:ListItem>
                                                <asp:ListItem Value="M">Male</asp:ListItem>
                                                <asp:ListItem Value="F">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">Email ID
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_email_address" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_email_address" runat="server" Visible="false" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 d-flex  ">
                                        <h5 style="font-weight: bold;">Mobile Number
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                        <h2>
                                            <asp:Label ID="lbl_Mobile_Number" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_Mobile_Number" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 ">
                                        <h5 style="font-weight: bold;">Address
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_address1" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_address11" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">Country
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_country" runat="server" Text=""></asp:Label>
                                            <%-- <asp:TextBox ID="txt_country" runat="server" Visible="false" cssclass="form-control"></asp:TextBox> --%>

                                            <asp:DropDownList ID="dd_country" runat="server" Visible="false" class="form-control">
                                                <asp:ListItem>Please select Country</asp:ListItem>
                                                <asp:ListItem>  AF:Afghanistan  </asp:ListItem>
                                                <asp:ListItem>  AX:Åland Islands    </asp:ListItem>
                                                <asp:ListItem>  AL:Albania  </asp:ListItem>
                                                <asp:ListItem>  DZ:Algeria  </asp:ListItem>
                                                <asp:ListItem>  AS:American Samoa   </asp:ListItem>
                                                <asp:ListItem>  AD:Andorra  </asp:ListItem>
                                                <asp:ListItem>  AO:Angola   </asp:ListItem>
                                                <asp:ListItem>  AI:Anguilla </asp:ListItem>
                                                <asp:ListItem>  AQ:Antarctica   </asp:ListItem>
                                                <asp:ListItem>  AG:Antigua and Barbuda  </asp:ListItem>
                                                <asp:ListItem>  AR:Argentina    </asp:ListItem>
                                                <asp:ListItem>  AM:Armenia  </asp:ListItem>
                                                <asp:ListItem>  AW:Aruba    </asp:ListItem>
                                                <asp:ListItem>  AU:Australia    </asp:ListItem>
                                                <asp:ListItem>  AT:Austria  </asp:ListItem>
                                                <asp:ListItem>  AZ:Azerbaijan   </asp:ListItem>
                                                <asp:ListItem>  BS:Bahamas  </asp:ListItem>
                                                <asp:ListItem>  BH:Bahrain  </asp:ListItem>
                                                <asp:ListItem>  BD:Bangladesh   </asp:ListItem>
                                                <asp:ListItem>  BB:Barbados </asp:ListItem>
                                                <asp:ListItem>  BY:Belarus  </asp:ListItem>
                                                <asp:ListItem>  BE:Belgium  </asp:ListItem>
                                                <asp:ListItem>  BZ:Belize   </asp:ListItem>
                                                <asp:ListItem>  BJ:Benin    </asp:ListItem>
                                                <asp:ListItem>  BM:Bermuda  </asp:ListItem>
                                                <asp:ListItem>  BT:Bhutan   </asp:ListItem>
                                                <asp:ListItem>  BO:Bolivia  </asp:ListItem>
                                                <asp:ListItem>  BA:Bosnia and Herzegovina   </asp:ListItem>
                                                <asp:ListItem>  BW:Botswana </asp:ListItem>
                                                <asp:ListItem>  BV:Bouvet Island    </asp:ListItem>
                                                <asp:ListItem>  BR:Brazil   </asp:ListItem>
                                                <asp:ListItem>  IO:British Indian Ocean Territory   </asp:ListItem>
                                                <asp:ListItem>  BN:Brunei Darussalam    </asp:ListItem>
                                                <asp:ListItem>  BG:Bulgaria </asp:ListItem>
                                                <asp:ListItem>  BF:Burkina Faso </asp:ListItem>
                                                <asp:ListItem>  BI:Burundi  </asp:ListItem>
                                                <asp:ListItem>  KH:Cambodia </asp:ListItem>
                                                <asp:ListItem>  CM:Cameroon </asp:ListItem>
                                                <asp:ListItem>  CA:Canada   </asp:ListItem>
                                                <asp:ListItem>  CV:Cape Verde   </asp:ListItem>
                                                <asp:ListItem>  KY:Cayman Islands   </asp:ListItem>
                                                <asp:ListItem>  CF:Central African Republic </asp:ListItem>
                                                <asp:ListItem>  TD:Chad </asp:ListItem>
                                                <asp:ListItem>  CL:Chile    </asp:ListItem>
                                                <asp:ListItem>  CN:China    </asp:ListItem>
                                                <asp:ListItem>  CX:Christmas Island </asp:ListItem>
                                                <asp:ListItem>  CC:Cocos (Keeling) Islands  </asp:ListItem>
                                                <asp:ListItem>  CO:Colombia </asp:ListItem>
                                                <asp:ListItem>  KM:Comoros  </asp:ListItem>
                                                <asp:ListItem>  CG:Congo    </asp:ListItem>
                                                <asp:ListItem>  CD:Congo, The Democratic Republic of The    </asp:ListItem>
                                                <asp:ListItem>  CK:Cook Islands </asp:ListItem>
                                                <asp:ListItem>  CR:Costa Rica   </asp:ListItem>
                                                <asp:ListItem>  CI:Cote D'ivoire    </asp:ListItem>
                                                <asp:ListItem>  HR:Croatia  </asp:ListItem>
                                                <asp:ListItem>  CU:Cuba </asp:ListItem>
                                                <asp:ListItem>  CY:Cyprus   </asp:ListItem>
                                                <asp:ListItem>  CZ:Czech Republic   </asp:ListItem>
                                                <asp:ListItem>  DK:Denmark  </asp:ListItem>
                                                <asp:ListItem>  DJ:Djibouti </asp:ListItem>
                                                <asp:ListItem>  DM:Dominica </asp:ListItem>
                                                <asp:ListItem>  DO:Dominican Republic   </asp:ListItem>
                                                <asp:ListItem>  EC:Ecuador  </asp:ListItem>
                                                <asp:ListItem>  EG:Egypt    </asp:ListItem>
                                                <asp:ListItem>  SV:El Salvador  </asp:ListItem>
                                                <asp:ListItem>  GQ:Equatorial Guinea    </asp:ListItem>
                                                <asp:ListItem>  ER:Eritrea  </asp:ListItem>
                                                <asp:ListItem>  EE:Estonia  </asp:ListItem>
                                                <asp:ListItem>  ET:Ethiopia </asp:ListItem>
                                                <asp:ListItem>  FK:Falkland Islands (Malvinas)  </asp:ListItem>
                                                <asp:ListItem>  FO:Faroe Islands    </asp:ListItem>
                                                <asp:ListItem>  FJ:Fiji </asp:ListItem>
                                                <asp:ListItem>  FI:Finland  </asp:ListItem>
                                                <asp:ListItem>  FR:France   </asp:ListItem>
                                                <asp:ListItem>  GF:French Guiana    </asp:ListItem>
                                                <asp:ListItem>  PF:French Polynesia </asp:ListItem>
                                                <asp:ListItem>  TF:French Southern Territories  </asp:ListItem>
                                                <asp:ListItem>  GA:Gabon    </asp:ListItem>
                                                <asp:ListItem>  GM:Gambia   </asp:ListItem>
                                                <asp:ListItem>  GE:Georgia  </asp:ListItem>
                                                <asp:ListItem>  DE:Germany  </asp:ListItem>
                                                <asp:ListItem>  GH:Ghana    </asp:ListItem>
                                                <asp:ListItem>  GI:Gibraltar    </asp:ListItem>
                                                <asp:ListItem>  GR:Greece   </asp:ListItem>
                                                <asp:ListItem>  GL:Greenland    </asp:ListItem>
                                                <asp:ListItem>  GD:Grenada  </asp:ListItem>
                                                <asp:ListItem>  GP:Guadeloupe   </asp:ListItem>
                                                <asp:ListItem>  GU:Guam </asp:ListItem>
                                                <asp:ListItem>  GT:Guatemala    </asp:ListItem>
                                                <asp:ListItem>  GG:Guernsey </asp:ListItem>
                                                <asp:ListItem>  GN:Guinea   </asp:ListItem>
                                                <asp:ListItem>  GW:Guinea-bissau    </asp:ListItem>
                                                <asp:ListItem>  GY:Guyana   </asp:ListItem>
                                                <asp:ListItem>  HT:Haiti    </asp:ListItem>
                                                <asp:ListItem>  HM:Heard Island and Mcdonald Islands    </asp:ListItem>
                                                <asp:ListItem>  VA:Holy See (Vatican City State)    </asp:ListItem>
                                                <asp:ListItem>  HN:Honduras </asp:ListItem>
                                                <asp:ListItem>  HK:Hong Kong    </asp:ListItem>
                                                <asp:ListItem>  HU:Hungary  </asp:ListItem>
                                                <asp:ListItem>  IS:Iceland  </asp:ListItem>
                                                <asp:ListItem>  IN:India    </asp:ListItem>
                                                <asp:ListItem>  ID:Indonesia    </asp:ListItem>
                                                <asp:ListItem>  IR:Iran, Islamic Republic of    </asp:ListItem>
                                                <asp:ListItem>  IQ:Iraq </asp:ListItem>
                                                <asp:ListItem>  IE:Ireland  </asp:ListItem>
                                                <asp:ListItem>  IM:Isle of Man  </asp:ListItem>
                                                <asp:ListItem>  IL:Israel   </asp:ListItem>
                                                <asp:ListItem>  IT:Italy    </asp:ListItem>
                                                <asp:ListItem>  JM:Jamaica  </asp:ListItem>
                                                <asp:ListItem>  JP:Japan    </asp:ListItem>
                                                <asp:ListItem>  JE:Jersey   </asp:ListItem>
                                                <asp:ListItem>  JO:Jordan   </asp:ListItem>
                                                <asp:ListItem>  KZ:Kazakhstan   </asp:ListItem>
                                                <asp:ListItem>  KE:Kenya    </asp:ListItem>
                                                <asp:ListItem>  KI:Kiribati </asp:ListItem>
                                                <asp:ListItem>  KP:Korea, Democratic People's Republic of   </asp:ListItem>
                                                <asp:ListItem>  KR:Korea, Republic of   </asp:ListItem>
                                                <asp:ListItem>  KW:Kuwait   </asp:ListItem>
                                                <asp:ListItem>  KG:Kyrgyzstan   </asp:ListItem>
                                                <asp:ListItem>  LA:Lao People's Democratic Republic </asp:ListItem>
                                                <asp:ListItem>  LV:Latvia   </asp:ListItem>
                                                <asp:ListItem>  LB:Lebanon  </asp:ListItem>
                                                <asp:ListItem>  LS:Lesotho  </asp:ListItem>
                                                <asp:ListItem>  LR:Liberia  </asp:ListItem>
                                                <asp:ListItem>  LY:Libyan Arab Jamahiriya   </asp:ListItem>
                                                <asp:ListItem>  LI:Liechtenstein    </asp:ListItem>
                                                <asp:ListItem>  LT:Lithuania    </asp:ListItem>
                                                <asp:ListItem>  LU:Luxembourg   </asp:ListItem>
                                                <asp:ListItem>  MO:Macao    </asp:ListItem>
                                                <asp:ListItem>  MK:Macedonia The Former Yugoslav Republic of </asp:ListItem>
                                                <asp:ListItem>  MG:Madagascar   </asp:ListItem>
                                                <asp:ListItem>  MW:Malawi   </asp:ListItem>
                                                <asp:ListItem>  MY:Malaysia </asp:ListItem>
                                                <asp:ListItem>  MV:Maldives </asp:ListItem>
                                                <asp:ListItem>  ML:Mali </asp:ListItem>
                                                <asp:ListItem>  MT:Malta    </asp:ListItem>
                                                <asp:ListItem>  MH:Marshall Islands </asp:ListItem>
                                                <asp:ListItem>  MQ:Martinique   </asp:ListItem>
                                                <asp:ListItem>  MR:Mauritania   </asp:ListItem>
                                                <asp:ListItem>  MU:Mauritius    </asp:ListItem>
                                                <asp:ListItem>  YT:Mayotte  </asp:ListItem>
                                                <asp:ListItem>  MX:Mexico   </asp:ListItem>
                                                <asp:ListItem>  FM:Micronesia, Federated States of  </asp:ListItem>
                                                <asp:ListItem>  MD:Moldova, Republic of </asp:ListItem>
                                                <asp:ListItem>  MC:Monaco   </asp:ListItem>
                                                <asp:ListItem>  MN:Mongolia </asp:ListItem>
                                                <asp:ListItem>  ME:Montenegro   </asp:ListItem>
                                                <asp:ListItem>  MS:Montserrat   </asp:ListItem>
                                                <asp:ListItem>  MA:Morocco  </asp:ListItem>
                                                <asp:ListItem>  MZ:Mozambique   </asp:ListItem>
                                                <asp:ListItem>  MM:Myanmar  </asp:ListItem>
                                                <asp:ListItem>  NA:Namibia  </asp:ListItem>
                                                <asp:ListItem>  NR:Nauru    </asp:ListItem>
                                                <asp:ListItem>  NP:Nepal    </asp:ListItem>
                                                <asp:ListItem>  NL:Netherlands  </asp:ListItem>
                                                <asp:ListItem>  AN:Netherlands Antilles </asp:ListItem>
                                                <asp:ListItem>  NC:New Caledonia    </asp:ListItem>
                                                <asp:ListItem>  NZ:New Zealand  </asp:ListItem>
                                                <asp:ListItem>  NI:Nicaragua    </asp:ListItem>
                                                <asp:ListItem>  NE:Niger    </asp:ListItem>
                                                <asp:ListItem>  NG:Nigeria  </asp:ListItem>
                                                <asp:ListItem>  NU:Niue </asp:ListItem>
                                                <asp:ListItem>  NF:Norfolk Island   </asp:ListItem>
                                                <asp:ListItem>  MP:Northern Mariana Islands </asp:ListItem>
                                                <asp:ListItem>  NO:Norway   </asp:ListItem>
                                                <asp:ListItem>  OM:Oman </asp:ListItem>
                                                <asp:ListItem>  PK:Pakistan </asp:ListItem>
                                                <asp:ListItem>  PW:Palau    </asp:ListItem>
                                                <asp:ListItem>  PS:Palestinian Territory, Occupied  </asp:ListItem>
                                                <asp:ListItem>  PA:Panama   </asp:ListItem>
                                                <asp:ListItem>  PG:Papua New Guinea </asp:ListItem>
                                                <asp:ListItem>  PY:Paraguay </asp:ListItem>
                                                <asp:ListItem>  PE:Peru </asp:ListItem>
                                                <asp:ListItem>  PH:Philippines  </asp:ListItem>
                                                <asp:ListItem>  PN:Pitcairn </asp:ListItem>
                                                <asp:ListItem>  PL:Poland   </asp:ListItem>
                                                <asp:ListItem>  PT:Portugal </asp:ListItem>
                                                <asp:ListItem>  PR:Puerto Rico  </asp:ListItem>
                                                <asp:ListItem>  QA:Qatar    </asp:ListItem>
                                                <asp:ListItem>  RE:Reunion  </asp:ListItem>
                                                <asp:ListItem>  RO:Romania  </asp:ListItem>
                                                <asp:ListItem>  RU:Russian Federation   </asp:ListItem>
                                                <asp:ListItem>  RW:Rwanda   </asp:ListItem>
                                                <asp:ListItem>  SH:Saint Helena </asp:ListItem>
                                                <asp:ListItem>  KN:Saint Kitts and Nevis    </asp:ListItem>
                                                <asp:ListItem>  LC:Saint Lucia  </asp:ListItem>
                                                <asp:ListItem>  PM:Saint Pierre and Miquelon    </asp:ListItem>
                                                <asp:ListItem>  VC:Saint Vincent and The Grenadines </asp:ListItem>
                                                <asp:ListItem>  WS:Samoa    </asp:ListItem>
                                                <asp:ListItem>  SM:San Marino   </asp:ListItem>
                                                <asp:ListItem>  ST:Sao Tome and Principe    </asp:ListItem>
                                                <asp:ListItem>  SA:Saudi Arabia </asp:ListItem>
                                                <asp:ListItem>  SN:Senegal  </asp:ListItem>
                                                <asp:ListItem>  RS:Serbia   </asp:ListItem>
                                                <asp:ListItem>  SC:Seychelles   </asp:ListItem>
                                                <asp:ListItem>  SL:Sierra Leone </asp:ListItem>
                                                <asp:ListItem>  SG:Singapore    </asp:ListItem>
                                                <asp:ListItem>  SK:Slovakia </asp:ListItem>
                                                <asp:ListItem>  SI:Slovenia </asp:ListItem>
                                                <asp:ListItem>  SB:Solomon Islands  </asp:ListItem>
                                                <asp:ListItem>  SO:Somalia  </asp:ListItem>
                                                <asp:ListItem>  ZA:South Africa </asp:ListItem>
                                                <asp:ListItem>  GS:South Georgia and The South Sandwich Islands </asp:ListItem>
                                                <asp:ListItem>  ES:Spain    </asp:ListItem>
                                                <asp:ListItem>  LK:Sri Lanka    </asp:ListItem>
                                                <asp:ListItem>  SD:Sudan    </asp:ListItem>
                                                <asp:ListItem>  SR:Suriname </asp:ListItem>
                                                <asp:ListItem>  SJ:Svalbard and Jan Mayen   </asp:ListItem>
                                                <asp:ListItem>  SZ:Swaziland    </asp:ListItem>
                                                <asp:ListItem>  SE:Sweden   </asp:ListItem>
                                                <asp:ListItem>  CH:Switzerland  </asp:ListItem>
                                                <asp:ListItem>  SY:Syrian Arab Republic </asp:ListItem>
                                                <asp:ListItem>  TW:Taiwan, Province of China    </asp:ListItem>
                                                <asp:ListItem>  TJ:Tajikistan   </asp:ListItem>
                                                <asp:ListItem>  TZ:Tanzania, United Republic of </asp:ListItem>
                                                <asp:ListItem>  TH:Thailand </asp:ListItem>
                                                <asp:ListItem>  TL:Timor-leste  </asp:ListItem>
                                                <asp:ListItem>  TG:Togo </asp:ListItem>
                                                <asp:ListItem>  TK:Tokelau  </asp:ListItem>
                                                <asp:ListItem>  TO:Tonga    </asp:ListItem>
                                                <asp:ListItem>  TT:Trinidad and Tobago  </asp:ListItem>
                                                <asp:ListItem>  TN:Tunisia  </asp:ListItem>
                                                <asp:ListItem>  TR:Turkey   </asp:ListItem>
                                                <asp:ListItem>  TM:Turkmenistan </asp:ListItem>
                                                <asp:ListItem>  TC:Turks and Caicos Islands </asp:ListItem>
                                                <asp:ListItem>  TV:Tuvalu   </asp:ListItem>
                                                <asp:ListItem>  UG:Uganda   </asp:ListItem>
                                                <asp:ListItem>  UA:Ukraine  </asp:ListItem>
                                                <asp:ListItem>  AE:United Arab Emirates </asp:ListItem>
                                                <asp:ListItem>  GB:United Kingdom   </asp:ListItem>
                                                <asp:ListItem>  US:United States    </asp:ListItem>
                                                <asp:ListItem>  UM:United States Minor Outlying Islands </asp:ListItem>
                                                <asp:ListItem>  UY:Uruguay  </asp:ListItem>
                                                <asp:ListItem>  UZ:Uzbekistan   </asp:ListItem>
                                                <asp:ListItem>  VU:Vanuatu  </asp:ListItem>
                                                <asp:ListItem>  VE:Venezuela    </asp:ListItem>
                                                <asp:ListItem>  VN:Viet Nam </asp:ListItem>
                                                <asp:ListItem>  VG:Virgin Islands, British  </asp:ListItem>
                                                <asp:ListItem>  VI:Virgin Islands, U.S. </asp:ListItem>
                                                <asp:ListItem>  WF:Wallis and Futuna    </asp:ListItem>
                                                <asp:ListItem>  EH:Western Sahara   </asp:ListItem>
                                                <asp:ListItem>  YE:Yemen    </asp:ListItem>
                                                <asp:ListItem>  ZM:Zambia   </asp:ListItem>
                                                <asp:ListItem>  ZW:Zimbabwe </asp:ListItem>
                                            </asp:DropDownList>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6  ">
                                        <h5 style="font-weight: bold;">State
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_state" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_state1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 ">
                                        <h5 style="font-weight: bold;">City
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_city" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_city1" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h5 style="font-weight: bold;">Pincode
                                        </h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h2>
                                            <asp:Label ID="lbl_postal_code" runat="server" Text=""></asp:Label>
                                            <asp:TextBox ID="txt_postal_code" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                        </h2>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <asp:Button ID="Button1" runat="server" Text="Edit Record" class="btn btn-md btn-success" OnClick="Button1_Click" />
                                        <asp:Button ID="Button2" Visible="false" runat="server" Text="Update Record" class="btn btn-md btn-success" OnClick="Button2_Click" Style="padding: 5px 11px;" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel Record" class="btn btn-md btn-success" Visible="false" OnClick="btnCancel_Click" />
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                                        <span style="font-weight: 900;">Check the box to proceed further.</span>
                                        <br />
                                        <asp:Label ID="Lbl_check" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </div>
                                    <div class="col-md-12" style="float: inline-end;">
                                        <%-- <button type="button" class="next-btn" style="float: inline-end; background-color: #2a3f54; color: white;">Next</button>
                                        <button type="button" class="prev-btn">Previous</button>--%>

                                        <asp:Button ID="next3" type="button" runat="server" Text="Next" class="btn btn-md btn-success" Style="float: inline-end; background-color: #2a3f54; color: white;" ValidationGroup="aacc" OnClick="RamHello33" />
                                        <asp:Button ID="back3" type="button" runat="server" Text="Previous" class="btn btn-md btn-success" Style="float: inline-end;" ValidationGroup="aacc" OnClick="RamHello3" />


                                    </div>
                                    <!-- <button  type="button" class="prev-btn">Previous</button> -->

                                </div>
                            </div>
                            <div class="payment" visible="false" id="section4" runat="server">
                                <div class="form-row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <p>Payment ( * mandatory fields)</p>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                        <p>Enter Voucher Code</p>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                        <asp:Label ID="lblErrMsg" runat="server" CssClass="error" ForeColor="Red"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtVoucherCode" placeholder="Enter Voucher Code" class="form-control"></asp:TextBox>
                                        <%--<input class="form-control" type="text" name="" id="" placeholder="Enter a Voucher Code">--%>
                                    </div>
                                    <div class="col-md-12" style="float: inline-end;">
                                        <%--<button type="button" class="next-btn" style="float: inline-end; background-color: #2a3f54; color: white;">Submit</button>
                                        <button type="button" class="prev-btn">Previous</button>--%>

                                        <asp:Button ID="next4" type="button" runat="server" Text="Pay" class="btn btn-md btn-success" Style="float: inline-end; background-color: #2a3f54; color: white;" OnClick="RamHello44" />
                                        <asp:Button ID="back4" type="button" runat="server" Text="Previous" class="btn btn-md btn-success" Style="float: inline-end;" ValidationGroup="aacc" OnClick="RamHello4" />
                                    </div>

                                    <!-- <button  type="button" class="prev-btn">Previous</button> -->

                                </div>
                            </div>
                            <section id="section5" runat="server" visible="false">
                                <div class="body">
                                    <div class="row clearfix" style="padding-top: 45px;">
                                        <div class="col-md-12" style="text-align: center; color: #f55e5e;">
                                            <asp:Label ID="Label1" CssClass="labe" runat="server" Font-Bold="True" Font-Size="22px" Text="Payment Successful"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="text-align: center;">
                                        <div class="row clearfix">
                                            <a href="sechdule">
                                                <button type="button" class="btn btn-default" style="margin-right: 11PX;">Schedule New Exam</button>
                                            </a>
                                        </div>
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
                                        const fieldsets = ['.provide-details', '.fill-exam', '.review-details', '.payment'];
                                        if (index < fieldsets.length - 1) {
                                            showFieldset(fieldsets[index], fieldsets[index + 1]);
                                        }
                                    });
                                });

                                // Add event listeners to Previous buttons
                                const prevButtons = document.querySelectorAll('.prev-btn');
                                prevButtons.forEach((button, index) => {
                                    button.addEventListener('click', function () {
                                        const fieldsets = ['.provide-details', '.fill-exam', '.review-details', '.payment'];
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
                                        data: '{useroremail: "' + $("#<%=txt_email.ClientID%>")[0].value + '" }',// user name or email value  
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: OnSuccess,
                                        failure: function (response) {
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
                                                    Yes: function () {
                                                        window.location.href = "existing.aspx?email=" + $("#<%=txt_email.ClientID%>")[0].value;
                                                    },
                                                    No: function () {
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
                                                    Yes: function () {
                                                        window.location.href = "existing.aspx?emailid=" + $("#<%=txt_email.ClientID%>")[0].value;
                                                    },
                                                    No: function () {
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
                                $(function () {
                                    initDOBDatePicker();
                                });

                                // After UpdatePanel postback
                                var prm = Sys.WebForms.PageRequestManager.getInstance();
                                if (prm) {
                                    prm.add_endRequest(function () {
                                        initDOBDatePicker();
                                    });
                                }

                                function SetRegistrstionDateTimePicker() {

                                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                                    if (prm != null) {
                                        prm.add_endRequest(function (sender, e) {
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
                                        success: function (data) {
                                            Dates = data.d[0].Dates.split(',');
                                            WeekEnds = data.d[0].WeekEnds.split(',');
                                            Maxdate = data.d[0].MaxDate;
                                            SetRegistrationDatePicker(Dates, WeekEnds, Maxdate);
                                        },
                                        error: function () {
                                        }
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
                                        success: function (data) {
                                            minDate = data.d;
                                        },
                                        error: function () {
                                            minDate = new Date();
                                        }
                                    });

                                    $('#<%=DateTextBox.ClientID %>').datepicker({
                                        minDate: minDate,
                                        dateFormat: 'dd-MM-yy',
                                        maxDate: Maxdate,
                                        beforeShowDay: function (date) {
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
