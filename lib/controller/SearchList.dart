//package - libraries
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hush_day/model/TrackList.dart';
import 'package:hush_day/service/ApiService.dart';


class SearchListController extends GetxController {
  var isLoading = true.obs;
  SearchList? SearchListData;

  TextEditingController searchkey = TextEditingController();


  @override
  void onInit(){
    super.onInit();
  }

  Future<void> getSearchList () async {
    try {
      isLoading(true);
      print("hereeeee: ${searchkey.value.text}");
      var list = await CommonApiService().getResponse( searchkey.value.text);
      
      if(list != null){
        SearchListData = SearchList.fromJson(json.decode(list) as Map<String, dynamic>);
        SearchListData.obs;
      }
    } catch (e) {
      print(e);
    }
    finally {
      isLoading(false);
    }
  }

}