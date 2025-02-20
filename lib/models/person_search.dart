class PersonSearchModel {
  String? _tahoeId;
  Name? _name;
  bool? _isPublic;
  bool? _isOptedOut;
  int? _sparseFlag;
  bool? _isPremium;
  String? _dob;
  int? _age;
  String? _dobFirstSeen;
  String? _dobLastSeen;
  List<Null>? _datesOfDeath;
  DeathRecords? _deathRecords;
  List<Akas>? _akas;
  List<MergedNames>? _mergedNames;
  List<Locations>? _locations;
  List<Addresses>? _addresses;
  List<PhoneNumbers>? _phoneNumbers;
  List<EmailAddresses>? _emailAddresses;
  List<RelativesSummary>? _relativesSummary;
  List<AssociatesSummary>? _associatesSummary;
  List<Associates>? _associates;
  String? _fullName;
  Indicators? _indicators;
  List<Null>? _driversLicenseDetail;
  bool? _hasAdditionalData;
  PropensityToPayScore? _propensityToPayScore;

  PersonSearchModel(
      {String? tahoeId,
      Name? name,
      bool? isPublic,
      bool? isOptedOut,
      int? sparseFlag,
      bool? isPremium,
      String? dob,
      int? age,
      String? dobFirstSeen,
      String? dobLastSeen,
      List<Null>? datesOfDeath,
      DeathRecords? deathRecords,
      List<Akas>? akas,
      List<MergedNames>? mergedNames,
      List<Locations>? locations,
      List<Addresses>? addresses,
      List<PhoneNumbers>? phoneNumbers,
      List<EmailAddresses>? emailAddresses,
      List<RelativesSummary>? relativesSummary,
      List<AssociatesSummary>? associatesSummary,
      List<Associates>? associates,
      String? fullName,
      Indicators? indicators,
      List<Null>? driversLicenseDetail,
      bool? hasAdditionalData,
      PropensityToPayScore? propensityToPayScore}) {
    if (tahoeId != null) {
      this._tahoeId = tahoeId;
    }
    if (name != null) {
      this._name = name;
    }
    if (isPublic != null) {
      this._isPublic = isPublic;
    }
    if (isOptedOut != null) {
      this._isOptedOut = isOptedOut;
    }
    if (sparseFlag != null) {
      this._sparseFlag = sparseFlag;
    }
    if (isPremium != null) {
      this._isPremium = isPremium;
    }
    if (dob != null) {
      this._dob = dob;
    }
    if (age != null) {
      this._age = age;
    }
    if (dobFirstSeen != null) {
      this._dobFirstSeen = dobFirstSeen;
    }
    if (dobLastSeen != null) {
      this._dobLastSeen = dobLastSeen;
    }
    if (datesOfDeath != null) {
      this._datesOfDeath = datesOfDeath;
    }
    if (deathRecords != null) {
      this._deathRecords = deathRecords;
    }
    if (akas != null) {
      this._akas = akas;
    }
    if (mergedNames != null) {
      this._mergedNames = mergedNames;
    }
    if (locations != null) {
      this._locations = locations;
    }
    if (addresses != null) {
      this._addresses = addresses;
    }
    if (phoneNumbers != null) {
      this._phoneNumbers = phoneNumbers;
    }
    if (emailAddresses != null) {
      this._emailAddresses = emailAddresses;
    }
    if (relativesSummary != null) {
      this._relativesSummary = relativesSummary;
    }
    if (associatesSummary != null) {
      this._associatesSummary = associatesSummary;
    }
    if (associates != null) {
      this._associates = associates;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (indicators != null) {
      this._indicators = indicators;
    }
    if (driversLicenseDetail != null) {
      this._driversLicenseDetail = driversLicenseDetail;
    }
    if (hasAdditionalData != null) {
      this._hasAdditionalData = hasAdditionalData;
    }
    if (propensityToPayScore != null) {
      this._propensityToPayScore = propensityToPayScore;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tahoeId'] = this._tahoeId;
    if (this._name != null) {
      data['name'] = this._name!.toJson();
    }
    data['isPublic'] = this._isPublic;
    data['isOptedOut'] = this._isOptedOut;
    data['sparseFlag'] = this._sparseFlag;
    data['isPremium'] = this._isPremium;
    data['dob'] = this._dob;
    data['age'] = this._age;
    data['dobFirstSeen'] = this._dobFirstSeen;
    data['dobLastSeen'] = this._dobLastSeen;
    if (this._datesOfDeath != null) {
      data['datesOfDeath'] = this._datesOfDeath!.map((v) => v).toList();
    }
    if (this._deathRecords != null) {
      data['deathRecords'] = this._deathRecords!.toJson();
    }
    if (this._akas != null) {
      data['akas'] = this._akas!.map((v) => v.toJson()).toList();
    }
    if (this._mergedNames != null) {
      data['mergedNames'] = this._mergedNames!.map((v) => v.toJson()).toList();
    }
    if (this._locations != null) {
      data['locations'] = this._locations!.map((v) => v.toJson()).toList();
    }
    if (this._addresses != null) {
      data['addresses'] = this._addresses!.map((v) => v.toJson()).toList();
    }
    if (this._phoneNumbers != null) {
      data['phoneNumbers'] =
          this._phoneNumbers!.map((v) => v.toJson()).toList();
    }
    if (this._emailAddresses != null) {
      data['emailAddresses'] =
          this._emailAddresses!.map((v) => v.toJson()).toList();
    }
    if (this._relativesSummary != null) {
      data['relativesSummary'] =
          this._relativesSummary!.map((v) => v.toJson()).toList();
    }
    if (this._associatesSummary != null) {
      data['associatesSummary'] =
          this._associatesSummary!.map((v) => v.toJson()).toList();
    }
    if (this._associates != null) {
      data['associates'] = this._associates!.map((v) => v.toJson()).toList();
    }
    data['fullName'] = this._fullName;
    if (this._indicators != null) {
      data['indicators'] = this._indicators!.toJson();
    }
    if (this._driversLicenseDetail != null) {
      data['driversLicenseDetail'] =
          this._driversLicenseDetail!.map((v) => v).toList();
    }
    data['hasAdditionalData'] = this._hasAdditionalData;
    if (this._propensityToPayScore != null) {
      data['propensityToPayScore'] = this._propensityToPayScore!.toJson();
    }
    return data;
  }
}

class Akas {
  // Properties of the Akas class
  String? alias;
  String? type;

  Akas({this.alias, this.type});

  // fromJson and toJson methods
  Akas.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'alias': alias,
      'type': type,
    };
  }
}

class Name {
  String? _prefix;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _suffix;
  List<String>? _rawNames;
  String? _publicFirstSeenDate;
  String? _totalFirstSeenDate;
  Null? _sourceSummary;

