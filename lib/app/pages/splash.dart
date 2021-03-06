import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 10),
    ).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Lottie.network(
                    //'https://assets4.lottiefiles.com/packages/lf20_syqnfe7c.json',
                    'https://assets8.lottiefiles.com/packages/lf20_65mlytpx.json',
                    repeat: true,
                    animate: true,
                    alignment: Alignment.center,
                  ),
                ),
                const Text(
                  'Estudo de Revisão flutter Everton Lima',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
