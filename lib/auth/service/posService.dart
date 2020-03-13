class Pos {
  String PinId;
  int PosPointId;
  String PosPointName;
  bool HasReadPermission;
  bool HasCreatePermission;
  bool HasUpdatePermission;
  bool HasDeletePermission;

  Pos(this.PinId,
      this.PosPointId,
      this.PosPointName,
      this.HasReadPermission,
      this.HasCreatePermission,
      this.HasUpdatePermission,
      this.HasDeletePermission);

  Pos.fromJson(Map<String, dynamic> json) {
    PinId = json['Id'];
    PosPointId = json['PosPointId'];
    PosPointName = json['PosPointName'];
    HasReadPermission = json['HasReadPermission'];
    HasCreatePermission = json['HasCreatePermission'];
    HasUpdatePermission = json['HasUpdatePermission'];
    HasDeletePermission = json['HasDeletePermission'];
  }
}