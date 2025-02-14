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

          //capital
          Text('Capital: ${country['capital']?[0] ?? "N/A"}',
          style: TextStyle(
            fontSize: 20,

            //population
          ),),
          Text('Population: ${country['population']}',
            style: TextStyle(
              fontSize: 20,

            ),),

          //region
          Text('Region: ${country['region'] ?? "N/A"}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          //sub region
          Text('Subregion: ${country['subregion'] ?? "N/A"}',
            style: TextStyle(
              fontSize: 20,

            ),),



          if (country.containsKey('currencies')) ...[
            const Text('Currencies:',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),),

            for (var currency in country['currencies'].values)
              Text('- ${currency['name']} (${currency['symbol']})',
              style: TextStyle(
                fontSize: 22,
              ),),


            if (country.containsKey('languages')) ...[
              const Text('Languages :',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),),
              for (var lang in country['languages'].values) Text('- $lang',
              style: TextStyle(
                fontSize: 20,
              ),),
            ],
          ],


        ],

      ),),
    );
  }
}
