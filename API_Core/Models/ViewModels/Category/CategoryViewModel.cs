using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Category
{
    public class CategoryViewModel
    {
        public string Index { get; set; }

        public int ID { get; set; }
        public string Code { get; set; }
        public int LevelID { get; set; }
        public List<string> Level { get; set; }
        public string NameVI { get; set; }
        public string NameEn { get; set; }
        public string NameTW { get; set; }
        public string CreatedBy { get; set; }
        public string Name { get; set; }
        public int UserID { get; set; }
        public int? KPI_Kind_ID { get; set; }
        public string KPI_Kind_Name { get; set; }
        public List<string> Names { get; set; }
        public string EngLishName { get; set; }
        public string ChineseName { get; set; }
        public string LocalLanguage { get; set; }

        public DateTime CreateTime { get; set; }
    }
}
