using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JBMK.Models
{
    public class JBMKContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public JBMKContext() : base("name=JBMKContext")
        {
        }

        public System.Data.Entity.DbSet<JBMK.Models.User> Users { get; set; }

        public System.Data.Entity.DbSet<JBMK.Models.SocialUser> SocialUsers { get; set; }
        public System.Data.Entity.DbSet<JBMK.Models.SocialUserFriend> SocialUserFriends { get; set; }
        public System.Data.Entity.DbSet<JBMK.Models.AccountSourceType> AccountSourceTypes { get; set; }
        public System.Data.Entity.DbSet<JBMK.Models.Account> Accounts { get; set; }
        public System.Data.Entity.DbSet<JBMK.Models.AccountScoreHistory> AccountScoreHistorys { get; set; }
        public System.Data.Entity.DbSet<JBMK.Models.ScoreType> ScoreTypes { get; set; }
    }
}