  Name(
      {String? prefix,
      String? firstName,
      String? middleName,
      String? lastName,
      String? suffix,
      List<String>? rawNames,
      String? publicFirstSeenDate,
      String? totalFirstSeenDate,
      Null? sourceSummary}) {
    if (prefix != null) {
      this._prefix = prefix;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (middleName != null) {
      this._middleName = middleName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (suffix != null) {
      this._suffix = suffix;
    }
    if (rawNames != null) {
      this._rawNames = rawNames;
    }
    if (publicFirstSeenDate != null) {
      this._publicFirstSeenDate = publicFirstSeenDate;
    }
    if (totalFirstSeenDate != null) {
      this._totalFirstSeenDate = totalFirstSeenDate;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  String? get prefix => _prefix;
  set prefix(String? prefix) => _prefix = prefix;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get middleName => _middleName;
  set middleName(String? middleName) => _middleName = middleName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get suffix => _suffix;
  set suffix(String? suffix) => _suffix = suffix;
  List<String>? get rawNames => _rawNames;
  set rawNames(List<String>? rawNames) => _rawNames = rawNames;
  String? get publicFirstSeenDate => _publicFirstSeenDate;
  set publicFirstSeenDate(String? publicFirstSeenDate) =>
      _publicFirstSeenDate = publicFirstSeenDate;
  String? get totalFirstSeenDate => _totalFirstSeenDate;
  set totalFirstSeenDate(String? totalFirstSeenDate) =>
      _totalFirstSeenDate = totalFirstSeenDate;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  Name.fromJson(Map<String, dynamic> json) {
    _prefix = json['prefix'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _suffix = json['suffix'];
    _rawNames = json['rawNames'].cast<String>();
    _publicFirstSeenDate = json['publicFirstSeenDate'];
    _totalFirstSeenDate = json['totalFirstSeenDate'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix'] = this._prefix;
    data['firstName'] = this._firstName;
    data['middleName'] = this._middleName;
    data['lastName'] = this._lastName;
    data['suffix'] = this._suffix;
    data['rawNames'] = this._rawNames;
    data['publicFirstSeenDate'] = this._publicFirstSeenDate;
    data['totalFirstSeenDate'] = this._totalFirstSeenDate;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class DeathRecords {
  bool? _isDeceased;
  Null? _sourceSummary;

  DeathRecords({bool? isDeceased, Null? sourceSummary}) {
    if (isDeceased != null) {
      this._isDeceased = isDeceased;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  bool? get isDeceased => _isDeceased;
  set isDeceased(bool? isDeceased) => _isDeceased = isDeceased;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  DeathRecords.fromJson(Map<String, dynamic> json) {
    _isDeceased = json['isDeceased'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeceased'] = this._isDeceased;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class MergedNames {
  String? _prefix;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _suffix;
  List<String>? _rawNames;
  Null? _publicFirstSeenDate;
  Null? _totalFirstSeenDate;
  Null? _sourceSummary;

  MergedNames(
      {String? prefix,
      String? firstName,
      String? middleName,
      String? lastName,
      String? suffix,
      List<String>? rawNames,
      Null? publicFirstSeenDate,
      Null? totalFirstSeenDate,
      Null? sourceSummary}) {
    if (prefix != null) {
      this._prefix = prefix;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (middleName != null) {
      this._middleName = middleName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (suffix != null) {
      this._suffix = suffix;
    }
    if (rawNames != null) {
      this._rawNames = rawNames;
    }
    if (publicFirstSeenDate != null) {
      this._publicFirstSeenDate = publicFirstSeenDate;
    }
    if (totalFirstSeenDate != null) {
      this._totalFirstSeenDate = totalFirstSeenDate;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  String? get prefix => _prefix;
  set prefix(String? prefix) => _prefix = prefix;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get middleName => _middleName;
  set middleName(String? middleName) => _middleName = middleName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get suffix => _suffix;
  set suffix(String? suffix) => _suffix = suffix;
  List<String>? get rawNames => _rawNames;
  set rawNames(List<String>? rawNames) => _rawNames = rawNames;
  Null? get publicFirstSeenDate => _publicFirstSeenDate;
  set publicFirstSeenDate(Null? publicFirstSeenDate) =>
      _publicFirstSeenDate = publicFirstSeenDate;
  Null? get totalFirstSeenDate => _totalFirstSeenDate;
  set totalFirstSeenDate(Null? totalFirstSeenDate) =>
      _totalFirstSeenDate = totalFirstSeenDate;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  MergedNames.fromJson(Map<String, dynamic> json) {
    _prefix = json['prefix'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _suffix = json['suffix'];
    _rawNames = json['rawNames'].cast<String>();
    _publicFirstSeenDate = json['publicFirstSeenDate'];
    _totalFirstSeenDate = json['totalFirstSeenDate'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix'] = this._prefix;
    data['firstName'] = this._firstName;
    data['middleName'] = this._middleName;
    data['lastName'] = this._lastName;
    data['suffix'] = this._suffix;
    data['rawNames'] = this._rawNames;
    data['publicFirstSeenDate'] = this._publicFirstSeenDate;
    data['totalFirstSeenDate'] = this._totalFirstSeenDate;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class Locations {
  String? _city;
  String? _state;

  Locations({String? city, String? state}) {
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
  }

  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;

  Locations.fromJson(Map<String, dynamic> json) {
    _city = json['city'];
    _state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this._city;
    data['state'] = this._state;
    return data;
  }
}

class Addresses {
  bool? _isDeliverable;
  bool? _isMergedAddress;
  bool? _isPublic;
  List<String>? _addressQualityCodes;
  String? _addressHash;
  String? _houseNumber;
  String? _streetPreDirection;
  String? _streetName;
  String? _streetPostDirection;
  String? _streetType;
  String? _unit;
  String? _unitType;
  String? _city;
  String? _state;
  String? _county;
  String? _zip;
  String? _zip4;
  String? _latitude;
  String? _longitude;
  int? _addressOrder;
  HighRiskMarker? _highRiskMarker; // Ensure HighRiskMarker is defined
  String? _propertyIndicator;
  String? _bldgCode;
  String? _utilityCode;
  int? _unitCount;
  String? _firstReportedDate;
  String? _lastReportedDate;
  String? _publicFirstSeenDate;
  String? _totalFirstSeenDate;
  List<String>? _phoneNumbers;
  List<dynamic>? _neighbors; // Changed to List<dynamic>
  List<dynamic>? _neighborSummaryRecords; // Changed to List<dynamic>
  String? _fullAddress;
  dynamic _sourceSummary; // Use dynamic for a more flexible type

  Addresses({
    bool? isDeliverable,
    bool? isMergedAddress,
    bool? isPublic,
    List<String>? addressQualityCodes,
    String? addressHash,
    String? houseNumber,
    String? streetPreDirection,
    String? streetName,
    String? streetPostDirection,
    String? streetType,
    String? unit,
    String? unitType,
    String? city,
    String? state,
    String? county,
    String? zip,
    String? zip4,
    String? latitude,
    String? longitude,
    int? addressOrder,
    HighRiskMarker? highRiskMarker,
    String? propertyIndicator,
    String? bldgCode,
    String? utilityCode,
    int? unitCount,
    String? firstReportedDate,
    String? lastReportedDate,
    String? publicFirstSeenDate,
    String? totalFirstSeenDate,
    List<String>? phoneNumbers,
    List<dynamic>? neighbors,
    List<dynamic>? neighborSummaryRecords,
    String? fullAddress,
    dynamic sourceSummary,
  }) {
    _isDeliverable = isDeliverable;
    _isMergedAddress = isMergedAddress;
    _isPublic = isPublic;
    _addressQualityCodes = addressQualityCodes;
    _addressHash = addressHash;
    _houseNumber = houseNumber;
    _streetPreDirection = streetPreDirection;
    _streetName = streetName;
    _streetPostDirection = streetPostDirection;
    _streetType = streetType;
    _unit = unit;
    _unitType = unitType;
    _city = city;
    _state = state;
    _county = county;
    _zip = zip;
    _zip4 = zip4;
    _latitude = latitude;
    _longitude = longitude;
    _addressOrder = addressOrder;
    _highRiskMarker = highRiskMarker;
    _propertyIndicator = propertyIndicator;
    _bldgCode = bldgCode;
    _utilityCode = utilityCode;
    _unitCount = unitCount;
    _firstReportedDate = firstReportedDate;
    _lastReportedDate = lastReportedDate;
    _publicFirstSeenDate = publicFirstSeenDate;
    _totalFirstSeenDate = totalFirstSeenDate;
    _phoneNumbers = phoneNumbers;
    _neighbors = neighbors;
    _neighborSummaryRecords = neighborSummaryRecords;
    _fullAddress = fullAddress;
    _sourceSummary = sourceSummary;
  }

  bool? get isDeliverable => _isDeliverable;
  set isDeliverable(bool? isDeliverable) => _isDeliverable = isDeliverable;

  // Other getter and setter methods...

  Addresses.fromJson(Map<String, dynamic> json) {
    _isDeliverable = json['isDeliverable'];
    _isMergedAddress = json['isMergedAddress'];
    _isPublic = json['isPublic'];
    _addressQualityCodes = List<String>.from(json['addressQualityCodes'] ?? []);
    _addressHash = json['addressHash'];
    _houseNumber = json['houseNumber'];
    _streetPreDirection = json['streetPreDirection'];
    _streetName = json['streetName'];
    _streetPostDirection = json['streetPostDirection'];
    _streetType = json['streetType'];
    _unit = json['unit'];
    _unitType = json['unitType'];
    _city = json['city'];
    _state = json['state'];
    _county = json['county'];
    _zip = json['zip'];
    _zip4 = json['zip4'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _addressOrder = json['addressOrder'];
    _highRiskMarker = json['highRiskMarker'] != null
        ? HighRiskMarker.fromJson(json['highRiskMarker'])
        : null;
    _propertyIndicator = json['propertyIndicator'];
    _bldgCode = json['bldgCode'];
    _utilityCode = json['utilityCode'];
    _unitCount = json['unitCount'];
    _firstReportedDate = json['firstReportedDate'];
    _lastReportedDate = json['lastReportedDate'];
    _publicFirstSeenDate = json['publicFirstSeenDate'];
    _totalFirstSeenDate = json['totalFirstSeenDate'];
    _phoneNumbers = List<String>.from(json['phoneNumbers'] ?? []);
    _neighbors =
        json['neighbors'] != null ? List<dynamic>.from(json['neighbors']) : [];
    _neighborSummaryRecords = json['neighborSummaryRecords'] != null
        ? List<dynamic>.from(json['neighborSummaryRecords'])
        : [];
    _fullAddress = json['fullAddress'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isDeliverable'] = _isDeliverable;
    data['isMergedAddress'] = _isMergedAddress;
    data['isPublic'] = _isPublic;
    data['addressQualityCodes'] = _addressQualityCodes;
    data['addressHash'] = _addressHash;
    data['houseNumber'] = _houseNumber;
    data['streetPreDirection'] = _streetPreDirection;
    data['streetName'] = _streetName;
    data['streetPostDirection'] = _streetPostDirection;
    data['streetType'] = _streetType;
    data['unit'] = _unit;
    data['unitType'] = _unitType;
    data['city'] = _city;
    data['state'] = _state;
    data['county'] = _county;
    data['zip'] = _zip;
    data['zip4'] = _zip4;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    data['addressOrder'] = _addressOrder;
    if (_highRiskMarker != null) {
      data['highRiskMarker'] = _highRiskMarker!.toJson();
    }
    data['propertyIndicator'] = _propertyIndicator;
    data['bldgCode'] = _bldgCode;
    data['utilityCode'] = _utilityCode;
    data['unitCount'] = _unitCount;
    data['firstReportedDate'] = _firstReportedDate;
    data['lastReportedDate'] = _lastReportedDate;
    data['publicFirstSeenDate'] = _publicFirstSeenDate;
    data['totalFirstSeenDate'] = _totalFirstSeenDate;
    data['phoneNumbers'] = _phoneNumbers;
    data['neighbors'] = _neighbors;
    data['neighborSummaryRecords'] = _neighborSummaryRecords;
    data['fullAddress'] = _fullAddress;
    data['sourceSummary'] = _sourceSummary;
    return data;
  }
}

class HighRiskMarker {
  bool? _isHighRisk;
  String? _sic;
  String? _addressType;

  HighRiskMarker({bool? isHighRisk, String? sic, String? addressType}) {
    if (isHighRisk != null) {
      this._isHighRisk = isHighRisk;
    }
    if (sic != null) {
      this._sic = sic;
    }
    if (addressType != null) {
      this._addressType = addressType;
    }
  }

  bool? get isHighRisk => _isHighRisk;
  set isHighRisk(bool? isHighRisk) => _isHighRisk = isHighRisk;
  String? get sic => _sic;
  set sic(String? sic) => _sic = sic;
  String? get addressType => _addressType;
  set addressType(String? addressType) => _addressType = addressType;

  HighRiskMarker.fromJson(Map<String, dynamic> json) {
    _isHighRisk = json['isHighRisk'];
    _sic = json['sic'];
    _addressType = json['addressType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isHighRisk'] = this._isHighRisk;
    data['sic'] = this._sic;
    data['addressType'] = this._addressType;
    return data;
  }
}

class PhoneNumbers {
  String? _phoneNumber;
  String? _company;
  String? _location;
  String? _phoneType;
  bool? _isConnected;
  bool? _isPublic;
  String? _latitude;
  String? _longitude;
  int? _phoneOrder;
  String? _firstReportedDate;
  String? _lastReportedDate;
  String? _publicFirstSeenDate;
  String? _totalFirstSeenDate;
  Null? _sourceSummary;

  PhoneNumbers(
      {String? phoneNumber,
      String? company,
      String? location,
      String? phoneType,
      bool? isConnected,
      bool? isPublic,
      String? latitude,
      String? longitude,
      int? phoneOrder,
      String? firstReportedDate,
      String? lastReportedDate,
      String? publicFirstSeenDate,
      String? totalFirstSeenDate,
      Null? sourceSummary}) {
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (company != null) {
      this._company = company;
    }
    if (location != null) {
      this._location = location;
    }
    if (phoneType != null) {
      this._phoneType = phoneType;
    }
    if (isConnected != null) {
      this._isConnected = isConnected;
    }
    if (isPublic != null) {
      this._isPublic = isPublic;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (phoneOrder != null) {
      this._phoneOrder = phoneOrder;
    }
    if (firstReportedDate != null) {
      this._firstReportedDate = firstReportedDate;
    }
    if (lastReportedDate != null) {
      this._lastReportedDate = lastReportedDate;
    }
    if (publicFirstSeenDate != null) {
      this._publicFirstSeenDate = publicFirstSeenDate;
    }
    if (totalFirstSeenDate != null) {
      this._totalFirstSeenDate = totalFirstSeenDate;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  String? get company => _company;
  set company(String? company) => _company = company;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get phoneType => _phoneType;
  set phoneType(String? phoneType) => _phoneType = phoneType;
  bool? get isConnected => _isConnected;
  set isConnected(bool? isConnected) => _isConnected = isConnected;
  bool? get isPublic => _isPublic;
  set isPublic(bool? isPublic) => _isPublic = isPublic;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;
  int? get phoneOrder => _phoneOrder;
  set phoneOrder(int? phoneOrder) => _phoneOrder = phoneOrder;
  String? get firstReportedDate => _firstReportedDate;
  set firstReportedDate(String? firstReportedDate) =>
      _firstReportedDate = firstReportedDate;
  String? get lastReportedDate => _lastReportedDate;
  set lastReportedDate(String? lastReportedDate) =>
      _lastReportedDate = lastReportedDate;
  String? get publicFirstSeenDate => _publicFirstSeenDate;
  set publicFirstSeenDate(String? publicFirstSeenDate) =>
      _publicFirstSeenDate = publicFirstSeenDate;
  String? get totalFirstSeenDate => _totalFirstSeenDate;
  set totalFirstSeenDate(String? totalFirstSeenDate) =>
      _totalFirstSeenDate = totalFirstSeenDate;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  PhoneNumbers.fromJson(Map<String, dynamic> json) {
    _phoneNumber = json['phoneNumber'];
    _company = json['company'];
    _location = json['location'];
    _phoneType = json['phoneType'];
    _isConnected = json['isConnected'];
    _isPublic = json['isPublic'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _phoneOrder = json['phoneOrder'];
    _firstReportedDate = json['firstReportedDate'];
    _lastReportedDate = json['lastReportedDate'];
    _publicFirstSeenDate = json['publicFirstSeenDate'];
    _totalFirstSeenDate = json['totalFirstSeenDate'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this._phoneNumber;
    data['company'] = this._company;
    data['location'] = this._location;
    data['phoneType'] = this._phoneType;
    data['isConnected'] = this._isConnected;
    data['isPublic'] = this._isPublic;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['phoneOrder'] = this._phoneOrder;
    data['firstReportedDate'] = this._firstReportedDate;
    data['lastReportedDate'] = this._lastReportedDate;
    data['publicFirstSeenDate'] = this._publicFirstSeenDate;
    data['totalFirstSeenDate'] = this._totalFirstSeenDate;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class EmailAddresses {
  String? _emailAddress;
  int? _emailOrdinal;
  bool? _isPremium;
  int? _nonBusiness;
  Null? _sourceSummary;

  EmailAddresses(
      {String? emailAddress,
      int? emailOrdinal,
      bool? isPremium,
      int? nonBusiness,
      Null? sourceSummary}) {
    if (emailAddress != null) {
      this._emailAddress = emailAddress;
    }
    if (emailOrdinal != null) {
      this._emailOrdinal = emailOrdinal;
    }
    if (isPremium != null) {
      this._isPremium = isPremium;
    }
    if (nonBusiness != null) {
      this._nonBusiness = nonBusiness;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  String? get emailAddress => _emailAddress;
  set emailAddress(String? emailAddress) => _emailAddress = emailAddress;
  int? get emailOrdinal => _emailOrdinal;
  set emailOrdinal(int? emailOrdinal) => _emailOrdinal = emailOrdinal;
  bool? get isPremium => _isPremium;
  set isPremium(bool? isPremium) => _isPremium = isPremium;
  int? get nonBusiness => _nonBusiness;
  set nonBusiness(int? nonBusiness) => _nonBusiness = nonBusiness;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  EmailAddresses.fromJson(Map<String, dynamic> json) {
    _emailAddress = json['emailAddress'];
    _emailOrdinal = json['emailOrdinal'];
    _isPremium = json['isPremium'];
    _nonBusiness = json['nonBusiness'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this._emailAddress;
    data['emailOrdinal'] = this._emailOrdinal;
    data['isPremium'] = this._isPremium;
    data['nonBusiness'] = this._nonBusiness;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class RelativesSummary {
  String? _tahoeId;
  String? _prefix;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _suffix;
  String? _dob;
  bool? _isPrivate;
  bool? _isOptedOut;
  bool? _isDeceased;
  String? _relativeLevel;
  String? _relativeType;
  int? _spouse;
  List<String>? _sharedHouseholdIds;
  int? _score;
  bool? _oldSpouse;
  Null? _city;
  Null? _state;

  RelativesSummary(
      {String? tahoeId,
      String? prefix,
      String? firstName,
      String? middleName,
      String? lastName,
      String? suffix,
      String? dob,
      bool? isPrivate,
      bool? isOptedOut,
      bool? isDeceased,
      String? relativeLevel,
      String? relativeType,
      int? spouse,
      List<String>? sharedHouseholdIds,
      int? score,
      bool? oldSpouse,
      Null? city,
      Null? state}) {
    if (tahoeId != null) {
      this._tahoeId = tahoeId;
    }
    if (prefix != null) {
      this._prefix = prefix;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (middleName != null) {
      this._middleName = middleName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (suffix != null) {
      this._suffix = suffix;
    }
    if (dob != null) {
      this._dob = dob;
    }
    if (isPrivate != null) {
      this._isPrivate = isPrivate;
    }
    if (isOptedOut != null) {
      this._isOptedOut = isOptedOut;
    }
    if (isDeceased != null) {
      this._isDeceased = isDeceased;
    }
    if (relativeLevel != null) {
      this._relativeLevel = relativeLevel;
    }
    if (relativeType != null) {
      this._relativeType = relativeType;
    }
    if (spouse != null) {
      this._spouse = spouse;
    }
    if (sharedHouseholdIds != null) {
      this._sharedHouseholdIds = sharedHouseholdIds;
    }
    if (score != null) {
      this._score = score;
    }
    if (oldSpouse != null) {
      this._oldSpouse = oldSpouse;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
  }

  String? get tahoeId => _tahoeId;
  set tahoeId(String? tahoeId) => _tahoeId = tahoeId;
  String? get prefix => _prefix;
  set prefix(String? prefix) => _prefix = prefix;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get middleName => _middleName;
  set middleName(String? middleName) => _middleName = middleName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get suffix => _suffix;
  set suffix(String? suffix) => _suffix = suffix;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  bool? get isPrivate => _isPrivate;
  set isPrivate(bool? isPrivate) => _isPrivate = isPrivate;
  bool? get isOptedOut => _isOptedOut;
  set isOptedOut(bool? isOptedOut) => _isOptedOut = isOptedOut;
  bool? get isDeceased => _isDeceased;
  set isDeceased(bool? isDeceased) => _isDeceased = isDeceased;
  String? get relativeLevel => _relativeLevel;
  set relativeLevel(String? relativeLevel) => _relativeLevel = relativeLevel;
  String? get relativeType => _relativeType;
  set relativeType(String? relativeType) => _relativeType = relativeType;
  int? get spouse => _spouse;
  set spouse(int? spouse) => _spouse = spouse;
  List<String>? get sharedHouseholdIds => _sharedHouseholdIds;
  set sharedHouseholdIds(List<String>? sharedHouseholdIds) =>
      _sharedHouseholdIds = sharedHouseholdIds;
  int? get score => _score;
  set score(int? score) => _score = score;
  bool? get oldSpouse => _oldSpouse;
  set oldSpouse(bool? oldSpouse) => _oldSpouse = oldSpouse;
  Null? get city => _city;
  set city(Null? city) => _city = city;
  Null? get state => _state;
  set state(Null? state) => _state = state;

  RelativesSummary.fromJson(Map<String, dynamic> json) {
    _tahoeId = json['tahoeId'];
    _prefix = json['prefix'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _suffix = json['suffix'];
    _dob = json['dob'];
    _isPrivate = json['isPrivate'];
    _isOptedOut = json['isOptedOut'];
    _isDeceased = json['isDeceased'];
    _relativeLevel = json['relativeLevel'];
    _relativeType = json['relativeType'];
    _spouse = json['spouse'];
    _sharedHouseholdIds = json['sharedHouseholdIds'].cast<String>();
    _score = json['score'];
    _oldSpouse = json['oldSpouse'];
    _city = json['city'];
    _state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tahoeId'] = this._tahoeId;
    data['prefix'] = this._prefix;
    data['firstName'] = this._firstName;
    data['middleName'] = this._middleName;
    data['lastName'] = this._lastName;
    data['suffix'] = this._suffix;
    data['dob'] = this._dob;
    data['isPrivate'] = this._isPrivate;
    data['isOptedOut'] = this._isOptedOut;
    data['isDeceased'] = this._isDeceased;
    data['relativeLevel'] = this._relativeLevel;
    data['relativeType'] = this._relativeType;
    data['spouse'] = this._spouse;
    data['sharedHouseholdIds'] = this._sharedHouseholdIds;
    data['score'] = this._score;
    data['oldSpouse'] = this._oldSpouse;
    data['city'] = this._city;
    data['state'] = this._state;
    return data;
  }
}

class AssociatesSummary {
  String? _tahoeId;
  String? _prefix;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _suffix;
  bool? _isPrivate;
  bool? _isOptedOut;
  bool? _isDeceased;
  String? _dob;
  int? _score;

  AssociatesSummary(
      {String? tahoeId,
      String? prefix,
      String? firstName,
      String? middleName,
      String? lastName,
      String? suffix,
      bool? isPrivate,
      bool? isOptedOut,
      bool? isDeceased,
      String? dob,
      int? score}) {
    if (tahoeId != null) {
      this._tahoeId = tahoeId;
    }
    if (prefix != null) {
      this._prefix = prefix;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (middleName != null) {
      this._middleName = middleName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (suffix != null) {
      this._suffix = suffix;
    }
    if (isPrivate != null) {
      this._isPrivate = isPrivate;
    }
    if (isOptedOut != null) {
      this._isOptedOut = isOptedOut;
    }
    if (isDeceased != null) {
      this._isDeceased = isDeceased;
    }
    if (dob != null) {
      this._dob = dob;
    }
    if (score != null) {
      this._score = score;
    }
  }

  String? get tahoeId => _tahoeId;
  set tahoeId(String? tahoeId) => _tahoeId = tahoeId;
  String? get prefix => _prefix;
  set prefix(String? prefix) => _prefix = prefix;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get middleName => _middleName;
  set middleName(String? middleName) => _middleName = middleName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get suffix => _suffix;
  set suffix(String? suffix) => _suffix = suffix;
  bool? get isPrivate => _isPrivate;
  set isPrivate(bool? isPrivate) => _isPrivate = isPrivate;
  bool? get isOptedOut => _isOptedOut;
  set isOptedOut(bool? isOptedOut) => _isOptedOut = isOptedOut;
  bool? get isDeceased => _isDeceased;
  set isDeceased(bool? isDeceased) => _isDeceased = isDeceased;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  int? get score => _score;
  set score(int? score) => _score = score;

  AssociatesSummary.fromJson(Map<String, dynamic> json) {
    _tahoeId = json['tahoeId'];
    _prefix = json['prefix'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _suffix = json['suffix'];
    _isPrivate = json['isPrivate'];
    _isOptedOut = json['isOptedOut'];
    _isDeceased = json['isDeceased'];
    _dob = json['dob'];
    _score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tahoeId'] = this._tahoeId;
    data['prefix'] = this._prefix;
    data['firstName'] = this._firstName;
    data['middleName'] = this._middleName;
    data['lastName'] = this._lastName;
    data['suffix'] = this._suffix;
    data['isPrivate'] = this._isPrivate;
    data['isOptedOut'] = this._isOptedOut;
    data['isDeceased'] = this._isDeceased;
    data['dob'] = this._dob;
    data['score'] = this._score;
    return data;
  }
}

class Associates {
  String? _tahoeId;
  Name? _name;
  bool? _isPublic;
  bool? _isOptedOut;
  int? _sparseFlag;
  bool? _isPremium;
  String? _dob;
  int? _age;
  List<DatesOfBirth>? _datesOfBirth;
  List<DatesOfDeath>? _datesOfDeath;
  DeathRecords? _deathRecords;
  List<Akas>? _akas;
  List<MergedNames>? _mergedNames;
  List<Locations>? _locations;
  List<Addresses>? _addresses;
  List<PhoneNumbers>? _phoneNumbers;
  List<EmailAddresses>? _emailAddresses;
  String? _fullName;
  List<dynamic>?
      _driversLicenseDetail; // Changed from List<Null> to List<dynamic>
  bool? _hasAdditionalData;
  PropensityToPayScore? _propensityToPayScore;
  String? _dod;

  Associates(
      {String? tahoeId,
      Name? name,
      bool? isPublic,
      bool? isOptedOut,
      int? sparseFlag,
      bool? isPremium,
      String? dob,
      int? age,
      List<DatesOfBirth>? datesOfBirth,
      List<DatesOfDeath>? datesOfDeath,
      DeathRecords? deathRecords,
      List<Akas>? akas,
      List<MergedNames>? mergedNames,
      List<Locations>? locations,
      List<Addresses>? addresses,
      List<PhoneNumbers>? phoneNumbers,
      List<EmailAddresses>? emailAddresses,
      String? fullName,
      List<dynamic>? driversLicenseDetail, // Changed to List<dynamic>
      bool? hasAdditionalData,
      PropensityToPayScore? propensityToPayScore,
      String? dod}) {
    _tahoeId = tahoeId;
    _name = name;
    _isPublic = isPublic;
    _isOptedOut = isOptedOut;
    _sparseFlag = sparseFlag;
    _isPremium = isPremium;
    _dob = dob;
    _age = age;
    _datesOfBirth = datesOfBirth;
    _datesOfDeath = datesOfDeath;
    _deathRecords = deathRecords;
    _akas = akas;
    _mergedNames = mergedNames;
    _locations = locations;
    _addresses = addresses;
    _phoneNumbers = phoneNumbers;
    _emailAddresses = emailAddresses;
    _fullName = fullName;
    _driversLicenseDetail = driversLicenseDetail; // Changed to List<dynamic>
    _hasAdditionalData = hasAdditionalData;
    _propensityToPayScore = propensityToPayScore;
    _dod = dod;
  }

  String? get tahoeId => _tahoeId;
  set tahoeId(String? tahoeId) => _tahoeId = tahoeId;
  Name? get name => _name;
  set name(Name? name) => _name = name;
  bool? get isPublic => _isPublic;
  set isPublic(bool? isPublic) => _isPublic = isPublic;
  bool? get isOptedOut => _isOptedOut;
  set isOptedOut(bool? isOptedOut) => _isOptedOut = isOptedOut;
  int? get sparseFlag => _sparseFlag;
  set sparseFlag(int? sparseFlag) => _sparseFlag = sparseFlag;
  bool? get isPremium => _isPremium;
  set isPremium(bool? isPremium) => _isPremium = isPremium;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  int? get age => _age;
  set age(int? age) => _age = age;
  List<DatesOfBirth>? get datesOfBirth => _datesOfBirth;
  set datesOfBirth(List<DatesOfBirth>? datesOfBirth) =>
      _datesOfBirth = datesOfBirth;
  List<DatesOfDeath>? get datesOfDeath => _datesOfDeath;
  set datesOfDeath(List<DatesOfDeath>? datesOfDeath) =>
      _datesOfDeath = datesOfDeath;
  DeathRecords? get deathRecords => _deathRecords;
  set deathRecords(DeathRecords? deathRecords) => _deathRecords = deathRecords;
  List<Akas>? get akas => _akas;
  set akas(List<Akas>? akas) => _akas = akas;
  List<MergedNames>? get mergedNames => _mergedNames;
  set mergedNames(List<MergedNames>? mergedNames) => _mergedNames = mergedNames;
  List<Locations>? get locations => _locations;
  set locations(List<Locations>? locations) => _locations = locations;
  List<Addresses>? get addresses => _addresses;
  set addresses(List<Addresses>? addresses) => _addresses = addresses;
  List<PhoneNumbers>? get phoneNumbers => _phoneNumbers;
  set phoneNumbers(List<PhoneNumbers>? phoneNumbers) =>
      _phoneNumbers = phoneNumbers;
  List<EmailAddresses>? get emailAddresses => _emailAddresses;
  set emailAddresses(List<EmailAddresses>? emailAddresses) =>
      _emailAddresses = emailAddresses;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  List<dynamic>? get driversLicenseDetail => _driversLicenseDetail;
  set driversLicenseDetail(List<dynamic>? driversLicenseDetail) =>
      _driversLicenseDetail = driversLicenseDetail;
  bool? get hasAdditionalData => _hasAdditionalData;
  set hasAdditionalData(bool? hasAdditionalData) =>
      _hasAdditionalData = hasAdditionalData;
  PropensityToPayScore? get propensityToPayScore => _propensityToPayScore;
  set propensityToPayScore(PropensityToPayScore? propensityToPayScore) =>
      _propensityToPayScore = propensityToPayScore;
  String? get dod => _dod;
  set dod(String? dod) => _dod = dod;

  Associates.fromJson(Map<String, dynamic> json) {
    _tahoeId = json['tahoeId'];
    _name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    _isPublic = json['isPublic'];
    _isOptedOut = json['isOptedOut'];
    _sparseFlag = json['sparseFlag'];
    _isPremium = json['isPremium'];
    _dob = json['dob'];
    _age = json['age'];
    if (json['datesOfBirth'] != null) {
      _datesOfBirth = <DatesOfBirth>[];
      json['datesOfBirth'].forEach((v) {
        _datesOfBirth!.add(new DatesOfBirth.fromJson(v));
      });
    }
    if (json['datesOfDeath'] != null) {
      _datesOfDeath = <DatesOfDeath>[];
      json['datesOfDeath'].forEach((v) {
        _datesOfDeath!.add(new DatesOfDeath.fromJson(v));
      });
    }
    _deathRecords = json['deathRecords'] != null
        ? new DeathRecords.fromJson(json['deathRecords'])
        : null;
    if (json['akas'] != null) {
      _akas = <Akas>[];
      json['akas'].forEach((v) {
        _akas!.add(new Akas.fromJson(v));
      });
    }
    if (json['mergedNames'] != null) {
      _mergedNames = <MergedNames>[];
      json['mergedNames'].forEach((v) {
        _mergedNames!.add(new MergedNames.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      _locations = <Locations>[];
      json['locations'].forEach((v) {
        _locations!.add(new Locations.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      _addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        _addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json['phoneNumbers'] != null) {
      _phoneNumbers = <PhoneNumbers>[];
      json['phoneNumbers'].forEach((v) {
        _phoneNumbers!.add(new PhoneNumbers.fromJson(v));
      });
    }
    if (json['emailAddresses'] != null) {
      _emailAddresses = <EmailAddresses>[];
      json['emailAddresses'].forEach((v) {
        _emailAddresses!.add(new EmailAddresses.fromJson(v));
      });
    }
    _fullName = json['fullName'];
    if (json['driversLicenseDetail'] != null) {
      _driversLicenseDetail = <dynamic>[];
      json['driversLicenseDetail'].forEach((v) {
        _driversLicenseDetail!.add(v); // No need for Null.fromJson
      });
    }
    _hasAdditionalData = json['hasAdditionalData'];
    _propensityToPayScore = json['propensityToPayScore'] != null
        ? new PropensityToPayScore.fromJson(json['propensityToPayScore'])
        : null;
    _dod = json['dod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tahoeId'] = this._tahoeId;
    if (this._name != null) {
      data['name'] = this._name!.toJson();
    }
    data['isPublic'] = this._isPublic;
    data['isOptedOut'] = this._isOptedOut;
    data['sparseFlag'] = this._sparseFlag;
    data['isPremium'] = this._isPremium;
    data['dob'] = this._dob;
    data['age'] = this._age;
    if (this._datesOfBirth != null) {
      data['datesOfBirth'] =
          this._datesOfBirth!.map((v) => v.toJson()).toList();
    }
    if (this._datesOfDeath != null) {
      data['datesOfDeath'] =
          this._datesOfDeath!.map((v) => v.toJson()).toList();
    }
    if (this._deathRecords != null) {
      data['deathRecords'] = this._deathRecords!.toJson();
    }
    if (this._akas != null) {
      data['akas'] = this._akas!.map((v) => v.toJson()).toList();
    }
    if (this._mergedNames != null) {
      data['mergedNames'] = this._mergedNames!.map((v) => v.toJson()).toList();
    }
    if (this._locations != null) {
      data['locations'] = this._locations!.map((v) => v.toJson()).toList();
    }
    if (this._addresses != null) {
      data['addresses'] = this._addresses!.map((v) => v.toJson()).toList();
    }
    if (this._phoneNumbers != null) {
      data['phoneNumbers'] =
          this._phoneNumbers!.map((v) => v.toJson()).toList();
    }
    if (this._emailAddresses != null) {
      data['emailAddresses'] =
          this._emailAddresses!.map((v) => v.toJson()).toList();
    }
    data['fullName'] = this._fullName;
    if (this._driversLicenseDetail != null) {
      data['driversLicenseDetail'] = this._driversLicenseDetail!;
    }
    data['hasAdditionalData'] = this._hasAdditionalData;
    if (this._propensityToPayScore != null) {
      data['propensityToPayScore'] = this._propensityToPayScore!.toJson();
    }
    data['dod'] = this._dod;
    return data;
  }
}

class DatesOfBirth {
  int? _age;
  Null? _sourceSummary;

  DatesOfBirth({int? age, Null? sourceSummary}) {
    if (age != null) {
      this._age = age;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  int? get age => _age;
  set age(int? age) => _age = age;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  DatesOfBirth.fromJson(Map<String, dynamic> json) {
    _age = json['age'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this._age;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class DatesOfDeath {
  String? _dod;
  Null? _sourceSummary;

  DatesOfDeath({String? dod, Null? sourceSummary}) {
    if (dod != null) {
      this._dod = dod;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  String? get dod => _dod;
  set dod(String? dod) => _dod = dod;
  Null? get sourceSummary => _sourceSummary;
  set sourceSummary(Null? sourceSummary) => _sourceSummary = sourceSummary;

  DatesOfDeath.fromJson(Map<String, dynamic> json) {
    _dod = json['dod'];
    _sourceSummary = json['sourceSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dod'] = this._dod;
    data['sourceSummary'] = this._sourceSummary;
    return data;
  }
}

class EmailAddressDetail {
  String? _emailAddress;
  int? _emailOrdinal;
  EmailEngagementData? _emailEngagementData;
  bool? _isPremium;
  int? _nonBusiness;
  dynamic
      _sourceSummary; // Use dynamic or nullable if sourceSummary is not always null

  // Constructor
  EmailAddressDetail(
      {String? emailAddress,
      int? emailOrdinal,
      EmailEngagementData? emailEngagementData,
      bool? isPremium,
      int? nonBusiness,
      dynamic sourceSummary}) {
    if (emailAddress != null) {
      this._emailAddress = emailAddress;
    }
    if (emailOrdinal != null) {
      this._emailOrdinal = emailOrdinal;
    }
    if (emailEngagementData != null) {
      this._emailEngagementData = emailEngagementData;
    }
    if (isPremium != null) {
      this._isPremium = isPremium;
    }
    if (nonBusiness != null) {
      this._nonBusiness = nonBusiness;
    }
    if (sourceSummary != null) {
      this._sourceSummary = sourceSummary;
    }
  }

  // Getters and Setters
  String? get emailAddress => _emailAddress;
  set emailAddress(String? emailAddress) => _emailAddress = emailAddress;

  int? get emailOrdinal => _emailOrdinal;
  set emailOrdinal(int? emailOrdinal) => _emailOrdinal = emailOrdinal;

  EmailEngagementData? get emailEngagementData => _emailEngagementData;
  set emailEngagementData(EmailEngagementData? emailEngagementData) =>
      _emailEngagementData = emailEngagementData;

  bool? get isPremium => _isPremium;
  set isPremium(bool? isPremium) => _isPremium = isPremium;

  int? get nonBusiness => _nonBusiness;
  set nonBusiness(int? nonBusiness) => _nonBusiness = nonBusiness;

  dynamic get sourceSummary => _sourceSummary;
  set sourceSummary(dynamic sourceSummary) => _sourceSummary = sourceSummary;

  // fromJson method
  EmailAddressDetail.fromJson(Map<String, dynamic> json) {
    _emailAddress = json['emailAddress'];
    _emailOrdinal = json['emailOrdinal'];
    _emailEngagementData = json['emailEngagementData'] != null
        ? EmailEngagementData.fromJson(json['emailEngagementData'])
        : null;
    _isPremium = json['isPremium'];
    _nonBusiness = json['nonBusiness'];
    _sourceSummary = json['sourceSummary'];
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emailAddress'] = _emailAddress;
    data['emailOrdinal'] = _emailOrdinal;
    if (_emailEngagementData != null) {
      data['emailEngagementData'] = _emailEngagementData!.toJson();
    }
    data['isPremium'] = _isPremium;
    data['nonBusiness'] = _nonBusiness;
    data['sourceSummary'] = _sourceSummary; // Make sure this is serializable
    return data;
  }
}

class EmailEngagementData {
  String? _lastCheckDate;
  bool? _isGoodDomain;
  bool? _isMatched;
  int? _engagementScore;
  String? _lastTouchDate;
  int? _sendTime;
  String? _bestDayOfTheWeek;
  String? _bestTimeOfTheDay;
  String? _frequency;
  List<String>? _naics;
  bool? _isBounce;

  EmailEngagementData(
      {String? lastCheckDate,
      bool? isGoodDomain,
      bool? isMatched,
      int? engagementScore,
      String? lastTouchDate,
      int? sendTime,
      String? bestDayOfTheWeek,
      String? bestTimeOfTheDay,
      String? frequency,
      List<String>? naics,
      bool? isBounce}) {
    if (lastCheckDate != null) {
      this._lastCheckDate = lastCheckDate;
    }
    if (isGoodDomain != null) {
      this._isGoodDomain = isGoodDomain;
    }
    if (isMatched != null) {
      this._isMatched = isMatched;
    }
    if (engagementScore != null) {
      this._engagementScore = engagementScore;
    }
    if (lastTouchDate != null) {
      this._lastTouchDate = lastTouchDate;
    }
    if (sendTime != null) {
      this._sendTime = sendTime;
    }
    if (bestDayOfTheWeek != null) {
      this._bestDayOfTheWeek = bestDayOfTheWeek;
    }
    if (bestTimeOfTheDay != null) {
      this._bestTimeOfTheDay = bestTimeOfTheDay;
    }
    if (frequency != null) {
      this._frequency = frequency;
    }
    if (naics != null) {
      this._naics = naics;
    }
    if (isBounce != null) {
      this._isBounce = isBounce;
    }
  }

  String? get lastCheckDate => _lastCheckDate;
  set lastCheckDate(String? lastCheckDate) => _lastCheckDate = lastCheckDate;
  bool? get isGoodDomain => _isGoodDomain;
  set isGoodDomain(bool? isGoodDomain) => _isGoodDomain = isGoodDomain;
  bool? get isMatched => _isMatched;
  set isMatched(bool? isMatched) => _isMatched = isMatched;
  int? get engagementScore => _engagementScore;
  set engagementScore(int? engagementScore) =>
      _engagementScore = engagementScore;
  String? get lastTouchDate => _lastTouchDate;
  set lastTouchDate(String? lastTouchDate) => _lastTouchDate = lastTouchDate;
  int? get sendTime => _sendTime;
  set sendTime(int? sendTime) => _sendTime = sendTime;
  String? get bestDayOfTheWeek => _bestDayOfTheWeek;
  set bestDayOfTheWeek(String? bestDayOfTheWeek) =>
      _bestDayOfTheWeek = bestDayOfTheWeek;
  String? get bestTimeOfTheDay => _bestTimeOfTheDay;
  set bestTimeOfTheDay(String? bestTimeOfTheDay) =>
      _bestTimeOfTheDay = bestTimeOfTheDay;
  String? get frequency => _frequency;
  set frequency(String? frequency) => _frequency = frequency;
  List<String>? get naics => _naics;
  set naics(List<String>? naics) => _naics = naics;
  bool? get isBounce => _isBounce;
  set isBounce(bool? isBounce) => _isBounce = isBounce;

  EmailEngagementData.fromJson(Map<String, dynamic> json) {
    _lastCheckDate = json['lastCheckDate'];
    _isGoodDomain = json['isGoodDomain'];
    _isMatched = json['isMatched'];
    _engagementScore = json['engagementScore'];
    _lastTouchDate = json['lastTouchDate'];
    _sendTime = json['sendTime'];
    _bestDayOfTheWeek = json['bestDayOfTheWeek'];
    _bestTimeOfTheDay = json['bestTimeOfTheDay'];
    _frequency = json['frequency'];
    _naics = json['naics'].cast<String>();
    _isBounce = json['isBounce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastCheckDate'] = this._lastCheckDate;
    data['isGoodDomain'] = this._isGoodDomain;
    data['isMatched'] = this._isMatched;
    data['engagementScore'] = this._engagementScore;
    data['lastTouchDate'] = this._lastTouchDate;
    data['sendTime'] = this._sendTime;
    data['bestDayOfTheWeek'] = this._bestDayOfTheWeek;
    data['bestTimeOfTheDay'] = this._bestTimeOfTheDay;
    data['frequency'] = this._frequency;
    data['naics'] = this._naics;
    data['isBounce'] = this._isBounce;
    return data;
  }
}

class PropensityToPayScore {
  String? _transactionId;
  String? _suffix;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _address;
  String? _city;
  String? _state;
  String? _zip;
  String? _zip4;
  List<dynamic>? _measures; // Changed List<Null> to List<dynamic>

  PropensityToPayScore(
      {String? transactionId,
      String? suffix,
      String? firstName,
      String? middleName,
      String? lastName,
      String? address,
      String? city,
      String? state,
      String? zip,
      String? zip4,
      List<dynamic>? measures}) {
    // Updated constructor
    if (transactionId != null) {
      this._transactionId = transactionId;
    }
    if (suffix != null) {
      this._suffix = suffix;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (middleName != null) {
      this._middleName = middleName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (address != null) {
      this._address = address;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (zip != null) {
      this._zip = zip;
    }
    if (zip4 != null) {
      this._zip4 = zip4;
    }
    if (measures != null) {
      this._measures = measures;
    }
  }

  String? get transactionId => _transactionId;
  set transactionId(String? transactionId) => _transactionId = transactionId;
  String? get suffix => _suffix;
  set suffix(String? suffix) => _suffix = suffix;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get middleName => _middleName;
  set middleName(String? middleName) => _middleName = middleName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get zip => _zip;
  set zip(String? zip) => _zip = zip;
  String? get zip4 => _zip4;
  set zip4(String? zip4) => _zip4 = zip4;
  List<dynamic>? get measures =>
      _measures; // Changed List<Null> to List<dynamic>
  set measures(List<dynamic>? measures) => _measures = measures;

  // fromJson method
  PropensityToPayScore.fromJson(Map<String, dynamic> json) {
    _transactionId = json['transactionId'];
    _suffix = json['suffix'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zip = json['zip'];
    _zip4 = json['zip4'];
    if (json['measures'] != null) {
      _measures = [];
      json['measures'].forEach((v) {
        _measures!
            .add(v); // Now adding directly as dynamic (or could be casted)
      });
    }
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = this._transactionId;
    data['suffix'] = this._suffix;
    data['firstName'] = this._firstName;
    data['middleName'] = this._middleName;
    data['lastName'] = this._lastName;
    data['address'] = this._address;
    data['city'] = this._city;
    data['state'] = this._state;
    data['zip'] = this._zip;
    data['zip4'] = this._zip4;
    if (this._measures != null) {
      data['measures'] = this._measures!;
    }
    return data;
  }
}

class Indicators {
  int? _hasBankruptcyRecords;
  int? _hasBusinessRecords;
  int? _hasDivorceRecords;
  int? _hasDomainsRecords;
  int? _hasEvictionsRecords;
  int? _hasFeinRecords;
  int? _hasForeclosuresRecords;
  int? _hasForeclosuresV2Records;
  int? _hasJudgmentRecords;
  int? _hasLienRecords;
  int? _hasMarriageRecords;
  int? _hasProfessionalLicenseRecords;
  int? _hasPropertyRecords;
  int? _hasVehicleRegistrationsRecords;
  int? _hasWorkplaceRecords;
  int? _hasDeaRecords;
  int? _hasPropertyV2Records;
  int? _hasUccRecords;
  int? _hasUnbankedData;
  int? _hasMobilePhones;
  int? _hasLandLines;
  int? _hasEmails;
  int? _hasAddresses;
  int? _hasCurrentAddresses;
  int? _hasHistoricalAddresses;
  int? _hasDebtRecords;

  Indicators(
      {int? hasBankruptcyRecords,
      int? hasBusinessRecords,
      int? hasDivorceRecords,
      int? hasDomainsRecords,
      int? hasEvictionsRecords,
      int? hasFeinRecords,
      int? hasForeclosuresRecords,
      int? hasForeclosuresV2Records,
      int? hasJudgmentRecords,
      int? hasLienRecords,
      int? hasMarriageRecords,
      int? hasProfessionalLicenseRecords,
      int? hasPropertyRecords,
      int? hasVehicleRegistrationsRecords,
      int? hasWorkplaceRecords,
      int? hasDeaRecords,
      int? hasPropertyV2Records,
      int? hasUccRecords,
      int? hasUnbankedData,
      int? hasMobilePhones,
      int? hasLandLines,
      int? hasEmails,
      int? hasAddresses,
      int? hasCurrentAddresses,
      int? hasHistoricalAddresses,
      int? hasDebtRecords}) {
    if (hasBankruptcyRecords != null) {
      this._hasBankruptcyRecords = hasBankruptcyRecords;
    }
    if (hasBusinessRecords != null) {
      this._hasBusinessRecords = hasBusinessRecords;
    }
    if (hasDivorceRecords != null) {
      this._hasDivorceRecords = hasDivorceRecords;
    }
    if (hasDomainsRecords != null) {
      this._hasDomainsRecords = hasDomainsRecords;
    }
    if (hasEvictionsRecords != null) {
      this._hasEvictionsRecords = hasEvictionsRecords;
    }
    if (hasFeinRecords != null) {
      this._hasFeinRecords = hasFeinRecords;
    }
    if (hasForeclosuresRecords != null) {
      this._hasForeclosuresRecords = hasForeclosuresRecords;
    }
    if (hasForeclosuresV2Records != null) {
      this._hasForeclosuresV2Records = hasForeclosuresV2Records;
    }
    if (hasJudgmentRecords != null) {
      this._hasJudgmentRecords = hasJudgmentRecords;
    }
    if (hasLienRecords != null) {
      this._hasLienRecords = hasLienRecords;
    }
    if (hasMarriageRecords != null) {
      this._hasMarriageRecords = hasMarriageRecords;
    }
    if (hasProfessionalLicenseRecords != null) {
      this._hasProfessionalLicenseRecords = hasProfessionalLicenseRecords;
    }
    if (hasPropertyRecords != null) {
      this._hasPropertyRecords = hasPropertyRecords;
    }
    if (hasVehicleRegistrationsRecords != null) {
      this._hasVehicleRegistrationsRecords = hasVehicleRegistrationsRecords;
    }
    if (hasWorkplaceRecords != null) {
      this._hasWorkplaceRecords = hasWorkplaceRecords;
    }
    if (hasDeaRecords != null) {
      this._hasDeaRecords = hasDeaRecords;
    }
    if (hasPropertyV2Records != null) {
      this._hasPropertyV2Records = hasPropertyV2Records;
    }
    if (hasUccRecords != null) {
      this._hasUccRecords = hasUccRecords;
    }
    if (hasUnbankedData != null) {
      this._hasUnbankedData = hasUnbankedData;
    }
    if (hasMobilePhones != null) {
      this._hasMobilePhones = hasMobilePhones;
    }
    if (hasLandLines != null) {
      this._hasLandLines = hasLandLines;
    }
    if (hasEmails != null) {
      this._hasEmails = hasEmails;
    }
    if (hasAddresses != null) {
      this._hasAddresses = hasAddresses;
    }
    if (hasCurrentAddresses != null) {
      this._hasCurrentAddresses = hasCurrentAddresses;
    }
    if (hasHistoricalAddresses != null) {
      this._hasHistoricalAddresses = hasHistoricalAddresses;
    }
    if (hasDebtRecords != null) {
      this._hasDebtRecords = hasDebtRecords;
    }
  }

  int? get hasBankruptcyRecords => _hasBankruptcyRecords;
  set hasBankruptcyRecords(int? hasBankruptcyRecords) =>
      _hasBankruptcyRecords = hasBankruptcyRecords;
  int? get hasBusinessRecords => _hasBusinessRecords;
  set hasBusinessRecords(int? hasBusinessRecords) =>
      _hasBusinessRecords = hasBusinessRecords;
  int? get hasDivorceRecords => _hasDivorceRecords;
  set hasDivorceRecords(int? hasDivorceRecords) =>
      _hasDivorceRecords = hasDivorceRecords;
  int? get hasDomainsRecords => _hasDomainsRecords;
  set hasDomainsRecords(int? hasDomainsRecords) =>
      _hasDomainsRecords = hasDomainsRecords;
  int? get hasEvictionsRecords => _hasEvictionsRecords;
  set hasEvictionsRecords(int? hasEvictionsRecords) =>
      _hasEvictionsRecords = hasEvictionsRecords;
  int? get hasFeinRecords => _hasFeinRecords;
  set hasFeinRecords(int? hasFeinRecords) => _hasFeinRecords = hasFeinRecords;
  int? get hasForeclosuresRecords => _hasForeclosuresRecords;
  set hasForeclosuresRecords(int? hasForeclosuresRecords) =>
      _hasForeclosuresRecords = hasForeclosuresRecords;
  int? get hasForeclosuresV2Records => _hasForeclosuresV2Records;
  set hasForeclosuresV2Records(int? hasForeclosuresV2Records) =>
      _hasForeclosuresV2Records = hasForeclosuresV2Records;
  int? get hasJudgmentRecords => _hasJudgmentRecords;
  set hasJudgmentRecords(int? hasJudgmentRecords) =>
      _hasJudgmentRecords = hasJudgmentRecords;
  int? get hasLienRecords => _hasLienRecords;
  set hasLienRecords(int? hasLienRecords) => _hasLienRecords = hasLienRecords;
  int? get hasMarriageRecords => _hasMarriageRecords;
  set hasMarriageRecords(int? hasMarriageRecords) =>
      _hasMarriageRecords = hasMarriageRecords;
  int? get hasProfessionalLicenseRecords => _hasProfessionalLicenseRecords;
  set hasProfessionalLicenseRecords(int? hasProfessionalLicenseRecords) =>
      _hasProfessionalLicenseRecords = hasProfessionalLicenseRecords;
  int? get hasPropertyRecords => _hasPropertyRecords;
  set hasPropertyRecords(int? hasPropertyRecords) =>
      _hasPropertyRecords = hasPropertyRecords;
  int? get hasVehicleRegistrationsRecords => _hasVehicleRegistrationsRecords;
  set hasVehicleRegistrationsRecords(int? hasVehicleRegistrationsRecords) =>
      _hasVehicleRegistrationsRecords = hasVehicleRegistrationsRecords;
  int? get hasWorkplaceRecords => _hasWorkplaceRecords;
  set hasWorkplaceRecords(int? hasWorkplaceRecords) =>
      _hasWorkplaceRecords = hasWorkplaceRecords;
  int? get hasDeaRecords => _hasDeaRecords;
  set hasDeaRecords(int? hasDeaRecords) => _hasDeaRecords = hasDeaRecords;
  int? get hasPropertyV2Records => _hasPropertyV2Records;
  set hasPropertyV2Records(int? hasPropertyV2Records) =>
      _hasPropertyV2Records = hasPropertyV2Records;
  int? get hasUccRecords => _hasUccRecords;
  set hasUccRecords(int? hasUccRecords) => _hasUccRecords = hasUccRecords;
  int? get hasUnbankedData => _hasUnbankedData;
  set hasUnbankedData(int? hasUnbankedData) =>
      _hasUnbankedData = hasUnbankedData;
  int? get hasMobilePhones => _hasMobilePhones;
  set hasMobilePhones(int? hasMobilePhones) =>
      _hasMobilePhones = hasMobilePhones;
  int? get hasLandLines => _hasLandLines;
  set hasLandLines(int? hasLandLines) => _hasLandLines = hasLandLines;
  int? get hasEmails => _hasEmails;
  set hasEmails(int? hasEmails) => _hasEmails = hasEmails;
  int? get hasAddresses => _hasAddresses;
  set hasAddresses(int? hasAddresses) => _hasAddresses = hasAddresses;
  int? get hasCurrentAddresses => _hasCurrentAddresses;
  set hasCurrentAddresses(int? hasCurrentAddresses) =>
      _hasCurrentAddresses = hasCurrentAddresses;
  int? get hasHistoricalAddresses => _hasHistoricalAddresses;
  set hasHistoricalAddresses(int? hasHistoricalAddresses) =>
      _hasHistoricalAddresses = hasHistoricalAddresses;
  int? get hasDebtRecords => _hasDebtRecords;
  set hasDebtRecords(int? hasDebtRecords) => _hasDebtRecords = hasDebtRecords;

  Indicators.fromJson(Map<String, dynamic> json) {
    _hasBankruptcyRecords = json['hasBankruptcyRecords'];
    _hasBusinessRecords = json['hasBusinessRecords'];
    _hasDivorceRecords = json['hasDivorceRecords'];
    _hasDomainsRecords = json['hasDomainsRecords'];
    _hasEvictionsRecords = json['hasEvictionsRecords'];
    _hasFeinRecords = json['hasFeinRecords'];
    _hasForeclosuresRecords = json['hasForeclosuresRecords'];
    _hasForeclosuresV2Records = json['hasForeclosuresV2Records'];
    _hasJudgmentRecords = json['hasJudgmentRecords'];
    _hasLienRecords = json['hasLienRecords'];
    _hasMarriageRecords = json['hasMarriageRecords'];
    _hasProfessionalLicenseRecords = json['hasProfessionalLicenseRecords'];
    _hasPropertyRecords = json['hasPropertyRecords'];
    _hasVehicleRegistrationsRecords = json['hasVehicleRegistrationsRecords'];
    _hasWorkplaceRecords = json['hasWorkplaceRecords'];
    _hasDeaRecords = json['hasDeaRecords'];
    _hasPropertyV2Records = json['hasPropertyV2Records'];
    _hasUccRecords = json['hasUccRecords'];
    _hasUnbankedData = json['hasUnbankedData'];
    _hasMobilePhones = json['hasMobilePhones'];
    _hasLandLines = json['hasLandLines'];
    _hasEmails = json['hasEmails'];
    _hasAddresses = json['hasAddresses'];
    _hasCurrentAddresses = json['hasCurrentAddresses'];
    _hasHistoricalAddresses = json['hasHistoricalAddresses'];
    _hasDebtRecords = json['hasDebtRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasBankruptcyRecords'] = this._hasBankruptcyRecords;
    data['hasBusinessRecords'] = this._hasBusinessRecords;
    data['hasDivorceRecords'] = this._hasDivorceRecords;
    data['hasDomainsRecords'] = this._hasDomainsRecords;
    data['hasEvictionsRecords'] = this._hasEvictionsRecords;
    data['hasFeinRecords'] = this._hasFeinRecords;
    data['hasForeclosuresRecords'] = this._hasForeclosuresRecords;
    data['hasForeclosuresV2Records'] = this._hasForeclosuresV2Records;
    data['hasJudgmentRecords'] = this._hasJudgmentRecords;
    data['hasLienRecords'] = this._hasLienRecords;
    data['hasMarriageRecords'] = this._hasMarriageRecords;
    data['hasProfessionalLicenseRecords'] = this._hasProfessionalLicenseRecords;
    data['hasPropertyRecords'] = this._hasPropertyRecords;
    data['hasVehicleRegistrationsRecords'] =
        this._hasVehicleRegistrationsRecords;
    data['hasWorkplaceRecords'] = this._hasWorkplaceRecords;
    data['hasDeaRecords'] = this._hasDeaRecords;
    data['hasPropertyV2Records'] = this._hasPropertyV2Records;
    data['hasUccRecords'] = this._hasUccRecords;
    data['hasUnbankedData'] = this._hasUnbankedData;
    data['hasMobilePhones'] = this._hasMobilePhones;
    data['hasLandLines'] = this._hasLandLines;
    data['hasEmails'] = this._hasEmails;
    data['hasAddresses'] = this._hasAddresses;
    data['hasCurrentAddresses'] = this._hasCurrentAddresses;
    data['hasHistoricalAddresses'] = this._hasHistoricalAddresses;
    data['hasDebtRecords'] = this._hasDebtRecords;
    return data;
  }
}
