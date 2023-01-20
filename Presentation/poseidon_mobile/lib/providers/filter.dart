import 'package:flutter/widgets.dart';

class FilterProps {
  bool description = false;
  bool gtin = false;
  bool number = false;
  bool name = true;
  bool price = false;
  bool orderUpdated = true;
  bool orderName = false;
  bool desc = false;
}

class Filter with ChangeNotifier {
  FilterProps _filterProperties = FilterProps();

  void setProps(FilterProps props) {
    _filterProperties = props;
    notifyListeners();
  }

  FilterProps get filter => _filterProperties;
}
