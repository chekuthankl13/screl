import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screl/config/global.dart';
import 'package:screl/modules/home/models/side_bar_model.dart';
import 'package:screl/utils/utils.dart';

class HomeWidgets {


/////// side bar menu tiles

 static Row menus(SideBarModel data, int value, {required Null Function() ontap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                            GestureDetector(
                              onTap: ontap,
                              child: Container(
                                height: 40, 
                                width: 40, 
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: value == data.index ?Global.orange:null,
                                  shape: BoxShape.circle, 
                                  border: Border.all(color:value == data.index ?Global.orange: Global.grey), 
                                  
                                ),
                                child: Text(data.index.toString(),style: TextStyle(color: value == data.index ?Global.white:Global.grey),),
                              ),
                            ), 
                            spaceWidth(10), 
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title,style: TextStyle(fontSize: 17,fontWeight: value == data.index ?FontWeight.bold:null),),
                                  spaceHeight(2), 
                                  Text(data.subTitle,style:const TextStyle(fontSize: 12,color: Global.grey),),
                              
                                ],
                              ),
                            )
                          ],);
  }


//// textform field 

static  Column txtField({isAddree = false, addressTxt = "",title,hint,cntr}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:const TextStyle(
              fontWeight: FontWeight.w600, color: Global.black, fontSize: 13),
        ),
        spaceHeight(10),
        TextFormField(
          controller: cntr,
          maxLines: isAddree ? 5 : 1,
          autovalidateMode: AutovalidateMode.onUnfocus,
          validator: (value) {
            if (value!.isEmpty){
              return "*required !!";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:const TextStyle(
                  color: Global.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Global.orange,
                  )),
                  errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(
                    color: Global.orange,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Global.grey,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Global.grey,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(
                    color: Global.orange,
                  ))),
        ),
        isAddree
            ? Text(
                addressTxt,
                style:const TextStyle(color: Global.grey),
              )
            : const SizedBox.shrink(),
        spaceHeight(30)
      ],
    );
  }

/// toogle buttons of forms
static  Row toogleField({txt,val}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
         txt,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        ValueListenableBuilder<bool>(valueListenable: val, builder: (context, value, child) => CupertinoSwitch(
          activeColor: Global.orange,
          thumbColor: Global.white,
          trackColor: Colors.black12,
          value: value,
          onChanged: (value) =>  val.value = value,
        ),)
      ],
    );
  }


}