using System;
using System.Collections.Generic;
using System.Text;

namespace Models.ViewModels.Auth
{
    public class UserLang
    {
        public string Username { get; set; }
        public string Alias { get; set; }
        public int Permission { get; set; }
        public int LevelID { get; set; }
        public int LevelOC { get; set; }
        public string Role { get; set; }
        public int ID { get; set; }
        public string Lang { get; set; }
        public bool IsActive { get; set; }

    }
}
