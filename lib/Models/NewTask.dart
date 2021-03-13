class ToDo {
  int _id;
  String _title;
  String _description;
  String _date;
  String _category;
  ToDo(this._date, this._description, this._id, this._title);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  String get category => _category;

  set title(String newTitle) {
    if (newTitle != null) this._title = newTitle;
  }

  set description(String newDescription) {
    if (newDescription != null) this._description = newDescription;
  }

  set date(String newDate) {
    if (newDate != null) this._date = newDate;
  }

  set category(String newCategory) {
    if (newCategory != null) {
      _category = newCategory;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['category'] = _category;
  }
  // Extract a Note object from a Map object
  ToDo.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._category = map['category'];
    this._description = map['description'];
    this._date = map['date'];
  }
}
