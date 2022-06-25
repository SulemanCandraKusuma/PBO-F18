<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PondokPesantren._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-color:#DBDFFD">
        <h1> Pesantren Syafi'ur rohman</h1>
        <p class="lead">Alamat: Jl. Brantas XXVI No.251, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121</p>
        <p><a href="https://www.facebook.com/ppmsrjember/" class="btn btn-primary btn-lg">Selengkapnya &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Rekap presensi</h2>
            <p>
                Berisi semua data presensi yang pernah dicatat oleh admin sehingga semua tanggal, kegiatan, dan status kehadiran akan ditampilkan.
            </p>
            <asp:Button ID="ShowButton" runat="server" Text="Show" OnClick="Showbtn_Click" Style="width: 60px" />  
         <div class="row">

         </div>
        </div>
        <div class="col-md-4">
            <h2>Filter presensi</h2>
            <p>
                Data yang muncul akan di filter berdasarkan data inputan pada kolom dibawah. 
            </p>
            <p> (Contoh: kehadiran = 'alpha' tanggal = '23-06-2022')</p>
            <label for="status_kehadiran" class="form-label">Status Kehadiran (hadir, alpha, atau ijin)</label>
            <asp:TextBox ID="status_kehadiran" runat="server"></asp:TextBox> <br> 
            <label for="tanggal_presensi" class="form-label">Tanggal Presensi</label> <br>
            <asp:TextBox ID="tanggal_presensi" runat="server"></asp:TextBox>  <br><br />
            <asp:Button ID="ShowFilterButton" runat="server" Text="Show" OnClick="Showfilterbtn_Click" Style="width: 60px" />  
        </div>
        <div class="col-md-4">
            <h2>Sorting</h2>
            <p>
                Menampilkan semua data absen dengan urutan opsi yang dipilih. (contoh: tombol kegiatan untuk mengurutkan data presensi berdasarkan kegiatan)
            </p>
            <asp:Button ID="SortkegiatanButton" runat="server" Text="Kegiatan" OnClick="Sortkegbtn_Click" Style="width: 70px" /> 
            <asp:Button ID="SortskButton" runat="server" Text="Status Kehadiran" OnClick="Sortskbtn_Click" Style="width: 120px" />
            <asp:Button ID="SorttglButton" runat="server" Text="Tanggal" OnClick="Sorttglbtn_Click" Style="width: 70px" />
        </div>
    </div>
     <%-- READ --%>
    <div>
        <h2 class="text-center">Data Presensi</h2>
    </div>
     <div class="row mt-4">
         <asp:GridView ID="GridData" runat="server" CssClass="table"></asp:GridView>
     </div>

</asp:Content>
