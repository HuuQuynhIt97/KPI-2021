using Models.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
   public class KPIKindLang
    {
        public int ID { get; set; }
        public string LanguageID { get; set; }
        public string Name { get; set; }
        public int? KPI_Kind_ID { get; set; }
        [ForeignKey("KPI_Kind_ID")]

        public virtual KPIKind KPIKind { get; set; }
    }
}
