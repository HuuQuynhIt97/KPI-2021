using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Models.ViewModels.Auth
{
    public class ChangePasswordModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
