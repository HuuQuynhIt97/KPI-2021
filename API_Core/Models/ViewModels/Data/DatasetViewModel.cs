using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Data
{
   public class DatasetViewModel
    {
        public string CategoryCode { get; set; }

        public string KPIName { get; set; }
        public string KPILevelCode { get; set; }
        public string Unit { get; set; }
        public string Target { get; set; }
        public string Target2 { get; set; }
        public string Period { get; set; }
        public string Link { get; set; }
        public string Kind { get; set; }
        public string Code { get; set; }
        public string Area { get; set; }
        public int Level { get; set; }
        public int Level_ID { get; set; }
        public string CategoryName { get; set; }
        public string Name { get; set; }
        public bool? Checked { get; set; }
        public bool? Status { get; set; }
        public int CategoryID { get; set; }
        public object Datasets { get; set; }
        public object Data { get; set; }
        public string Owner { get; set; }
        public string Manager { get; set; }
        public string Updater { get; set; }
        public string Sponsor { get; set; }
        public int Yearly { get; set; }
        public string Participant { get; set; }
        public object KPIObj { get; set; }
        public int ID { get; set; }
    }

   public class CategoryViewModel
    {
        public string CategoryCode { get; set; }
        public string CategoryName { get; set; }
        public string Name { get; set; }
        public int ID { get; set; }
    }
}
