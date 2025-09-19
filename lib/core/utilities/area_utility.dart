class AreaUtility {
  final List<String> _area = ['head office', 'sa 1 toko', 'sa mobile', 'sa mobile stay', 'spc'];
  final List<String> _permittedArea = ['sa mobile', 'spc'];

  // Getter _area
  List<String> get area => _area;

  // Periksa apakah area diizinkan atau tidak
  bool isPermittedArea(String area) {
    return _permittedArea.contains(area.toLowerCase());
  }
}
