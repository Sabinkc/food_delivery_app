import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/common/widgets/common_textfield.dart';

import '../../../../common/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundGreyColor,
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text("Search Screen"),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: CommonTextField(
            prefixIcon: Icons.search,
            hintText: "Search here...",
            textFieldColor: Colors.white,
            isObscure: false,
            validator: (value) {},
            controller: TextEditingController()),
      ),
    );
  }
}
