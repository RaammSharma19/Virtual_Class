using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Virtual_Class.Startup))]
namespace Virtual_Class
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
