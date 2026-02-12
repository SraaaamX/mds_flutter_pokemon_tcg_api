import 'package:flutter/material.dart';

/// Pokemon TCG Official Color Palette
class PokemonColors {
  // Primary Pokemon Brand Colors
  static const Color pokemonBlue = Color(0xFF3c5aa6);
  static const Color pokemonLightBlue = Color(0xFF2a75bb);
  static const Color pokemonYellow = Color(0xFFffcb05);
  static const Color pokemonYellowShadow = Color(0xFfc7a008);
  static const Color pokemonRed = Color(0xFFee1515);

  // Background Colors
  static const Color backgroundLight = Color(0xFFf5f5f5);
  static const Color cardBackground = Color(0xFFffffff);

  // Text Colors
  static const Color textPrimary = Color(0xFF2d2d2d);
  static const Color textSecondary = Color(0xFF6b6b6b);

  // Type Colors (for Pokemon types)
  static const Color typeGrass = Color(0xFF78C850);
  static const Color typeFire = Color(0xFFF08030);
  static const Color typeWater = Color(0xFF6890F0);
  static const Color typeElectric = Color(0xFFF8D030);
  static const Color typePsychic = Color(0xFFF85888);
  static const Color typeFighting = Color(0xFFC03028);
  static const Color typeDarkness = Color(0xFF705848);
  static const Color typeMetal = Color(0xFFB8B8D0);
  static const Color typeFairy = Color(0xFFEE99AC);
  static const Color typeDragon = Color(0xFF7038F8);
  static const Color typeColorless = Color(0xFFA8A878);
}

/// Pokemon TCG Theme
class PokemonTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      
      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: PokemonColors.pokemonBlue,
        secondary: PokemonColors.pokemonYellow,
        surface: PokemonColors.backgroundLight,
        error: PokemonColors.pokemonRed,
        onPrimary: Colors.white,
        onSecondary: PokemonColors.textPrimary,
        onSurface: PokemonColors.textPrimary,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: PokemonColors.pokemonBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: PokemonColors.cardBackground,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PokemonColors.pokemonYellow,
          foregroundColor: PokemonColors.textPrimary,
          elevation: 4,
          shadowColor: PokemonColors.pokemonYellowShadow,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: PokemonColors.pokemonBlue,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: PokemonColors.pokemonBlue,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: PokemonColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: PokemonColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: PokemonColors.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: PokemonColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: PokemonColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: PokemonColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: PokemonColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: PokemonColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: PokemonColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          color: PokemonColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: PokemonColors.textPrimary,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          color: PokemonColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: PokemonColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: PokemonColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: PokemonColors.textSecondary,
        ),
      ),

      // Scaffold Background
      scaffoldBackgroundColor: PokemonColors.backgroundLight,
    );
  }

  /// Get color for Pokemon type
  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return PokemonColors.typeGrass;
      case 'fire':
        return PokemonColors.typeFire;
      case 'water':
        return PokemonColors.typeWater;
      case 'lightning':
      case 'electric':
        return PokemonColors.typeElectric;
      case 'psychic':
        return PokemonColors.typePsychic;
      case 'fighting':
        return PokemonColors.typeFighting;
      case 'darkness':
        return PokemonColors.typeDarkness;
      case 'metal':
        return PokemonColors.typeMetal;
      case 'fairy':
        return PokemonColors.typeFairy;
      case 'dragon':
        return PokemonColors.typeDragon;
      case 'colorless':
        return PokemonColors.typeColorless;
      default:
        return Colors.grey;
    }
  }

  /// Get color for rarity
  static Color getRarityColor(String? rarity) {
    if (rarity == null) return Colors.grey;
    
    switch (rarity.toLowerCase()) {
      case 'common':
        return Colors.grey[600]!;
      case 'uncommon':
        return Colors.green[700]!;
      case 'rare':
        return Colors.blue[700]!;
      case 'rare holo':
      case 'holo rare':
        return Colors.purple[700]!;
      case 'ultra rare':
      case 'rare ultra':
        return PokemonColors.pokemonYellowShadow;
      case 'secret rare':
      case 'rare secret':
        return PokemonColors.pokemonRed;
      default:
        return Colors.grey[600]!;
    }
  }
}
