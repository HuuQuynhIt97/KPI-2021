using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Dto
{
    public class UpdateLanguageDto
    {
      
        public string fileName { get; set; }
        public string key { get; set; }
        public string newValue { get; set; }
    }
}
