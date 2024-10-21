part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  // final FormModel? campaign;
  // final FormModel? segment;
  // final FormModel? bidding;
  // final FormModel? links;
  // final FormModel? review;


  const HomeState();

  @override
  List<Object?> get props => [];



}

final class HomeInitial extends HomeState {
  
}

final class HomeLoaded extends HomeState {
  final FormModel? campaign;
  final FormModel? segment;
  final FormModel? bidding;
  final FormModel? links;
  final FormModel? review;

 const HomeLoaded({required this.campaign, required this.segment, required this.bidding, required this.links, required this.review});

 HomeLoaded copyCam (camp){
  return HomeLoaded(campaign: camp, segment: segment, bidding: bidding, links: links, review: review);
 }

 HomeLoaded copySeg (seg){
  return HomeLoaded(campaign: campaign, segment: seg, bidding: bidding, links: links, review: review);
 }


 HomeLoaded copyBid (bid){
  return HomeLoaded(campaign: campaign, segment: segment, bidding: bid, links: links, review: review);
 }

 HomeLoaded copyLink (link){
  return HomeLoaded(campaign: campaign, segment: segment, bidding: bidding, links: link, review: review);
 }

HomeLoaded copyReview (rev){
  return HomeLoaded(campaign: campaign, segment: segment, bidding: bidding, links: links, review: rev);
 }


@override
  List<Object?> get props => [campaign,segment,bidding,review,links];
}
