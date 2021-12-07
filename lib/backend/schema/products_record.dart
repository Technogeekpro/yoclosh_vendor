import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'product_name')
  String get productName;

  @nullable
  @BuiltValueField(wireName: 'product_price')
  double get productPrice;

  @nullable
  @BuiltValueField(wireName: 'product_discount')
  double get productDiscount;

  @nullable
  @BuiltValueField(wireName: 'product_description')
  String get productDescription;

  @nullable
  String get category;

  @nullable
  @BuiltValueField(wireName: 'product_id')
  String get productId;

  @nullable
  @BuiltValueField(wireName: 'product_image')
  String get productImage;

  @nullable
  @BuiltValueField(wireName: 'product_stock')
  String get productStock;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..productName = ''
    ..productPrice = 0.0
    ..productDiscount = 0.0
    ..productDescription = ''
    ..category = ''
    ..productId = ''
    ..productImage = ''
    ..productStock = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String productName,
  double productPrice,
  double productDiscount,
  String productDescription,
  String category,
  String productId,
  String productImage,
  String productStock,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..productName = productName
          ..productPrice = productPrice
          ..productDiscount = productDiscount
          ..productDescription = productDescription
          ..category = category
          ..productId = productId
          ..productImage = productImage
          ..productStock = productStock));
