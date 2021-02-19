import 'package:account_service/src/models/index.dart';

class AccountRepository {
  late Account _account;

  Account get account {
    if (_account == null) {
      return Account(
        (b) => b
          ..token = '92ffef8629332e06d272e147bbcf0b392a1b2377'
          ..id = 1
          ..username = 'aliyazdi75'
          ..email = 'ma.yazdi75@gmail.com'
          ..firstName = 'Ali'
          ..lastName = 'Yazdi',
      );
      // todo: try get from database
      // throw UnimplementedError('Get Local Account not implemented yet.');
    }
    return _account;
  }

  set account(Account account) {
    _account = account;
  }
}
