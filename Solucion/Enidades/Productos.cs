using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enidades
{
    public class Productos
    {
        public int? idProducto { get; set; }
        public int nroProducto { get; set; }
        public string nombreProducto { get; set; }
        public int idTalle { get; set; }
        public double precioVenta { get; set; }
        public double precioCompra { get; set; }
        public bool esAccesorio { get; set; }
        public string marca { get; set; }
        public int stock { get; set; }
    }
}
