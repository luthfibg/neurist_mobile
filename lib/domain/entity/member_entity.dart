class MemberEntity {
  const MemberEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.serviceId,
    required this.phone,
    required this.email,
  });

  final int id;
  final String name;
  final int age;
  final String address;
  final int serviceId;
  final String phone;
  final String email;
}
