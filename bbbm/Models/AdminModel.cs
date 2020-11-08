using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bbbm.DataModels;

namespace bbbm.Models
{
    public class AdminModel
    {
        public int PageID { get; set; }
        public string PageName { get; set; }
        public string URL { get; set; }

        public List<PageSection> pageSections { get; set; }
    }
}
