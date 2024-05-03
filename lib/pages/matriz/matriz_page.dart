import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:matriz_delosi/controllers/matriz_controller.dart';
import 'package:matriz_delosi/pages/matriz/widgets/matrix_input_widget.dart';
import 'package:matriz_delosi/pages/matriz/widgets/matrix_rotate_widget.dart';
import 'package:matriz_delosi/pages/matriz/widgets/rotate_btn_widget.dart';

class MatrizPage extends StatelessWidget {
  const MatrizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatrizController(),
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'App Rotación Matriz'
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(top: 20,bottom: 12),
                    child: Text(
                      'Ingresa la matriz',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MatrixInputWidget(
                        inputController: controller.inputMatrixController,
                      ),
                      
                      RotateBtnWidget(
                        pressBtnRotate: (){
                          controller.validateInputEmpty();
                        },
                      )
                    ],
                  ),
                  if(controller.matrixModel.listValues.length > 0)...{
                    const SizedBox(height: 20,),
    
                    MatrixRotateWidget(
                      matrix: controller.matrixModel,
                    )
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}