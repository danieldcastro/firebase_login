class RemoteUserModel {
  String id;
  String name;
  String email;

  RemoteUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory RemoteUserModel.empty() =>
      RemoteUserModel(id: '', name: '', email: '');

  @override
  String toString() => 'RemoteUserModel(id: $id, name: $name, email: $email)';
}
