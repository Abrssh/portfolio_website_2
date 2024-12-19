class TopPlayer {
  final String name;
  final String teamName;
  final String teamLightColor;
  final String teamDarkColor;
  final String teamFontLightColor;
  final int goals;
  final int assists;
  final double rating;

  TopPlayer({
    required this.name,
    required this.teamName,
    required this.teamLightColor,
    required this.teamDarkColor,
    required this.teamFontLightColor,
    required this.goals,
    required this.assists,
    required this.rating,
  });

  factory TopPlayer.fromJson(Map<String, dynamic> json) {
    return TopPlayer(
      name: json['name'] ?? '',
      teamName: json['teamName'] ?? '',
      teamLightColor: json['teamColors']['lightMode'] ?? '#FFFFFF',
      teamDarkColor: json['teamColors']['darkMode'] ?? '#000000',
      teamFontLightColor: json['teamColors']['fontLightMode'] ?? '#000000',
      goals: json['goals'] ?? 0,
      assists: json['assists'] ?? 0,
      rating: json['rating'] ?? 0.0,
    );
  }
}
