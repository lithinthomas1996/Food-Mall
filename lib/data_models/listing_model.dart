/// Status : "success"
/// Data : [{"nItemId":305,"cItemName":"FARMTODINE IDLI AND DOSA BATTER","bCombItem":0,"cItemShName":"DIM","cItemImage":"/Images/1/invitem/305TI.jpg","bSubscription":true,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":60.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":60.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true},{"nItemId":311,"cItemName":"DELIGHT CHAPPATHI SET","bCombItem":0,"cItemShName":"CHA","cItemImage":"/Images/1/invitem/311TI.jpg","bSubscription":true,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":50.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":50.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true},{"nItemId":386,"cItemName":"AVEES PALAPPAM BATTER","bCombItem":0,"cItemShName":"APB","cItemImage":"/Images/1/invitem/TI08062021132151.jpg","bSubscription":false,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":75.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":75.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true},{"nItemId":387,"cItemName":"AVEES VELLAYAPPAM BATTER","bCombItem":0,"cItemShName":"AVB","cItemImage":"/Images/1/invitem/TI08062021132305.jpg","bSubscription":false,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":75.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":75.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true},{"nItemId":389,"cItemName":"V TASTY FROZEN MAIDA POROTTA","bCombItem":0,"cItemShName":"VTAS0389","cItemImage":"/Images/1/invitem/TI08062021104339.jpg","bSubscription":false,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":80.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":80.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true},{"nItemId":390,"cItemName":"V TASTY FROZEN WHEAT POROTTA","bCombItem":0,"cItemShName":"VTAS0390","cItemImage":"/Images/1/invitem/TI08062021113635.jpg","bSubscription":false,"nOutletId":2,"nItemGrpId":6,"nDefUnit":5,"nItemClusterId":3,"nCompanyId":1,"bActive":true,"bCancelled":false,"nMaxOrderQtyPerDay":0.00000,"nRate_WODisc":80.00000,"nUnitId":5,"cUnitName":"PKT","nTSort":2,"nBalanceAmt":80.00000,"bDiscPerc":0,"nFreeQty":0.00000,"bFreeItems":false,"bApplyDisc":true}]
/// Message : ""

class ListingModel {
  String? _status;
  List<Data>? _data;
  String? _message;

  String? get status => _status;
  List<Data>? get data => _data;
  String? get message => _message;

  ListingModel({
      String? status,
      List<Data>? data,
      String? message}){
    _status = status;
    _data = data;
    _message = message;
}

  ListingModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
    _message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['Data'] = _data!.map((v) => v.toJson()).toList();
    }
    map['Message'] = _message;
    return map;
  }

}

/// nItemId : 305
/// cItemName : "FARMTODINE IDLI AND DOSA BATTER"
/// bCombItem : 0
/// cItemShName : "DIM"
/// cItemImage : "/Images/1/invitem/305TI.jpg"
/// bSubscription : true
/// nOutletId : 2
/// nItemGrpId : 6
/// nDefUnit : 5
/// nItemClusterId : 3
/// nCompanyId : 1
/// bActive : true
/// bCancelled : false
/// nMaxOrderQtyPerDay : 0.00000
/// nRate_WODisc : 60.00000
/// nUnitId : 5
/// cUnitName : "PKT"
/// nTSort : 2
/// nBalanceAmt : 60.00000
/// bDiscPerc : 0
/// nFreeQty : 0.00000
/// bFreeItems : false
/// bApplyDisc : true

class Data {
  int? _nItemId;
  String? _cItemName;
  int? _bCombItem;
  String? _cItemShName;
  String? _cItemImage;
  bool? _bSubscription;
  int? _nOutletId;
  int? _nItemGrpId;
  int? _nDefUnit;
  int? _nItemClusterId;
  int? _nCompanyId;
  bool? _bActive;
  bool? _bCancelled;
  double? _nMaxOrderQtyPerDay;
  double? _nRateWODisc;
  int? _nUnitId;
  String? _cUnitName;
  int? _nTSort;
  double? _nBalanceAmt;
  int? _bDiscPerc;
  double? _nFreeQty;
  bool? _bFreeItems;
  bool? _bApplyDisc;

