using System.Threading.Tasks;

namespace bbbm.Services
{
    public interface IEMailer
    {
        Task SendEmailAsync(string subject, string body, int contactID);
    }
}