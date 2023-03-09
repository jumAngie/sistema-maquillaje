using System;
using System.Collections.Generic;
using System.Text;

namespace Maquillaje.DataAccess.Repositories
{
    public interface IRepository<T>
    {
        public IEnumerable<T> List();

        public int Insert(T item);

        public int Update(T item);

        public int Delete(int? id);

        public T Find(int? id);
    }
}
