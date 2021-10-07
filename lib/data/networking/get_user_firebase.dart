import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getUsers(String phone) async {
  QuerySnapshot<Map<String, dynamic>> where = await FirebaseFirestore.instance
      .collection('users')
      .where("phone", isEqualTo: phone)
      .get();
  Map<String, dynamic> result = {"phone": false};
  if (where.docs.isNotEmpty) {
    for (var i in where.docs) {
      result = i.data();
    }
  }
  // print("Resutlado getUSER:$result");
  return result;
}
