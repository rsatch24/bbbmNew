using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using bbbm.Models;
using bbbm.DataModels;
using bbbm.Repositories;
using bbbm.Enums;
namespace bbbm.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IAdminRepository _adminRepository;

        public HomeController(ILogger<HomeController> logger, IAdminRepository adminRepository)
        {
            _logger = logger;
            _adminRepository = adminRepository;
        }

        public IActionResult Index()
        {
            HomePageModel hp = fillHomePageModel();
            return View(hp);
        }

        private HomePageModel fillHomePageModel()
        {
            HomePageModel hp = new HomePageModel();
            hp.PageID = (int)PageEnums.Home;
            hp.PageName = PageEnums.Home.ToString();
            hp.URL = "/";
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", hp.PageID);
            hp.pageSections = _adminRepository.GetSectionByPageID(paramVals).Result;

            return hp;
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult About()
        {
            return View();
        }
        public IActionResult FAQ()
        {
            return View();
        }

        public IActionResult CorporateEngagement()
        {
            return View();
        }
        public IActionResult IntegrativeNutrition()
        {
            IntNutritionPageModel np = FillNutritionPageModel();
            return View(np);
        }

        private IntNutritionPageModel FillNutritionPageModel()
        {
            IntNutritionPageModel np = new IntNutritionPageModel();
            np.PageID = (int)PageEnums.IntegrativeNutrition;
            np.PageName = PageEnums.IntegrativeNutrition.ToString();
            np.URL = "/IntegrativeNutrition";
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", np.PageID);
            np.pageSections = _adminRepository.GetSectionByPageID(paramVals).Result;

            return np;
        }




        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
