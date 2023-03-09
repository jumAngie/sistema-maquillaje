using AutoMapper;
using Maquillaje.Entities.Entities;
using Maquillaje.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Maquillaje.WebUI.Extensions
{
    public class MappingProfileExtensions : Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<CategoriaViewModel, tbCategorias>().ReverseMap();
        }
    }
}
