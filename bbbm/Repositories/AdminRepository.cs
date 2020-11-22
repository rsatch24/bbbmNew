using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using bbbm.data;
using bbbm.DataModels;
using Dapper;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;


namespace bbbm.Repositories
{
    public class AdminRepository : IAdminRepository
    {

        private IDataAccessor _dataAccessor;
        private readonly IConfiguration _config;
        private readonly string _connString;

        public AdminRepository(IDataAccessor dataAccessor, IConfiguration config)
        {
            _dataAccessor = dataAccessor;
            _config = config;
            _connString = config.GetConnectionString("bbbm");
        }

        public async Task<List<PageSection>> GetSectionByPageID(IDictionary<string, object> Params)
        {

            string query = "SELECT * FROM Sections WHERE PageID = @PageID";
            DynamicParameters dynamicParameters = new DynamicParameters();
            foreach (KeyValuePair<string, object> kp in Params)
            {
                dynamicParameters.Add($"@{kp.Key}", kp.Value);
            }
            var ok = await _dataAccessor.GetData<PageSection>(_connString, query, dynamicParameters);
            return ok.ToList();
        }

        public async Task UpdateSectionContent(IDictionary<string, object> Params)
        {
            DynamicParameters dynamicParameters = new DynamicParameters();
            string setString = "Set SectionContent = @SectionContent";
            string whereString = "Where SectionID = @SectionID";
            foreach (KeyValuePair<string, object> kp in Params)
            {
                dynamicParameters.Add($"@{kp.Key}", kp.Value);
            }
            string query = @$"UPDATE Sections {setString} {whereString}";

            await _dataAccessor.SaveDataAsync(_connString, query, dynamicParameters);
        }

        public async Task UpdateSectionImage(IDictionary<string, object> Params)
        {
            DynamicParameters dynamicParameters = new DynamicParameters();
            string setString = "Set imgsrc = @imgsrc, SectionContent = @SectionContent";
            string whereString = "Where SectionID = @SectionID";
            foreach (KeyValuePair<string, object> kp in Params)
            {
                dynamicParameters.Add($"@{kp.Key}", kp.Value);
            }
            string query = @$"UPDATE Sections {setString} {whereString}";

            await _dataAccessor.SaveDataAsync(_connString, query, dynamicParameters);
        }

        public List<Page> GetPages()
        {
            string query = "SELECT * FROM Pages";
            var ok =  _dataAccessor.GetQuickData<Page>(_connString, query, null);
            return ok.ToList();
        }

        public async Task<User> GetUser(IDictionary<string, object> queryParams)
        {
            string query = "SELECT * FROM Users Where RoleName = @RoleName AND UserName = @UserName AND PassWord = @PassWord";
            DynamicParameters dynamicParameters = new DynamicParameters();
            foreach (KeyValuePair<string, object> kp in queryParams)
            {
                dynamicParameters.Add($"@{kp.Key}", kp.Value);
            }
            var ok =  await _dataAccessor.GetData<User>(_connString, query, dynamicParameters);

            return ok.ToList().FirstOrDefault();
        }
    }
}
