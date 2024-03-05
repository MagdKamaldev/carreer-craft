class NumberOfEmployees {
  int? min;
  int? max;

  NumberOfEmployees({this.min, this.max});

  factory NumberOfEmployees.fromJson(Map<String, dynamic> json) {
    return NumberOfEmployees(
      min: json['min'] as int?,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}
