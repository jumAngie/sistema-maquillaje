using Maquillaje.DataAccess.Repositories;
using Maquillaje.Entities.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Maquillaje.BusinessLogic.Services
{
    public class GeneralesService
    {
        private readonly CategoriaRepository _categoriaRepository;

        public GeneralesService(CategoriaRepository categoriaRepository)
        {
            _categoriaRepository = categoriaRepository;
        }

        #region Categorias
        public IEnumerable<tbCategorias> Listado()
        {
            try
            {
                var result = _categoriaRepository.List();
                return result;
            }
            catch (Exception)
            {

                return Enumerable.Empty<tbCategorias>();
            }
        }

        #endregion
    }
}
