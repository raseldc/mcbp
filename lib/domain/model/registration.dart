const String tableRegistration = 'registration';

class RegistrationFields{
  static final String id = '_id';
  static final String nationalId="nationalId";
  static final String birthDate="birthDate";
  static final String personalNameInBangla="personalNameInBangla";
  static final String personalNameInEnglish="personalNameInEnglish";
  static final String personalFatherName="personalFatherName";
  static final String personalMotherName="personalMotherName";
  static final String personalHusbandName="personalHusbandName";
  static final String personalNickName="personalNickName";
  static final String personalBirthPlace="personalBirthPlace";
  static final String personalReligeon="personalReligeon";
  static final String personalMobileNo="personalMobileNo";
  static final String personalEducation="personalEducation";
  static final String personalBloodGroup="personalBloodGroup";
  static final String personalMaritialStatus="personalMaritialStatus";
  static final String presentDivision="presentDivision";
  static final String presentDistrict="presentDistrict";
  static final String presentSubDistrict="presentSubDistrict";
  static final String presentUnion="presentUnion";
  static final String presentVillage="presentVillage";
  static final String presentPostCode="presentPostCode";
  static final String presentStreet="presentStreet";
  static final String permanentDivision="permanentDivision";
  static final String permanentDistrict="permanentDistrict";
  static final String permanentSubDistrict="permanentSubDistrict";
  static final String permanentUnion="permanentUnion";
  static final String permanentVillage="permanentVillage";
  static final String permanentPostCode="permanentPostCode";
  static final String permanentStreet="permanentStreet";
  static final String propertyAmount="propertyAmount";
  static final String familyHeadOccupation="familyHeadOccupation";
  static final String husbandMonthlyIncome="husbandMonthlyIncome";
  static final String sanitationFacility="sanitationFacility";
  static final String electricityFacility="electricityFacility";
  static final String electricityFan="electricityFan";
  static final String tubewelFacility="tubewelFacility";
  static final String bedRoomWall="bedRoomWall";
  static final String disablePerson="disablePerson";
  static final String conceptionPriod="conceptionPriod";
  static final String conceptionTimeInWeek="conceptionTimeInWeek";
  static final String paymentType="paymentType";
  static final String accountName="accountName";
  static final String accountNumber="accountNumber";
  static final String photo="photo";
  static final String signature="signature";
  static final String attachment="attachment";
}

class Registration{

  int? id;
  String? nationalId;
  String? birthDate;
  String? personalNameInBangla;
  String? personalNameInEnglish;
  String? personalFatherName;
  String? personalMotherName;
  String? personalHusbandName;
  String? personalNickName;
  String? personalBirthPlace;
  String? personalReligeon;
  String? personalMobileNo;
  String? personalEducation;
  String? personalBloodGroup;
  String? personalMaritialStatus;
  String? presentDivision;
  String? presentDistrict;
  String? presentSubDistrict;
  String? presentUnion;
  String? presentVillage;
  String? presentPostCode;
  String? presentStreet;
  String? permanentDivision;
  String? permanentDistrict;
  String? permanentSubDistrict;
  String? permanentUnion;
  String? permanentVillage;
  String? permanentPostCode;
  String? permanentStreet;
  String? propertyAmount;
  String? familyHeadOccupation;
  String? husbandMonthlyIncome;
  String? sanitationFacility;
  String? electricityFacility;
  String? electricityFan;
  String? tubewelFacility;
  String? bedRoomWall;
  String? disablePerson;
  String? conceptionPriod;
  String? conceptionTimeInWeek;
  String? paymentType;
  String? accountName;
  String? accountNumber;
  String? photo;
  String? signature;
  String? attachment;


  Registration({
    this.id,
    required this.nationalId,
    required this.birthDate,
    required this.personalNameInBangla,
    required this.personalNameInEnglish,
    required this.personalFatherName,
    required this.personalMotherName,
    required this.personalHusbandName,
    required this.personalNickName,
    required this.personalBirthPlace,
    required this.personalReligeon,
    required this.personalMobileNo,
    required this.personalEducation,
    required this.personalBloodGroup,
    required this.personalMaritialStatus,
    required this.presentDivision,
    required this.presentDistrict,
    required this.presentSubDistrict,
    required this.presentUnion,
    required this.presentVillage,
    required this.presentPostCode,
    required this.presentStreet,
    required this.permanentDivision,
    required this.permanentDistrict,
    required this.permanentSubDistrict,
    required this.permanentUnion,
    required this.permanentVillage,
    required this.permanentPostCode,
    required this.permanentStreet,
    required this.propertyAmount,
    required this.familyHeadOccupation,
    required this.husbandMonthlyIncome,
    required this.sanitationFacility,
    required this.electricityFacility,
    required this.electricityFan,
    required this.tubewelFacility,
    required this.bedRoomWall,
    required this.disablePerson,
    required this.conceptionPriod,
    required this.conceptionTimeInWeek,
    required this.paymentType,
    required this.accountName,
    required this.accountNumber,
    required this.photo,
    required this.signature,
    required this.attachment
  });

