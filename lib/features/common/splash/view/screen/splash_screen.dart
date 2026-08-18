import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../view_model/splash_cubit.dart';
import '../../view_model/splash_state.dart';
import '../widgets/image_widget.dart';
import '../widgets/pill_widget.dart';
import '../widgets/tagline_widget.dart';
import '../widgets/title_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startSplashSequence(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with TickerProviderStateMixin {
  late final List<AnimationController> _letterControllers;
  late final AnimationController _taglineController;
  late final AnimationController _imageController;
  late final AnimationController _shimmerController;
  late final AnimationController _pillController;

  late final List<Animation<double>> _letterOffsets;
  late final List<Animation<double>> _letterOpacities;
  late final Animation<double> _taglineFade;
  late final Animation<double> _taglineSlide;
  late final Animation<double> _imageScale;
  late final Animation<double> _imageOpacity;
  late final Animation<double> _imageSlide;
  late final Animation<double> _shimmer;
  late final Animation<double> _pillFade;
  late final Animation<double> _pillSlide;

  static const String _word = 'SPORTIVA';
  static const List<int> _delays = [100, 180, 260, 340, 420, 500, 580, 660];

  @override
  void initState() {
    super.initState();
    _buildControllers();
    _buildAnimations();
    _startAnimations();
  }

  void _buildControllers() {
    _letterControllers = List.generate(
      _word.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _pillController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  void _buildAnimations() {
    _letterOffsets = _letterControllers
        .map(
          (c) => Tween<double>(begin: -60, end: 0).animate(
            CurvedAnimation(parent: c, curve: Curves.easeOutExpo),
          ),
        )
        .toList();

    _letterOpacities = _letterControllers
        .map(
          (c) => Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: c, curve: Curves.easeOut),
          ),
        )
        .toList();

    _taglineFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _taglineController, curve: Curves.easeOut),
    );

    _taglineSlide = Tween<double>(begin: 12, end: 0).animate(
      CurvedAnimation(parent: _taglineController, curve: Curves.easeOut),
    );

    _imageScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.85, end: 1.03), weight: 65),
      TweenSequenceItem(tween: Tween(begin: 1.03, end: 1.0), weight: 35),
    ]).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOut),
    );

    _imageOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: const Interval(0, 0.45, curve: Curves.easeOut),
      ),
    );

    _imageSlide = Tween<double>(begin: -18, end: 0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOutCubic),
    );

    _shimmer = Tween<double>(begin: -1.8, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    _pillFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _pillController, curve: Curves.easeOut),
    );

    _pillSlide = Tween<double>(begin: 14, end: 0).animate(
      CurvedAnimation(parent: _pillController, curve: Curves.easeOut),
    );
  }

  Future<void> _startAnimations() async {
    for (int i = 0; i < _word.length; i++) {
      Future.delayed(Duration(milliseconds: _delays[i]), () {
        if (mounted) _letterControllers[i].forward();
      });
    }

    await Future.delayed(const Duration(milliseconds: 900));
    if (mounted) _taglineController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) _imageController.forward();

    await Future.delayed(const Duration(milliseconds: 700));
    if (mounted) _shimmerController.repeat();

    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) _pillController.forward();
  }

  @override
  void dispose() {
    for (final c in _letterControllers) {
      c.dispose();
    }
    _taglineController.dispose();
    _imageController.dispose();
    _shimmerController.dispose();
    _pillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(
                    letterControllers: _letterControllers,
                    letterOffsets: _letterOffsets,
                    letterOpacities: _letterOpacities,
                  ),
                  const SizedBox(height: 10),
                  TaglineWidget(
                    taglineController: _taglineController,
                    taglineFade: _taglineFade,
                    taglineSlide: _taglineSlide,
                  ),
                  const SizedBox(height: 52),
                  ImageWidget(
                    imageController: _imageController,
                    shimmerController: _shimmerController,
                    imageScale: _imageScale,
                    imageOpacity: _imageOpacity,
                    imageSlide: _imageSlide,
                    shimmer: _shimmer,
                  ),
                  const SizedBox(height: 52),
                  PillWidget(
                    pillController: _pillController,
                    pillFade: _pillFade,
                    pillSlide: _pillSlide,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
