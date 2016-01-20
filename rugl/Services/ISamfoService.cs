using rugl.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace rugl.Services
{
    public interface ISamfoService : IDisposable
    {
        //Get api/Rides
        BaseService.RideResults GetRides();
    }


}