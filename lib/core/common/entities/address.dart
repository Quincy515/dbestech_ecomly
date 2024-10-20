import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    this.street,
    this.apartment,
    this.city,
    this.postalCode,
    this.country,
  });

  const Address.empty()
      : street = '',
        apartment = '',
        city = '',
        postalCode = '',
        country = '';

  final String? street;
  final String? apartment;
  final String? city;
  final String? postalCode;
  final String? country;

  bool get isEmpty =>
      street == null && city == null && postalCode == null && country == null;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [street, city, postalCode, country];
}
