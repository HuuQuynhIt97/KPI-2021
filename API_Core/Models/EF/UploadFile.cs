using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
  public  class UploadFile
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int UploadBy { get; set; }
        public int ActionPlanID { get; set; }
    }
}
