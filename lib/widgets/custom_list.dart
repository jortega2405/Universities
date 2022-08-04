import 'package:flutter/material.dart';
import 'package:univerties/screens/deatils/details_screen.dart';

import '../models/universities_model.dart';


class CustomList extends StatelessWidget {
  final Universities universities;
  final String name;
  final String country;


  const CustomList({
    Key? key,
    required this.universities,
    required this.name, required this.country, 

    
    }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3)  
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Stack(
          children: [
            _Description(
              name : name,
              country: country,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: (){
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsScreen(universities: universities, name: name))
                 );
                },
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff22D8C4),
                  ),
                )
              ),
            )
          ],
        ),

      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String name;
  final String country;
  const _Description({Key? key, required this.name, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
             
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.location_city,
                color: Color(0xff22D8C4),

              ),
              Text(
                country,
                style: const TextStyle(fontSize: 12),
              )
            ],
          )

        ],
      ),
    );
  }
}