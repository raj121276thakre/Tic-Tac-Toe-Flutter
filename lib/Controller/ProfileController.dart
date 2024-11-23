import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Messages.dart';
import 'package:tik_tac_toe_multiplayer/Models/UserModel.dart';
import 'package:tik_tac_toe_multiplayer/Pages/HomePage/HomePage.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final store = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Future<void> updateProfile(String name, String imagePath) async {
    isLoading.value =true;
    try {
     if(imagePath != ""&& name != ""){
       //var uploadedImageUrl = await uploadFileToFirebase(imagePath);
       //.................enable Firebase Storage and then un comment above commment.
       var uploadedImageUrl = imagePath;

       var newUser = UserModel(
           id: auth.currentUser!.uid,
           name: name,
           email: auth.currentUser!.email,
           image: uploadedImageUrl,
           totalWins: "0");

       await db.collection("users").doc(auth.currentUser!.uid).set(
         newUser.toJson(),
       );
       successMessage("Profile Updated");
       Get.offAll(HomePage());

     }else{
       errorMessage("Please fill all the fields");
     }
    } catch (e) {
      errorMessage("Profile Update Failed");

      print(e);
    }
    isLoading.value =false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/${imagePath}";
    final file = File(imagePath!);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (ex) {
        print(ex);
        return "";
      }
    }
    return "";
  }

  Future<String> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return image.path;
    } else {
      return "";
    }
  }
}
