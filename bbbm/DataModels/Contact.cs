﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace bbbm.DataModels
{
    public class Contact
    {
       public string name { get; set; }
        public string email { get; set; }
        public string message { get; set; }

        public bool isSpam { get; set; }
    }
}
