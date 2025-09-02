enum ModeTransport {
  bus,
  tram;

  static ModeTransport fromString(String mode) {
    switch (mode.toLowerCase()) {
      case 'bus':
        return ModeTransport.bus;
      case 'tram':
        return ModeTransport.tram;
      default:
        throw ArgumentError('Mode de transport inconnu : $mode');
    }
  }
}