using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace rugl.ApiControllers
{
    public class SamfoController : ApiController
    {

        public  SamfoController()
        {
           
        }

        [HttpGet]
        public HttpResponseMessage GetRides()
        {
            return Request.CreateResponse(HttpStatusCode.OK);
        }


    }
}
