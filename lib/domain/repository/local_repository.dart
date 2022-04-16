import '../../utils/services/mcbp_db.dart';
import '../model/registration.dart';

class LocalRepository{
  var db = McbpDatabase.instance;

  Future<List<Registration>> getRegistrationList() async => db.registrationList();
}