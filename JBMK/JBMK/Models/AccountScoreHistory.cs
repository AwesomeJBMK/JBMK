using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JBMK.Models
{
    public class AccountScoreHistory
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long AccountScoreHistoryKey { get; set; }
        public long AccountKey { get; set; }
        public byte ScoreTypeKey { get; set; }
        public int Score { get; set; }
        public bool IsRewarded { get; set; }
        public DateTime CreateDate { get; set; }
    }
}