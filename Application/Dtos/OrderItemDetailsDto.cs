namespace Poseidon.Application.Dto;

using System;
using AutoMapper;
using Poseidon.Domain;
public partial class OrderItemDetailsDto : IMapFrom<OrderItem>
{ 
        public long?           OrderItemId        { get; set; }
        public decimal         DiscountAmount     { get; set; }
        public long            OrderId            { get; set; }
        public long            ProductId          { get; set; }
        public decimal         ProductPrice       { get; set; }
        public string          ProductName        { get; set; }
        public decimal         Quantity           { get; set; }
        public decimal         TaxAmount          { get; set; }
        public decimal         TaxPercent         { get; set; }
        public decimal         Total              { get; set; }
        
        public DateTimeOffset  Sys_CreatedAt      { get; set; }
        public string          Sys_CreatedBy      { get; set; }
        public DateTimeOffset  Sys_UpdatedAt      { get; set; }
        public string          Sys_UpdatedBy      { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap< OrderItem, OrderItemDto >();
    }
}