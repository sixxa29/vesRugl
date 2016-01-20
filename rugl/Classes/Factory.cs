using rugl.Providers;
using rugl.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace rugl.Classes
{
    public class Factory
    {
        public static ISamfoService CreateSamfoService()
        {
            return new SamfoService();
        }
    }
}