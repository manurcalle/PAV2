<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Productos.aspx.cs" Inherits="ABMS_Productos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>PRODUCTOS</h2>
    <div>
    <asp:Label ID="lblNombreProducto" runat="server" Text="Nombre Producto: "></asp:Label><asp:TextBox ID="txtNombreProducto" runat="server"></asp:TextBox>
    </div>
    <div>   
        <asp:Label ID="lblMarca" runat="server" Text="Marca: "></asp:Label><asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
    </div>
    <div>   
        <asp:Label ID="lblTalle" runat="server" Text="Talle: "></asp:Label><asp:DropDownList ID="ddlTalle" runat="server"></asp:DropDownList>
    </div>
    <div>   
        <asp:Label ID="lblPrevioVenta" runat="server" Text="Precio Venta: "></asp:Label><asp:TextBox ID="txtPrecioVenta" runat="server"></asp:TextBox>
    </div>
    <div>   
        <asp:Label ID="lblPrecioCompra" runat="server" Text="Precio Compra: "></asp:Label><asp:TextBox ID="txtPrecioCompra" runat="server"></asp:TextBox>
    </div>
    <div>   
        <asp:CheckBox ID="cbEsAccesorio" runat="server" /><asp:Label ID="esAccesorio" runat="server" Text=" Es Accesorio"></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblStock" runat="server" Text="Stock: "></asp:Label>
        <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
    </div>
    <div>
        <asp:GridView ID="dgvProductos" runat="server"></asp:GridView>
    </div>
    
</asp:Content>

