using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
    public class KPI : Inheritance
    {
        public string CategoryCode { get; set; }
        public int CategoryID { get; set; }
        public int Unit { get; set; }
        public bool? Status { get; set; }
        public int UserID { get; set; }
        public int? KPI_Kind_ID { get; set; }
        public string  Description { get; set; }
        public virtual List<KPILang> KPILangs { get; set; }


    }
}
