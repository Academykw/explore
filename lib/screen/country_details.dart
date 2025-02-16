import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  final dynamic country;

  const CountryDetails({super.key,  required this.country});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']['common']),

      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
      Center(
        child: Image.network(
        country['flags']['png'],
          width: 332,
          height: 208,// Adjust width as needed
          errorBuilder: (context, object, stackTrace) => const Icon(Icons.flag),
        ),
      ),
          SizedBox(height: 20,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (country.containsKey('capital')) ...[
                const Text('Capital:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontStyle: FontStyle.normal,
                  ),),

                  // capital
                  Text('-${country['capital'] ?[0] ?? "N/A"} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
              ]
            ],
          ),



          SizedBox(height: 20,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (country.containsKey('population')) ...[
                const Text('Population:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontStyle: FontStyle.normal,
                  ),),

                  // population
                  Text('-${country['population']} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
              ]
            ],
          ),


          SizedBox(height: 20,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (country.containsKey('region')) ...[
                const Text('Region:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontStyle: FontStyle.normal,
                  ),),




                  /// region
                  Text('-${country['region'] ?? "N/A"} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
              ]
            ],
          ),


          SizedBox(height: 20,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (country.containsKey('subregion')) ...[
                const Text('Subregion:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontStyle: FontStyle.normal,
                  ),),

                  //SUBREGION
                  Text('-${country['subregion'] ?? "N/A"} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
              ]
            ],
          ),

          SizedBox(height: 20,),

             Row(
               children: [
             if (country.containsKey('currencies')) ...[
               const Text('Currencies:',
                  style: TextStyle(
                   fontSize: 20,
                 color: Colors.amber,
                 fontStyle: FontStyle.normal,
                ),),

               for (var currency in country['currencies'].values)
               Text('-${currency['name']} ',
               style: TextStyle(
                fontSize: 18,
                ),),
              ]
               ],
             ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                if (country.containsKey('languages')) ...[
                  const Text('Languages :',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                      fontStyle: FontStyle.normal,
                    ),),
                  for (var lang in country['languages'].values) Text('- $lang',
                    style: TextStyle(
                      fontSize: 20,
                    ),),

                ],

              ],
            )




          ] ,
      ),),
    );
  }
}
