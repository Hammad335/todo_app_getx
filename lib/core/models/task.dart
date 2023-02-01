class Task {
  int id;
  String title;
  String note;
  bool isCompleted;
  String date;
  String startTime;
  String endTime;
  int color;
  int remind;
  String repeat;

  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.remind,
    required this.repeat,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      title: map['title'] as String,
      note: map['note'] as String,
      isCompleted: map['isCompleted'] as bool,
      date: map['date'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      color: map['color'] as int,
      remind: map['remind'] as int,
      repeat: map['repeat'] as String,
    );
  }
}
