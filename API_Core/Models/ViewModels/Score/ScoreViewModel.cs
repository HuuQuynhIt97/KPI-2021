using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.KPILevel
{
   public class ScoreViewModel
    {
        public int? ID { get; set; }
        public string Score { get; set; }
        public string Min { get; set; }
        public string Max { get; set; }
        public string KPILevel_Code { get; set; }
        public string Period { get; set; }
        public int KPILevel_ID { get; set; }
    }
}
