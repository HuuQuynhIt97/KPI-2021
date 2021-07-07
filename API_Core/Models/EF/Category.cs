using Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.EF
{
  public  class Category :Inheritance
    {
        public int? Cate_Kind_ID { get; set; }
        public virtual List<CategoryLang> CategoryLangs { get; set; }
    }
}
