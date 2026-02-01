import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme.dart';
import '../nav.dart';

class VersionHistoryPage extends StatelessWidget {
  const VersionHistoryPage({super.key});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.science_rounded, color: Theme.of(context).colorScheme.primary, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            "RECIPE LAB / V-084",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Theme.of(context).colorScheme.primary),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Vegan Emulsion Base: 'The Heavy Cream'",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                          icon: const Icon(Icons.add),
                          label: const Text("New Iteration"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
                          side: BorderSide(color: Theme.of(context).colorScheme.divider),
                        ),
                        icon: const Icon(Icons.picture_as_pdf),
                        label: const Text("Export PDF"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Text(
                "ACTIVE ITERATION",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              
              VersionCard(
                versionTag: "V 2.2.0 (ACTIVE)",
                statusBg: const Color(0xFFDCFCE7),
                statusText: const Color(0xFF166534),
                date: "Oct 24, 2023",
                chef: "Chef Aris",
                cardBg: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.primary,
                cost: "€3.85",
                margin: "75%",
                hasDiff: true,
                isPos: false, // arrow down
                isGood: true, // green
                diffText: "6.5%",
                stability: 1.0,
                flavor: "Creamy+",
                children: [
                  IngredientItem(name: "Soy Protein Isolate", qty: "380g", function: "Protein/Body", cost: "€1.60", indicator: Theme.of(context).colorScheme.success),
                  IngredientItem(name: "Soy Lecithin", qty: "15g", function: "Emulsifier", cost: "€0.30", indicator: Theme.of(context).colorScheme.primary),
                  IngredientItem(name: "Guar Bean", qty: "3g", function: "Stabilizer", cost: "€0.08", indicator: Theme.of(context).colorScheme.accent),
                ],
              ),

              const SizedBox(height: 24),

              // Cost Evolution Chart
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "COST EVOLUTION BY FUNCTION",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final labels = ["Fat V1", "Fat V2", "Emul V1", "Emul V2", "Stab V1", "Stab V2"];
                                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        labels[value.toInt()],
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 8),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            makeGroupData(0, 2.10, context),
                            makeGroupData(1, 1.60, context),
                            makeGroupData(2, 0.45, context),
                            makeGroupData(3, 0.30, context),
                            makeGroupData(4, 0.05, context),
                            makeGroupData(5, 0.08, context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Chef's Notes
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFFEF3C7)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.tips_and_updates, color: Color(0xFFD97706)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CHEF'S NOTES",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: const Color(0xFF92400E),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Swapping Cashew for Soy Protein reduced costs by 12% while improving heat stability. Lecithin concentration increased to compensate for lower natural fat content in soy.",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFFB45309),
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                "PREVIOUS VERSIONS",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),

              VersionCard(
                versionTag: "V 2.1.0 (BASELINE)",
                statusBg: const Color(0xFFF3F4F6),
                statusText: const Color(0xFF4B5563),
                date: "Oct 12, 2023",
                chef: "Chef Aris",
                cardBg: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.divider,
                cost: "€4.12",
                margin: "72%",
                hasDiff: false,
                diffText: "",
                stability: 0.8,
                flavor: "Neutral",
                children: [
                  IngredientItem(name: "Cashew Base", qty: "400g", function: "Fat/Body", cost: "€2.10", indicator: Theme.of(context).colorScheme.secondary),
                  IngredientItem(name: "Sunflower Lecithin", qty: "12g", function: "Emulsifier", cost: "€0.45", indicator: Theme.of(context).colorScheme.primary),
                  IngredientItem(name: "Xanthan Gum", qty: "2g", function: "Stabilizer", cost: "€0.05", indicator: Theme.of(context).colorScheme.accent),
                ],
              ),
              
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y, BuildContext context) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Theme.of(context).colorScheme.primary,
          width: 24,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}

class VersionCard extends StatelessWidget {
  final String versionTag;
  final Color statusBg;
  final Color statusText;
  final String date;
  final String chef;
  final Color cardBg;
  final Color borderColor;
  final String cost;
  final String margin;
  final bool hasDiff;
  final bool isPos;
  final bool isGood;
  final String diffText;
  final double stability;
  final String flavor;
  final List<Widget> children;

  const VersionCard({
    super.key,
    required this.versionTag,
    required this.statusBg,
    required this.statusText,
    required this.date,
    required this.chef,
    required this.cardBg,
    required this.borderColor,
    required this.cost,
    required this.margin,
    required this.hasDiff,
    this.isPos = false,
    this.isGood = true,
    required this.diffText,
    required this.stability,
    required this.flavor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      versionTag,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: statusText,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$date • $chef",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.secondary, size: 20),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "ECONOMICS",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: MetricRow(
                  label: "Cost per Kg",
                  value: cost,
                  hasDiff: hasDiff,
                  isPositive: isPos,
                  isGood: isGood,
                  diffText: diffText,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: MetricRow(
                  label: "Margin",
                  value: margin,
                  hasDiff: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Theme.of(context).colorScheme.divider),
          const SizedBox(height: 16),
          Text(
            "PERFORMANCE",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stability",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: stability,
                      backgroundColor: Theme.of(context).colorScheme.divider,
                      color: Theme.of(context).colorScheme.success,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flavor Profile",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      flavor,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Theme.of(context).colorScheme.divider),
          const SizedBox(height: 16),
          Text(
            "COMPOSITION",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class MetricRow extends StatelessWidget {
  final String label;
  final String value;
  final bool hasDiff;
  final bool isPositive;
  final bool isGood;
  final String diffText;

  const MetricRow({
    super.key,
    required this.label,
    required this.value,
    required this.hasDiff,
    this.isPositive = false,
    this.isGood = true,
    this.diffText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (hasDiff) ...[
              const SizedBox(width: 8),
              Row(
                children: [
                  Icon(
                    isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 14,
                    color: isGood ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    diffText,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isGood ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String name;
  final String qty;
  final String function;
  final String cost;
  final Color indicator;

  const IngredientItem({
    super.key,
    required this.name,
    required this.qty,
    required this.function,
    required this.cost,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 32,
            decoration: BoxDecoration(color: indicator, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$qty • $function",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ),
          Text(
            cost,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
