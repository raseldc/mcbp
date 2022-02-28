class District {
  String id;
  String creationDate;
  String? modificationDate;
  String isDeleted;
  String active;
  String code;
  String nameInBangla;
  String nameInEnglish;
  String createdBy;
  String? modifiedBy;
  String divisionId;

  District({
    required this.id,
    required this.creationDate,
    this.modificationDate,
    required this.isDeleted,
    required this.active,
    required this.code,
    required this.nameInBangla,
    required this.nameInEnglish,
    required this.createdBy,
    this.modifiedBy,
    required this.divisionId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is District &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          creationDate == other.creationDate &&
          modificationDate == other.modificationDate &&
          isDeleted == other.isDeleted &&
          active == other.active &&
          code == other.code &&
          nameInBangla == other.nameInBangla &&
          nameInEnglish == other.nameInEnglish &&
          createdBy == other.createdBy &&
          modifiedBy == other.modifiedBy &&
          divisionId == other.divisionId);

  @override
  int get hashCode =>
      id.hashCode ^
      creationDate.hashCode ^
      modificationDate.hashCode ^
      isDeleted.hashCode ^
      active.hashCode ^
      code.hashCode ^
      nameInBangla.hashCode ^
      nameInEnglish.hashCode ^
      createdBy.hashCode ^
      modifiedBy.hashCode ^
      divisionId.hashCode;

  @override
  String toString() {
    return 'District{' +
        ' id: $id,' +
        ' creationDate: $creationDate,' +
        ' modificationDate: $modificationDate,' +
        ' isDeleted: $isDeleted,' +
        ' active: $active,' +
        ' code: $code,' +
        ' nameInBangla: $nameInBangla,' +
        ' nameInEnglish: $nameInEnglish,' +
        ' createdBy: $createdBy,' +
        ' modifiedBy: $modifiedBy,' +
        ' divisionId: $divisionId,' +
        '}';
  }

  District copyWith({
    String? id,
    String? creationDate,
    String? modificationDate,
    String? isDeleted,
    String? active,
    String? code,
    String? nameInBangla,
    String? nameInEnglish,
    String? createdBy,
    String? modifiedBy,
    String? divisionId,
  }) {
    return District(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      modificationDate: modificationDate ?? this.modificationDate,
      isDeleted: isDeleted ?? this.isDeleted,
      active: active ?? this.active,
      code: code ?? this.code,
      nameInBangla: nameInBangla ?? this.nameInBangla,
      nameInEnglish: nameInEnglish ?? this.nameInEnglish,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      divisionId: divisionId ?? this.divisionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'creationDate': this.creationDate,
      'modificationDate': this.modificationDate,
      'isDeleted': this.isDeleted,
      'active': this.active,
      'code': this.code,
      'nameInBangla': this.nameInBangla,
      'nameInEnglish': this.nameInEnglish,
      'createdBy': this.createdBy,
      'modifiedBy': this.modifiedBy,
      'divisionId': this.divisionId,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'] as String,
      creationDate: map['creationDate'] as String,
      modificationDate: map['modificationDate'] as String,
      isDeleted: map['isDeleted'] as String,
      active: map['active'] as String,
      code: map['code'] as String,
      nameInBangla: map['nameInBangla'] as String,
      nameInEnglish: map['nameInEnglish'] as String,
      createdBy: map['createdBy'] as String,
      modifiedBy: map['modifiedBy'] as String,
      divisionId: map['divisionId'] as String,
    );
  }

//</editor-fold>
}