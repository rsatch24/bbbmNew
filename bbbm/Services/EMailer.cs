using bbbm.Entities;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Options;
using bbbm.data;
using Microsoft.Extensions.Configuration;
using Dapper;
using System.Data;
using System.Security.Authentication;
//using System.Net;
//using System.Net.Mail;

namespace bbbm.Services
{
    public class EMailer : IEMailer
    {
        private readonly SmtpSettings _smtpSettings;
        private IDataAccessor _dataAccessor;
        private readonly IConfiguration _config;
        private readonly string _connString;

        public EMailer(IOptions<SmtpSettings> smtpSettings, IDataAccessor dataAccessor, IConfiguration config)
        {
            _smtpSettings = smtpSettings.Value;

            _dataAccessor = dataAccessor;
            _config = config;
            _connString = config.GetConnectionString("bbbm");

        }
        public async Task SendEmailAsync(string subject, string body, int contactID)
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
                var query = $@"INSERT INTO logging(ContactID, Message) 
				               VALUES(@ContactID, @Message);";


                DynamicParameters parameters = new DynamicParameters();

                parameters.Add("@ContactID", contactID, DbType.Int32, ParameterDirection.Input);
                parameters.Add("@Message", "Email sent successfully", DbType.String, ParameterDirection.Input);

                await _dataAccessor.SaveDataAsync(_connString, query, parameters);
            }
            catch (Exception e)
            {
                var query = $@"INSERT INTO logging(ContactID, Message) 
				               VALUES(@ContactID, @Message);";


                DynamicParameters parameters = new DynamicParameters();

                parameters.Add("@ContactID", contactID, DbType.Int32, ParameterDirection.Input);
                parameters.Add("@Message", e.Message, DbType.String, ParameterDirection.Input);

                await _dataAccessor.SaveDataAsync(_connString, query, parameters);
                throw new InvalidOperationException(e.Message);

            }
        }


        //public void sendEmail (string subject, string body)
        //{
        //    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
        //    //create the mail message 
        //    MailMessage mail = new MailMessage();

        //    //set the addresses 
        //    mail.From = new MailAddress("postmaster@bbbmnutrition.com"); //IMPORTANT: This must be same as your smtp authentication address.
        //    mail.To.Add("rsatch24@gmail.com");

        //    //set the content 
        //    mail.Subject = "This is an email";
        //    mail.Body = "This is from system.net.mail using C sharp with smtp authentication.";
        //    //send the message 
        //    SmtpClient smtp = new SmtpClient("mail5016.site4now.net");

        //    //IMPORANT:  Your smtp login email MUST be same as your FROM address. 
        //    NetworkCredential Credentials = new NetworkCredential("postmaster@bbbmnutrition.com", "bbbm091920!@#$");
        //    smtp.UseDefaultCredentials = false;
        //    smtp.Credentials = Credentials;
        //    smtp.Port = 465;    //alternative port number is 8889
        //    smtp.EnableSsl = true;
        //    smtp.Send(mail);
        //  // lblMessage.Text = "Mail Sent";

        //}
    }
}
