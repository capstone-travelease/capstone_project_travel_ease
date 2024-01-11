// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanksModel _$BanksModelFromJson(Map<String, dynamic> json) => BanksModel(
      json['bankId'] as int?,
      json['accountName'] as String?,
      json['accountId'] as int?,
      json['accountNumber'] as String?,
      json['typeBank'] as int?,
      imageBankUrl: json['imageBank'] as String?,
      typeBank: json['bankType'] as int?,
      nameBank: json['nameBank'] as String?,
    );

Map<String, dynamic> _$BanksModelToJson(BanksModel instance) =>
    <String, dynamic>{
      'bankId': instance.bankId,
      'imageBank': instance.imageBankUrl,
      'bankType': instance.typeBank,
      'typeBank': instance.bankType,
      'nameBank': instance.nameBank,
      'accountName': instance.accountName,
      'accountId': instance.accountId,
      'accountNumber': instance.accountNumber,
    };
