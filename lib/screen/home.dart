import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Theme/theme_provider.dart';
import '../api/model/model_data.dart';
import 'package:http/http.dart' as http;

import 'country_details.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

/*
  late Future<List<Country>> futureCountries;
*/


  List<dynamic> countries = [];
  List<dynamic> filteredCountries = []; // New list for filtered countries
  bool isLoading = true;
  String errorMessage = '';
  String searchText = '';
  bool isSearching = false;

  bool showFilter = false; // Track filter visibility
  String selectedRegion = 'All'; // Store selected region



  @override
  void initState() {
    fetchCountries();
    super.initState();
  }


  Future<void> fetchCountries() async {
    isLoading = true;
    try {
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/region/africa'));

      if (response.statusCode == 200) {
        setState(() {
          countries = jsonDecode(response.body);
          isLoading = false;


        });
      } else {
        setState(() {
          errorMessage = 'Failed to load countries/Bad network: ${response.statusCode}';
          isLoading = false;
        });
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
      print('Error fetching countries: $e');
    }
  }

  void  filterCountries (String text){
    setState(() {
      searchText = text;
      if(text.isEmpty){
        filteredCountries = countries;

      }else {
        lastSearchText = text;
        filteredCountries = filteredCountries
            .where((country) =>
            country['name']['common']
                .toLowerCase()
                .contains(text.toLowerCase()))
            .toList();
        applyRegionFilter();

      }
    });
  }
  String lastSearchText = "";


  void applyRegionFilter() {
    if (selectedRegion != 'All') {
      setState(() {
        filteredCountries = filteredCountries.where((country) {
          final region = country['region']?.toString().toLowerCase() ?? ''; // Handle nulls
          return region == selectedRegion.toLowerCase();
        }).toList();
      });
    }
  }
  void _onType(text){
    filterCountries(text);
    isSearching = true;
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          //button for dark/light mode
         IconButton(
             onPressed: (){
               ThemeProvider themeProvider = Provider.of<ThemeProvider>(
                   context,
                 listen: false
               );
               themeProvider.swapTheme();
             },
             icon: Icon(Icons.brightness_6),
           color:   Theme.of(context).colorScheme.primary,
         ),


        ],
        title: Text('Explore .',
          style: TextStyle(
          ),
        ),
        centerTitle: false,
      ),


      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8),
          child: TextField(


            onChanged:  _onType,
            decoration: const InputDecoration(
            hintText: 'Search countries...',
            prefixIcon: Icon(Icons.search),
          ),
          ),
          ),


          //filter
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


            ],
          ),


          Expanded(
            child: ListView.builder(
                         itemCount: !isSearching ? countries.length: filteredCountries.length,
                         itemBuilder: !isSearching?(context,index){
                           final country = countries[index];
                           final name = country['name']['common'];
                           final flag = country['flags']['png']; // Or svg

                           return ListTile(
                             subtitle: Text(
                                 ' ${country['capital']?[0] ?? "N/A"}'
                             ),
                             leading: Image.network(
                             flag,
                             width: 50,
                             errorBuilder: (context, object, stackTrace) => const Icon(Icons.flag),
                             ),
                             title: Text(name),
                              onTap: (){
                               Navigator.push(context,
                                   MaterialPageRoute(
                                       builder: (context) => CountryDetails(country: country,)));
                              },
                           );

                            } :
                             (context,index){
                           final country = filteredCountries[index];
                           final name = country['name']['common'];
                           final flag = country['flags']['png']; // Or svg

                           return ListTile(
                             subtitle: Text(
                                 ' ${country['capital']?[0] ?? "N/A"}'
                             ),
                             leading: Image.network(
                               flag,
                               width: 50,
                               errorBuilder: (context, object, stackTrace) => const Icon(Icons.flag),
                             ),
                             title: Text(name),
                             onTap: (){
                               Navigator.push(context,
                                   MaterialPageRoute(
                                       builder: (context) => CountryDetails(country: country,)));
                             },
                           );

                         }

            ),
          ),
        ],
      )
    );
  }
}