<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs"
    Inherits="Center.report" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var dates = $("input[id$='<%=DateTextBox1.ClientID %>'], input[id$='<%=DateTextBox2.ClientID %>']").datepicker({
                    onSelect: function (selectedDate) {
                        var option = this.id == $("input[id$='<%=DateTextBox1.ClientID %>']")[0].id ? "minDate" : "maxDate",
                            instance = $(this).data("datepicker"),
                            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
                        dates.not(this).datepicker("option", option, date);
                        SetHideReset();
                    }
                });

                $('#<%=btnReset.ClientID %>').on('click', function () {
                    $('#<%=btnReset.ClientID %>').prop('disabled', true);
                    $('#<%=DateTextBox1.ClientID %>').val('');
                    $('#<%=DateTextBox2.ClientID %>').val('');
                    $('#<%=rfvDateTextBox1.ClientID %>').hide();
                    $('#<%=rfvDateTextBox2.ClientID %>').hide();
                    dates.attr('value', '');
                    dates.datepicker("option", {
                        minDate: null,
                        maxDate: null
                    });
                });
            });

            function SetHideReset() {
                var DateTextBox1 = $('#<%=DateTextBox1.ClientID %>').val();
                var DateTextBox2 = $('#<%=DateTextBox2.ClientID %>').val();
                if (DateTextBox1 == '' && DateTextBox2 == '') {
                    $('#<%=btnReset.ClientID %>').prop('disabled', true);
                }
                else {
                    $('#<%=btnReset.ClientID %>').prop('disabled', false);
                }
            }

            function ReportDetails(aadhar_card) {
                var DateTextBox1 = document.getElementById("<%=DateTextBox1.ClientID%>");
                var DateTextBox2 = document.getElementById("<%=DateTextBox2.ClientID%>");
                var center_name = '<%=Session["center_name"]%>';
                var datas = "{'straadhar_card':'" + aadhar_card + "','strDateTextBox1':'" + DateTextBox1.value + "','strDateTextBox2':'" + DateTextBox2.value + "','strcenter_name':'" + center_name + "'}";
                $.ajax({
                    type: "POST",
                    url: "report.aspx/GetReportViewData",
                    data: datas,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        ShowReportView(data);
                    }, error: function (error) {
                    }
                });
            }

            function ShowReportView(data) {
                var tdcommon_id = document.getElementById("<%=tdcommon_id.ClientID%>");
                var hdncommon_id = document.getElementById("<%=hdncommon_id.ClientID%>");
                var tdaadhar_card = document.getElementById("<%=tdaadhar_card.ClientID%>");
                var hdnaadhar_card = document.getElementById("<%=hdnaadhar_card.ClientID%>");
                var tdname = document.getElementById("<%=tdname.ClientID%>");
                var hdnname = document.getElementById("<%=hdnname.ClientID%>");
                var tdemail_address = document.getElementById("<%=tdemail_address.ClientID%>");
                var hdnemail_address = document.getElementById("<%=hdnemail_address.ClientID%>");
                var tdmobile_number = document.getElementById("<%=tdmobile_number.ClientID%>");
                var hdnmobile_number = document.getElementById("<%=hdnmobile_number.ClientID%>");
                var tdaddress = document.getElementById("<%=tdaddress.ClientID%>");
                var hdnaddress = document.getElementById("<%=hdnaddress.ClientID%>");
                var tdexam_name = document.getElementById("<%=tdexam_name.ClientID%>");
                var hdnexam_name = document.getElementById("<%=hdnexam_name.ClientID%>");
                var tdExamstatus = document.getElementById("<%=tdExamstatus.ClientID%>");
                var hdnExamstatus = document.getElementById("<%=hdnExamstatus.ClientID%>");
                var tdResult_Pass_or_Fail = document.getElementById("<%=tdResult_Pass_or_Fail.ClientID%>");
                var hdnResult_Pass_or_Fail = document.getElementById("<%=hdnResult_Pass_or_Fail.ClientID%>");

                if (tdcommon_id && hdncommon_id) {
                    tdcommon_id.innerHTML = data.d[0].common_id;
                    hdncommon_id.value = data.d[0].common_id;
                }

                if (tdaadhar_card && hdnaadhar_card) {
                    tdaadhar_card.innerHTML = data.d[0].aadhar_card;
                    hdnaadhar_card.value = data.d[0].aadhar_card;
                }

                if (tdname && hdnname) {
                    tdname.innerHTML = data.d[0].name;
                    hdnname.value = data.d[0].name;
                }

                if (tdemail_address && hdnemail_address) {
                    tdemail_address.innerHTML = data.d[0].email_address;
                    hdnemail_address.value = data.d[0].email_address;
                }

                if (tdmobile_number && hdnmobile_number) {
                    tdmobile_number.innerHTML = data.d[0].mobile_number;
                    hdnmobile_number.value = data.d[0].mobile_number;
                }

                if (tdaddress && hdnaddress) {
                    tdaddress.innerHTML = data.d[0].address;
                    hdnaddress.value = data.d[0].address;
                }

                if (tdexam_name && hdnexam_name) {
                    tdexam_name.innerHTML = data.d[0].exam_name;
                    hdnexam_name.value = data.d[0].exam_name;
                }

                if (tdExamstatus && hdnExamstatus) {
                    tdExamstatus.innerHTML = data.d[0].Examstatus;
                    hdnExamstatus.value = data.d[0].Examstatus;
                }

                if (tdResult_Pass_or_Fail && hdnResult_Pass_or_Fail) {
                    tdResult_Pass_or_Fail.innerHTML = data.d[0].Result_Pass_or_Fail;
                    hdnResult_Pass_or_Fail.value = data.d[0].Result_Pass_or_Fail;
                }
            }
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="right_col" role="main" style="height:84vh">
            <div class="container">

                <!-- ===== Breadcrumb Navigation ===== -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <nav class="te-breadcrumb" aria-label="breadcrumb">
                            <ol>
                                <li><a href="dashboard"><i class="fa fa-home"></i> Home</a></li>
                                <li class="te-breadcrumb__active">Exam Report</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">

                    <!-- ===== Search Section ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header">
                                <i class="fa fa-filter"></i>
                                <span>Filter By Date Range</span>
                            </div>
                            <div class="te-card__body">
                                <div class="form-row row gy-4">
                                    <div class="form-group col-lg-4 col-md-6 col-12">
                                        <label class="te-label">Date From</label>
                                        <asp:TextBox ID="DateTextBox1" placeholder="Select Date From"
                                            AutoCompleteType="Disabled" autocomplete="off" runat="server"
                                            CssClass="form-control te-input" Style="cursor: text !important;">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDateTextBox1" runat="server"
                                            ControlToValidate="DateTextBox1" Display="Dynamic" ErrorMessage="Required"
                                            ForeColor="Red" SetFocusOnError="true" ValidationGroup="Search">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-lg-4 col-md-6 col-12">
                                        <label class="te-label">Date To</label>
                                        <asp:TextBox ID="DateTextBox2" Placeholder="Select Date To"
                                            AutoCompleteType="Disabled" autocomplete="off" runat="server"
                                            CssClass="form-control te-input" Style="cursor: text !important;">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDateTextBox2" runat="server"
                                            ControlToValidate="DateTextBox2" Display="Dynamic" ErrorMessage="Required"
                                            ForeColor="Red" SetFocusOnError="true" ValidationGroup="Search">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-lg-4 col-12 d-flex align-items-end gap-2">
                                        <div class="flex-grow-1">
                                            <asp:Button ID="btn_search" runat="server" Text="Search"
                                                OnClick="Search_Record" CssClass="te-btn-primary w-100"
                                                ValidationGroup="Search" />
                                        </div>
                                        <div class="flex-grow-1">
                                            <button id="btnReset" runat="server" type="button"
                                                class="btn te-btn-view bg-secondary w-100"
                                                style="height: 38px; border-radius: 25px;"
                                                disabled="disabled">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ===== Results Section ===== -->
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="te-card">
                            <div class="te-card__header te-card__header--accent">
                                <i class="fa fa-file-text-o"></i>
                                <span>Candidate Report List</span>
                            </div>
                            <div class="te-card__body te-card__body--flush">
                                <div class="table-responsive">
                                    <asp:Panel ID="panel1" runat="server">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" Width="100%"
                                            CssClass="table te-table" AutoGenerateColumns="false" PageSize="300">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Exam Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_testing_exam_name1" runat="server"
                                                            Text='<%#Eval("exam_name") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Candidate Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_testing_exam_date11" runat="server"
                                                            Text='<%#Eval("first_name") %>' />
                                                        <asp:Label ID="lbl_testing_exam_time" runat="server"
                                                            Text='<%#Eval("last_name") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server"
                                                            Text='<%#Eval("email_address") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server"
                                                            Text='<%#Eval("mobile_number") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Exam Date / Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server"
                                                            Text='<%#Eval("exam_date") %>' /> -
                                                        <asp:Label ID="Label4" runat="server"
                                                            Text='<%#Eval("exam_time") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Result Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_testing_exam_date111" runat="server"
                                                            Text='<%#Eval("Result_Pass_or_Fail") %>'
                                                            ForeColor='<%# (Eval("Examstatus").Equals("Waiting to get hold of")) ?  System.Drawing.Color.Red : System.Drawing.Color.Green %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <div data-toggle="modal" title="View Details"
                                                            style="cursor: pointer;" data-target="#dvReportDetails"
                                                            onclick='ReportDetails("<%#Eval("aadhar_card") %>")'>
                                                            <i class="fa fa-eye text-primary" aria-hidden="true"
                                                                style="font-size: 1.2rem;"></i>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div class="px-3 pb-3">
                                        <asp:Label ID="lbl_checkkckckc" runat="server" ForeColor="Red" Text="" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ===== Download Options ===== -->
                        <div class="py-3 d-flex flex-wrap gap-3 justify-content-center">
                            <asp:Button ID="Button1" runat="server" Text="Download Word" Visible="false"
                                CssClass="te-btn-view" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" Text="Download Excel" Visible="false"
                                CssClass="te-btn-view" OnClick="Button2_Click" />
                            <asp:Button ID="Button3" runat="server" Text="Download PDF" Visible="false"
                                CssClass="te-btn-view" OnClick="Button3_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- ===== Report Modal ===== -->
        <div class="modal fade" id="dvReportDetails" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" style="border-radius: 12px; overflow: hidden;">
                    <div id="dvCandidateDetails" runat="server">
                        <div class="modal-header te-card__header--accent" style="border: none;">
                            <h4 class="modal-title" id="H1" style="color: white; font-weight: 600;">
                                <i class="fa fa-user-circle-o"></i> Candidate Details
                            </h4>
                            <asp:Button ID="Button4" runat="server" type="button" CssClass="close text-white"
                                data-dismiss="modal" Text="&times;"
                                Style="background: none; border: none; font-size: 2rem; opacity: 1; margin-top: -10px;">
                            </asp:Button>
                        </div>
                        <div class="modal-body p-0">
                            <table class="table te-table mb-0">
                                <tbody>
                                    <tr>
                                        <td class="fw-bold bg-light" style="width: 30%;">ID</td>
                                        <td id="tdcommon_id" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Registration ID</td>
                                        <td id="tdaadhar_card" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Candidate Name</td>
                                        <td id="tdname" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Email ID</td>
                                        <td id="tdemail_address" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Mobile Number</td>
                                        <td id="tdmobile_number" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Address</td>
                                        <td id="tdaddress" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Exam Name</td>
                                        <td id="tdexam_name" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Exam Status</td>
                                        <td id="tdExamstatus" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold bg-light">Exam Result</td>
                                        <td id="tdResult_Pass_or_Fail" runat="server"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <asp:HiddenField ID="hdncommon_id" runat="server" />
                    <asp:HiddenField ID="hdnaadhar_card" runat="server" />
                    <asp:HiddenField ID="hdnname" runat="server" />
                    <asp:HiddenField ID="hdnemail_address" runat="server" />
                    <asp:HiddenField ID="hdnmobile_number" runat="server" />
                    <asp:HiddenField ID="hdnaddress" runat="server" />
                    <asp:HiddenField ID="hdnexam_name" runat="server" />
                    <asp:HiddenField ID="hdnExamstatus" runat="server" />
                    <asp:HiddenField ID="hdnResult_Pass_or_Fail" runat="server" />
                    <div class="modal-footer d-flex justify-content-center bg-light">
                        <asp:Button ID="btnCandidatesPdf" runat="server" Text="Download PDF"
                            CssClass="te-btn-primary w-50" OnClick="btnCandidatesPdf_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>

    </asp:Content>