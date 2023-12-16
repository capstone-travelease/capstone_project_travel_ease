import 'package:equatable/equatable.dart';

class PatchUpdatePassBody extends Equatable {
  const PatchUpdatePassBody({
    required this.oldPassword,
    required this.newPassword,
  });
  final String oldPassword;
  final String newPassword;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  PatchUpdatePassBody copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return PatchUpdatePassBody(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  @override
  String toString() {
    return 'PatchUpdatePassBody(oldPassword: $oldPassword, newPassword: $newPassword,)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
