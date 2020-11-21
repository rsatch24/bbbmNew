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
using System.Web;
using System.Web;
using System.IO;

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

        public IActionResult Index()
        {
                return RedirectToAction("Login", "Admin");
        }

        public IActionResult LoadContent(int PageID)
           
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString(SessionKeyName)))
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                AdminModel am = fillAdminModel(PageID);
                return View("Index", am);
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
                return RedirectToAction("LoadContent", "Admin");
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

        [HttpPost]
        public async Task<IActionResult> UploadFiles(IFormCollection form, IFormFile file)
        {
            if (file == null || file.Length == 0)
                return Content("file not selected");

            var path = Path.Combine(
                        Directory.GetCurrentDirectory(), "wwwroot", "content",
                        file.FileName);

            using (var stream = new FileStream(path, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            string imGPathName = $"/content/{file.FileName}";

            var t = form["fileSectionID"].ToString();
            
             var page = form["filePageID"].ToString();
            IDictionary<string, object> valparams = new Dictionary<string, object>();
            valparams.Add("sectionID", Convert.ToInt32(t));
            valparams.Add("imgsrc", imGPathName);

             await _adminRepo.UpdateSectionImage(valparams);

            return RedirectToAction("LoadContent", "Admin", new { PageID = Convert.ToInt32(page)});
        }
    }
}   
