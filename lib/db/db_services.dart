import 'package:get_storage/get_storage.dart';

class DbServices {
  final storage = GetStorage();
 
 Future<void>setData({  required String key,required String value})async{
  await storage.write(key, value);
 }

String getData(String key){
  return storage.read(key) ?? "";
}

}