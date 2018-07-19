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
    public partial class Register : System.Web.UI.Page
    {
        string message;

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Page.IsPostBack)
            {
                if (Session["state"] != null)
                {
                    if (Session["state"].Equals("Success"))
                    {
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Session["state"] = null;
                        Response.Redirect("Login.aspx");
                    }
                }
            }

            btnRegister.Click += btnRegister_Click;
            btnOk.Click += btnOk_Click;
        }

        void btnOk_Click(object sender, EventArgs e)
        {
            registerBlocker.Style.Add("display", "none");

        }

        void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                if (TextBoxPwd.Text.Equals(TextBoxConfirmPwd.Text))
                {

                    var registerData = new UserModel()
                    {
                        name = TextBoxusername.Text.Trim(),
                        email = TextBoxEmail.Text.Trim(),
                        password = TextBoxPwd.Text,
                        phone = TextBoxPhone.Text.Trim(),
                        address = TextBoxAddress.Text.Trim(),
                        active = true
                    };

                    if (dbHelper.InsertRecord(registerData))
                    {
                        ClearView();
                        message = "Account created successfully";

                        Session["state"] = "Success";
                    }
                    else
                    {
                        message = "Error in connecting the DB. Please try again later";
                        Session["state"] = "Error";
                    }
                    registerBlocker.Style.Add("display", "block");

                }
                else
                {
                    TextBoxPwd.Text = string.Empty;
                    TextBoxConfirmPwd.Text = string.Empty;
                    Page.Validate();

                }
            }

        }

        private void ClearView()
        {
            TextBoxusername.Text = string.Empty;
            TextBoxEmail.Text = string.Empty;
            TextBoxPwd.Text = string.Empty;
            TextBoxConfirmPwd.Text = string.Empty;
            TextBoxPhone.Text = string.Empty;
            TextBoxAddress.Text = string.Empty;
        }

        public string GetMessage()
        {
            return message;
        }
    }
}