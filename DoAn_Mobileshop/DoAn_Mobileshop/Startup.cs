using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DoAn_Mobileshop.Startup))]
namespace DoAn_Mobileshop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
