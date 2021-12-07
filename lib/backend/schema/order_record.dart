import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'order_id')
  BuiltList<String> get orderId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderRecordBuilder builder) =>
      builder..orderId = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderRecordData() => serializers.toFirestore(
    OrderRecord.serializer, OrderRecord((o) => o..orderId = null));
