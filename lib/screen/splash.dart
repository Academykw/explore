import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_country/screen/home.dart';
import 'package:http/http.dart' as http;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void getData() async{
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    print(response.body);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
   print('hjkgu yt');
    Future.delayed(Duration(seconds: 5,), (){
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_)  => Home() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MY',
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
                padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
            child: Text('COUNTRY',
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),),)
          ],
        ),
      ),
    );
  }
}
