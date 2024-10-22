import 'dart:convert';

import 'package:dbestech_ecomly/core/common/entities/address.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';

class AddressModel extends Address {
  const AddressModel({
    super.street,
    super.apartment,
    super.city,
    super.postalCode,
    super.country,
  });

  const AddressModel.empty()
      : this(
          street: '',
          apartment: '',
          city: '',
          postalCode: '',
          country: '',
        );

  Address copyWith({
    String? street,
    String? apartment,
    String? city,
    String? postalCode,
    String? country,
  }) {
    return Address(
      street: street ?? this.street,
      apartment: apartment ?? this.apartment,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'street': street,
      'apartment': apartment,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }

  factory AddressModel.fromMap(DataMap map) {
    return AddressModel(
      street: map['street'] != null ? map['street'] as String : null,
      apartment: map['apartment'] != null ? map['apartment'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as DataMap);
}
