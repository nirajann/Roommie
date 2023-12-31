// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'model/hostel.dart';
import 'model/order.dart';
import 'model/user.dart';
import 'model/verifyorder.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 154094744469173903),
      name: 'Hostel',
      lastPropertyId: const IdUid(13, 1062861036561704918),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2152680420273099751),
            name: 'hId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 8750054903926214449),
            name: 'hostelid',
            type: 9,
            flags: 2080,
            indexId: const IdUid(1, 8213980472615547164)),
        ModelProperty(
            id: const IdUid(3, 3717692673430383534),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4738732633848416416),
            name: 'type',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5151401725910241598),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1468940259361186635),
            name: 'city',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 9212995681576286926),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 4167735208115887480),
            name: 'photos',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2000675482160487768),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 7028302971166302127),
            name: 'desc',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 2468371357784933560),
            name: 'rating',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 368792400788686289),
            name: 'cheapestPrice',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 1062861036561704918),
            name: 'featured',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 3975570120311867770),
      name: 'Orders',
      lastPropertyId: const IdUid(2, 6109242029990609720),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7003558737033560277),
            name: 'oid',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 6109242029990609720),
            name: 'orderid',
            type: 9,
            flags: 2080,
            indexId: const IdUid(2, 5801360058060581416))
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8164990310463910730),
      name: 'User',
      lastPropertyId: const IdUid(6, 7596032804997492950),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4068965230344034106),
            name: 'uId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 783955412383446089),
            name: 'userId',
            type: 9,
            flags: 2080,
            indexId: const IdUid(3, 5016043339141036809)),
        ModelProperty(
            id: const IdUid(3, 990808656815560637),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 774495102116804982),
            name: 'Username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8750073317288486094),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7596032804997492950),
            name: 'pic',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 7337353775075678148),
      name: 'VerifyOrders',
      lastPropertyId: const IdUid(5, 3049619070490822334),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 259838137364596958),
            name: 'oid',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 4397210217698252714),
            name: 'checkInDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1896195651576639430),
            name: 'checkOutDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7023985865128613393),
            name: 'location',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3049619070490822334),
            name: 'phone',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 7337353775075678148),
      lastIndexId: const IdUid(3, 5016043339141036809),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Hostel: EntityDefinition<Hostel>(
        model: _entities[0],
        toOneRelations: (Hostel object) => [],
        toManyRelations: (Hostel object) => {},
        getId: (Hostel object) => object.hId,
        setId: (Hostel object, int id) {
          object.hId = id;
        },
        objectToFB: (Hostel object, fb.Builder fbb) {
          final hostelidOffset = object.hostelid == null
              ? null
              : fbb.writeString(object.hostelid!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          final cityOffset =
              object.city == null ? null : fbb.writeString(object.city!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          final photosOffset =
              object.photos == null ? null : fbb.writeString(object.photos!);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final descOffset =
              object.desc == null ? null : fbb.writeString(object.desc!);
          fbb.startTable(14);
          fbb.addInt64(0, object.hId);
          fbb.addOffset(1, hostelidOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, typeOffset);
          fbb.addOffset(4, addressOffset);
          fbb.addOffset(5, cityOffset);
          fbb.addOffset(6, phoneOffset);
          fbb.addOffset(7, photosOffset);
          fbb.addOffset(8, titleOffset);
          fbb.addOffset(9, descOffset);
          fbb.addInt64(10, object.rating);
          fbb.addInt64(11, object.cheapestPrice);
          fbb.addBool(12, object.featured);
          fbb.finish(fbb.endTable());
          return object.hId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Hostel(
              hostelid: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              type: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              photos: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              address: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              cheapestPrice: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              city: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              desc: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 22),
              featured: const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 28),
              phone: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 16),
              rating: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 24),
              title: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              hId: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        }),
    Orders: EntityDefinition<Orders>(
        model: _entities[1],
        toOneRelations: (Orders object) => [],
        toManyRelations: (Orders object) => {},
        getId: (Orders object) => object.oid,
        setId: (Orders object, int id) {
          object.oid = id;
        },
        objectToFB: (Orders object, fb.Builder fbb) {
          final orderidOffset =
              object.orderid == null ? null : fbb.writeString(object.orderid!);
          fbb.startTable(3);
          fbb.addInt64(0, object.oid);
          fbb.addOffset(1, orderidOffset);
          fbb.finish(fbb.endTable());
          return object.oid;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Orders(
              oid: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              orderid: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6));

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[2],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.uId,
        setId: (User object, int id) {
          object.uId = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final userIdOffset =
              object.userId == null ? null : fbb.writeString(object.userId!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final UsernameOffset = object.Username == null
              ? null
              : fbb.writeString(object.Username!);
          final passwordOffset = object.password == null
              ? null
              : fbb.writeString(object.password!);
          final picOffset =
              object.pic == null ? null : fbb.writeString(object.pic!);
          fbb.startTable(7);
          fbb.addInt64(0, object.uId);
          fbb.addOffset(1, userIdOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addOffset(3, UsernameOffset);
          fbb.addOffset(4, passwordOffset);
          fbb.addOffset(5, picOffset);
          fbb.finish(fbb.endTable());
          return object.uId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              userId: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              Username: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              password: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              uId: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              pic: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14));

          return object;
        }),
    VerifyOrders: EntityDefinition<VerifyOrders>(
        model: _entities[3],
        toOneRelations: (VerifyOrders object) => [],
        toManyRelations: (VerifyOrders object) => {},
        getId: (VerifyOrders object) => object.oid,
        setId: (VerifyOrders object, int id) {
          object.oid = id;
        },
        objectToFB: (VerifyOrders object, fb.Builder fbb) {
          final locationOffset = object.location == null
              ? null
              : fbb.writeString(object.location!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          fbb.startTable(6);
          fbb.addInt64(0, object.oid);
          fbb.addInt64(1, object.checkInDate?.millisecondsSinceEpoch);
          fbb.addInt64(2, object.checkOutDate?.millisecondsSinceEpoch);
          fbb.addOffset(3, locationOffset);
          fbb.addOffset(4, phoneOffset);
          fbb.finish(fbb.endTable());
          return object.oid;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final checkInDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final checkOutDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final object = VerifyOrders(
              oid: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              checkInDate: checkInDateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(checkInDateValue),
              checkOutDate: checkOutDateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(checkOutDateValue),
              location: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              phone: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Hostel] entity fields to define ObjectBox queries.
class Hostel_ {
  /// see [Hostel.hId]
  static final hId = QueryIntegerProperty<Hostel>(_entities[0].properties[0]);

  /// see [Hostel.hostelid]
  static final hostelid =
      QueryStringProperty<Hostel>(_entities[0].properties[1]);

  /// see [Hostel.name]
  static final name = QueryStringProperty<Hostel>(_entities[0].properties[2]);

  /// see [Hostel.type]
  static final type = QueryStringProperty<Hostel>(_entities[0].properties[3]);

  /// see [Hostel.address]
  static final address =
      QueryStringProperty<Hostel>(_entities[0].properties[4]);

  /// see [Hostel.city]
  static final city = QueryStringProperty<Hostel>(_entities[0].properties[5]);

  /// see [Hostel.phone]
  static final phone = QueryStringProperty<Hostel>(_entities[0].properties[6]);

  /// see [Hostel.photos]
  static final photos = QueryStringProperty<Hostel>(_entities[0].properties[7]);

  /// see [Hostel.title]
  static final title = QueryStringProperty<Hostel>(_entities[0].properties[8]);

  /// see [Hostel.desc]
  static final desc = QueryStringProperty<Hostel>(_entities[0].properties[9]);

  /// see [Hostel.rating]
  static final rating =
      QueryIntegerProperty<Hostel>(_entities[0].properties[10]);

  /// see [Hostel.cheapestPrice]
  static final cheapestPrice =
      QueryIntegerProperty<Hostel>(_entities[0].properties[11]);

  /// see [Hostel.featured]
  static final featured =
      QueryBooleanProperty<Hostel>(_entities[0].properties[12]);
}

/// [Orders] entity fields to define ObjectBox queries.
class Orders_ {
  /// see [Orders.oid]
  static final oid = QueryIntegerProperty<Orders>(_entities[1].properties[0]);

  /// see [Orders.orderid]
  static final orderid =
      QueryStringProperty<Orders>(_entities[1].properties[1]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.uId]
  static final uId = QueryIntegerProperty<User>(_entities[2].properties[0]);

  /// see [User.userId]
  static final userId = QueryStringProperty<User>(_entities[2].properties[1]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[2].properties[2]);

  /// see [User.Username]
  static final Username = QueryStringProperty<User>(_entities[2].properties[3]);

  /// see [User.password]
  static final password = QueryStringProperty<User>(_entities[2].properties[4]);

  /// see [User.pic]
  static final pic = QueryStringProperty<User>(_entities[2].properties[5]);
}

/// [VerifyOrders] entity fields to define ObjectBox queries.
class VerifyOrders_ {
  /// see [VerifyOrders.oid]
  static final oid =
      QueryIntegerProperty<VerifyOrders>(_entities[3].properties[0]);

  /// see [VerifyOrders.checkInDate]
  static final checkInDate =
      QueryIntegerProperty<VerifyOrders>(_entities[3].properties[1]);

  /// see [VerifyOrders.checkOutDate]
  static final checkOutDate =
      QueryIntegerProperty<VerifyOrders>(_entities[3].properties[2]);

  /// see [VerifyOrders.location]
  static final location =
      QueryStringProperty<VerifyOrders>(_entities[3].properties[3]);

  /// see [VerifyOrders.phone]
  static final phone =
      QueryStringProperty<VerifyOrders>(_entities[3].properties[4]);
}
