using Models.EF;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Abstract
{
   public abstract class BLang
    {
        //public BLang()
        //{
        //    CreatedTime = DateTime.Now;
        //}

        public int ID { get; set; }
        public string LanguageID { get; set; }
        public string Name { get; set; }
        public int KPIID { get; set; }
        public virtual KPI KPI { get; set; }
        //[Column(TypeName = "datetime")]
        //public DateTime CreatedTime { get; set; }
    }
}
