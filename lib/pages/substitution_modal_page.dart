import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme.dart';
import '../nav.dart';

class SubstitutionModalPage extends StatelessWidget {
  const SubstitutionModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FUNCTIONAL SUBSTITUTION",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.accent,
                              fontFamily: 'JetBrains Mono',
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Replace: Aquafaba",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close, color: Theme.of(context).colorScheme.secondary),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Current Ingredient Context
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CURRENT FUNCTION",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              FunctionalTag(label: "EMULSIFIER", icon: Icons.bubble_chart, color: Color(0xFF22D3EE)),
                              const SizedBox(width: 8),
                              FunctionalTag(label: "BINDER", icon: Icons.link, color: Color(0xFF4ADE80)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "RECIPE DOSE",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        Text(
                          "150g",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontFamily: 'JetBrains Mono',
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              Divider(color: Theme.of(context).colorScheme.divider),
              const SizedBox(height: 16),

              // Search
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search functional alternatives...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.divider),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Theme.of(context).colorScheme.divider),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune, color: Theme.of(context).colorScheme.onSurface),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // List
              Text(
                "COMPATIBLE ALTERNATIVES (3)",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const SizedBox(height: 8),
              
              IngredientCard(
                name: "Soy Lecithin (Powder)",
                imgDesc: "yellow powder",
                function: "EMULSIFIER",
                intensity: "5",
                cost: "€12.40",
                supplier: "Bio-Culinary",
                selected: true,
                costImpact: "-12%",
                costColor: Theme.of(context).colorScheme.success,
                costTrend: Icons.trending_down,
                flavor: "Neutral",
                allergens: "Soy",
              ),
              IngredientCard(
                name: "Xanthan Gum",
                imgDesc: "white powder",
                function: "BINDER",
                intensity: "4",
                cost: "€18.90",
                supplier: "Modernist Pantry",
                selected: false,
                costImpact: "+5%",
                costColor: Theme.of(context).colorScheme.error,
                costTrend: Icons.trending_up,
                flavor: "Neutral",
                allergens: "None",
              ),
              IngredientCard(
                name: "Methylcellulose (SGA150)",
                imgDesc: "fine white powder",
                function: "STRUCTURING",
                intensity: "5",
                cost: "€45.00",
                supplier: "Chef Services",
                selected: false,
                costImpact: "+28%",
                costColor: Theme.of(context).colorScheme.error,
                costTrend: Icons.trending_up,
                flavor: "Slight Chemical",
                allergens: "None",
              ),

              const SizedBox(height: 24),

              // Chart
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FUNCTIONAL IMPACT PROJECTION",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true, drawVerticalLine: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const titles = ["Stability", "Viscosity", "Binding", "Flavor", "Cost"];
                                  if (value.toInt() >= 0 && value.toInt() < titles.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        titles[value.toInt()],
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 10),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [FlSpot(0, 80), FlSpot(1, 85), FlSpot(2, 90), FlSpot(3, 70), FlSpot(4, 60)],
                              isCurved: true,
                              color: Theme.of(context).colorScheme.accent,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                            ),
                            LineChartBarData(
                              spots: const [FlSpot(0, 95), FlSpot(1, 90), FlSpot(2, 85), FlSpot(3, 80), FlSpot(4, 85)],
                              isCurved: true,
                              color: Theme.of(context).colorScheme.primary,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(width: 8, height: 8, decoration: BoxDecoration(color: Theme.of(context).colorScheme.accent, borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 4),
                            Text("Original (Aquafaba)", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Container(width: 8, height: 8, decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 4),
                            Text("Substitute (Soy Lecithin)", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.secondary,
                        side: BorderSide(color: Theme.of(context).colorScheme.divider),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      icon: const Icon(Icons.swap_horiz),
                      label: const Text("Confirm Substitution"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FunctionalTag extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const FunctionalTag({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontFamily: 'JetBrains Mono',
                ),
          ),
        ],
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final String name;
  final String imgDesc;
  final String function;
  final String intensity;
  final String cost;
  final String supplier;
  final bool selected;
  final String costImpact;
  final Color costColor;
  final IconData costTrend;
  final String flavor;
  final String allergens;

  const IngredientCard({
    super.key,
    required this.name,
    required this.imgDesc,
    required this.function,
    required this.intensity,
    required this.cost,
    required this.supplier,
    required this.selected,
    required this.costImpact,
    required this.costColor,
    required this.costTrend,
    required this.flavor,
    required this.allergens,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.divider),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                child: const Icon(Icons.image, color: Colors.grey), // Placeholder for image
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        FunctionalTag(label: function, icon: Icons.functions, color: Theme.of(context).colorScheme.accent),
                        const SizedBox(width: 8),
                        Text(
                          "Intensity: $intensity/5",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$cost/kg",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontFamily: 'JetBrains Mono',
                        ),
                  ),
                  Text(
                    supplier,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.hint,
                        ),
                  ),
                ],
              ),
            ],
          ),
          if (selected) ...[
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImpactStat(label: "COST IMPACT", value: costImpact, color: costColor, trendIcon: costTrend, showTrend: true),
                  ImpactStat(label: "FLAVOR PROFILE", value: flavor, color: Colors.white, trendIcon: Icons.error, showTrend: false),
                  ImpactStat(label: "ALLERGENS", value: allergens, color: Theme.of(context).colorScheme.error, trendIcon: Icons.error, showTrend: false),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ImpactStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData trendIcon;
  final bool showTrend;

  const ImpactStat({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.trendIcon,
    required this.showTrend,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Flexible(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JetBrains Mono',
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showTrend) ...[
                const SizedBox(width: 4),
                Icon(trendIcon, color: color, size: 16),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
