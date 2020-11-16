using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using bbbm.DataModels;
using bbbm.Models;
using System.Text.Json;
using bbbm.Repositories;
using bbbm.Enums;
using Microsoft.AspNetCore.Http;

namespace bbbm.Controllers
{
    public class AdminController : Controller
    {

        private readonly IAdminRepository _adminRepo;
        private readonly List<Page> _pages;

        private readonly string _validRole = "Admin";

        public string SessionKeyName = "_UserName";

        public AdminController(IAdminRepository adminRepo)
        {
            _adminRepo = adminRepo;
            _pages = _adminRepo.GetPages();
        }

        public IActionResult Index(int? PageID)
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString(SessionKeyName)))
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                AdminModel am = fillAdminModel(PageID);
                return View(am);
            }

        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(IFormCollection form)
        {
            var name = form["nameInput"].ToString();

            var passWord = form["passWordInput"].ToString();

            IDictionary<string, object> dict = new Dictionary<string, object>();
            dict.Add("RoleName", _validRole);
            dict.Add("UserName", name);
            dict.Add("PassWord", passWord);

            var getCurrentUser = await _adminRepo.GetUser(dict);

            if (getCurrentUser != null)
            {
                HttpContext.Session.SetString(SessionKeyName, name);
                return RedirectToAction("Index", "Admin");
            }

            else
            {
                ViewData.Add("ShowUnauthorized", true);
                return View();
            }

        }

        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Admin");
        }

        public IActionResult Login()
        {
            ViewData.Add("ShowUnauthorized", false);
            return View();
        }

        private AdminModel fillAdminModel(int? PageID)
        {
            AdminModel am = new AdminModel();
            if (!PageID.HasValue || PageID == (int?)PageEnums.Home)
            {
                am.PageID = (int)PageEnums.Home;
                am.PageName = PageEnums.Home.ToString();
                am.URL = "/";
                Dictionary<string, object> paramVals = new Dictionary<string, object>();
                paramVals.Add("PageID", am.PageID);
                am.pageSections = _adminRepo.GetSectionByPageID(paramVals).Result;
                return am;
            }
            else
            {
                am.PageID = (int)PageID;
                am.PageName = _pages.Where(w => w.PageID == (int)PageID).Select(s => s.PageName).FirstOrDefault();
                Dictionary<string, object> paramVals = new Dictionary<string, object>();
                paramVals.Add("PageID", am.PageID);
                am.pageSections = _adminRepo.GetSectionByPageID(paramVals).Result;
                return am;
            }

        }

        [HttpPost]
        public async Task<JsonResult> saveContentToDB([FromBody] PageSection c)
        {

            try
            {
                IDictionary<string, object> valparams = new Dictionary<string, object>();
                valparams.Add("SectionID", c.SectionID);
                valparams.Add("SectionContent", c.SectionContent);
                await _adminRepo.UpdateSectionContent(valparams);
                return Json("success");
            }
            catch
            {
                return Json("something went wrong");
            }
        }
    }
}
