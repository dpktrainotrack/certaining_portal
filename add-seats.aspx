<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="add-seats.aspx.cs" Inherits="Center.add_seats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_col" role="main" style="min-height: 102vh;">
        <div class="container">
            <div class="row">
                <h2 class="header"><span>Home</span> > Add Seat</h2>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="form-container">
                        <div class="form1">
                            <h3 class="fourm-title">Add Seat </h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Seat Name*</label>
                                    <input type="text" class="form-control" id="text" placeholder="Write Your Seat Name*">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Last Name</label>
                                    <select class="form-control" id="exampleFormControlSelect1">
                                        <option value="0" selected disabled>Choose Status</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <br>
                            <button type="submit" class="btn btn-primary" style="width: 100%; border-radius: 25px;">Submit</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>







    </div>
</asp:Content>
