using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class EmpAttendanceDetails : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetTeacher();
            }
        }
        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select * from Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "Name";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "Select Teacher");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(txtMonth.Text);
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], t.Name, ta.Status,               ta.Date from TeacherAttendance ta inner join Teacher t on t.TeacherId = ta.TeacherId where DATEPART(yy, Date)= '" + date.Year + "' and DATEPART(M, Date)= '" + date.Month + "' and ta.TeacherId = '" + ddlTeacher.SelectedValue + "'");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}