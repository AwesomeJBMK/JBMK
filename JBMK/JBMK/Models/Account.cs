using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JBMK.Models
{
    public class Account
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long AccountKey { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public long InvitedByAccountKey { get; set; }
        public byte AccountSourceTypeKey { get; set; }
        public int ValidScore { get; set; }
        public int SocialUserKey { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ChangeDate { get; set; }
    }
}