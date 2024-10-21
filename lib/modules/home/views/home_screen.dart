import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screl/config/global.dart';
import 'package:screl/modules/home/cubit/home_cubit.dart';
import 'package:screl/modules/home/models/side_bar_model.dart';
import 'package:screl/modules/home/widgets/home_widgets.dart';
import 'package:screl/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> fkey1 = GlobalKey<FormState>();
  GlobalKey<FormState> fkey2 = GlobalKey<FormState>();
  GlobalKey<FormState> fkey3 = GlobalKey<FormState>();
  GlobalKey<FormState> fkey4 = GlobalKey<FormState>();
  GlobalKey<FormState> fkey5 = GlobalKey<FormState>();

///// campaign
  TextEditingController cntrCas = TextEditingController();
  TextEditingController cntrCap = TextEditingController();
  TextEditingController cntrCaf = TextEditingController();
  TextEditingController cntrCae = TextEditingController();

  ValueNotifier<bool> campT1 = ValueNotifier(false);
  ValueNotifier<bool> campT2 = ValueNotifier(false);

/////// segments
  TextEditingController cntrSes = TextEditingController();
  TextEditingController cntrSep = TextEditingController();
  TextEditingController cntrSef = TextEditingController();
  TextEditingController cntrSee = TextEditingController();

  ValueNotifier<bool> segT1 = ValueNotifier(false);
  ValueNotifier<bool> segT2 = ValueNotifier(false);

///// bidding

  TextEditingController cntrBids = TextEditingController();
  TextEditingController cntrBidp = TextEditingController();
  TextEditingController cntrBidf = TextEditingController();
  TextEditingController cntrBide = TextEditingController();

  ValueNotifier<bool> bidT1 = ValueNotifier(false);
  ValueNotifier<bool> bidT2 = ValueNotifier(false);

///// link

  TextEditingController cntrLins = TextEditingController();
  TextEditingController cntrLinp = TextEditingController();
  TextEditingController cntrLinf = TextEditingController();
  TextEditingController cntrLine = TextEditingController();

  ValueNotifier<bool> linT1 = ValueNotifier(false);
  ValueNotifier<bool> linT2 = ValueNotifier(false);

//// review

  TextEditingController cntrRevs = TextEditingController();
  TextEditingController cntrRevp = TextEditingController();
  TextEditingController cntrRevf = TextEditingController();
  TextEditingController cntrReve = TextEditingController();

  ValueNotifier<bool> revT1 = ValueNotifier(false);
  ValueNotifier<bool> revT2 = ValueNotifier(false);

  // @override
  // void initState() {
  //   // BlocProvider.of<HomeCubit>(context).load();
  //   super.initState();
  // }

  @override
  void dispose() {
    cntrCas.dispose();
    cntrCap.dispose();
    cntrCaf.dispose();
    cntrCae.dispose();
    campT1.dispose();
    campT2.dispose();

    cntrSes.dispose();
    cntrSep.dispose();
    cntrSef.dispose();
    cntrSee.dispose();
    segT1.dispose();
    segT2.dispose();

    cntrBids.dispose();
    cntrBidp.dispose();
    cntrBidf.dispose();
    cntrBide.dispose();
    bidT1.dispose();
    bidT2.dispose();

    cntrLins.dispose();
    cntrLinp.dispose();
    cntrLinf.dispose();
    cntrLine.dispose();
    linT1.dispose();
    linT2.dispose();

    cntrRevs.dispose();
    cntrRevp.dispose();
    cntrRevf.dispose();
    cntrReve.dispose();
    revT1.dispose();
    revT2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          if (state.campaign != null) {
            cntrCas.text = state.campaign!.subject;
            cntrCap.text = state.campaign!.preview;
            cntrCaf.text = state.campaign!.from;
            cntrCae.text = state.campaign!.email;
            campT1.value = state.campaign!.oncePerCustomer;
            campT2.value = state.campaign!.customerAudience;
          }

          if (state.bidding != null) {
            cntrBids.text = state.bidding!.subject;
            cntrBidp.text = state.bidding!.preview;
            cntrBidf.text = state.bidding!.from;
            cntrBide.text = state.bidding!.email;
            bidT1.value = state.bidding!.oncePerCustomer;
            bidT2.value = state.bidding!.customerAudience;
          }

          if (state.links != null) {
            cntrLins.text = state.links!.subject;
            cntrLinp.text = state.links!.preview;
            cntrLinf.text = state.links!.from;
            cntrLine.text = state.links!.email;
            linT1.value = state.links!.oncePerCustomer;
            linT2.value = state.links!.customerAudience;
          }

          if (state.segment != null) {
            cntrSes.text = state.segment!.subject;
            cntrSep.text = state.segment!.preview;
            cntrSef.text = state.segment!.from;
            cntrSee.text = state.segment!.email;
            segT1.value = state.segment!.oncePerCustomer;
            segT2.value = state.segment!.customerAudience;
          }

          if (state.review != null) {
            cntrRevs.text = state.review!.subject;
            cntrRevp.text = state.review!.preview;
            cntrRevf.text = state.review!.from;
            cntrReve.text = state.review!.email;
            revT1.value = state.review!.oncePerCustomer;
            revT2.value = state.review!.customerAudience;
          }

          return Container(
            height: sH(context),
            width: sW(context),
            alignment: Alignment.center,
            child: isTab(context) ? tabView(state) : webView(state),
          );
        }

        return Container();
      },
    ));
  }

