using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.KPI
{
    public class KPIViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public List<string> Names { get; set; }
        public string EnglishName { get; set; }
        public string ChineseName { get; set; }
        public string LocalLanguage { get; set; }
        public string Code { get; set; }
        public bool? Status { get; set; }
        public int KPIID { get; set; }
        public int? KPI_Kind_ID { get; set; }
        public string KPI_Kind_Name { get; set; }
        public string Description { get; set; }
        public string CreatedBy { get; set; }
        public string Index { get; set; }
        public int LevelID { get; set; }
        public int UserID { get; set; }
        public string CategoryName { get; set; }
        public string Unit { get; set; }
        public int UnitID { get; set; }
        public int CategoryID { get; set; }
        public string NameVI { get; set; }
        public string NameEn { get; set; }
        public string NameTW { get; set; }
        public DateTime CreateTime { get; set; }
    }
}
