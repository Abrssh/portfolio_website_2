import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portfolio_website_2/MVVM/Model/Data/rapid_api_datasource.dart';
import 'package:portfolio_website_2/MVVM/Model/get_topplayer_implementation.dart';
import 'package:portfolio_website_2/MVVM/ViewModel/football_api_section_viewmodel.dart';
import 'package:provider/provider.dart';
import 'MVVM/View/Screen/home_screen.dart';
import 'MVVM/View/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: "api_key.env");
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return FootballApiSecViewModel(
                // manual dependency injection
                getTopPlayersUseCase: GetTopPlayerImplementation(
                    rapidApiDataSource: RapidApiDataSource()));
          },
        ),
      ],
      child: MaterialApp(
        title: 'My Portfolio',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
