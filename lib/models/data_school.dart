class School {
  int _id;
  int _priority;
  int _height;
  int _weight;

  School(this._id, this._priority, this._height, this._weight);

  //getter setter
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get priority => _priority;

  set priority(int value) {
    _priority = value;
  }

  int get height => _height;

  set height(int value) {
    _height = value;
  } //constructor

  int get weight => _weight;

  set weight(int value) {
    _weight = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['priority'] = _priority;
    map['height'] = _height;
    map['weight'] = _weight;
    return map;
  }

  formMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._priority = map['priority'];
    this._height = map['height'];
    this._weight = map['weight'];
  }
}
