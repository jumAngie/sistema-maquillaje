﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Maquillaje.Entities.Entities
{
    public partial class tbDepartamentos
    {
        public tbDepartamentos()
        {
            tbMunicipios = new HashSet<tbMunicipios>();
        }

        public int dep_ID { get; set; }
        public string dep_Descripcion { get; set; }
        public int dep_UsuarioCrea { get; set; }
        public DateTime? dep_FechaCrea { get; set; }
        public int? dep_UsuarioModi { get; set; }
        public DateTime? dep_FechaModi { get; set; }

        public virtual ICollection<tbMunicipios> tbMunicipios { get; set; }
    }
}