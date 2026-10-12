import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  String _selectedMood = 'Peaceful';

  @override
  Widget build(BuildContext context) {
    final moods = ['Radiant', 'Peaceful', 'Anxious', 'Tired', 'Low'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CareCompanion • Check-in', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.secondary),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Text('HOW ARE YOU FEELING RIGHT NOW?', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: moods.map((m) => ChoiceChip(
                      label: Text(m),
                      selected: _selectedMood == m,
                      selectedColor: AppTheme.primary.withValues(alpha: 0.4),
                      onSelected: (val) => setState(() => _selectedMood = m),
                    )).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => RoutingService.openRegistrationUrl(),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(48)),
              child: const Text('Save Reflection & Receive Mindful Affirmation'),
            ),
          ],
        ),
      ),
    );
  }
}
