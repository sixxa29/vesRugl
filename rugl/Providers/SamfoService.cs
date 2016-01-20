using Newtonsoft.Json;
using rugl.Services;
using rugl.Services.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;


namespace rugl.Providers
{


    public class SamfoService : BaseService, ISamfoService
    {
        private string BaseUrl;
        private int TIMEOUT = 1000;

        public SamfoService()
        {
            BaseUrl = "http://apis.is/rides/";
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public RideResults GetRides()
        {
            string url = BaseUrl + "samferda-passengers/";
            var rides = GetResponseObject<List<Rides>>(url);

            return rides;
        }



        /*  public List<Drivers> GetDrivers()
          {
              string url = BaseUrl + "/samferda-drivers/";
              var drivers = GetResponseObject<List<Drivers>>(url);

              return drivers;
          }*/


    }
}