/// Status : "success"
/// Data : [{"nItemGrpId":4,"cGrpName":"EGG","cGroupImage":"/Images/1/Cluster/CL_IMG20200508104147960.jpg"},{"nItemGrpId":2,"cGrpName":"MILK & MILK PRODUCTS","cGroupImage":"/Images/1/Cluster/CL_IMG20220118091712625.jpg"},{"nItemGrpId":3,"cGrpName":"READY TO COOK","cGroupImage":"/Images/1/Cluster/CL_IMG20200501114104770.jpg"},{"nItemGrpId":5,"cGrpName":"READY TO EAT","cGroupImage":"/Images/1/Cluster/CL_IMG20200508115313039.jpg"}]
/// Message : ""

class GroupModel {
  String? _status;
  List<Data>? _data;
  String? _message;

  String? get status => _status;
  List<Data>? get data => _data;
  String? get message => _message;

  GroupModel({
      String? status,
      List<Data>? data,
      String? message}){
    _status = status;
    _data = data;
    _message = message;
}

  GroupModel.fromJson(dynamic json) {
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

/// nItemGrpId : 4
/// cGrpName : "EGG"
/// cGroupImage : "/Images/1/Cluster/CL_IMG20200508104147960.jpg"

class Data {
  int? _nItemGrpId;
  String? _cGrpName;
  String? _cGroupImage;

  int? get nItemGrpId => _nItemGrpId;
  String? get cGrpName => _cGrpName;
  String? get cGroupImage => _cGroupImage;

  Data({
      int? nItemGrpId,
      String? cGrpName,
      String? cGroupImage}){
    _nItemGrpId = nItemGrpId;
    _cGrpName = cGrpName;
    _cGroupImage = cGroupImage;
}

  Data.fromJson(dynamic json) {
    _nItemGrpId = json['nItemGrpId'];
    _cGrpName = json['cGrpName'];
    _cGroupImage = json['cGroupImage'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['nItemGrpId'] = _nItemGrpId;
    map['cGrpName'] = _cGrpName;
    map['cGroupImage'] = _cGroupImage;
    return map;
  }

}