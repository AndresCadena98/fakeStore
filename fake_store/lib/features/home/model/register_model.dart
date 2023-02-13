
import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.address,
        required this.phone,
    });

    int id;
    String email;
    String username;
    String password;
    Name name;
    Address address;
    String phone;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
    };
}

class Address {
    Address({
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
        required this.geolocation,
    });

    String city;
    String street;
    int number;
    String zipcode;
    Geolocation geolocation;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: Geolocation.fromJson(json["geolocation"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation.toJson(),
    };
}

class Geolocation {
    Geolocation({
        required this.lat,
        required this.long,
    });

    String lat;
    String long;

    factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class Name {
    Name({
        required this.firstname,
        required this.lastname,
    });

    String firstname;
    String lastname;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}
