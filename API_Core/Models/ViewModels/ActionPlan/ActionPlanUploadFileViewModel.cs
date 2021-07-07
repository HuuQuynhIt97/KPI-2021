using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.ActionPlan
{
   public class ActionPlanUploadFileViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int UploadBy { get; set; }
        public int ActionPlanID { get; set; }

    }
}
