using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(rugl.Startup))]
namespace rugl
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
