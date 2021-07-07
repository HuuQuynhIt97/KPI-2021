using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
   public class HistoryActionPlan
    {
       
        public int ID { get; set; }
        public string Action { get; set; }
        public int UserID { get; set; }
        public int ActionPlanID { get; set; }
        public DateTime? UpdateSheduleDate { get; set; }
        public DateTime? ActualFinishDate { get; set; }

    }
}