  Map<String, Object?> toJson()=>{
    RegistrationFields.id: id,
    RegistrationFields.nationalId:nationalId,
    RegistrationFields.birthDate:birthDate,
    RegistrationFields.personalNameInBangla:personalNameInBangla,
    RegistrationFields.personalNameInEnglish:personalNameInEnglish,
    RegistrationFields.personalFatherName:personalFatherName,
    RegistrationFields.personalMotherName:personalMotherName,
    RegistrationFields.personalHusbandName:personalHusbandName,
    RegistrationFields.personalNickName:personalNickName,
    RegistrationFields.personalBirthPlace:personalBirthPlace,
    RegistrationFields.personalReligeon:personalReligeon,
    RegistrationFields.personalMobileNo:personalMobileNo,
    RegistrationFields.personalEducation:personalEducation,
    RegistrationFields.personalBloodGroup:personalBloodGroup,
    RegistrationFields.personalMaritialStatus:personalMaritialStatus,
    RegistrationFields.presentDivision:presentDivision,
    RegistrationFields.presentDistrict:presentDistrict,
    RegistrationFields.presentSubDistrict:presentSubDistrict,
    RegistrationFields.presentUnion:presentUnion,
    RegistrationFields.presentVillage:presentVillage,
    RegistrationFields.presentPostCode:presentPostCode,
    RegistrationFields.presentStreet:presentStreet,
    RegistrationFields.permanentDivision:permanentDivision,
    RegistrationFields.permanentDistrict:permanentDistrict,
    RegistrationFields.permanentSubDistrict:permanentSubDistrict,
    RegistrationFields.permanentUnion:permanentUnion,
    RegistrationFields.permanentVillage:permanentVillage,
    RegistrationFields.permanentPostCode:permanentPostCode,
    RegistrationFields.permanentStreet:permanentStreet,
    RegistrationFields.propertyAmount:propertyAmount,
    RegistrationFields.familyHeadOccupation:familyHeadOccupation,
    RegistrationFields.husbandMonthlyIncome:husbandMonthlyIncome,
    RegistrationFields.sanitationFacility:sanitationFacility,
    RegistrationFields.electricityFacility:electricityFacility,
    RegistrationFields.electricityFan:electricityFan,
    RegistrationFields.tubewelFacility:tubewelFacility,
    RegistrationFields.bedRoomWall:bedRoomWall,
    RegistrationFields.disablePerson:disablePerson,
    RegistrationFields.conceptionPriod:conceptionPriod,
    RegistrationFields.conceptionTimeInWeek:conceptionTimeInWeek,
    RegistrationFields.paymentType:paymentType,
    RegistrationFields.accountName:accountName,
    RegistrationFields.accountNumber:accountNumber,
    RegistrationFields.photo:photo,
    RegistrationFields.signature:signature,
    RegistrationFields.attachment:attachment,
  };

