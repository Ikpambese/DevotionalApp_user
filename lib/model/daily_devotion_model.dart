// Create a model for the devotional data
class TodayDevotionalModel {
  final String imagePath;
  final String title;
  final String docDate;
  final String verse;
  final String content;
  final String confession;
  final String confessionHead;
  final String furtherReading;

  TodayDevotionalModel({
    required this.imagePath,
    required this.title,
    required this.verse,
    required this.content,
    required this.confession,
    required this.furtherReading,
    required this.confessionHead,
    required this.docDate,
  });
}
