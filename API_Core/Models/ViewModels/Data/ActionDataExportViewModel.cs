using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Data
{
    public class ActionDataExportViewModel
    {
        public string ActionPlanName { get; set; }
        public string Description { get; set; }
        public string PIC { get; set; }
        public string DueDate { get; set; }
        public string UpdateCheduleDate { get; set; }
        public string ActualFinishDate { get; set; }
        public string Remark { get; set; }
        public string ApprovedBy { get; set; }
        public string CreatedBy { get; set; }

       
    }
}
