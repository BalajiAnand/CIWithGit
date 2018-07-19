using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationSample.db;
using WebApplicationSample.model;

namespace WebApplicationSample
{
    public partial class Default : System.Web.UI.Page
    {
        string message;
        List<UserModel> userlist;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            LoadUserList();
            btnOk.Click += btnOk_Click;
            
            CheckBoxShowPwd.CheckedChanged += CheckBoxShowPwd_CheckedChanged;
        }

        void CheckBoxShowPwd_CheckedChanged(object sender, EventArgs e)
        {
            TextBoxPassword.TextMode = CheckBoxShowPwd.Checked ? TextBoxMode.SingleLine : TextBoxMode.Password; 
        }

        void btnOk_Click(object sender, EventArgs e)
        {
            loginBlocker.Style.Add("display", "none");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Logged In')", true);

                UserModel user;
                try
                {
                    user = userlist.Where(a => a.name.Equals(TextBoxusername.Text.Trim(), StringComparison.OrdinalIgnoreCase)).Single();
                }
                catch (Exception exception)
                {
                    user = null;
                }
                

                if (user != null)
                {
                    if (user.password.Equals(TextBoxPassword.Text))
                    {
                        TextBoxusername.Text = string.Empty;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        message = "This password is Incorrect. Try again";
                        loginBlocker.Style.Add("display", "block");
                    }

                }
                else
                {
                    message = "UserName or Password Incorrect";
                    loginBlocker.Style.Add("display", "block");
                }

                
            }
        }

        private void LoadUserList()
        {
            var dt = dbHelper.getRecord();
            userlist = new List<UserModel>();
            userlist.Clear();

            for (int i = 0; i < dt.Rows.Count; i++ )
            {
                userlist.Add(new UserModel()
                {
                    id = Convert.ToInt16(dt.Rows[i]["id"].ToString()),
                    name = dt.Rows[i]["name"].ToString(),
                    email = dt.Rows[i]["email"].ToString(),
                    password = dt.Rows[i]["password"].ToString(),
                    address = dt.Rows[i]["address"].ToString(),
                    phone = dt.Rows[i]["phone"].ToString(),
                    active = dt.Rows[i]["active"].ToString().Equals("1")?true:false
                });
            }
        }

        public string GetMessage()
        {
            return message;
        }
    }
}