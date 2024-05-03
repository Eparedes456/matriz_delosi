import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matriz_delosi/exception/matrix_exception.dart';
import 'package:matriz_delosi/models/matrix_model.dart';


class MatrizController extends GetxController{
  MatrixModel matrixModel = MatrixModel(listValues: []);
  TextEditingController inputMatrixController = TextEditingController();

  @override
  void onInit() {
    inputMatrixController = TextEditingController(
      text: '[[1,2],[3,4]]'
    );
    
    // TODO: implement onInit
    super.onInit();
  }

  void validateInputEmpty(){
    if(inputMatrixController.text.length == 0){
      _showAlert(message: 'El campo de texto es obligatorio');
      return;
    }

    generateMatrix();
  }

  void generateMatrix(){
    try {
      MatrixModel response = MatrixModel.generar(inputTextValue: inputMatrixController.text);
      if(response.runtimeType == MatrixCreationExcep){
        //_showAlert(message: response.errorMessage);
      }else{
        inputMatrixController.clear();
        matrixModel = rotateMatrix(response);
        update();
      }
    } catch (e) {
      _showAlert(message: e.toString());
    }
    
  }

  void _showAlert({required String message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      )
    );
  }

   MatrixModel rotateMatrix( matrix){
    int n = matrix.listValues.length;
    final List<List<int>> rotatedMatrix = List.generate(n, (_) => List.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        rotatedMatrix[n - 1 - j][i] = matrix.listValues[i][j];
      }
    }
    return MatrixModel(listValues: rotatedMatrix);
    
  }
}