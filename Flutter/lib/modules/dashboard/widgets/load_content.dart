import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../controller/loading_controller.dart';

class LoadContent extends StatelessWidget {

  final String? text;
  
  const LoadContent({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingController _loadingController = Get.put(LoadingController());

    return Obx(
      () => (_loadingController.isLoading.value)
          ? Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Color.fromARGB(200, 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitDoubleBounce(
                      color: Colors.white,
                      size: 50.0,
                    ),
                    SizedBox(height: 18),
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          text ?? "Carregando",
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ],
                )),
              ))
          : Container(),
    );
  }
}
