import 'package:openapi/api.dart';

class Product extends ProductDto {
  Product(ProductDto dto)
      : super(
          productId: dto.productId,
          categoryId: dto.categoryId,
          description: dto.description,
          gtin: dto.gtin,
          imageUrl: dto.imageUrl,
          name: dto.name,
          number: dto.number,
          price: dto.price,
          supplier: dto.supplier,
          sysCreatedAt: dto.sysCreatedAt,
          sysCreatedBy: dto.sysCreatedBy,
          sysUpdatedAt: dto.sysUpdatedAt,
          sysUpdatedBy: dto.sysUpdatedBy,
          taxRateId: dto.taxRateId,
          unit: dto.unit,
        );
}
