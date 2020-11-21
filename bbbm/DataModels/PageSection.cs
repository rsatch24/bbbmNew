using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace bbbm.DataModels
{
    public class PageSection
    {

        public int SectionID { get; set; }

        public int PageID { get; set; }

        public string SectionName { get; set; }

        public string SectionContent { get; set; }

        public bool isIMG { get; set; }

        public string imgsrc { get; set; }
    }
}
