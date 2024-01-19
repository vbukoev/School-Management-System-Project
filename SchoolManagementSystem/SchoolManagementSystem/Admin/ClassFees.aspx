﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolManagementSystem.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     
     <div class="container p-md-4 p-sm-4">
         <div>
             <asp:Label ID="lblMsg" runat="server"></asp:Label>
         </div>
         <h3 class="text-center">New Fees</h3>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
             <div class="col-md-6">
                 <label for="ddlClass">Class</label>
                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required." ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
             </div>
             
             <div class="col-md-6">
                 <label for="txtFeeAmounts">Fees(Annual)</label>
                 <asp:TextBox ID="txtFeeAmounts" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required></asp:TextBox>
             </div>
         </div>
         
         <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Fees" OnClick="btnAdd_Click" />
             </div>
         </div>
         
         <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-8">
                 <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" pageOnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="FeesId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                     <Columns>
                         <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="Fees(Annual)">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" />
                         </asp:TemplateField>
                         <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:CommandField>
                     </Columns>
                     <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                 </asp:GridView>
             </div>
         </div>
     </div>
</asp:Content>
