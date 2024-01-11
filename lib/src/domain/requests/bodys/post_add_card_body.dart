import 'package:equatable/equatable.dart';

class PutAddCardBody extends Equatable {
  const PutAddCardBody(
      {required this.bankId,
      required this.accountName,
      required this.accountNumber});
  final String accountName;
  final int bankId;
  final String accountNumber;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accountName': accountName,
      'bankId': bankId,
      'accountNumber': accountNumber,
    };
  }

  PutAddCardBody copyWith({
    String? accountName,
    int? bankId,
    String? accountNumber,
  }) {
    return PutAddCardBody(
      accountName: accountName ?? this.accountName,
      bankId: bankId ?? this.bankId,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }

  @override
  String toString() {
    return 'PutAddCardBody( accountName: $accountName, bankId: $bankId,accountNumber: $accountNumber)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [accountName, bankId, accountNumber];
}
