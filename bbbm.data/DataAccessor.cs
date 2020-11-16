using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using Dapper;
using System.Linq;
using System.Threading.Tasks;


namespace bbbm.data
{
    public class DataAccessor : IDataAccessor
    {
        public async Task<List<T>> GetData<T>(string connectionString, string query, object queryParams)
        {
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                var ok = await connection.QueryAsync<T>(query, queryParams);
                return ok.ToList();
            }
        }

        public async Task SaveDataAsync(string connectionString, string query, object queryParams)
        {
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    await connection.ExecuteAsync(query, queryParams);
                }
                catch (MySqlException ex)
                {
                    Console.Write(ex.Message);
                }
            }
        }

        public async Task SaveAndReturnAsync(string connectionString, string query, object queryParams)
        {
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                   var t = await connection.ExecuteAsync(query, queryParams, commandType: CommandType.StoredProcedure);
            }
        }

        public List<T> GetQuickData<T>(string connectionString, string query, object queryParams)
        {
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                var ok = connection.Query<T>(query, queryParams);
                return ok.ToList();
            }
        }

    }
}
