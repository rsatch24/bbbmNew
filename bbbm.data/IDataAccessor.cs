using System.Collections.Generic;
using System.Threading.Tasks;

namespace bbbm.data
{
    public interface IDataAccessor
    {
        Task<List<T>> GetData<T>(string connectionString, string query, object queryParams);
        Task SaveDataAsync(string connectionString, string query, object queryParams);
        Task SaveAndReturnAsync(string connectionString, string query, object queryParams);
    }
}