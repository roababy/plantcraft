// FILE: lib/utils/unit_converter.dart

/// Small helper to normalize units into grams for cost calculations.
/// This is intentionally conservative — tweak the conversions to match your kitchen.

class UnitConverter {
  /// Convert a quantity in [unit] to grams.
  /// Supported units: 'g','kg','mg','ml','l','tbsp','tsp','cup','unit'
  /// For liquids we assume density close to water (1 g/ml) unless specified elsewhere.
  static double toGrams(double quantity, String unit) {
    switch (unit.toLowerCase()) {
      case 'g':
        return quantity;
      case 'kg':
        return quantity * 1000.0;
      case 'mg':
        return quantity / 1000.0;
      case 'ml':
        return quantity; // assume 1 ml = 1 g (water-like)
      case 'l':
        return quantity * 1000.0;
      case 'tbsp':
        return quantity * 15.0; // 1 tbsp ≈ 15 g
      case 'tsp':
        return quantity * 5.0; // 1 tsp ≈ 5 g
      case 'cup':
        return quantity * 240.0; // US cup ~240 ml
      case 'unit':
        return quantity * 50.0; // fall-back: one unit = 50 g (adjust per kg)
      default:
        return quantity; // fallback: assume grams
    }
  }
}

