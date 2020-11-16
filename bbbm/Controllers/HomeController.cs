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
            AboutPageModel np = FillAboutPageModel();
            return View(np);
           
        }
        private AboutPageModel FillAboutPageModel()
        {
            AboutPageModel np = new AboutPageModel();
            np.PageID = (int)PageEnums.About;
            np.PageName = PageEnums.About.ToString();
            np.URL = "/About";
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", np.PageID);
            np.pageSections = _adminRepository.GetSectionByPageID(paramVals).Result;

            return np;
        }
        public IActionResult FAQ()
        {
            FAQPageModel np = fillFAQModel();
            return View(np);
        }

        private FAQPageModel fillFAQModel()
        {
            FAQPageModel np = new FAQPageModel();
            np.PageID = (int)PageEnums.FAQ;
            np.PageName = PageEnums.FAQ.ToString();
            np.URL = "/FAQ";
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", np.PageID);
            np.pageSections = _adminRepository.GetSectionByPageID(paramVals).Result;

            return np;
        }

        public IActionResult CorporateEngagement()
        {
            CorporateEngagementModel np = FillCorpPageModel();
            return View(np);
        }
        private CorporateEngagementModel FillCorpPageModel()
        {
            CorporateEngagementModel np = new CorporateEngagementModel();
            np.PageID = (int)PageEnums.CorporateEngagement;
            np.PageName = PageEnums.CorporateEngagement.ToString();
            np.URL = "/CorporateEngagment";
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", np.PageID);
            np.pageSections = _adminRepository.GetSectionByPageID(paramVals).Result;

            return np;
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
