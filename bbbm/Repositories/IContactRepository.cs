using bbbm.DataModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace bbbm.Repositories
{
    public interface IContactRepository
    {
        //Task SaveContacts(Contact c);
        Task SaveContactReasons(int contactID, List<int> reasons);
        Task<int> SaveContacts(Contact c);

        Task SaveBotContacts(Contact c);
        Task<List<Reasons>> GetReasons();
    }
}