import 'package:aserar_admin/views/add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Aserar Admin', style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.02),
              MaterialButton(
                onPressed: () => Get.to(() => Add()),
                color: Theme.of(context).primaryColor,
                height: 40.0,
                minWidth: double.infinity,
                child: Text('Add Recipe', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