//// tab and mobile view

  ListView tabView(HomeLoaded state) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      children: [
        ValueListenableBuilder(
          valueListenable: Global.indexVal,
          builder: (context, value, child) {
            switch (value.index) {
              case 1:
                return formContainer(value,
                    key: fkey1,
                    cntr1: cntrCas,
                    cntr2: cntrCap,
                    cntr3: cntrCaf,
                    cntr4: cntrCae,
                    t1: campT1,
                    t2: campT2, nextStep: () {
                  if (fkey1.currentState!.validate()) {
                    BlocProvider.of<HomeCubit>(context).nextStep(
                        key: "camp",
                        cntr1: cntrCas.text,
                        cntr2: cntrCap.text,
                        cntr3: cntrCaf.text,
                        cntr4: cntrCae.text,
                        t1: campT1.value,
                        t2: campT2.value);
                    Global.indexVal.value = sideBars[1];
                  }
                }, saveDraft: () async {
                  BlocProvider.of<HomeCubit>(context).nextStep(
                      key: "camp",
                      cntr1: cntrCas.text,
                      cntr2: cntrCap.text,
                      cntr3: cntrCaf.text,
                      cntr4: cntrCae.text,
                      t1: campT1.value,
                      t2: campT2.value);
                  await BlocProvider.of<HomeCubit>(context).saveDraft(state);
                  showToast(context);
                });
              case 2:
                return formContainer(value,
                    key: fkey2,
                    cntr1: cntrSes,
                    cntr2: cntrSep,
                    cntr3: cntrSef,
                    cntr4: cntrSee,
                    t1: segT1,
                    t2: segT2, nextStep: () {
                  if (fkey2.currentState!.validate()) {
                    BlocProvider.of<HomeCubit>(context).nextStep(
                        key: "seg",
                        cntr1: cntrSes.text,
                        cntr2: cntrSep.text,
                        cntr3: cntrSef.text,
                        cntr4: cntrSee.text,
                        t1: segT1.value,
                        t2: segT2.value);

                    Global.indexVal.value = sideBars[2];
                  }
                }, saveDraft: () async {
                  BlocProvider.of<HomeCubit>(context).nextStep(
                      key: "seg",
                      cntr1: cntrSes.text,
                      cntr2: cntrSep.text,
                      cntr3: cntrSef.text,
                      cntr4: cntrSee.text,
                      t1: segT1.value,
                      t2: segT2.value);
                  await BlocProvider.of<HomeCubit>(context).saveDraft(state);
                  showToast(context);
                });
              case 3:
                return formContainer(value,
                    key: fkey3,
                    cntr1: cntrBids,
                    cntr2: cntrBidp,
                    cntr3: cntrBidf,
                    cntr4: cntrBide,
                    t1: bidT1,
                    t2: bidT2, nextStep: () {
                  if (fkey3.currentState!.validate()) {
                    BlocProvider.of<HomeCubit>(context).nextStep(
                        key: "bid",
                        cntr1: cntrBids.text,
                        cntr2: cntrBidp.text,
                        cntr3: cntrBidf.text,
                        cntr4: cntrBide.text,
                        t1: bidT1.value,
                        t2: bidT2.value);

                    Global.indexVal.value = sideBars[3];
                  }
                }, saveDraft: () async {
                  BlocProvider.of<HomeCubit>(context).nextStep(
                      key: "bid",
                      cntr1: cntrBids.text,
                      cntr2: cntrBidp.text,
                      cntr3: cntrBidf.text,
                      cntr4: cntrBide.text,
                      t1: bidT1.value,
                      t2: bidT2.value);
                  await BlocProvider.of<HomeCubit>(context).saveDraft(state);
                  showToast(context);
                });
              case 4:
                return formContainer(value,
                    key: fkey4,
                    cntr1: cntrLins,
                    cntr2: cntrLinp,
                    cntr3: cntrLinf,
                    cntr4: cntrLine,
                    t1: linT1,
                    t2: linT2, nextStep: () {
                  if (fkey4.currentState!.validate()) {
                    BlocProvider.of<HomeCubit>(context).nextStep(
                        key: "link",
                        cntr1: cntrLins.text,
                        cntr2: cntrLinp.text,
                        cntr3: cntrLinf.text,
                        cntr4: cntrLine.text,
                        t1: linT1.value,
                        t2: linT2.value);

                    Global.indexVal.value = sideBars[4];
                  }
                }, saveDraft: () async {
                  BlocProvider.of<HomeCubit>(context).nextStep(
                      key: "link",
                      cntr1: cntrLins.text,
                      cntr2: cntrLinp.text,
                      cntr3: cntrLinf.text,
                      cntr4: cntrLine.text,
                      t1: linT1.value,
                      t2: linT2.value);
                  await BlocProvider.of<HomeCubit>(context).saveDraft(state);
                  showToast(context);
                });
              default:
                return formContainer(value,
                    key: fkey5,
                    cntr1: cntrRevs,
                    cntr2: cntrRevp,
                    cntr3: cntrRevf,
                    cntr4: cntrReve,
                    t1: revT1,
                    t2: revT2,
                    isSubmit: true, onSubmit: () async {
                  if (fkey5.currentState!.validate()) {
                    BlocProvider.of<HomeCubit>(context).nextStep(
                        key: "review",
                        cntr1: cntrRevs.text,
                        cntr2: cntrRevp.text,
                        cntr3: cntrRevf.text,
                        cntr4: cntrReve.text,
                        t1: revT1.value,
                        t2: revT2.value);
                    clearFields();
                    showToast(context, txt: "Successfully form submitted !!");
                    BlocProvider.of<HomeCubit>(context).formSubmit();
                  }
                }, nextStep: () {}, saveDraft: () {});
            }
          },
        ),
        spaceHeight(20),
        ValueListenableBuilder(
          valueListenable: Global.indexVal,
          builder: (context, value, child) => sideBarContainer(value),
        )
      ],
    );
  }

