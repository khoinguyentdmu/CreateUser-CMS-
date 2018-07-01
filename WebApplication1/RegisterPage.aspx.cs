using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        //Connection string
        string connString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Init configuration
            System.Configuration.Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration(null);

            //Read configurations from Web.config
            if (rootWebConfig.AppSettings.Settings.Count > 0)
            {
                System.Configuration.KeyValueConfigurationElement host = rootWebConfig.AppSettings.Settings["host"];
                System.Configuration.KeyValueConfigurationElement user = rootWebConfig.AppSettings.Settings["user"];
                System.Configuration.KeyValueConfigurationElement dbName = rootWebConfig.AppSettings.Settings["dbName"];
                System.Configuration.KeyValueConfigurationElement password = rootWebConfig.AppSettings.Settings["password"];
                System.Configuration.KeyValueConfigurationElement port = rootWebConfig.AppSettings.Settings["port"];
                
                if (host != null && user != null && dbName != null && password != null && port != null)
                {
                    connString = String.Format("Server={0}; User Id={1}; Database={2}; Port={3}; Password={4}; SSL Mode=Prefer; Trust Server Certificate=true", 
                        host.Value, user.Value, dbName.Value, port.Value, password.Value);
                }
                else
                    lblNotifycation.Text = "Không có kết nối với cơ sở dữ liệu";
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            //Get data
            String firstName = txtFirstName.Text;
            String lastName = txtLastName.Text;
            String userName = txtUserName.Text;
            String password = txtPassword.Text;
            String rePassword = txtRePassword.Text;
            String email = txtEmail.Text;

            //Check input password
            if (!password.Equals(rePassword) || password.Trim().Length < 6)
            {
                lblNotifycation.Text = "Mật khẩu nhập lại không khớp, rỗng, hoặc độ dài chưa đủ (>=6)";
                return;
            }

            //Format input password
            password = "plaintext:" + password;

            //Init 
            var conn = new NpgsqlConnection(connString);
            conn.Open();
            var command = conn.CreateCommand();

            //Sql command
            command.CommandText = @"INSERT INTO public.users (first_name, last_name, username, password, email, preferred_languages) VALUES ('" + firstName + "', '" + lastName + "', '" + userName + "', '" + password + "', '" + email + "', '{}'); INSERT INTO public.participations(delay_time, extra_time, hidden, unrestricted, contest_id, user_id) VALUES ('00:00:00', '00:00:00', false, false, (SELECT id FROM public.contests ORDER BY id DESC LIMIT 1), (SELECT id FROM public.users ORDER BY id DESC LIMIT 1));";

            //Insert into database
            try
            {
                int res = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblNotifycation.Text = "Đã tồn tại tài khoản này hoặc thông tin không hợp lệ. Hãy nhập lại!!";
            }

            lblNotifycation.Text = "Đã tạo tài khoản thành công!!";

            //Close connection
            conn.Close();
        }
    }
}