using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Models.ViewModels.Auth
{
    public class ForgotPasswordModel
    {
        public string Email { get; set; }
        public string  Username { get; set; }
    }
}
