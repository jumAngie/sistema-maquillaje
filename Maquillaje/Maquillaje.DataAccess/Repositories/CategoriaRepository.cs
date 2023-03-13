using Dapper;
using Maquillaje.Entities.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Maquillaje.DataAccess.Repositories
{
    public class CategoriaRepository : IRepository<tbCategorias>
    {
        public int Delete(int? id)
        {
            //investigar
            throw new NotImplementedException();
        }

        public tbCategorias Find(int? id)
        {
            using var db = new TiendaContext();
            var result = db.tbCategorias.Find(id);

            return result;
        }

        public int Insert(tbCategorias item)
        {
            using var db = new TiendaContext();

            db.tbCategorias.Add(item);
            db.SaveChanges();
            return item.cat_Id;
        }

        public IEnumerable<tbCategorias> List()
        {
            
            using var db = new SqlConnection(TiendaContext.ConnectionString);
            return db.Query<tbCategorias>(ScriptsDataBase.CategoriasList, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbCategorias item)
        {
            using var db = new TiendaContext();
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();

            return item.cat_Id;
        }
    }
}


//////using var db = new TiendaContext();
////var listado = db.tbCategorias.ToList();

////return listado;
//using var db = new SqlConnection(TiendaContext.ConnectionString);
////var parametors = new DynamicParameters();
////parametors.Add("@Parametro", "dd", DbType.String, ParameterDirection.Input);

//return db.Query<tbCategorias>(ScriptsDataBase.CategoriasList, null, commandType: CommandType.StoredProcedure);
