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

namespace bbbm.Controllers
{
    public class AdminController : Controller
    {

        private readonly IAdminRepository _adminRepo;
        public AdminController(IAdminRepository adminRepo)
        {
            _adminRepo = adminRepo;
        }

        public IActionResult Index()
        {
            return View();
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
