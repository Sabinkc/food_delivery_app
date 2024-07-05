// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'constants.dart';

// class CommonPasswordTextField extends StatefulWidget {
//   final IconData prefixIcon;
//   final String hintText;
//   final Color textFieldColor;
//   bool isObscure;
//   final String? Function(String?)? validator;
//   CommonPasswordTextField(
//       {super.key,
//       required this.prefixIcon,
//       required this.hintText,
//       required this.textFieldColor,
//       required this.isObscure,
//       required this.validator});

//   @override
//   State<CommonPasswordTextField> createState() => _CommonTextFieldState();
// }

// class _CommonTextFieldState extends State<CommonPasswordTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: widget.textFieldColor,
//             borderRadius: BorderRadius.circular(30)),
//         margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//         child: TextFormField(
//           validator: widget.validator,
//           obscureText: widget.isObscure,
//           decoration: InputDecoration(
//               hintText: widget.hintText,
//               hintStyle: TextStyle(
//                 fontSize: 20,
//               ),
//               fillColor: Constants.primaryColor,
//               disabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               focusedErrorBorder: InputBorder.none,
//               // focusedErrorBorder: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//               prefixIcon: Icon(
//                 widget.prefixIcon,
//               ),
//               suffixIcon: widget.isObscure
//                   ? IconButton(
//                       onPressed: () {
//                         setState(() {
//                           widget.isObscure = !widget.isObscure;
//                         });
//                       },
//                       icon: Icon(Icons.visibility))
//                   : IconButton(
//                       onPressed: () {
//                         setState(() {
//                           widget.isObscure = !widget.isObscure;
//                         });
//                       },
//                       icon: Icon(Icons.visibility_off)),
//               prefixIconColor: Colors.grey,
//               errorStyle: TextStyle(
//                 color: Colors.red,
//               )),
//         ));
//   }
// }




// Still to understand this code which uses focusnode to display suffixicon when tapping on textfield only
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CommonPasswordTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final Color textFieldColor;
  bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  CommonPasswordTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.textFieldColor,
    required this.isObscure,
    required this.validator,
    required this.controller,

  });

  @override
  State<CommonPasswordTextField> createState() => _CommonPasswordTextFieldState();
}

class _CommonPasswordTextFieldState extends State<CommonPasswordTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Rebuilds the widget when focus changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.textFieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        focusNode: _focusNode,
        validator: widget.validator,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 20,
          ),
          fillColor: Constants.primaryColor,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: _focusNode.hasFocus
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isObscure = !widget.isObscure;
                    });
                  },
                  icon: widget.isObscure
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
          prefixIconColor: Colors.grey,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
