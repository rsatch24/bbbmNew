using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bbbm.DataModels;

namespace bbbm.Models
{
    public class ContactModel : HomePageModel
    {
        public string Name { get; set; }

        public string email { get; set; }

        public string Message { get; set; }
        public List<Reasons> Reasons { get; set; }

        public string recapthcaSiteKey { get; set; }
    }
}