///// web view
  Row webView(HomeLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        ValueListenableBuilder(
          valueListenable: Global.indexVal,
          builder: (context, value, child) {
            switch (value.index) {
              case 1:
                return Expanded(
                    flex: 4,
                    child: formContainer(value,
                        key: fkey1,
                        cntr1: cntrCas,
                        cntr2: cntrCap,
                        cntr3: cntrCaf,
                        cntr4: cntrCae,
                        t1: campT1,
                        t2: campT2, nextStep: () {
                      if (fkey1.currentState!.validate()) {
                        BlocProvider.of<HomeCubit>(context).nextStep(
                            key: "camp",
                            cntr1: cntrCas.text,
                            cntr2: cntrCap.text,
                            cntr3: cntrCaf.text,
                            cntr4: cntrCae.text,
                            t1: campT1.value,
                            t2: campT2.value);
                        Global.indexVal.value = sideBars[1];
                      }
                    }, saveDraft: () async {
                      BlocProvider.of<HomeCubit>(context).nextStep(
                          key: "camp",
                          cntr1: cntrCas.text,
                          cntr2: cntrCap.text,
                          cntr3: cntrCaf.text,
                          cntr4: cntrCae.text,
                          t1: campT1.value,
                          t2: campT2.value);
                      await BlocProvider.of<HomeCubit>(context)
                          .saveDraft(state);
                      showToast(context);
                    }));
              case 2:
                return Expanded(
                    flex: 4,
                    child: formContainer(value,
                        key: fkey2,
                        cntr1: cntrSes,
                        cntr2: cntrSep,
                        cntr3: cntrSef,
                        cntr4: cntrSee,
                        t1: segT1,
                        t2: segT2, nextStep: () {
                      if (fkey2.currentState!.validate()) {
                        BlocProvider.of<HomeCubit>(context).nextStep(
                            key: "seg",
                            cntr1: cntrSes.text,
                            cntr2: cntrSep.text,
                            cntr3: cntrSef.text,
                            cntr4: cntrSee.text,
                            t1: segT1.value,
                            t2: segT2.value);
                        Global.indexVal.value = sideBars[2];
                      }
                    }, saveDraft: () async {
                      BlocProvider.of<HomeCubit>(context).nextStep(
                          key: "seg",
                          cntr1: cntrSes.text,
                          cntr2: cntrSep.text,
                          cntr3: cntrSef.text,
                          cntr4: cntrSee.text,
                          t1: segT1.value,
                          t2: segT2.value);
                      await BlocProvider.of<HomeCubit>(context)
                          .saveDraft(state);
                      showToast(context);
                    }));
              case 3:
                return Expanded(
                    flex: 4,
                    child: formContainer(value,
                        key: fkey3,
                        cntr1: cntrBids,
                        cntr2: cntrBidp,
                        cntr3: cntrBidf,
                        cntr4: cntrBide,
                        t1: bidT1,
                        t2: bidT2, nextStep: () {
                      if (fkey3.currentState!.validate()) {
                        BlocProvider.of<HomeCubit>(context).nextStep(
                            key: "bid",
                            cntr1: cntrBids.text,
                            cntr2: cntrBidp.text,
                            cntr3: cntrBidf.text,
                            cntr4: cntrBide.text,
                            t1: bidT1.value,
                            t2: bidT2.value);
                        Global.indexVal.value = sideBars[3];
                      }
                    }, saveDraft: () async {
                      BlocProvider.of<HomeCubit>(context).nextStep(
                          key: "bid",
                          cntr1: cntrBids.text,
                          cntr2: cntrBidp.text,
                          cntr3: cntrBidf.text,
                          cntr4: cntrBide.text,
                          t1: bidT1.value,
                          t2: bidT2.value);
                      await BlocProvider.of<HomeCubit>(context)
                          .saveDraft(state);
                      showToast(context);
                    }));
              case 4:
                return Expanded(
                    flex: 4,
                    child: formContainer(value,
                        key: fkey4,
                        cntr1: cntrLins,
                        cntr2: cntrLinp,
                        cntr3: cntrLinf,
                        cntr4: cntrLine,
                        t1: linT1,
                        t2: linT2, nextStep: () {
                      if (fkey4.currentState!.validate()) {
                        BlocProvider.of<HomeCubit>(context).nextStep(
                            key: "link",
                            cntr1: cntrLins.text,
                            cntr2: cntrLinp.text,
                            cntr3: cntrLinf.text,
                            cntr4: cntrLine.text,
                            t1: linT1.value,
                            t2: linT2.value);
                        Global.indexVal.value = sideBars[4];
                      }
                    }, saveDraft: () async {
                      BlocProvider.of<HomeCubit>(context).nextStep(
                          key: "link",
                          cntr1: cntrLins.text,
                          cntr2: cntrLinp.text,
                          cntr3: cntrLinf.text,
                          cntr4: cntrLine.text,
                          t1: linT1.value,
                          t2: linT2.value);
                      await BlocProvider.of<HomeCubit>(context)
                          .saveDraft(state);
                      showToast(context);
                    }));
              default:
                return Expanded(
                    flex: 4,
                    child: formContainer(value,
                        key: fkey5,
                        cntr1: cntrRevs,
                        cntr2: cntrRevp,
                        cntr3: cntrRevf,
                        cntr4: cntrReve,
                        t1: revT1,
                        t2: revT2,
                        isSubmit: true, onSubmit: () {
                      if (fkey5.currentState!.validate()) {
                        BlocProvider.of<HomeCubit>(context).nextStep(
                            key: "review",
                            cntr1: cntrRevs.text,
                            cntr2: cntrRevp.text,
                            cntr3: cntrRevf.text,
                            cntr4: cntrReve.text,
                            t1: revT1.value,
                            t2: revT2.value);

                        clearFields();
                        showToast(context,
                            txt: "Successfully form submitted !!");
                        BlocProvider.of<HomeCubit>(context).formSubmit();
                      }
                    }, nextStep: () {}, saveDraft: () {}));
            }
          },
        ),
        const Expanded(flex: 1, child: SizedBox()),
        ValueListenableBuilder(
          valueListenable: Global.indexVal,
          builder: (context, value, child) =>
              Expanded(flex: 2, child: sideBarContainer(value)),
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }

//// side bar
  Widget sideBarContainer(SideBarModel value) {
    return Container(
      // height: sH(context)/1.5,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
          borderRadius: BorderRadius.circular(10),
          color: Global.white),
      child: SingleChildScrollView(
        physics:const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: sideBars.length,
              separatorBuilder: (context, index) => spaceHeight(20),
              itemBuilder: (context, index) {
                var data = sideBars[index];
                return HomeWidgets.menus(data, value.index, ontap: () {
                  // Global.indexVal.value = data;
                });
              },
            ),
            spaceHeight(100),
            const Text(
              "Need Help ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const Text(
              "Get to know how your campaign can reach a wider audience",
              style: TextStyle(color: Global.grey),
            ),
            spaceHeight(5),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Global.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text("Contact US"))
          ],
        ),
      ),
    );
  }

