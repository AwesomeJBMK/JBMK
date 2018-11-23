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
    public class SpreadController : ApiController
    {
        private JBMKContext db = new JBMKContext();


        // POST: api/Spread
        [ResponseType(typeof(List<SocialUserFriend>))]
        public async Task<IHttpActionResult> PostSpread(int socialUserKey)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var potentialUsers = await db.SocialUserFriends.Where(f => f.SocialUserKey == socialUserKey).ToListAsync();

            return Ok(potentialUsers);
        }
    }
}
