import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hush_day/controller/SearchList.dart';

class Jobs extends StatefulWidget {
  Jobs() : super();

  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<Jobs> {
  final _debouncer = Debouncer();
   SearchListController searchlist = Get.put(SearchListController());

  List<Subject> ulist = [];
  List<Subject> userLists = [];
  //API call for All Subject List

  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Subject>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Subject> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    // getAllulistList().then((subjectFromServer) {
    //   setState(() {
    //     ulist = subjectFromServer;
    //     userLists = ulist;
    //   });
    // });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => searchlist.isLoading.isTrue? const CircularProgressIndicator():
        Text(
          searchlist.SearchListData!.queries.request[0].title,
          style: TextStyle(fontSize: 25),
        ),
      ),),
      
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: searchlist.searchkey,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  child: IconButton(icon: Icon(Icons.search), onPressed: (){
                print("info:${searchlist.searchkey.text}");
                searchlist.getSearchList();
                  },),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
            ),
          ),
          Container(
            child:
            Column(
              children: [
                Container(
                  width: 800,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                  Obx(
                            () => searchlist.isLoading.isTrue
                                ? Container()
                                : Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                      searchlist.SearchListData!.items[0].title,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                ),
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                     width: 800,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(
                              () => searchlist.isLoading.isTrue
                                  ? Container()
                                  : Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 20),
                                    child: Text(
                                        searchlist.SearchListData!.items[0].snippet,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                  ),
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 700,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Obx(
                              () => searchlist.isLoading.isTrue
                                  ?  Container()
                                  : Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 20),
                                    child: Text(
                                        searchlist.SearchListData!.items[0].link,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                  ),
                            ),
                  ),
                ),         
              ],
            )
            
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: 
                          Obx(() => searchlist.isLoading.isTrue? const CircularProgressIndicator():
                          Text(
                            searchlist.SearchListData!.items[0].title,
                            style: TextStyle(fontSize: 16),
                          )),
                          subtitle: Text(
                            userLists[index].author ?? "null",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Declare Subject class for json data or parameters of json string/data
//Class For Subject
class Subject {
  var text;
  var author;
  Subject({
    required this.text,
    required this.author,
  });

  factory Subject.fromJson(Map<dynamic, dynamic> json) {
    return Subject(
      text: json['text'],
      author: json['author'],
    );
  }
}
