import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ArchiveorgApi {
  static String archiveorg = 'archive.org';

  var dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      baseUrl: "https://" + archiveorg));

  Future<List<ArchiveorgItem>> getResult(encodedKeywords) async {
    Response response = await dio.get(getUrl(encodedKeywords));

    if (response.statusCode == 200) {
      List results = response.data['response']['docs'];

      return results.map((e) => ArchiveorgItem.formJson(e)).toList();
    }
    return null;
  }

  Future<dynamic> getDetails(identifier) async {
    print(getCrawlUrl(identifier));

    var response = await dio
        .get(getCrawlUrl(identifier))
        .catchError((error) => print(error.toString()));

    print(response.headers);

    if (response?.statusCode == 200) {
      var json = response.data;

      print(json['server']);
      print(json['dir']);
      print(json['files']
          .keys
          .where((element) => element.toString().contains('.mp4'))
          .toList());

      Map map = {
        'base': json['server'] + json['dir'],
        'files': json['files']
            .keys
            .where((element) => element.toString().contains('.mp4'))
            .toList()
      };

      return map;
    }
    return null;
  }

  //ArchiveorgSearchResult
  String getCrawlUrl(identifier) {
    return "/details/" + identifier + "?output=json";
  }

  String getUrl(String encodedKeywords) {
    return "/advancedsearch.php?q=" +
        encodedKeywords +
        "&fl[]=avg_rating&fl[]=call_number&fl[]=collection&fl[]=contributor&fl[]=coverage&fl[]=creator&fl[]=date&fl[]=description&fl[]=downloads&fl[]=foldoutcount&fl[]=format&fl[]=headerImage&fl[]=identifier&fl[]=imagecount&fl[]=language&fl[]=licenseurl&fl[]=mediatype&fl[]=month&fl[]=num_reviews&fl[]=oai_updatedate&fl[]=publicdate&fl[]=publisher&fl[]=rights&fl[]=scanningcentre&fl[]=source&fl[]=title&fl[]=type&fl[]=volume&fl[]=week&fl[]=year&rows=50&page=1&indent=yes&output=json";
  }

  basicSeach(String encodedKeywords){

  }

//  searchPage(String page) {
//    List result = [];
//    var response = jsonDecode(page);
//    for (ArchiveorgItem item in response.response.docs) {
//      if (!isStopped() && filter(item)) {
//        var sr = new ArchiveorgSearchResult(getDomainName(), item);
//        result.add(sr);
//      }
//    }
//    return result;
//  }

}

class ArchiveorgFile {
  String filename;
  String source;
  String size;
  String format;
  String md5;
  String mtime;
  String crc32;
  String sha1;
  String length;
}

class ArchiveorgItem {
  Object title;
  String mediatype;
  Object description;
  String licenseurl;
  String publicdate;
  int downloads;
  int month;
  String identifier;
  List format;
  List collection;

  ArchiveorgItem.formJson(Map<String, dynamic> json)
      : title = json['title'],
        mediatype = json['mediatype'],
        description = json['description'],
        licenseurl = json['licenseurl'],
        publicdate = json['publicdate'],
        downloads = json['downloads'],
        month = json['month'],
        identifier = json['identifier'],
        format = json['format'],
        collection = json['collection'];
}
