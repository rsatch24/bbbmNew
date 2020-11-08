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

namespace bbbm.Controllers
{
    public class AdminController : Controller
    {

        private readonly IAdminRepository _adminRepo;
        private readonly List<Page> _pages;
        public AdminController(IAdminRepository adminRepo)
        {
            _adminRepo = adminRepo;
            _pages = _adminRepo.GetPages();
        }

        public IActionResult Index(int? PageID)
        {
            AdminModel am = fillAdminModel(PageID);
            return View(am);
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
            else {
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
