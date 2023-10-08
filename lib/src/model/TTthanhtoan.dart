// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class tinhtrangTT {
  String trangthai;
  String? idtinhtrang;
  tinhtrangTT({
    required this.trangthai,
    this.idtinhtrang,
  });
  factory tinhtrangTT.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return tinhtrangTT(
        trangthai: snapshot['trangthai'], idtinhtrang: snapshot['idtinhtrang']);
  }
  Map<String, dynamic> toJson() => {
        "trangthai": trangthai,
        "idtinhtrang": idtinhtrang,
      };
}
