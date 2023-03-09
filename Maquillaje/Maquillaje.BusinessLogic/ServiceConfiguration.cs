using Maquillaje.BusinessLogic.Services;
using Maquillaje.DataAccess;
using Maquillaje.DataAccess.Repositories;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Maquillaje.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection services, string connection)
        {
            services.AddScoped<CategoriaRepository>();
            TiendaContext.BuildConnectionString(connection);
        }


        public static void BussinessLogic(this IServiceCollection services)
        {
            services.AddScoped<GeneralesService>();

        }
    }
}
