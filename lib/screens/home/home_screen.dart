import 'package:flutter/material.dart';
import 'package:univerties/models/universities_model.dart';
import 'package:univerties/utils/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Universities> universities = [];
  List<Universities> filteredUniversities = [];
  HttpService _httpService = HttpService();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _httpService.getUniversities()
      .then((universitiesFromServer) {
        setState(() {
          universities = universitiesFromServer;
          filteredUniversities = universities;
        });
      });
  }

  @override
  Widget build(BuildContext context) {

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Prueba De Ingreso'),
            backgroundColor: const Color(0xff22D8C4),
          ),
        );
      }
    
    
    );
    
  }
}