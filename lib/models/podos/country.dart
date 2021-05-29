class Country {
  String? countryId;
  String? capital;
  String? continent;
  String? countryName;
  String? dS;
  String? dial;
  String? eDGAR;
  String? fIFA;
  String? fIPS;
  String? gAUL;
  String? geoNameID;
  String? iOC;
  String? iSO31661Alpha2;
  String? iSO31661Alpha3;
  String? iSO4217CurrencyAlphabeticCode;
  String? iSO4217CurrencyCountryName;
  int? iSO4217CurrencyMinorUnit;
  String? iSO4217CurrencyName;
  int? iSO4217CurrencyNumericCode;
  String? iTU;
  String? isIndependent;
  String? languages;
  int? m49;
  String? mARC;
  String? officialNameEnglish;
  String? tLD;
  String? wMO;
  String? countryFlag;

  Country({
    this.countryId,
    this.capital,
    this.continent,
    this.countryName,
    this.dS,
    this.dial,
    this.eDGAR,
    this.fIFA,
    this.fIPS,
    this.gAUL,
    this.geoNameID,
    this.iOC,
    this.iSO31661Alpha2,
    this.iSO31661Alpha3,
    this.iSO4217CurrencyAlphabeticCode,
    this.iSO4217CurrencyCountryName,
    this.iSO4217CurrencyMinorUnit,
    this.iSO4217CurrencyName,
    this.iSO4217CurrencyNumericCode,
    this.iTU,
    this.isIndependent,
    this.languages,
    this.m49,
    this.mARC,
    this.officialNameEnglish,
    this.tLD,
    this.wMO,
    this.countryFlag
  });

  String? get countryCode {
    if (dial == null) return "";
    if (dial!.startsWith("+")) return dial;
    return "+$dial";
  }

  Country.fromJson(Map json) {
    final numCode = (json['ISO4217_Currency_Numeric_Code'] ?? json['ISO4217CurrencyNumericCode']);
    countryId = json['CountryId'];
    capital = json['Capital'];
    continent = json['Continent'];
    countryName = json['Country_Name'] ?? json['CountryName'];
    dS = json['DS'];
    dial = json['Dial'];
    eDGAR = json['EDGAR'];
    fIFA = json['FIFA'];
    fIPS = json['FIPS'];
    gAUL = json['GAUL'];
    geoNameID = json['Geo_Name_ID'] ?? json["GeoNameId"];
    iOC = json['IOC'];
    iSO31661Alpha2 = json['ISO3166_1_Alpha_2'];
    iSO31661Alpha3 = json['ISO3166_1_Alpha_3'];
    iSO4217CurrencyAlphabeticCode = json['ISO4217_Currency_Alphabetic_Code'] ?? json['ISO4217CurrencyAlphabeticCode'];
    iSO4217CurrencyCountryName = json['ISO4217_Currency_Country_Name'];
    iSO4217CurrencyMinorUnit = json['ISO4217_Currency_Minor_Unit'];
    iSO4217CurrencyName = json['ISO4217_Currency_Name'];
    iSO4217CurrencyNumericCode = numCode is int? ? numCode : int.tryParse(numCode);
    iTU = json['ITU'];
    isIndependent = json['Is_Independent'];
    languages = json['Languages'];
    m49 = json['M49'];
    mARC = json['MARC'];
    officialNameEnglish = json['Official_Name_English'] ?? json['officialNameEnglish'];
    tLD = json['TLD'];
    wMO = json['WMO'];
    countryFlag = json['countryFlag'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Capital'] = this.capital;
    data['Continent'] = this.continent;
    data['Country_Name'] = this.countryName;
    data['DS'] = this.dS;
    data['Dial'] = this.dial;
    data['EDGAR'] = this.eDGAR;
    data['FIFA'] = this.fIFA;
    data['FIPS'] = this.fIPS;
    data['GAUL'] = this.gAUL;
    data['Geo_Name_ID'] = this.geoNameID;
    data['IOC'] = this.iOC;
    data['ISO3166_1_Alpha_2'] = this.iSO31661Alpha2;
    data['ISO3166_1_Alpha_3'] = this.iSO31661Alpha3;
    data['ISO4217_Currency_Alphabetic_Code'] =
        this.iSO4217CurrencyAlphabeticCode;
    data['ISO4217_Currency_Country_Name'] = this.iSO4217CurrencyCountryName;
    data['ISO4217_Currency_Minor_Unit'] = this.iSO4217CurrencyMinorUnit;
    data['ISO4217_Currency_Name'] = this.iSO4217CurrencyName;
    data['ISO4217_Currency_Numeric_Code'] = this.iSO4217CurrencyNumericCode;
    data['ITU'] = this.iTU;
    data['Is_Independent'] = this.isIndependent;
    data['Languages'] = this.languages;
    data['M49'] = this.m49;
    data['MARC'] = this.mARC;
    data['Official_Name_English'] = this.officialNameEnglish;
    data['TLD'] = this.tLD;
    data['WMO'] = this.wMO;
    data['countryFlag'] = this.countryFlag;
    return data;
  }
}
