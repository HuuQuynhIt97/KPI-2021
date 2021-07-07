using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.KPI
{
    public class KPIVM
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public int Unit { get; set; }
        public string NameVI { get; set; }
        public string NameEn { get; set; }
        public string Description { get; set; }
        public string NameTW { get; set; }
        public int UserID { get; set; }
        public int KPI_Kind_ID { get; set; }
        public bool? Status { get; set; }
    }
}
