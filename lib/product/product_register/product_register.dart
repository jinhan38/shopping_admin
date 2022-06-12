import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_admin/res/style.dart';

class ProductRegister extends StatefulWidget {
  const ProductRegister({Key? key}) : super(key: key);

  @override
  _ProductRegisterState createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> {
  late TextEditingController nameController;

  late TextEditingController priceController;

  late TextEditingController discountController;

  @override
  void initState() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  // 이름, 가격, 할인, 이미지
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 16),
        _textField("이름을 입력해주세요", TextInputType.text, nameController),
        const SizedBox(height: 16),
        _textField("가격을 입력해주세요", TextInputType.number, priceController),
        const SizedBox(height: 16),
        _textField("할인률 입력해주세요", TextInputType.number, discountController),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _textField(String hintText, TextInputType textInputType,
      TextEditingController controller) {
    return TextField(
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Style.body2,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        labelStyle: Style.body1,
      ),
      controller: controller,
    );
  }
}
