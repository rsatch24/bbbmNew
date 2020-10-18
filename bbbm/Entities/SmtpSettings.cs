using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace bbbm.Entities
{
    public class SmtpSettings
    {
        public string Server { get; set; }
        public string Port { get; set; }
        public string SenderName { get; set; }

        public string SenderEmail { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Recipient { get; set; }

        public string RecipientEmail { get; set; }
       
    }
}
