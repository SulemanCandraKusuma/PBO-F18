using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Npgsql;

namespace PondokPesantren
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Insertbtn_Click(object sender, EventArgs e)
        {
            try
            {
                /* Insertion After Validations*/
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "Insert into presensi (id_kegiatan, id_guru, id_santri, status_kehadiran, tanggal_presensi) values(@idk, @idg, @ids, @sk, @tgl)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new NpgsqlParameter("@idk", Convert.ToInt32(id_kegiatan.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@idg", Convert.ToInt32(id_guru.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@ids", Convert.ToInt32(id_santri.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@sk", status_kehadiran.Text));
                    cmd.Parameters.Add(new NpgsqlParameter("@tgl", Convert.ToDateTime(tanggal_presensi.Text)));
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                    id_kegiatan.Text = "";
                    id_guru.Text = "";
                    id_santri.Text = "";
                    status_kehadiran.Text = "";
                    tanggal_presensi.Text = "";
                    Massage.Text = "Data Has been Saved";
                }
            }
            catch (Exception ex)
            {
                Massage.Text = ex.Message;
            }
        }

        protected void Showkegiatanbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from kegiatan";
                    cmd.CommandType = CommandType.Text;
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();

                    GridData.DataSource = dt;
                    GridData.DataBind();
                }
            }
            catch (Exception ex) { }
        }

        protected void Showgurubtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select id_guru, nama_guru, nomor_induk_guru, alamat_guru from guru";
                    cmd.CommandType = CommandType.Text;
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();

                    GridData.DataSource = dt;
                    GridData.DataBind();
                }
            }
            catch (Exception ex) { }
        }

        protected void Showsantribtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select id_santri, nama_santri, nomor_induk_santri, alamat_santri from santri";
                    cmd.CommandType = CommandType.Text;
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();

                    GridData.DataSource = dt;
                    GridData.DataBind();
                }
            }
            catch (Exception ex) { }
        }
    }
}