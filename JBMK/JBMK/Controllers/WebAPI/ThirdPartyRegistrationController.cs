using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using JBMK.Models;
using JBMK.Models.Contract;

namespace JBMK.Controllers.WebAPI
{
    public class ThirdPartyRegistrationController : ApiController
    {
        private JBMKContext db = new JBMKContext();

        // POST: api/ThirdPartyRegistration
        [ResponseType(typeof(Account))]
        public async Task<IHttpActionResult> PostSocialUser(RegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (!string.IsNullOrWhiteSpace(request.SocialLoginUserName) && !string.IsNullOrWhiteSpace(request.SocialLoginPassword) && db.SocialUsers.Any(u => u.SocialLoginUserName == request.SocialLoginUserName))
            {
                var user = db.SocialUsers.Where(u => u.SocialLoginUserName == request.SocialLoginUserName).SingleOrDefault();
                if (null != user && user.SocialLoginPassword == request.SocialLoginPassword)
                {
                    Account account = new Account();
                    if (!ValidateExistingAccount(user.SocialUserKey))
                    {
                        account = new Account
                        {
                            FirstName = user.FirstName,
                            LastName = user.LastName,
                            SocialUserKey = user.SocialUserKey,
                            InvitedByAccountKey = request.InvitedByAccountKey.HasValue ? request.InvitedByAccountKey.Value : 0,
                            CreateDate = DateTime.Now,
                            ChangeDate = DateTime.Now
                        };


                        db.Accounts.Add(account);
                        await db.SaveChangesAsync();
                    }
                    else
                    {
                        account = db.Accounts.SingleOrDefault(a => a.SocialUserKey == user.SocialUserKey);
                    }

                    return Ok(account);
                }
            }

            return Ok(new Account());
        }

        private bool ValidateExistingAccount(int socialUserKey)
        {
            if (db.Accounts.Any(a => a.SocialUserKey == socialUserKey))
            {
                return true;
            }

            return false;
        }
    }
}
