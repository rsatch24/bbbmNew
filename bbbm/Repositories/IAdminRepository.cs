﻿using bbbm.DataModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace bbbm.Repositories
{
    public interface IAdminRepository
    {
        Task<List<PageSection>> GetSectionByPageID(IDictionary<string, object> Params);

        Task UpdateSectionContent(IDictionary<string, object> Params);
        Task UpdateSectionImage(IDictionary<string, object> Params);

        public List<Page> GetPages();
        public Task<User> GetUser(IDictionary<string, object> queryParams);
    }
}