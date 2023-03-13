using Dapper;
using Maquillaje.Entities.Entities;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Maquillaje.DataAccess.Repositories
{
    public class ProductosRepository : IRepository<tbProductos>
    {
        public int Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbProductos Find(int? id)
        {
            throw new NotImplementedException();
        }

        public int Insert(tbProductos item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbProductos> List()
        {
            using var db = new SqlConnection(TiendaContext.ConnectionString);
            return db.Query<tbProductos>(ScriptsDataBase.ProductosList, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbProductos item)
        {
            throw new NotImplementedException();
        }
    }
}
