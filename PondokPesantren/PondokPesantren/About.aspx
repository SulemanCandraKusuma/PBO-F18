<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PondokPesantren.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <h2>Tambah Data</h2>
    <h3>Masukkan data presensi pada halaman ini</h3>
    <p>*ketik tombol untuk menampilkan keterangan dari tiap kolom inputan yang kurang jelas</p>--%>


 <div class="container">
     <div class="row">
         <div class="col-md-6">
             <h2>Memperbarui Data</h2> <br>
             <label for="id_kegiatan" class="form-label">Kegiatan (id)</label> <br>
             <asp:TextBox ID="id_kegiatan" runat="server"></asp:TextBox> 
             <asp:Button ID="ShowKegiatanButton" runat="server" Text="Detail" OnClick="Showkegiatanbtn_Click" Style="width: 60px" /> <br>
             <label for="id_guru" class="form-label">Guru (id)</label> <br>
             <asp:TextBox ID="id_guru" runat="server"></asp:TextBox> 
             <asp:Button ID="ShowGuruButton" runat="server" Text="Detail" OnClick="Showgurubtn_Click" Style="width: 60px" />  <br>
             <label for="id_santri" class="form-label">santri  (id)</label> <br>
             <asp:TextBox ID="id_santri" runat="server"></asp:TextBox> 
             <asp:Button ID="ShowSantriButton" runat="server" Text="Detail" OnClick="Showsantribtn_Click" Style="width: 60px" />  <br>
             <label for="status_kehadiran" class="form-label">Status Kehadiran (hadir, alpha, atau ijin)</label> <br>
             <asp:TextBox ID="status_kehadiran" runat="server"></asp:TextBox>  <br>
             <label for="tanggal_presensi" class="form-label">Tanggal Presensi</label> <br>
             <asp:TextBox ID="tanggal_presensi" runat="server"></asp:TextBox> <br> <br />
             <asp:Button ID="InsertButton" runat="server" Text="Tambah Data" OnClick="Insertbtn_Click" Style="width: 120px" /> <br> <br />
             <asp:Label ID="Massage" runat="server" Font-Size="Larger">Massage</asp:Label>
         </div>

         <div class="col-md-6">
             <h2 class="text-center">Tabel Detail</h2> <br>
             <asp:GridView ID="GridData" runat="server" CssClass="table"></asp:GridView>
         </div>
     </div>

</div>
</asp:Content>

