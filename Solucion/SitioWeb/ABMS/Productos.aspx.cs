using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Enidades;
using Gestores;

public partial class ABMS_Productos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarGrilla();
        cargarCombo();
    }
    private void cargarGrilla()
    {
        dgvProductos.DataSource = GestorProductos.ObtenerProductos();
        dgvProductos.DataBind();
    }
    private void cargarCombo()
    {
        ddlTalle.DataSource = GestorTalles.ObtenerTalles();
        ddlTalle.DataTextField = "nombreTalle";
        ddlTalle.DataValueField = "nroTalle";
        ddlTalle.DataBind();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {

    }
}