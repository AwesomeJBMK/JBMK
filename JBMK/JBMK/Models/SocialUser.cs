using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JBMK.Models
{
    public class SocialUser
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SocialUserKey { get; set; }
        public string SocialLoginUserName { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string SocialLoginPassword { get; set; }
    }
}