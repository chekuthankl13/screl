import 'dart:convert';


import 'package:screl/db/db_services.dart';
import 'package:screl/modules/home/models/form_model.dart';

class HomeRepo {
 Map<String,dynamic> loadData() {



    String camp = DbServices().getData("camp");
    String seg = DbServices().getData("seg");
    String bid = DbServices().getData("bid");
    String link = DbServices().getData("link");
    String review = DbServices().getData("review");

    var campJson = camp.isEmpty?null: jsonDecode(camp);
    var segJson =seg.isEmpty?null: jsonDecode(seg);
    var bidJson =bid.isEmpty?null: jsonDecode(bid);
    var linkJson =link.isEmpty?null: jsonDecode(link);
    var revJson =review.isEmpty?null: jsonDecode(review);

    return {
      "camp":campJson == null ?null: FormModel.fromJson(campJson),
      "seg":segJson == null?null: FormModel.fromJson(segJson),
      "bid":bidJson== null?null: FormModel.fromJson(bidJson),
      "link":linkJson== null?null: FormModel.fromJson(linkJson),
      "review":revJson == null?null: FormModel.fromJson(revJson)
    };
  }


 Future<void> saveDraft({required key,required value})async{
  // log("key :"+key + " value :"+value);
    await DbServices().setData(key: key, value: value);
  }


}
