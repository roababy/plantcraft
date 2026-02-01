import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../nav.dart';

class IngredientDetailPage extends StatelessWidget {
  const IngredientDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
                              onPressed: () => context.pop(),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INGREDIENT_ID: V-092",
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                ),
                                Text(
                                  "Xanthan Gum (Clear)",
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text("Add Supplier"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _buildStat(context, "AVG. COST", "€34.50/kg", Theme.of(context).colorScheme.success),
                        const SizedBox(width: 24),
                        _buildStat(context, "USED IN", "14 Recipes", Theme.of(context).colorScheme.onSurface),
                        const SizedBox(width: 24),
                        _buildStat(context, "STOCK", "8.5 kg", Theme.of(context).colorScheme.onSurface),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Market Volatility Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(4), // Theme uses 4 or 12, going with design spec of lg which is usually 4 in this system
                        boxShadow: [
                           BoxShadow(
                             color: Colors.black.withValues(alpha: 0.2),
                             blurRadius: 4,
                             offset: const Offset(0, 2),
                           ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MARKET VOLATILITY",
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.8),
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.trending_up, color: Theme.of(context).colorScheme.onPrimary, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    "+2.4% price increase vs last month",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              side: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                            child: const Text("View History"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Culinary Functions
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Theme.of(context).colorScheme.divider),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CULINARY FUNCTIONS",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              FunctionalChip(label: "Stabilizer", icon: Icons.architecture, active: true),
                              FunctionalChip(label: "Thickener", icon: Icons.layers, active: true),
                              FunctionalChip(label: "Emulsifier", icon: Icons.blur_on, active: true),
                              FunctionalChip(label: "Binding Agent", icon: Icons.link, active: false),
                              FunctionalChip(label: "Texture Modifier", icon: Icons.texture, active: true),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(color: Theme.of(context).colorScheme.divider),
                          const SizedBox(height: 20),
                          Text(
                            "FUNCTIONAL INTENSITY (LAB SCALE)",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                          const SizedBox(height: 20),
                          GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 3.5,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 20,
                            children: const [
                              IntensityBar(functionName: "Viscosity", level: 5),
                              IntensityBar(functionName: "Shear Thinning", level: 4),
                              IntensityBar(functionName: "Clarity", level: 5),
                              IntensityBar(functionName: "Heat Stability", level: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Notes
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Theme.of(context).colorScheme.divider),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "R&D CHEF NOTES",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Hydrates in both hot and cold liquids. Synergistic with Guar Gum for high-viscosity gels. Does not affect flavor profile even at high concentrations (0.5%+). Essential for preventing oil separation in vegan dressings.",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  height: 1.6,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Suppliers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ACTIVE SUPPLIERS",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Manage All"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const SupplierCard(name: "VeganChem Europe", format: "1kg Tub", priceKg: "32.00", date: "2023-10-12"),
                    const SupplierCard(name: "Bio-Culinary Labs", format: "500g Pouch", priceKg: "37.00", date: "2023-09-28"),
                    const SupplierCard(name: "Global Gastronomy", format: "5kg Bulk", priceKg: "29.50", date: "2023-11-01"),
                    
                    const SizedBox(height: 24),

                    // Compliance
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF5F5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFFFED7D7)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ALLERGENS & COMPLIANCE",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFC53030),
                                ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildComplianceChip(context, "VEGAN"),
                              _buildComplianceChip(context, "GLUTEN-FREE"),
                              _buildComplianceChip(context, "NON-GMO"),
                              _buildComplianceChip(context, "NO SOY"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                    OutlinedButton.icon(
                      onPressed: () => context.push(AppRoutes.substitutionModal),
                      icon: const Icon(Icons.science),
                      label: const Text("Run Substitution Simulation"),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildComplianceChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.success,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}

class FunctionalChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;

  const FunctionalChip({
    super.key,
    required this.label,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.divider;
    final iconColor = active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary;
    final textColor = active ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.secondary;
    final fontWeight = active ? FontWeight.w600 : FontWeight.w400;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: textColor,
                  fontWeight: fontWeight,
                ),
          ),
        ],
      ),
    );
  }
}

class IntensityBar extends StatelessWidget {
  final String functionName;
  final int level;

  const IntensityBar({
    super.key,
    required this.functionName,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          functionName,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        const SizedBox(height: 4),
        Row(
          children: List.generate(5, (index) {
            final isActive = index < level;
            return Expanded(
              child: Container(
                height: 6,
                margin: EdgeInsets.only(right: index < 4 ? 4.0 : 0.0),
                decoration: BoxDecoration(
                  color: isActive ? Theme.of(context).colorScheme.accent : Theme.of(context).colorScheme.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class SupplierCard extends StatelessWidget {
  final String name;
  final String format;
  final String priceKg;
  final String date;

  const SupplierCard({
    super.key,
    required this.name,
    required this.format,
    required this.priceKg,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Format: $format",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "€$priceKg / kg",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.success,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                "Last update: $date",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.hint,
                    ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.secondary, size: 20),
        ],
      ),
    );
  }
}
