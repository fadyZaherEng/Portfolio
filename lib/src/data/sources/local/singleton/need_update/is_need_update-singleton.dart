
class IsNeedUpdateSingleton {
  IsNeedUpdateSingleton._();

  static final IsNeedUpdateSingleton _instance = IsNeedUpdateSingleton._();

  factory IsNeedUpdateSingleton() => _instance;

  IsNeedToUpdate _isNeedUpdate =   IsNeedToUpdate();

  void setIsNeedToUpdateDialog(IsNeedToUpdate value) {
    _isNeedUpdate = value;
  }

  IsNeedToUpdate getIsNeedToUpdateDialog() {
    return _isNeedUpdate;
  }
}

class IsNeedToUpdate {
}
