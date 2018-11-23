using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JBMK.Models.Contract
{
    public class RegistrationRequest
    {
        public string SocialLoginUserName { get; set; }
        public string SocialLoginPassword { get; set; }
        public int? InvitedByAccountKey { get; set; }
    }
}