﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

namespace ProModes
{
    public partial class Participants
    {
        public int Id { get; set; }
        public int KpilevelId { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedTime { get; set; }
        public int CategoryId { get; set; }
        public string KpilevelCode { get; set; }
        public string CategoryCode { get; set; }
    }
}