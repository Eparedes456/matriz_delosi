import 'package:flutter/material.dart';

class RotateBtnWidget extends StatelessWidget {
  const RotateBtnWidget({super.key, required this.pressBtnRotate});

  final Function() pressBtnRotate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: (){
          pressBtnRotate();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20,right: 20),
            child: Text(
              'Rotar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}