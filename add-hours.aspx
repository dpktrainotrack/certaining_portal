<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="add-hours.aspx.cs" Inherits="Center.add_hours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Create Hours</h2>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="form-container">
                        <div class="form1">
                            <h3 class="fourm-title">Add Hours</h3>
                            <div class="form-row">

                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Type</label>
                                    <select class="form-control" id="typeSelect">
                                        <option value="0" selected disabled>Select</option>
                                        <option value="1">Timing</option>
                                        <option value="2">Holiday</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Select Date*</label>
                                    <input type="date" class="form-control">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inputEmail4" style="display: flex; justify-content: space-between;">
                                        <p style="margin-bottom: 0;">End Date*</p>
                                        <div class="form-check" id="endDateSection">
                                            <input class="form-check-input" type="checkbox" id="noEndDateCheckbox">
                                            <label class="form-check-label" for="noEndDateCheckbox" style="margin-top: 0;">
                                                No End Date
                           
                                            </label>
                                        </div>
                                    </label>
                                    <input type="date" class="form-control" id="endDateInput">
                                </div>

                                <div class="form-group col-md-6" id="startTimeSection">
                                    <label for="startTime">Start Time*</label>
                                    <input type="time" class="form-control" id="startTime">
                                </div>

                                <div class="form-group col-md-6" id="endTimeSection">
                                    <label for="endTime" style="display: flex; justify-content: space-between;">
                                        <p style="margin-bottom: 0;">End Time*</p>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="allDaysCheckbox">
                                            <label class="form-check-label" for="allDaysCheckbox" style="margin-top: 0;">
                                                All Days
                           
                                            </label>
                                        </div>
                                    </label>
                                    <input type="time" class="form-control" id="endTime">
                                </div>

                                <!-- Weekly off checkboxes (remaining the same) -->

                                <div class="form-group col-md-12 pt-3">
                                    <select class="form-control">
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <br>
                            <button type="submit" class="btn btn-primary" style="width: 25%; border-radius: 25px; background-color: red; border-color: red;">Reset</button>
                            <button type="submit" class="btn btn-primary" style="width: 25%; border-radius: 25px; float: right;">Submit</button>
                        </div>
                    </div>
                    <script>
                        // Hide and show sections based on selected type
                        document.getElementById('typeSelect').addEventListener('change', function () {
                            var selectedValue = this.value;
                            var endDateSection = document.getElementById('endDateSection');
                            var startTimeSection = document.getElementById('startTimeSection');
                            var endTimeSection = document.getElementById('endTimeSection');

                            if (selectedValue == '2') { // If 'Holiday' is selected
                                endDateSection.style.display = 'none';
                                startTimeSection.style.display = 'none';
                                endTimeSection.style.display = 'none';
                            } else { // If 'Timing' is selected
                                endDateSection.style.display = ''; // Show the fields again
                                startTimeSection.style.display = 'block';
                                endTimeSection.style.display = 'block';
                            }
                        });

                        // Disable/Enable "End Date" input based on "No End Date" checkbox
                        document.getElementById('noEndDateCheckbox').addEventListener('change', function () {
                            var endDateInput = document.getElementById('endDateInput');
                            endDateInput.disabled = this.checked;
                        });

                        // Disable/Enable "Start Time" and "End Time" inputs based on "All Days" checkbox
                        document.getElementById('allDaysCheckbox').addEventListener('change', function () {
                            var startTimeInput = document.getElementById('startTime');
                            var endTimeInput = document.getElementById('endTime');
                            startTimeInput.disabled = this.checked;
                            endTimeInput.disabled = this.checked;
                        });
              </script>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
