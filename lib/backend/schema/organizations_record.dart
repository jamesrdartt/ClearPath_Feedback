import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationsRecord extends FirestoreRecord {
  OrganizationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "orgCode" field.
  String? _orgCode;
  String get orgCode => _orgCode ?? '';
  bool hasOrgCode() => _orgCode != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _orgCode = snapshotData['orgCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizations');

  static Stream<OrganizationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizationsRecord.fromSnapshot(s));

  static Future<OrganizationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizationsRecord.fromSnapshot(s));

  static OrganizationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizationsRecordData({
  String? name,
  String? orgCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'orgCode': orgCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizationsRecordDocumentEquality
    implements Equality<OrganizationsRecord> {
  const OrganizationsRecordDocumentEquality();

  @override
  bool equals(OrganizationsRecord? e1, OrganizationsRecord? e2) {
    return e1?.name == e2?.name && e1?.orgCode == e2?.orgCode;
  }

  @override
  int hash(OrganizationsRecord? e) =>
      const ListEquality().hash([e?.name, e?.orgCode]);

  @override
  bool isValidKey(Object? o) => o is OrganizationsRecord;
}
