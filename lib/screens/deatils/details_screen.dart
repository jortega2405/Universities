
import 'package:flutter/material.dart';
import 'package:univerties/models/universities_model.dart';

class DetailsScreen extends StatelessWidget {
  final Universities universities;
  final String name;
  const DetailsScreen({Key? key, required this.universities, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(universities.name),
          backgroundColor: const Color(0xff22D8C4),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12), 
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language_outlined, color:Color(0xff22D8C4),),
                        title: const Text('Alpha Two Code'),
                        subtitle: Text(universities.alphaTwoCode),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined, color:Color(0xff22D8C4),),
                        title: const Text('Country'),
                        subtitle: Text(universities.country),
                      ),
                      ListTile(
                        leading: const Icon(Icons.web_outlined, color:Color(0xff22D8C4),),
                        title: const Text('Web Pages'),
                        subtitle: Text(universities.webPages[0]),
                      ),
                      ListTile(
                        leading: const Icon(Icons.domain, color:Color(0xff22D8C4),),
                        title: const Text('Domains'),
                        subtitle: Text(universities.domains[0]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff22D8C4)
                  ),
                  onPressed: () {print("Here is where we have to use the image_picker dependecy");},
                  child: Text('Upload Media'))
              ],
            ),
            
            ),
        ),
      )
      );
  }
}