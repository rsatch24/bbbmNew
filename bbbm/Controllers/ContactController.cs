using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using bbbm.DataModels;
using bbbm.Repositories;
using bbbm.Models;
using bbbm.Services;
using bbbm.Entities;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Microsoft.Extensions.Configuration;

namespace bbbm.Controllers
{
    public class ContactController : Controller
    {
        private readonly IContactRepository _contactRepository;
        private readonly IEMailer _emailer;
        private readonly string _recaptchaSecretKey;
        private readonly string _recaptchaSiteKey;
        public ContactController(IContactRepository contactRepository, IEMailer mailer, IConfiguration config)
        {
            _contactRepository = contactRepository;
            _emailer = mailer;
            _recaptchaSecretKey = config.GetSection("recaptchaSecretKey").Value;
            _recaptchaSiteKey = config.GetSection("recaptchaSiteKey").Value;
        }
        public IActionResult Index(ContactModel contactModel)
        {
            contactModel.Reasons = _contactRepository.GetReasons().Result;
            contactModel.recapthcaSiteKey = _recaptchaSiteKey;
            ViewData.Add("success", false);
            ViewData.Add("IsValidCaptcha", false);
            ViewData.Add("initialPageLoad", true);
            return View(contactModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SaveContact(IFormCollection form)
        {
            ContactModel cm = new ContactModel();
            cm.Reasons = _contactRepository.GetReasons().Result;
            cm.recapthcaSiteKey = _recaptchaSiteKey;

            try
            {
                /*TURN ON WHEN REAL DEPLOYMENT*/
                bool verifyRecaptcha = IsRecaptchaVerified(form);
                //bool verifyRecaptcha = true;
                if (verifyRecaptcha)
                {
                    Contact c = new Contact()
                    {
                        name = form["nameInput"].ToString(),
                        email = form["EmailInput"].ToString(),
                        message = form["message"].ToString(),
                    };

                    int contactID = _contactRepository.SaveContacts(c).Result;

                    if (contactID != 0)
                    {
                        List<int> selectedReasons = fillContactReasons(form);
                        _contactRepository.SaveContactReasons(contactID, selectedReasons);
                        string emailBody = createEmailBody(c.name, c.email, c.message, selectedReasons);
                        string emailSubject = createEmailSubject(c.name);
                        _emailer.SendEmailAsync(emailSubject, emailBody);
                    }
                    
                    ViewData.Add("success", true);
                    ViewData.Add("IsValidCaptcha", true);
                    ViewData.Add("initialPageLoad", false);
                    return View("Index");
                }
                else
                {
                    ViewData.Add("success", false);
                    ViewData.Add("IsValidCaptcha", false);
                    ViewData.Add("initialPageLoad", false);
                    return View("Index", cm);
                }
                
            }
            catch
            {
                ViewData.Add("success", false);
                ViewData.Add("initialPageLoad", false);
                return View("Index", cm);
            }
        }
           
        private List<int> fillContactReasons(IFormCollection form)
        {
            List<int> reasonsToAdd = new List<int>();

            int initial = form["reason_1"].ToString() == "on" ? 1 : 0;
            if(initial > 0)  reasonsToAdd.Add(initial);

            int followUp = form["reason_2"].ToString() == "on" ? 2 : 0;
            if (followUp > 0) reasonsToAdd.Add(followUp);

            int consulting = form["reason_3"].ToString() == "on" ? 3 : 0;
            if (consulting > 0) reasonsToAdd.Add(consulting);

            return reasonsToAdd;
        }

        private string createEmailBody(string name, string email, string message, List<int> reasons)
        {
            string concatReasons = "Reasons: <br />";
            foreach(int c in reasons)
            {
                string stringToAdd = "";
                if (c == (int)DB_Reasons.Initial) { stringToAdd = "Nutrition - Initial Consultation"; }
                if (c == (int)DB_Reasons.FollowUp) { stringToAdd = "Nutrition - Follow-up Consultation"; }
                if (c == (int)DB_Reasons.Consultation) { stringToAdd = "Functional Nutrition Consulting"; }
                concatReasons += $"{stringToAdd} <br />";
            }

            var finalBody = $"{name} with E-mail: {email} has the following message: <br /> {message} <br /> {concatReasons}";
            return finalBody;
        }

        private string createEmailSubject(string name)
        {
            return $"NEW CONTACT: {name}";
        }

        private bool IsRecaptchaVerified(IFormCollection form)
        {
            const string urlToPost = "https://www.google.com/recaptcha/api/siteverify";
            
            //const string secretKey = _recaptchaSecretKey;
            var captchaResponse = form["g-recaptcha-response"];

            if (string.IsNullOrWhiteSpace(captchaResponse)) return false;

            var validateResult = ValidateFromGoogle(urlToPost, _recaptchaSecretKey, captchaResponse);
            return validateResult.Success ? true : false;
        }
        internal class ReCaptchaResponse
        {
            [JsonProperty("success")]
            public bool Success { get; set; }

            [JsonProperty("challenge_ts")]
            public string ValidatedDateTime { get; set; }

            [JsonProperty("hostname")]
            public string HostName { get; set; }

            [JsonProperty("error-codes")]
            public List<string> ErrorCodes { get; set; }
        }
        private static ReCaptchaResponse ValidateFromGoogle(string urlToPost, string secretKey, string captchaResponse)
        {
            var postData = "secret=" + secretKey + "&response=" + captchaResponse;

            var request = (HttpWebRequest)WebRequest.Create(urlToPost);
            request.Method = "POST";
            request.ContentLength = postData.Length;
            request.ContentType = "application/x-www-form-urlencoded";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                streamWriter.Write(postData);

            string result;
            using (var response = (HttpWebResponse)request.GetResponse())
            {
                using (var reader = new StreamReader(response.GetResponseStream()))
                    result = reader.ReadToEnd();
            }

            return JsonConvert.DeserializeObject<ReCaptchaResponse>(result);
        }
    } 
}
