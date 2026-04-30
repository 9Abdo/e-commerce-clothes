import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clothes/models/cart_irem_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';

class CartService {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance;

  CollectionReference get _cartRef =>
      _db.collection("users").doc(userId).collection("cart");

  Future<void> addToCart(Clothesmodel product) async {
    final doc = _cartRef.doc(product.id.toString());

    final snapshot = await doc.get();

    if (snapshot.exists) {
      await doc.update({"quantity": FieldValue.increment(1)});
    } else {
      await doc.set({
        "id": product.id,
        "title": product.clothesType,
        "price": product.price,
        "image": product.image,
        "quantity": 1,
      });
    }
  }

  Future<void> removeFromCart(int productId) async {
    await _cartRef.doc(productId.toString()).delete();
  }

  Future<void> increaseQuantity(int productId) async {
    await _cartRef.doc(productId.toString()).update({
      "quantity": FieldValue.increment(1),
    });
  }

  Future<void> decreaseQuantity(int productId) async {
    final doc = await _cartRef.doc(productId.toString()).get();

    if (!doc.exists) return;

    int quantity = doc['quantity'];

    if (quantity > 1) {
      await _cartRef.doc(productId.toString()).update({
        "quantity": FieldValue.increment(-1),
      });
    } else {
      await removeFromCart(productId);
    }
  }

  Stream<List<CartItemModel>> getCart() {
    return _db
        .collection("users")
        .doc(userId)
        .collection("cart")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((e) => CartItemModel.fromJson(e.data()))
              .toList(),
        );
  }

  Future<void> clearCart() async {
    final snapshot = await _cartRef.get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
