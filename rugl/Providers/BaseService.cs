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
    public class BaseService
    {
        private int TIMEOUT = 1000;
        protected virtual string DoRequest(string url, Action<HttpWebRequest> setup)
        {

            var request = (HttpWebRequest)WebRequest.Create(url);

            request.Accept = "application/json";

            setup(request);

            try
            {

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                var content = new StreamReader(response.GetResponseStream()).ReadToEnd();

                return content;
            }
            catch (Exception ex)
            {
            }
            return "[]";
        }

        protected virtual string PostObjectReturningContent(string url, object obj)
        {
            return DoRequest(url, request =>
            {
                request.Method = "POST";
                request.ContentType = "application/json; charset=utf-8";
                SetTimeout(request);
                var str = JsonConvert.SerializeObject(obj);
                var stream = request.GetRequestStream();

                var bytes = UTF8Encoding.UTF8.GetBytes(str);

                stream.Write(bytes, 0, bytes.Length);

                stream.Close();
            });
        }
        private void SetTimeout(HttpWebRequest r)
        {
            if (TIMEOUT > 0) r.Timeout = TIMEOUT;
        }

        public class RideResults
        {
            public List<Rides> results { get; set; }
        }

        public class DriverResults
        {
            public List<Drivers> results { get; set; }
        }

        public RideResults GetResponseObject<T>(string url)
        {

            var obj = default(T);
            var content = GetResponseContent(url);

            // check if we are expecting a single object but empty array is returned
            try
            {
                if (content.Equals("[]") && !(typeof(T).FullName.StartsWith("System.Collections.Generic.IEnumerable")))
                    content = "{}";
            }
            catch (Exception ex)
            {

            }

            var mList = JsonConvert.DeserializeObject<RideResults>(content);

            return mList;
        }

        protected virtual string GetResponseContent(string url)
        {
            return DoRequest(url, r => { SetTimeout(r); });
        }

    }
}