import 'package:equatable/equatable.dart';

class PostForgotPassWordBody extends Equatable {
  const PostForgotPassWordBody({
    required this.email,
  });
  final String email;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }

  PostForgotPassWordBody copyWith({
    String? email,
  }) {
    return PostForgotPassWordBody(
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'PostForgotPassWordBody( email: $email,)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
      ];
}
