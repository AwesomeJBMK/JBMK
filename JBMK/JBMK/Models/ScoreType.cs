using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JBMK.Models
{
    public class ScoreType
    {
        [Key, Column(Order = 0)]
        public byte ScoreTypeKey { get; set; }
        public string ScoreTypeName { get; set; }
        public string ScoreTypeDescription { get; set; }
        public DateTime CreateDate { get; set; }
    }
}