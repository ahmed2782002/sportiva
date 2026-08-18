import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/language_model.dart';
import '../../view_model/language_selection_cubit.dart';
import '../../view_model/language_selection_state.dart';
import 'language_card.dart';
import 'language_constants.dart';

class LanguageEntranceAnimation extends StatefulWidget {
  final Widget child;

  const LanguageEntranceAnimation({super.key, required this.child});

  @override
  State<LanguageEntranceAnimation> createState() =>
      _LanguageEntranceAnimationState();
}

class _LanguageEntranceAnimationState extends State<LanguageEntranceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fade,
    child: SlideTransition(position: _slide, child: widget.child),
  );
}

class LanguageCardsAnimation extends StatefulWidget {
  const LanguageCardsAnimation({super.key});

  @override
  State<LanguageCardsAnimation> createState() => _LanguageCardsAnimationState();
}

class _LanguageCardsAnimationState extends State<LanguageCardsAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languages = LanguageConstants.supportedLanguages;

    return Column(
      children: [
        for (var i = 0; i < languages.length; i++) ...[
          _AnimatedLanguageCard(
            language: languages[i],
            animation: CurvedAnimation(
              parent: _controller,
              curve: Interval(
                i * 0.16,
                0.55 + i * 0.16,
                curve: Curves.easeOutCubic,
              ),
            ),
          ),
          if (i < languages.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _AnimatedLanguageCard extends StatelessWidget {
  final LanguageModel language;
  final Animation<double> animation;

  const _AnimatedLanguageCard({
    required this.language,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: animation,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.12),
        end: Offset.zero,
      ).animate(animation),
      child: BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
        builder: (context, state) => LanguageCard(
          language: language,
          isSelected: state.selectedLanguage?.code == language.code,
          onTap: () => context.read<LanguageSelectionCubit>().selectLanguage(language),
        ),
      ),
    ),
  );
}
