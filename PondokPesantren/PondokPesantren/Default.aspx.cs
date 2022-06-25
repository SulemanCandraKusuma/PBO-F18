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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Showbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select id_presensi,nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri";
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

        protected void Showfilterbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri where status_kehadiran = @sk and tanggal_presensi= @tgl ";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new NpgsqlParameter("@sk", status_kehadiran.Text));
                    cmd.Parameters.Add(new NpgsqlParameter("@tgl", Convert.ToDateTime(tanggal_presensi.Text)));
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    cmd.Dispose();
                    connection.Close();
                    status_kehadiran.Text = "";
                    tanggal_presensi.Text = "";
                    GridData.DataSource = dt;
                    GridData.DataBind();
                }
            }
            catch (Exception ex) { }
        }

        protected void Sortkegbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri order by nama_kegiatan asc";
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

        protected void Sortskbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri order by status_kehadiran asc";
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

        protected void Sorttglbtn_Click(object sender, EventArgs e)
        {
            try /* Select After Validations*/
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri order by tanggal_presensi asc";
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