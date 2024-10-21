import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:screl/modules/home/models/form_model.dart';
import 'package:screl/modules/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitial());

loadData(){  
var res = repo.loadData();
log(res.toString());
var camp = res['camp'] as FormModel?;
var seg = res['seg']  as FormModel?;
var bid = res['bid']  as FormModel?;
var link = res['link']  as FormModel?;
var rev = res['review']  as FormModel?;
emit(HomeLoaded(campaign: camp , segment: seg, bidding: bid, links: link, review: rev));
}


nextStep({key,cntr1,cntr2,cntr3,cntr4,t1,t2}){
    var obj = FormModel(subject: cntr1, preview: cntr2, from: cntr3, email: cntr4, oncePerCustomer: t1, customerAudience: t2);

  switch (key) {
    case 'camp':
      emit((state as HomeLoaded).copyCam(obj));
      break;
    case 'seg':
      emit((state as HomeLoaded).copySeg(obj));
      break;
    case 'bid':
      emit((state as HomeLoaded).copyBid(obj));
      break;
    case 'link':
      emit((state as HomeLoaded).copyLink(obj));
      break;
      case 'review':
      emit((state as HomeLoaded).copyReview(obj));
      break;
    default:
  }
}

saveDraft(HomeLoaded statef)async{
  var camp = (state as HomeLoaded).campaign?.toJson() ;
  var seg =(state as HomeLoaded).segment?.toJson();
  var bid = (state as HomeLoaded).bidding?.toJson();
  var link =(state as HomeLoaded).links?.toJson();
  var review = (state as HomeLoaded).review?.toJson();

 await Future.wait([
    repo.saveDraft(key: "camp", value: jsonEncode(camp)),
    repo.saveDraft(key: "seg", value: jsonEncode(seg)), 
    repo.saveDraft(key: "bid", value: jsonEncode(bid)), 
    repo.saveDraft(key: "link", value: jsonEncode(link)),
    repo.saveDraft(key: "review", value: jsonEncode(review))


  ]);

}
  

formSubmit(){
  var camp = (state as HomeLoaded).campaign!.toJson();
  var seg = (state as HomeLoaded).segment!.toJson();
  var bid = (state as HomeLoaded).bidding!.toJson();
  var link = (state as HomeLoaded).links!.toJson();
  var review = (state as HomeLoaded).review!.toJson();

  //// final output 
  
  var res = {"campaign":camp,"segments":seg,"bidding":bid,"links":link,"review":review};

  log(res.toString(),name:"form submit" );
}

}





