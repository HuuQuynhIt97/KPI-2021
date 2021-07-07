using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
  public  class CategoryLevel
    {
        public int ID { get; set; }
        public int Cate_ID { get; set; }
        public int Level_ID { get; set; }
    }
}
