void main(List<String> arguments) {
  // Данные
  List<String> students = [
    'Иванов Иван', 'Петрова Мария', 'Сидоров Алексей',
    'Козлова Елена', 'Морозов Дмитрий', 'Волкова Анна'
  ];

  List<String> subjects = [
    'Математика', 'Физика', 'Программирование', 'Английский язык'
  ];

  List<List<int>> grades = [
    [5, 4, 5, 3],  // Иванов
    [4, 5, 4, 5],  // Петрова
    [3, 3, 4, 4],  // Сидоров
    [5, 5, 5, 5],  // Козлова
    [4, 3, 3, 4],  // Морозов
    [5, 4, 5, 4]   // Волкова
  ];

  print('ЖУРНАЛ УСПЕВАЕМОСТИ\n');

  print('СТУДЕНТЫ:');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]}');
  }
  
  print('\nПРЕДМЕТЫ:');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }

  print('ОЦЕНКИ:');
  for (int i = 0; i < students.length; i++) {
    print('\n${students[i]}:');
    for (int j = 0; j < subjects.length; j++) {
      print('  ${subjects[j]}: ${grades[i][j]}');
    }
  }

  print('СРЕДНИЙ БАЛЛ ПО ПРЕДМЕТАМ:');
  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }
    double avg = sum / students.length;
    print('${subjects[j]}: ${avg.toStringAsFixed(2)}');
  }

  print('СРЕДНИЙ БАЛЛ СТУДЕНТОВ:');
  List<double> studentAvg = [];
  for (int i = 0; i < students.length; i++) {
    double sum = 0;
    for (int j = 0; j < subjects.length; j++) {
      sum += grades[i][j];
    }
    double avg = sum / subjects.length;
    studentAvg.add(avg);
    print('${students[i]}: ${avg.toStringAsFixed(2)}');
  }

  double maxAvg = studentAvg[0];
  int bestIndex = 0;
  for (int i = 1; i < studentAvg.length; i++) {
    if (studentAvg[i] > maxAvg) {
      maxAvg = studentAvg[i];
      bestIndex = i;
    }
  }
  print('ЛУЧШИЙ СТУДЕНТ: ${students[bestIndex]} (${maxAvg.toStringAsFixed(2)})');

  double minSubjectAvg = 999;
  int worstSubjectIndex = 0;
  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }
    double avg = sum / students.length;
    if (avg < minSubjectAvg) {
      minSubjectAvg = avg;
      worstSubjectIndex = j;
    }
  }
  print('ХУДШИЙ ПРЕДМЕТ: ${subjects[worstSubjectIndex]} (${minSubjectAvg.toStringAsFixed(2)})');

  double totalSum = 0;
  int totalCount = 0;
  for (int i = 0; i < students.length; i++) {
    for (int j = 0; j < subjects.length; j++) {
      totalSum += grades[i][j];
      totalCount++;
    }
  }
  double totalAvg = totalSum / totalCount;
  print('ОБЩИЙ СРЕДНИЙ БАЛЛ: ${totalAvg.toStringAsFixed(2)}');

  print('\nВСЕГО ПРЕДМЕТОВ: ${subjects.length}');

  print('\nНЕТ ДВОЕК:');
  for (int i = 0; i < students.length; i++) {
    bool hasTwo = false;
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] == 2) {
        hasTwo = true;
        break;
      }
    }
    if (!hasTwo) {
      print(students[i]);
    }
  }

  print('\nВСЕ ОЦЕНКИ 4 И 5:');
  for (int i = 0; i < students.length; i++) {
    bool allGood = true;
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] < 4) {
        allGood = false;
        break;
      }
    }
    if (allGood) {
      print(students[i]);
    }
  }

  print('ГОТОВО!');
}