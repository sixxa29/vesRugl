using rugl.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace rugl.Classes
{
    public interface IFactory
    {
        ISamfoService CreateSamfoService();
    }
}