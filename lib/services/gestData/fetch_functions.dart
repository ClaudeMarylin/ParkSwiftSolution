import 'package:comparking/helper/helper_functions.dart';
import 'package:comparking/main.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Json>?> fetchParkings() async {
  try {
    return await supabase.from('parking').select('name, imageURL');
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);    
    return null;
  } catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
}


Future<List<Json>?> fetchUtilisateurs() async {
  try {
    return await supabase.from('users').select('email');
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);
    return null;
  } catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
}
