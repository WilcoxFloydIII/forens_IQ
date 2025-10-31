class ScanModel {
  late final String id;
  late final String fileName;
  late final double fileSize;
  late final String fileType;
  late final String hashMD5;
  late final String hashSHA256;
  late final DateTime firstSeen;
  late final String apiCalls;
  late final String networkActivity;
  late final String fileModification;
  late final List<ThreatCorrelation> threatCorrelations;
  late final List<Log> logs;

  ScanModel({
    required this.id,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.firstSeen,
    required this.hashMD5,
    required this.hashSHA256,
    required this.logs,
    required this.threatCorrelations,
    required this.apiCalls,
    required this.fileModification,
    required this.networkActivity,
  });
}

class ThreatCorrelation {
  late final String info;
  late final String type;

  ThreatCorrelation({required this.info, required this.type});
}

class Log {
  late final DateTime time;
  late final String info;

  Log({required this.info, required this.time});
}
