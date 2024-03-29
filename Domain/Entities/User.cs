﻿namespace Poseidon.Domain;

    public class User : AuditableEntity
    {
        public int     UserId               { get; set; } 
        public string  ExternalRef          { get; set; }
        public string  Username             { get; set; }
        public string  FirstName            { get; set; }
        public string  PhoneNumber          { get; set; }
        public string  LastName             { get; set; }
        public string  Email                { get; set; }
        public string? ImageUrl             { get; set; }
        public int     AddressId            { get; set; }
        public virtual Address Address      { get; set; }
        public virtual ICollection<UserProductReview> UserProductReview { get; set; }
}

