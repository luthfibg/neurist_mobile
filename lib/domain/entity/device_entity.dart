class DeviceEntity {
  const DeviceEntity({
    required this.id,
    required this.name,
    required this.value,
    required this.status,
  });

  final int id;
  final String name;
  final int value;
  final String status;
}
