import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';

class FavoriteService {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance;

  CollectionReference get _favRef =>
      _db.collection("users").doc(userId).collection("favorites");

  Future<void> toggleFavorite(Clothesmodel product) async {
    final doc = _favRef.doc(product.id.toString());

    final snapshot = await doc.get();

    if (snapshot.exists) {
      await doc.delete();
    } else {
      await doc.set({
        "id": product.id,
        "title": product.clothesType,
        "price": product.price,
        "image": product.image,
      });
    }
  }

  Stream<List<Clothesmodel>> getFavorites() {
    return _favRef.snapshots().map(
      (snapshot) => snapshot.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        return Clothesmodel(
          id: data["id"],
          clothesType: data["title"],
          price: data["price"],
          image: data["image"],
          description: "",
        );
      }).toList(),
    );
  }
}