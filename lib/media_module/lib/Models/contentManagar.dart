import 'dart:convert';

import 'package:media/Models/content.dart';
import 'package:http/http.dart' as http;
class ContentManger{
List<Content> content=[];
Future<void> addLinkContent(String link)
  async{
    try{
      final response= await http.get(Uri.parse(link));
      final data = json.decode(response.body);
      if(response.statusCode==200){
      final newContent=Content(data['title'],data['description'],data['imageUrl']);
        content.add(newContent);
      }
      else{
        throw Exception('failed to load content');
      }}

      catch(e){
        print('erroe :$e');
      }
    

    }
  }

 
  


