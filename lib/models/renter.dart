class Renter {
  final String renterId;
  final String landlordId;
  final String name;
  final String phonenumber;
  final String email;
  final String houseId;
  final String rent;
  final String lastReading;
  final String currentReading;
  final String miscellaneous;
  final String eBRate;

  Renter({
    required this.renterId,
    required this.landlordId,
    required this.name,
    required this.phonenumber,
    required this.email,
    required this.houseId,
    required this.rent,
    required this.lastReading,
    required this.currentReading,
    required this.miscellaneous,
    required this.eBRate,
  });

  factory Renter.fromJson(Map<String, dynamic> json) {
    return Renter(
      renterId: json['renter_id'],
      landlordId: json['landlordId'],
      name: json['name'],
      phonenumber: json['phonenumber'],
      email: json['email'],
      houseId: json['houseId'],
      rent: json['rent'],
      lastReading: json['lastReading'],
      currentReading: json['currentReading'],
      miscellaneous: json['miscellaneousAmount'],
      eBRate: json['EBCharge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'renterId': renterId,
      'landlordId': landlordId,
      'name': name,
      'phonenumber': phonenumber,
      'email': email,
      'houseId': houseId,
      'rent': rent,
      'lastReading': lastReading,
      'currentReading': currentReading,
      'miscellaneous': miscellaneous,
      'eBRate': eBRate,
    };
  }
}
