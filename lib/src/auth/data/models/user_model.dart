import 'dart:convert';

import 'package:dbestech_ecomly/core/common/entities/address.dart';
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/data/models/address_model.dart';
import 'package:dbestech_ecomly/src/wishlist/data/models/wishlist_product_model.dart';
import 'package:dbestech_ecomly/src/wishlist/domain/entities/wishlist_product.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isAdmin,
    required super.wishlist,
    super.address,
    super.phone,
  });

  UserModel.empty()
      : this(
          id: '',
          name: '',
          email: '',
          isAdmin: true,
          wishlist: [],
          address: null,
          phone: null,
        );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? isAdmin,
    List<WishlistProduct>? wishlist,
    Address? address,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      wishlist: wishlist ?? this.wishlist,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'isAdmin': isAdmin,
      'wishlist': wishlist
          .map((product) => (product as WishlistProductModel).toMap())
          .toList(),
      if (address != null) 'address': (address as AddressModel).toMap(),
      if (phone != null) 'phone': phone,
    };
  }

  factory UserModel.fromMap(DataMap map) {
    final address = AddressModel.fromMap({
      if (map case {'street': String street}) 'street': street,
      if (map case {'apartment': String apartment}) 'apartment': apartment,
      if (map case {'city': String city}) 'city': city,
      if (map case {'postalCode': String postalCode}) 'postalCode': postalCode,
      if (map case {'country': String country}) 'country': country,
    });
    return UserModel(
      id: map['id'] as String? ?? map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      wishlist: List<DataMap>.from(map['wishlist'] as List<dynamic>)
          .map<WishlistProductModel>(WishlistProductModel.fromMap)
          .toList(),
      address: address.isEmpty ? null : address,
      phone: map['phone']
          as String?, // map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as DataMap);
}
