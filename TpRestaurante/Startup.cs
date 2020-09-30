using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TpRestaurante.Startup))]
namespace TpRestaurante
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
