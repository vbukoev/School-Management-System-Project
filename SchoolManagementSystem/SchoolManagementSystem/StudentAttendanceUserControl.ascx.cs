using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem
{
    public partial class StudentAttendanceUserControl : System.Web.UI.UserControl
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
            //}

            if (!IsPostBack)
            {
                GetClass();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + classId + "' "); //query
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";               //GETSUBJECT() method is implemented here
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Subject");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date = Convert.ToDateTime(txtMonth.Text);

            if (ddlSubject.SelectedValue == "Select Subject")
            {
                dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No],s.Name, sa.Status, sa.Date from StudentAttendance sa inner join Student s on s.RollNo = sa.RollNo where sa.ClassId= '" + ddlClass.SelectedValue + "' and sa.RollNo= '"+txtRollNo.Text.Trim()+"' and DATEPART (yy, Date)= '" + date.Year + "' and DATEPART(M, Date)= '" + date.Month + "' and sa.Status = 1");
            }
            else
            {
                dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No],s.Name, sa.Status, sa.Date from StudentAttendance sa inner join Student s on s.RollNo = sa.RollNo where sa.ClassId= '" + ddlClass.SelectedValue + "' and sa.RollNo= '" + txtRollNo.Text.Trim() + "' and sa.SubjectId = '"+ ddlSubject.SelectedValue+"' and DATEPART (yy, Date)= '" + date.Year + "' and DATEPART(M, Date)= '" + date.Month + "' and sa.Status = 1");
            }


            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}