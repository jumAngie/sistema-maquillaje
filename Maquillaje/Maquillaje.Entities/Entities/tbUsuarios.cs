﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Maquillaje.Entities.Entities
{
    public partial class tbUsuarios
    {
        public int usu_ID { get; set; }
        public string usu_Usuario { get; set; }
        public int usu_empID { get; set; }
        public string usu_Clave { get; set; }
        public bool usu_EsAdmin { get; set; }
        public int usu_UsuarioCrea { get; set; }
        public DateTime? usu_FechaCrea { get; set; }
        public int? usu_UsuarioModi { get; set; }
        public DateTime? usu_FechaModi { get; set; }
        public bool? usu_Estado { get; set; }

        public virtual tbEmpleados usu_emp { get; set; }
    }
}