  Registration copy({
    int? id,
    String? nationalId,
    String? birthDate,
    String? personalNameInBangla,
    String? personalNameInEnglish,
    String? personalFatherName,
    String? personalMotherName,
    String? personalHusbandName,
    String? personalNickName,
    String? personalBirthPlace,
    String? personalReligeon,
    String? personalMobileNo,
    String? personalEducation,
    String? personalBloodGroup,
    String? personalMaritialStatus,
    String? presentDivision,
    String? presentDistrict,
    String? presentSubDistrict,
    String? presentUnion,
    String? presentVillage,
    String? presentPostCode,
    String? presentStreet,
    String? permanentDivision,
    String? permanentDistrict,
    String? permanentSubDistrict,
    String? permanentUnion,
    String? permanentVillage,
    String? permanentPostCode,
    String? permanentStreet,
    String? propertyAmount,
    String? familyHeadOccupation,
    String? husbandMonthlyIncome,
    String? sanitationFacility,
    String? electricityFacility,
    String? electricityFan,
    String? tubewelFacility,
    String? bedRoomWall,
    String? disablePerson,
    String? conceptionPriod,
    String? conceptionTimeInWeek,
    String? paymentType,
    String? accountName,
    String? accountNumber,
    String? photo,
    String? signature,
    String? attachment
  })=>
  Registration(
      id: id?? this.id,
      nationalId: nationalId ?? this.nationalId,
      birthDate: birthDate ?? this.birthDate,
      personalNameInBangla: personalNameInBangla ?? this.personalNameInBangla,
      personalNameInEnglish: personalNameInEnglish ?? this.personalNameInEnglish,
      personalFatherName: personalFatherName ?? this.personalFatherName,
      personalMotherName: personalMotherName ?? this.personalMotherName,
      personalHusbandName: personalHusbandName ?? this.personalHusbandName,
      personalNickName:personalNickName ?? this.personalNickName,
      personalBirthPlace: personalBirthPlace ?? this.personalBirthPlace,
      personalReligeon: personalReligeon ?? this.personalReligeon,
      personalMobileNo: personalMobileNo ?? this.personalMobileNo,
      personalEducation: personalEducation ?? this.personalEducation,
      personalBloodGroup: personalBloodGroup ?? this.personalBloodGroup,
      personalMaritialStatus: personalMaritialStatus ?? this.personalMaritialStatus,
      presentDivision: presentDivision ?? this.presentDivision,
      presentDistrict: presentDistrict ?? this.presentDistrict,
      presentSubDistrict: presentSubDistrict ?? this.presentSubDistrict,
      presentUnion: presentUnion ?? this.presentUnion,
      presentVillage: presentVillage ?? this.presentVillage,
      presentPostCode: presentPostCode ?? this.presentPostCode,
      presentStreet: presentStreet ?? this.presentStreet,
      permanentDivision: permanentDivision ?? this.permanentDivision,
      permanentDistrict: permanentDistrict ?? this.permanentDistrict,
      permanentSubDistrict: permanentSubDistrict ?? this.permanentSubDistrict,
      permanentUnion: permanentUnion ?? this.permanentUnion,
      permanentVillage: permanentVillage ?? this.permanentVillage,
      permanentPostCode: permanentPostCode ?? this.permanentPostCode,
      permanentStreet: permanentStreet ?? this.permanentStreet,
      propertyAmount: propertyAmount ?? this.propertyAmount,
      familyHeadOccupation: familyHeadOccupation ?? this.familyHeadOccupation,
      husbandMonthlyIncome: husbandMonthlyIncome ?? this.husbandMonthlyIncome,
      sanitationFacility: sanitationFacility ?? this.sanitationFacility,
      electricityFacility: electricityFacility ?? this.electricityFacility,
      electricityFan: electricityFan ?? this.electricityFan,
      tubewelFacility: tubewelFacility ?? this.tubewelFacility,
      bedRoomWall: bedRoomWall ?? this.bedRoomWall,
      disablePerson: disablePerson ?? this.disablePerson,
      conceptionPriod: conceptionPriod ?? this.conceptionPriod,
      conceptionTimeInWeek: conceptionTimeInWeek ?? this.conceptionTimeInWeek,
      paymentType: paymentType ?? this.paymentType,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      photo: photo ?? this.photo,
      signature: signature ?? this.signature,
      attachment: attachment ?? this.attachment
  );

  Registration.fromMap(Map<String, dynamic> map) {
    nationalId = map['nationalId'];
    birthDate = map['birthDate'];
    personalNameInBangla = map['personalNameInBangla'];
    personalNameInEnglish = map['personalNameInEnglish'];
    personalFatherName = map['personalFatherName'];
    personalMotherName = map['personalMotherName'];
    personalHusbandName = map['personalHusbandName'];
    personalNickName = map['personalNickName'];
    personalBirthPlace = map['personalBirthPlace'];
    personalReligeon = map['personalReligeon'];
    personalMobileNo = map['personalMobileNo'];
    personalEducation = map['personalEducation'];
    personalBloodGroup = map['personalBloodGroup'];
    personalMaritialStatus = map['personalMaritialStatus'];
    presentDivision = map['presentDivision'];
    presentDistrict = map['presentDistrict'];
    presentSubDistrict = map['presentSubDistrict'];
    presentUnion = map['presentUnion'];
    presentVillage = map['presentVillage'];
    presentPostCode = map['presentPostCode'];
    presentStreet = map['presentStreet'];
    permanentDivision = map['permanentDivision'];
    permanentDistrict = map['permanentDistrict'];
    permanentSubDistrict = map['permanentSubDistrict'];
    permanentUnion = map['permanentUnion'];
    permanentVillage = map['permanentVillage'];
    permanentPostCode = map['permanentPostCode'];
    permanentStreet = map['permanentStreet'];
    propertyAmount = map['propertyAmount'];
    familyHeadOccupation = map['familyHeadOccupation'];
    husbandMonthlyIncome = map['husbandMonthlyIncome'];
    sanitationFacility = map['sanitationFacility'];
    electricityFacility = map['electricityFacility'];
    electricityFan = map['electricityFan'];
    tubewelFacility = map['tubewelFacility'];
    bedRoomWall = map['bedRoomWall'];
    disablePerson = map['disablePerson'];
    conceptionPriod = map['conceptionPriod'];
    conceptionTimeInWeek = map['conceptionTimeInWeek'];
    paymentType = map['paymentType'];
    accountName = map['accountName'];
    accountNumber = map['accountNumber'];
    photo = map['photo'];
    signature = map['signature'];
    attachment = map['attachment'];
  }
}