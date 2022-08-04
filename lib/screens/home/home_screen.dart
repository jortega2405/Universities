import 'package:flutter/material.dart';
import 'package:univerties/models/universities_model.dart';
import 'package:univerties/utils/http_service.dart';
import 'package:univerties/widgets/custom_list.dart';

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
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Prueba De Ingreso'),
              centerTitle: true,
              backgroundColor: const Color(0xff22D8C4),
            ),

            body: Column(
              children: [
                Container(
                  height: 42,
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const TextField(
                    style: TextStyle(
                      color:Color( 0xff22D8C4),
                    ),
                    decoration: InputDecoration(
                      
                      hintText: 'Search by name',
                      fillColor: Color( 0xff22D8C4),
                      contentPadding: EdgeInsets.all(15.0),
                      prefixIcon: Icon(Icons.search, color: Color(0xff22D8C4),
                      
          
                      
                      )
                    ),
                  // onChanged: (string) {
                  //   setState(() {
                  //     filteredUniversities = universities.where((u) => (
                  //       u.name.toLowerCase().contains(s.toLowerCase())
                  //     )).toList();
                  //   });
                  // },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _httpService.getUniversities(),
                    builder: (BuildContext context, AsyncSnapshot<List<Universities>> snapshot){
                      if (snapshot.hasData) {
                        List<Universities> universities;
                        universities = snapshot.requireData;
                        return Scrollbar(
                          thickness: 10,
                          radius: Radius.circular(20),
                          isAlwaysShown: true,
                          child: ListView(
                            children: universities
                            .map(
                              (Universities universities) => CustomList(
                              name: universities.name,
                              country: universities.country,
                                universities: universities,
                              ),
                        
                            ).toList()
                          ),
                        );
                      }

                      return const Center(child: CircularProgressIndicator(),);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    
    
    );
    
  }
}