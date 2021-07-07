using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.HistoryActionPlan
{
    public class HistoryActionPlanViewModel
    {
        //public HistoryActionPlanViewModel()
        //{
        //    CreatedDate = DateTime.Now;
        //}
        public int ID { get; set; }
        public string Action { get; set; }
        public int UserID { get; set; }
        public string CreatedBy { get; set; }
        public string Title { get; set; }
        public DateTime? Deadline { get; set; }
        public DateTime? ActualFinishDate { get; set; }
        public DateTime? UpdateSheduleDate { get; set; }
        //public DateTime CreatedDate { get; set; }
    }
}