//// form
  Widget formContainer(SideBarModel value,
      {saveDraft,
      nextStep,
      TextEditingController? cntr1,
      TextEditingController? cntr2,
      TextEditingController? cntr3,
      TextEditingController? cntr4,
      t1,
      t2,
      isSubmit = false,
      key,
      onSubmit}) {
    return Container(
      // height: sH(context)/1.5,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
          borderRadius: BorderRadius.circular(10),
          color: Global.white),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                value.title,
                style: const TextStyle(
                    color: Global.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                value.subTitle,
                style: const TextStyle(color: Global.grey, fontSize: 15),
              ),
              spaceHeight(40),
              HomeWidgets.txtField(
                  title: "Campaign Subject",
                  hint: "Enter Subject",
                  cntr: cntr1),
              HomeWidgets.txtField(
                  title: "Preview text",
                  hint: "Enter text here ..",
                  cntr: cntr2,
                  isAddree: true,
                  addressTxt: "Keep this simple of 50 charater"),
              Row(
                children: [
                  Expanded(
                      child: HomeWidgets.txtField(
                          title: " " "From" " Name",
                          hint: "From Anne",
                          cntr: cntr3)),
                  spaceWidth(20),
                  Expanded(
                      child: HomeWidgets.txtField(
                          title: " " "From" " Email ",
                          hint: "Anne@example.com",
                          cntr: cntr4)),
                ],
              ),
              const Divider(),
              spaceHeight(20),
              HomeWidgets.toogleField(
                  val: t1, txt: "Run Only once per customer"),
              spaceHeight(10),
              HomeWidgets.toogleField(val: t2, txt: "Customer audience"),
              spaceHeight(20),
              RichText(
                text:  TextSpan(text: "You can set up a ", children: [
                  TextSpan(
                      text:
                          "custom domain or connect your email serivce provider ",
                      style: TextStyle(color: Global.orange)),
                  TextSpan(text: "to change this.")
                ]),
              ),
              spaceHeight(20),
              const Divider(),
              spaceHeight(40),
              isSubmit
                  ? ElevatedButton(
                      onPressed: onSubmit,
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(sW(context) / 2, 40),
                          foregroundColor: Global.white,
                          backgroundColor: Global.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                  : Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: saveDraft,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Global.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side:  BorderSide(color: Global.orange),
                              ),
                            ),
                            child: const Text(
                              "Save Draft",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        spaceWidth(20),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: nextStep,
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Global.white,
                                  backgroundColor: Global.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: const Text(
                                "Next Step",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

//clear fields
  clearFields() {
    log("********");
    cntrCas.text = "";
    cntrCap.text = "";
    cntrCaf.text = "";
    cntrCae.text = "";
    campT1.value = false;
    campT2.value = false;

    cntrSes.text = "";
    cntrSep.text = "";
    cntrSef.text = "";
    cntrSee.text = "";
    segT1.value = false;
    segT2.value = false;

    cntrBids.text = "";
    cntrBidp.text = "";
    cntrBidf.text = "";
    cntrBide.text = "";
    bidT1.value = false;
    bidT2.value = false;

    cntrLins.text = "";
    cntrLinp.text = "";
    cntrLinf.text = "";
    cntrLine.text = "";
    linT1.value = false;
    linT2.value = false;

    cntrRevs.text = "";
    cntrRevp.text = "";
    cntrRevf.text = "";
    cntrReve.text = "";
    revT1.value = false;
    revT2.value = false;
  }
}
