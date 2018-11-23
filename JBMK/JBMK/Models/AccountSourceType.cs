using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JBMK.Models
{
    public class AccountSourceType
    {
        [Key, Column(Order = 0)]
        public byte AccountSourceTypeKey { get; set; }
        public string AccountSourceTypeName { get; set; }
        public string AccountSourceTypeDescription { get; set; }
        public DateTime CreateDate { get; set; }
    }
}