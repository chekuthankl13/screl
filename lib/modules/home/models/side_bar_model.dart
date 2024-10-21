class SideBarModel {
  final int index;
  final String title;
  final String subTitle;

  SideBarModel(
      {required this.index, required this.title, required this.subTitle});
}

List<SideBarModel> sideBars = [
  SideBarModel(
      index: 1,
      title: "Create New Campaign",
      subTitle: "Fill out these details and get your campaign ready"),
  SideBarModel(
      index: 2,
      title: "Create Segments",
      subTitle: "Get full control over your audience"),
  SideBarModel(
      index: 3,
      title: "Bidding startegy",
      subTitle: "Optimize your campaign reach with adsense"),
  SideBarModel(
      index: 4,
      title: "Site Links",
      subTitle: "Set your customer journey flow"),
  SideBarModel(
      index: 5,
      title: "Review Campaign",
      subTitle: "Double check your campaign is ready to go !"),
];
