import 'package:http/http.dart' as http;



class CommonApiService {
  static var Client = http.Client();
  var baseUrl = "https://www.googleapis.com/customsearch/v1?key=AIzaSyCTH-7Jbu4rm0vcZY2oNUCxdztkL5lFItI&cx=4350f38bf733e474b&q=";

  Future<dynamic> getResponse(query) async {
    var url = Uri.parse(baseUrl+ query);
    print(url);
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await Client.get(url, headers: headers);
    print(response.body);
    if(response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
    
  }
}