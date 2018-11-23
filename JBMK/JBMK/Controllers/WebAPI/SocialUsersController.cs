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

namespace JBMK.Controllers.WebAPI
{
    public class SocialUsersController : ApiController
    {
        private JBMKContext db = new JBMKContext();

        // GET: api/SocialUsers
        public IQueryable<SocialUser> GetSocialUsers()
        {
            return db.SocialUsers;
        }

        // GET: api/SocialUsers/5
        [ResponseType(typeof(SocialUser))]
        public async Task<IHttpActionResult> GetSocialUser(string id)
        {
            SocialUser socialUser = await db.SocialUsers.FindAsync(id);
            if (socialUser == null)
            {
                return NotFound();
            }

            return Ok(socialUser);
        }

        // PUT: api/SocialUsers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutSocialUser(int id, SocialUser socialUser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != socialUser.SocialUserKey)
            {
                return BadRequest();
            }

            db.Entry(socialUser).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SocialUserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/SocialUsers
        [ResponseType(typeof(SocialUser))]
        public async Task<IHttpActionResult> PostSocialUser(SocialUser socialUser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SocialUsers.Add(socialUser);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = socialUser.SocialUserKey }, socialUser);
        }

        // DELETE: api/SocialUsers/5
        [ResponseType(typeof(SocialUser))]
        public async Task<IHttpActionResult> DeleteSocialUser(string id)
        {
            SocialUser socialUser = await db.SocialUsers.FindAsync(id);
            if (socialUser == null)
            {
                return NotFound();
            }

            db.SocialUsers.Remove(socialUser);
            await db.SaveChangesAsync();

            return Ok(socialUser);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SocialUserExists(int id)
        {
            return db.SocialUsers.Count(e => e.SocialUserKey == id) > 0;
        }
    }
}