import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "organizationRef" field.
  DocumentReference? _organizationRef;
  DocumentReference? get organizationRef => _organizationRef;
  bool hasOrganizationRef() => _organizationRef != null;

  // "upvotes" field.
  int? _upvotes;
  int get upvotes => _upvotes ?? 0;
  bool hasUpvotes() => _upvotes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "upvoters" field.
  List<String>? _upvoters;
  List<String> get upvoters => _upvoters ?? const [];
  bool hasUpvoters() => _upvoters != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _organizationRef = snapshotData['organizationRef'] as DocumentReference?;
    _upvotes = castToType<int>(snapshotData['upvotes']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _upvoters = getDataList(snapshotData['upvoters']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? title,
  String? description,
  DocumentReference? createdBy,
  DocumentReference? organizationRef,
  int? upvotes,
  String? status,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'createdBy': createdBy,
      'organizationRef': organizationRef,
      'upvotes': upvotes,
      'status': status,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.organizationRef == e2?.organizationRef &&
        e1?.upvotes == e2?.upvotes &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.upvoters, e2?.upvoters);
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdBy,
        e?.organizationRef,
        e?.upvotes,
        e?.status,
        e?.createdAt,
        e?.upvoters
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
