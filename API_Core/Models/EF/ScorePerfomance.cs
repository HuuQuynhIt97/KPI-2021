using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
  public  class ScorePerfomance
    {
        public int ID { get; set; }
        public string Score { get; set; }
        public string Min { get; set; }
        public string Max { get; set; }
        public int KPILevel_ID { get; set; }
        public string KPILevel_Code { get; set; }
        public string Period { get; set; }
    }
}
