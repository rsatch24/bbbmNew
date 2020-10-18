using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace bbbm.DataModels
{
    public enum DB_Reasons
    {
       Initial = 1,
       FollowUp,
       Consultation
    }

    public class Reasons
    {
        public int ReasonID { get; set; }

        public string reason { get; set; }
    }
}
