<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarksDetailUserControl.ascx.cs" Inherits="SchoolManagementSystem.WebUserControl1" %>


<div class="container p-md-4 p-sm-4">
    <div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <h3 class="text-center">Marks Details</h3>
    <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
        <div class="col-md-6">
            <label for="ddlClass">Class</label>
            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required." ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-6">
            <label for="txtRoll">Student Roll Number</label>
            <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number" required></asp:TextBox>
        </div>
    </div>

    <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-3 col-md-offset-2 mb-3">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Get Marks" OnClick="btnAdd_Click" />
        </div>
    </div>

    <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" OnPageIndexChanging="GridView1_PageIndexChanging">
                <columns>
                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ClassName" HeaderText="Class">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="RollNo" HeaderText="Roll Number">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="OutOfMarks" HeaderText="Out Of Marks">
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

                </columns>
                <headerstyle backcolor="#5558C9" forecolor="White" />
            </asp:GridView>
        </div>
    </div>
</div>