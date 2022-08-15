class STuition {
  String cls;
  bool isMark;
  String title;
  String location;
  String time;

  List<String> req;
  STuition(
      this.cls, this.isMark, this.title, this.location, this.time, this.req);
  static List<STuition> generateTuition() {
    return [
      STuition(
        'Class: 8',
        false,
        'All subject',
        'Mirpur 10',
        '4.00 pm',
        [
          'Teacher Name    : Prodip Kumar',
          'Insitute        : Dhaka University',
          'Profession      : Student (Running)',
          'Experience      : 1 year',
        ],
      ),
      STuition(
        'Class: 11',
        true,
        'Physics',
        'Badda',
        'After 3.00 pm',
        [
          'Teacher Name: Nabila Khatun',
          'Insitute        : Khulna University',
          'Profession      : Student (Running)',
          'Experience      : n/a',
        ],
      ),
      STuition(
        'Class: 5',
        false,
        'All subject',
        'Mirpur 14',
        '7.00 pm',
        [
          'Teacher Name: Joy Adhikari',
          'Insitute        : BUBT',
          'Profession      : Student (Running)',
          'Experience      : 3 year',
        ],
      ),
    ];
  }
}
