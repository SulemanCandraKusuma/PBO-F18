<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PondokPesantren.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
<%--    <h3>Menampilkan & Memperbarui Data</h3>--%>

 <div class="container">

     <div class="row">
         <div class="col-md-6">
             <h2>Edit Data</h2>
             <label for="id_presensi" class="form-label">Presensi (id)</label> <br>
             <asp:TextBox ID="id_presensi" runat="server"></asp:TextBox>  <br>
             <label for="id_kegiatan" class="form-label">Kegiatan (id)</label> <br>
             <asp:TextBox ID="id_kegiatan" runat="server"></asp:TextBox>  <br>
             <label for="id_guru" class="form-label">Guru (id)</label> <br>
             <asp:TextBox ID="id_guru" runat="server"></asp:TextBox>  <br>
             <label for="id_santri" class="form-label">santri  (id)</label> <br>
             <asp:TextBox ID="id_santri" runat="server"></asp:TextBox> <br>
             <label for="status_kehadiran" class="form-label">Status Kehadiran (hadir, alpha, atau ijin)</label> <br>
             <asp:TextBox ID="status_kehadiran" runat="server"></asp:TextBox>  <br>
             <label for="tanggal_presensi" class="form-label">Tanggal Presensi</label><br>
             <asp:TextBox ID="tanggal_presensi" runat="server"></asp:TextBox> <br> <br />
             <asp:Button ID="UpdateButton" runat="server" Text="Ubah" OnClick="Updatebtn_Click" Style="width: 60px" />  <br> <br />
             <asp:Label ID="Massage" runat="server" Font-Size="Larger">Massage</asp:Label><br>
         </div>
         <div class="col-md-6">
             <h2>Menghapus Data</h2> <br>
             <label for="delpresensi" class="form-label">ID Presensi</label> <br>
             <asp:TextBox ID="delpresensi" runat="server"></asp:TextBox>  <br> <br />
             <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-prymary" OnClick="Deletebtn_Click" Style="width: 80px" />  <br> <br />
             <asp:Label ID="MassageDel" runat="server" Font-Size="Larger">Massage</asp:Label> <br>
         </div>
     </div>
        <%-- UPDATE DATA --%>
         <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                 
             </div>
         </div>

         <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                 
             </div>
         </div>

         <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                 
             </div>
         </div>

        <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                  
             </div>
         </div>
        <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                 
             </div>
         </div>
        <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                  
             </div>
         </div>
        <br>
        <div class="row">
            <div class="col-lg-3">
                
            </div>
            <div class="col-lg-9">
                
            </div>
        </div>
        <br>
     <%-- Delete --%>
        <div class="row">
             
         </div>

        <div class="row">
             <div class="col-lh-4">
                 
             </div>
             <div class="col-lh-8">
                 
             </div>
        </div>
        <br>
        <div class="row">
            <div class="col-lg-3">
                
            </div>
            <div class="col-lg-9">
                
             </div>
        </div>
</div>
</asp:Content>
