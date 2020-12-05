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
    public class ContactRepository : IContactRepository
    {

        private IDataAccessor _dataAccessor;
        private readonly IConfiguration _config;
        private readonly string _connString;
        
        public ContactRepository(IDataAccessor dataAccessor, IConfiguration config)
        {
            _dataAccessor = dataAccessor;
            _config = config;
            _connString = config.GetConnectionString("bbbm");
        }

        public async Task<List<Reasons>> GetReasons()
        {
            string query = "SELECT * FROM Reasons";
             var ok =  await _dataAccessor.GetData<Reasons>(_connString, query, null);
            return ok.ToList();
        }

        public async Task<int> SaveContacts(Contact c)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@user_Name", c.name, DbType.String, ParameterDirection.Input);
            parameters.Add("@Email", c.email, DbType.String, ParameterDirection.Input);
            parameters.Add("@Message", c.message, dbType: DbType.String, direction: ParameterDirection.Input);
            parameters.Add("@out_id", dbType: DbType.Int32, direction: ParameterDirection.Output);
            string query = $"sp_createContact";
            try
            {
                await _dataAccessor.SaveAndReturnAsync(_connString, query, parameters);
                return parameters.Get<int>("@out_id");
            }
            catch (MySqlException ex)
            {
                Console.Write(ex.Message);
                return 0;
            }

        }
        public async Task SaveBotContacts(Contact c)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@Name", c.name);
            parameters.Add("@Email", c.email);
            parameters.Add("@Message", c.message);
            parameters.Add("@IsSpam", c.isSpam);
            string query = $"INSERT INTO Contact(Name, Email, Message, IsSpam) VALUES(@Name, @Email, @Message, @IsSpam)";
            try
            {
                await _dataAccessor.SaveDataAsync(_connString, query, parameters);
            }
            catch (MySqlException ex)
            {
                Console.Write(ex.Message);
            }

        }

        public async Task SaveContactReasons(int contactID, List<int> reasons)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@contactID", contactID, DbType.Int32, ParameterDirection.Input);
            string query = $"INSERT INTO ContactReasons(ContactID, ReasonID) VALUES(@contactID, @reasonID)";

            try
            {
                foreach (int r in reasons) {
                    parameters.Add("@reasonID", r, DbType.Int32, ParameterDirection.Input);
                    await _dataAccessor.SaveDataAsync(_connString, query, parameters);
                }
            }
            catch (MySqlException ex)
            {
                Console.Write(ex.Message);
            }

        }

    }
}