  int? get nItemId => _nItemId;
  String? get cItemName => _cItemName;
  int? get bCombItem => _bCombItem;
  String? get cItemShName => _cItemShName;
  String? get cItemImage => _cItemImage;
  bool? get bSubscription => _bSubscription;
  int? get nOutletId => _nOutletId;
  int? get nItemGrpId => _nItemGrpId;
  int? get nDefUnit => _nDefUnit;
  int? get nItemClusterId => _nItemClusterId;
  int? get nCompanyId => _nCompanyId;
  bool? get bActive => _bActive;
  bool? get bCancelled => _bCancelled;
  double? get nMaxOrderQtyPerDay => _nMaxOrderQtyPerDay;
  double? get nRateWODisc => _nRateWODisc;
  int? get nUnitId => _nUnitId;
  String? get cUnitName => _cUnitName;
  int? get nTSort => _nTSort;
  double? get nBalanceAmt => _nBalanceAmt;
  int? get bDiscPerc => _bDiscPerc;
  double? get nFreeQty => _nFreeQty;
  bool? get bFreeItems => _bFreeItems;
  bool? get bApplyDisc => _bApplyDisc;

  Data({
      int? nItemId,
      String? cItemName,
      int? bCombItem,
      String? cItemShName,
      String? cItemImage,
      bool? bSubscription,
      int? nOutletId,
      int? nItemGrpId,
      int? nDefUnit,
      int? nItemClusterId,
      int? nCompanyId,
      bool? bActive,
      bool? bCancelled,
      double? nMaxOrderQtyPerDay,
      double? nRateWODisc,
      int? nUnitId,
      String? cUnitName,
      int? nTSort,
      double? nBalanceAmt,
      int? bDiscPerc,
      double? nFreeQty,
      bool? bFreeItems,
      bool? bApplyDisc}){
    _nItemId = nItemId;
    _cItemName = cItemName;
    _bCombItem = bCombItem;
    _cItemShName = cItemShName;
    _cItemImage = cItemImage;
    _bSubscription = bSubscription;
    _nOutletId = nOutletId;
    _nItemGrpId = nItemGrpId;
    _nDefUnit = nDefUnit;
    _nItemClusterId = nItemClusterId;
    _nCompanyId = nCompanyId;
    _bActive = bActive;
    _bCancelled = bCancelled;
    _nMaxOrderQtyPerDay = nMaxOrderQtyPerDay;
    _nRateWODisc = nRateWODisc;
    _nUnitId = nUnitId;
    _cUnitName = cUnitName;
    _nTSort = nTSort;
    _nBalanceAmt = nBalanceAmt;
    _bDiscPerc = bDiscPerc;
    _nFreeQty = nFreeQty;
    _bFreeItems = bFreeItems;
    _bApplyDisc = bApplyDisc;
}

  Data.fromJson(dynamic json) {
    _nItemId = json['nItemId'];
    _cItemName = json['cItemName'];
    _bCombItem = json['bCombItem'];
    _cItemShName = json['cItemShName'];
    _cItemImage = json['cItemImage'];
    _bSubscription = json['bSubscription'];
    _nOutletId = json['nOutletId'];
    _nItemGrpId = json['nItemGrpId'];
    _nDefUnit = json['nDefUnit'];
    _nItemClusterId = json['nItemClusterId'];
    _nCompanyId = json['nCompanyId'];
    _bActive = json['bActive'];
    _bCancelled = json['bCancelled'];
    _nMaxOrderQtyPerDay = json['nMaxOrderQtyPerDay'];
    _nRateWODisc = json['nRate_WODisc'];
    _nUnitId = json['nUnitId'];
    _cUnitName = json['cUnitName'];
    _nTSort = json['nTSort'];
    _nBalanceAmt = json['nBalanceAmt'];
    _bDiscPerc = json['bDiscPerc'];
    _nFreeQty = json['nFreeQty'];
    _bFreeItems = json['bFreeItems'];
    _bApplyDisc = json['bApplyDisc'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['nItemId'] = _nItemId;
    map['cItemName'] = _cItemName;
    map['bCombItem'] = _bCombItem;
    map['cItemShName'] = _cItemShName;
    map['cItemImage'] = _cItemImage;
    map['bSubscription'] = _bSubscription;
    map['nOutletId'] = _nOutletId;
    map['nItemGrpId'] = _nItemGrpId;
    map['nDefUnit'] = _nDefUnit;
    map['nItemClusterId'] = _nItemClusterId;
    map['nCompanyId'] = _nCompanyId;
    map['bActive'] = _bActive;
    map['bCancelled'] = _bCancelled;
    map['nMaxOrderQtyPerDay'] = _nMaxOrderQtyPerDay;
    map['nRate_WODisc'] = _nRateWODisc;
    map['nUnitId'] = _nUnitId;
    map['cUnitName'] = _cUnitName;
    map['nTSort'] = _nTSort;
    map['nBalanceAmt'] = _nBalanceAmt;
    map['bDiscPerc'] = _bDiscPerc;
    map['nFreeQty'] = _nFreeQty;
    map['bFreeItems'] = _bFreeItems;
    map['bApplyDisc'] = _bApplyDisc;
    return map;
  }

}