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
        private readonly ProductosRepository _productosRepository;

        public GeneralesService(CategoriaRepository categoriaRepository)
        {
            _categoriaRepository = categoriaRepository;
        }

        public GeneralesService(ProductosRepository productosRepository)
        {
            _productosRepository = productosRepository;
        }


        #region Categorias
        public IEnumerable<tbCategorias> ListadoCategorias()
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

        
        #region Productos

        public IEnumerable<tbProductos> ListadoProductos()
        {
            try
            {
                var result = _productosRepository.List();
                return result;
            }
            catch (Exception)
            {

                return Enumerable.Empty<tbProductos>();
            }
        }

        #endregion
    }
}
