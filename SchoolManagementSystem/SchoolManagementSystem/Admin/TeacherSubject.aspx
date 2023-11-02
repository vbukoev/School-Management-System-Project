<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="SchoolManagementSystem.Admin.TeacherSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container p-md-4 p-sm-4">
    <div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <h3 class="text-center">Add Teacher Subject</h3>
    <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
        <div class="col-md-6">
            <label for="ddlClass">Class</label>
            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required." ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        
        <div class="col-md-6">
            <label for="ddlSubject">Subject</label>
            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Subject is required." ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        
        <div class="col-md-6">
            <label for="ddlTeacher">Teacher</label>
            <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Teacher is required." ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
    </div>
    
    <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-3 col-md-offset-2 mb-3">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Assign Subject" OnClick="btnAdd_Click" />
        </div>
    </div>
    
    <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-8">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" pageOnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="Id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Class"> <%-- CLASS template field --%>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="True">
                                <asp:ListItem>Select Class</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject"> <%-- SUBJECT template field --%>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSubjectGv" runat="server" CssClass="form-control"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Teacher"> <%-- TEACHER template field --%>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlTeacherGv" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="TeacherId" SelectedValue='<%# Eval("TeacherId") %>' CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT [TeacherId], [Name] FROM [Teacher]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
            </asp:GridView>
        </div>
    </div>
</div>

</asp:Content>
