using rugl.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rugl
{
    public partial class About : Page
    {
        public class RideObject
        {
            public string link { get; set; }
            public string from { get; set; }
            public string to { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            MyTextBox.Text = "HELLP";

            if (GetRides().Any())
            {

                MyTextBox.Text = GetRides().FirstOrDefault().to.ToString();
            }
            Repeater1.DataSource = GetRides();
            Repeater1.DataBind();

        }

        private List<RideObject> GetRides()
        {
            var ride = Factory.CreateSamfoService();
            var allRides = ride.GetRides();
            List<RideObject> ridesToShow = new List<RideObject>();

            foreach (var all in allRides.results)
            {
                RideObject r = new RideObject();
                r.from = all.from;
                r.link = all.link;
                r.to = all.to;
                ridesToShow.Add(r);
            }

            return ridesToShow;

        }
    }
}