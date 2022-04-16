import 'package:mcbp/domain/repository/local_repository.dart';

class LocalUseCase{
  getRegistrationList() async => LocalRepository().getRegistrationList();
}