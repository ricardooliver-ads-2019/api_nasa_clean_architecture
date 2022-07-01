import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ScreenErro extends StatelessWidget {
  final String message;

  const ScreenErro({ Key? key, required this.message }) : super(key: key);
  
   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            backgroundColor: Colors.white.withOpacity(0),
            title: const Text(''),
            elevation: 0,
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     const Icon(
                    Icons.error_outline_outlined,
                    size: 50,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                    '${message}', 
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ),
       );
  }
}