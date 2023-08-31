import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/game/game_logic.dart';
import 'package:vegas_brain_game/feature/game/lose_screen.dart';
import 'package:vegas_brain_game/feature/game/win_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/main_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';
import 'package:vegas_brain_game/helpers/const.dart';

import '../../../helpers/saved_data.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Game _game = Game();

  late int _coin;

  String textGameSimply = '';
  String textGameMode = '';

  int _count = 0;
  int _diamond = 0;
  int _quest = 0;

  int openedCardCount = 0;

  int player = 1;
  int round = 1;

  @override
  void initState() {
    super.initState();
    _initializeGame();
    _quests();
  }

  Future<void> _quests() async {
    int questSavedData = await SavedData.getQuest();
    int diamondSavedData = await SavedData.getDymond();

    int playerSavedData = await SavedData.getPlayer();

    int roundSavedData = await SavedData.getTournament();

    setState(() {
      _quest = questSavedData;
      _diamond = diamondSavedData;
      player = playerSavedData;
      round = roundSavedData;
    });
  }

  Future<void> _initializeGame() async {
    await _fetchSavedData();
    _startTimer();
    _coin = await _fetchCoin();
    _count = 0;
    await _game.initGame();
    isCardFlipped = List.filled(_game.gameImg!.length, false);
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  }

  Future<void> _fetchSavedData() async {
    String textSavedData = await SavedData.getGameSimply();
    String textSavedData2 = await SavedData.getGameMode();
    setState(() {
      textGameSimply = textSavedData;
      textGameMode = textSavedData2;
    });
  }

  int tries = 10;
  List<bool> isCardFlipped = [];

  int matchedPairs = 0;

  Future<int> _fetchCoin() async {
    return await SavedData.getCoin();
  }

  Timer? timer;
  final oneSec = const Duration(seconds: 1);
  int seconds = 0;

  void _startTimer() {
    setState(() {
      seconds = 60;
    });
    if (textGameSimply == GameSimply.time) {
      timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          setState(() {
            seconds--;
            if (seconds == 0) {
              timer.cancel();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoseScreen(),
                ),
                (route) => false,
              );
            }
          });
        },
      );
    }
  }

  String minutesConvert(int seconds) {
    if (seconds < 0) {
      seconds = 0;
    }
    Duration clockTimer = Duration(seconds: seconds);
    return '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  Future<void> player1() async {
    player += 1;
    await SavedData.setPlayer(player);
    await SavedData.setPlayer1(0);
  }

  Future<void> player2() async {
    await SavedData.setPlayer2(0);
    await SavedData.setPlayer(1);
  }

  @override
  Widget build(BuildContext context) {
    if (tries == 0) {
      if (textGameSimply == GameSimply.twoPlayer && player == 1) {
        player1();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const GameScreen(),
            ),
            (route) => false,
          );
        });
      } else if (textGameSimply == GameSimply.twoPlayer && player == 2) {
        player2();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WinScreen(),
            ),
            (route) => false,
          );
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoseScreen(),
            ),
            (route) => false,
          );
        });
      }
    }
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.imageBg), fit: BoxFit.cover),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff061E4C),
              Color(0xff0A3378),
            ],
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (protected) => false,
                        );
                      },
                      child: Image.asset(AppImages.closeIcon, width: 40),
                    ),
                    textGameSimply == GameSimply.norm
                        ? Image.asset(
                            AppImages.simplyGame,
                            height: 30,
                          )
                        : textGameSimply == GameSimply.time
                            ? Text(minutesConvert(seconds),
                                style: AppTextStyles.s36W900(
                                    color: AppColors.colorFDD835Yellow))
                            : textGameSimply == GameSimply.gameAttempts
                                ? Text('$tries',
                                    style: AppTextStyles.s36W900(
                                        color: AppColors.colorFDD835Yellow))
                                : textGameSimply == GameSimply.twoPlayer
                                    ? Text('Player$player  $tries',
                                        style: AppTextStyles.s36W900(
                                            color: AppColors.colorFDD835Yellow))
                                    : textGameSimply == GameSimply.tournament
                                        ? Text('Round $round ',
                                            style: AppTextStyles.s36W900(
                                                color: AppColors
                                                    .colorFDD835Yellow))
                                        : const Text(''),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _game.gameImg != null && _game.gameImg!.isNotEmpty
                      ? Center(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: _game.gameImg!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: textGameMode == GameMode.x23
                                  ? 2
                                  : textGameMode == GameMode.x24
                                      ? 2
                                      : textGameMode == GameMode.x25
                                          ? 2
                                          : textGameMode == GameMode.x34
                                              ? 3
                                              : 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: ((context, index) {
                              String imagePath = _game.gameImg![index];
                              bool isImageVisible = isCardFlipped[index];

                              return InkWell(
                                onTap: () async {
                                  if (openedCardCount >= 2) {
                                    return;
                                  }
                                  setState(() {
                                    if (!isImageVisible) {
                                      isCardFlipped[index] = true;
                                      _game.matchCheck.add({index: imagePath});
                                      openedCardCount++;
                                    }
                                  });

                                  if (_game.matchCheck.length == 2) {
                                    if (_game.matchCheck[0].values.first ==
                                        _game.matchCheck[1].values.first) {
                                      if (textGameSimply ==
                                              GameSimply.gameAttempts ||
                                          textGameSimply ==
                                              GameSimply.twoPlayer) {
                                        setState(() {
                                          tries--;
                                        });
                                      }
                                      matchedPairs++;
                                      if (matchedPairs ==
                                          _game.gameImg!.length / 2) {
                                        _count = 100;
                                        _coin += _count;
                                        await SavedData.setCoin(_coin);
                                        _quest += 1;
                                        await SavedData.setQuest(_quest);
                                        if (_quest == 20) {
                                          _diamond += 1;
                                          await SavedData.setDymond(_diamond);
                                        }
                                        if (textGameSimply ==
                                                GameSimply.twoPlayer &&
                                            player == 1) {
                                          player += 1;
                                          await SavedData.setPlayer(player);
                                          await SavedData.setPlayer1(tries);
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GameScreen(),
                                            ),
                                            (route) => false,
                                          );
                                        } else {
                                          if (textGameSimply ==
                                              GameSimply.twoPlayer) {
                                            await SavedData.setPlayer(1);
                                            await SavedData.setPlayer2(tries);
                                          }
                                          if (textGameSimply ==
                                                  GameSimply.tournament &&
                                              round < 3) {
                                                round += 1;
                                              await SavedData.setTournament(
                                                  round);
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    GameScreen(),
                                              ),
                                              (route) => false,
                                            );
                                          } else {
                                              
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WinScreen(coin: _count),
                                              ),
                                              (route) => false,
                                            );
                                          }
                                        }
                                      }
                                      openedCardCount = 0;
                                      _game.matchCheck.clear();
                                    } else {
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        setState(() {
                                          isCardFlipped[_game.matchCheck[0].keys
                                              .first] = false;
                                          isCardFlipped[_game.matchCheck[1].keys
                                              .first] = false;
                                          if (textGameSimply ==
                                                  GameSimply.gameAttempts ||
                                              textGameSimply ==
                                                  GameSimply.twoPlayer) {
                                            tries--;
                                          }
                                          openedCardCount = 0;
                                          _game.matchCheck.clear();
                                        });
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          isImageVisible
                                              ? imagePath
                                              : _game.hiddenCardpath,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              );
                            }),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
