import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:rive/rive.dart';

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
      const Duration(seconds: 10),
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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                /*Center(
                  child: Lottie.network(
                    //'https://assets4.lottiefiles.com/packages/lf20_syqnfe7c.json',
                    'https://assets8.lottiefiles.com/packages/lf20_65mlytpx.json',
                    repeat: true,
                    animate: true,
                    alignment: Alignment.center,
                  ),
                ),*/
                Center(
                  child: RiveAnimation.asset('lib/assets/testeanimation.riv'),
                ),
                 Text(
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
