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
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Updatebtn_Click(object sender, EventArgs e)
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
                    cmd.CommandText = "update presensi set id_kegiatan = @idk, id_guru = @idg, id_santri = @ids, status_kehadiran = @sk, tanggal_presensi = @tgl where id_presensi = @idp";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new NpgsqlParameter("@idp", Convert.ToInt32(id_presensi.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@idk", Convert.ToInt32(id_kegiatan.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@idg", Convert.ToInt32(id_guru.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@ids", Convert.ToInt32(id_santri.Text)));
                    cmd.Parameters.Add(new NpgsqlParameter("@sk", status_kehadiran.Text));
                    cmd.Parameters.Add(new NpgsqlParameter("@tgl", Convert.ToDateTime(tanggal_presensi.Text)));
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                    id_presensi.Text = "";
                    id_kegiatan.Text = "";
                    id_guru.Text = "";
                    id_santri.Text = "";
                    status_kehadiran.Text = "";
                    tanggal_presensi.Text = "";
                    Massage.Text = "Data telah diubah";
                }
            }
            catch (Exception ex)
            {
                Massage.Text = ex.Message;
            }
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
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
                    cmd.CommandText = "delete from presensi where id_presensi = @idp";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new NpgsqlParameter("@idp", Convert.ToInt32(delpresensi.Text)));
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                    delpresensi.Text = "";
                    MassageDel.Text = "Data Telah dihapus";
                }
            }
            catch (Exception ex)
            {
                MassageDel.Text = ex.Message;
            }
        }
    }
}