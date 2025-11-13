import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpvotesRecord extends FirestoreRecord {
  UpvotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "feedbackRef" field.
  DocumentReference? _feedbackRef;
  DocumentReference? get feedbackRef => _feedbackRef;
  bool hasFeedbackRef() => _feedbackRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _feedbackRef = snapshotData['feedbackRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('upvotes');

  static Stream<UpvotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpvotesRecord.fromSnapshot(s));

  static Future<UpvotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpvotesRecord.fromSnapshot(s));

  static UpvotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpvotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpvotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpvotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpvotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpvotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpvotesRecordData({
  DocumentReference? userRef,
  DocumentReference? feedbackRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'feedbackRef': feedbackRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpvotesRecordDocumentEquality implements Equality<UpvotesRecord> {
  const UpvotesRecordDocumentEquality();

  @override
  bool equals(UpvotesRecord? e1, UpvotesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.feedbackRef == e2?.feedbackRef &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UpvotesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.feedbackRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UpvotesRecord;
}
