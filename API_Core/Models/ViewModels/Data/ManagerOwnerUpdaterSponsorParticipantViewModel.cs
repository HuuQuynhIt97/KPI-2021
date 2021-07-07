using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Data
{
    public class ManagerOwnerUpdaterSponsorParticipantViewModel
    {
        public int KPILevelID { get; set; }
        public string KPILevelCode { get; set; }
        public int CategoryID { get; set; }
        public string KPIName { get; set; }
        public string Owner { get; set; }
        public string Area { get; set; }
        public string Code { get; set; }
        public string Manager { get; set; }
        public string Unit { get; set; }
        public string Updater { get; set; }
        public string Sponsor { get; set; }
        public string Participant { get; set; }
        public bool? Checked { get; set; }
        public bool? Status { get; set; }
    }
}
