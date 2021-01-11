using bbbm.Entities;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Options;

namespace bbbm.Services
{
    public class EMailer : IEMailer
    {
        private readonly SmtpSettings _smtpSettings;
        
        
        public EMailer(IOptions<SmtpSettings> smtpSettings)
        {
            _smtpSettings = smtpSettings.Value;

        }
        public async Task SendEmailAsync(string subject, string body)
        {
            try
            {

                var message = new MimeMessage();

                //always send from system email
                message.From.Add(new MailboxAddress(_smtpSettings.SenderName, _smtpSettings.SenderEmail));

                //awlays send to Joshua's email
                message.To.Add(new MailboxAddress(_smtpSettings.Recipient, _smtpSettings.RecipientEmail));
                message.To.Add(new MailboxAddress("System Admin", "rsatch24@gmail.com"));

                message.Subject = subject;
                message.Body = new TextPart("html") { Text = body };

                using (var client = new SmtpClient())
                {
                    await client.ConnectAsync(_smtpSettings.Server, Convert.ToInt32(_smtpSettings.Port), true);
                    await client.AuthenticateAsync(_smtpSettings.Username, _smtpSettings.Password);
                    await client.SendAsync(message);
                    await client.DisconnectAsync(true);
                }
            }
            catch (Exception e) {
                throw new InvalidOperationException(e.Message);
            }
        }
    }
}
