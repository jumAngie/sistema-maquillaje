using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Maquillaje.WebUI.Models
{
    public class ProductosViewModel
    {
        [Display(Name = "Producto ID")]
        public int pro_Id { get; set; }

        [Display(Name = "Código")]
        public string pro_Codigo { get; set; }

        [Display(Name = "Nombre")]
        public string pro_Nombre { get; set; }

        [Display(Name = "Stock Inicial")]
        public string pro_StockInicial { get; set; }

        [Display(Name = "Precio Unitario")]
        public decimal pro_PrecioUnitario { get; set; }

        [Display(Name = "Proveedor")]
        public int? pro_Proveedor { get; set; }

        [Display(Name = "Categoría")]
        public int? pro_Categoria { get; set; }
    }
}
