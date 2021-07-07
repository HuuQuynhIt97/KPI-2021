using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Category
{
    public class CategoryVM
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public int LevelID { get; set; }
        public string NameVI { get; set; }
        public string NameEn { get; set; }
        public string NameTW { get; set; }

        public List<LevelID2> LevelID2;
        public string Name { get; set; }
        public int UserID { get; set; }
        public int? Cate_Kind_ID { get; set; }
        public List<string> Names { get; set; }

        public DateTime CreateTime { get; set; }
    }
    public class LevelID2
    {
        public string id { get; set; }
        public string text { get; set; }

    }
}
