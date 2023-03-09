using AutoMapper;
using Maquillaje.BusinessLogic.Services;
using Maquillaje.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Maquillaje.WebUI.Controllers
{
    public class CategoriaController : Controller
    {
        private readonly GeneralesService _generalesService;
        private readonly IMapper _mapper;


        public CategoriaController(GeneralesService generalesService, IMapper mapper)
        {
            _generalesService = generalesService;
            _mapper = mapper;
        }

        [HttpGet("/Categorias/Listado")]
        public IActionResult Index()
        {
            var listado = _generalesService.Listado();
            var listadoMapeado = _mapper.Map<IEnumerable<CategoriaViewModel>>(listado);
            return View(listadoMapeado);
        }
    }
}
