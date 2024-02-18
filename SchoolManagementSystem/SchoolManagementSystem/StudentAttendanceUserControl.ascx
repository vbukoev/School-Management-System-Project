<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUserControl.ascx.cs" Inherits="SchoolManagementSystem.StudentAttendanceUserControl" %>

<div class="container p-md-4 p-sm-4">
    <div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <h3 class="text-center mt-3">Student Attendance Details</h3>

    <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
        <div class="col-md-6">
            <label for="ddlClass">Class</label>
            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required." ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-6">
            <label for="ddlSubject">Subject</label>
            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>

        </div>
    </div>

    <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
        <div class="col-md-6">
            <label for="txtRollNo">Roll Number</label>
            <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" placeholder="Enter Student Roll No"> </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="RollNo is required." ControlToValidate="txtRollNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
    
        <div class="col-md-6">
            <label for="txtMonth">Month</label>
            <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Date"> </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Month is required." ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-3 col-md-offset-2 mb-3">
            <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" OnClick="btnCheckAttendance_Click" />
        </div>
    </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Nane">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="label1" Text='<%#Boolean.Parse (Eval("Status").ToString()) ? "Present" : "Absent"%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0: dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                    </Columns>
                    <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>

