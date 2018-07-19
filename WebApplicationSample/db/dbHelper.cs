using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplicationSample.model;

namespace WebApplicationSample.db
{
    public class dbHelper
    {
        public static DataTable getRecord()
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlServerConnection"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbluser", cn);

                cn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);          

                //SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //rdr.Read();
                //Response.Write(rdr[0].ToString()); //read a value
                cn.Close();
            }

            return dt;
        }

        public static bool InsertRecord(UserModel user)
        {
            bool isSuccess = false;

            var query = "INSERT INTO dbluser (name, email, phone,address,password,active) VALUES (@name,@email,@phone,@address,@password,@active)";

            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlServerConnection"].ToString()))
            {
                
                cn.Open();
                SqlCommand cmd = new SqlCommand(query, cn);

                cmd.Parameters.AddWithValue("@name", user.name);
                cmd.Parameters.AddWithValue("@email", user.email);
                cmd.Parameters.AddWithValue("@phone", user.phone);
                cmd.Parameters.AddWithValue("@address", user.address);
                cmd.Parameters.AddWithValue("@password", user.password);
                cmd.Parameters.AddWithValue("@active", user.active);

                isSuccess = cmd.ExecuteNonQuery() > 0;

                //SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //rdr.Read();
                //Response.Write(rdr[0].ToString()); //read a value
                cn.Close();
            }

            return isSuccess;
        }
    }
}