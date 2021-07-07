using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
    public class KPIKind
    {
        public int ID { get; set; }
        public string KPI_Kind_Name { get; set; }
        public virtual List<KPIKindLang> KPIKindLangs { get; set; }
    }
}
