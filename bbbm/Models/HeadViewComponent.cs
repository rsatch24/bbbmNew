using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using bbbm.data;
using Microsoft.Extensions.Configuration;
using bbbm.Repositories;
namespace bbbm.Models
{
    public class HeadViewComponent : ViewComponent
    {
        private readonly IAdminRepository _adminRepository;


        public HeadViewComponent(IAdminRepository adminRepository)
        {
            _adminRepository = adminRepository;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            HeaderModel hh = new HeaderModel();
            hh.PageID = 7;
            Dictionary<string, object> paramVals = new Dictionary<string, object>();
            paramVals.Add("PageID", hh.PageID);
            var t = await _adminRepository.GetSectionByPageID(paramVals);
            hh.pageSections = t.ToList();

            return View("Default", hh);
        }
    }
}
