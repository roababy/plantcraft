import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme.dart';
import '../nav.dart';

class CostOverviewPage extends StatelessWidget {
  const CostOverviewPage({super.key});

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
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.analytics_outlined, color: Theme.of(context).colorScheme.primary, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                "FINANCIAL ANALYSIS",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Vegan 'Nduja Base v4.2",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh, size: 16),
                      label: const Text("Update Prices"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(color: Theme.of(context).colorScheme.divider),
                      ),
                    ),
                  ],
                ),
              ),

              // Stats Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    StatCard(label: "BATCH COST", value: "€14.82", hasTrend: true, trend: "↓ 4%", isPositive: true),
                    const SizedBox(width: 16),
                    StatCard(label: "COST / KG", value: "€5.93", hasTrend: false),
                    const SizedBox(width: 16),
                    StatCard(label: "MARGIN", value: "72.4%", hasTrend: true, trend: "↑ 1.2%", isPositive: true),
                  ],
                ),
              ),

              // Price Alert
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E5),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFFFE0B2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Color(0xFFF57C00), size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ingredient Price Alert",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFE65100),
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Sunflower Wax prices increased by 12%. Impact: +€0.38/batch.",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFFE65100),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Color(0xFFE65100)),
                  ],
                ),
              ),

              // Cost Distribution Chart
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "COST DISTRIBUTION",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 50,
                          sections: [
                            PieChartSectionData(value: 30, color: Theme.of(context).colorScheme.primary, radius: 60, showTitle: false),
                            PieChartSectionData(value: 21, color: Theme.of(context).colorScheme.accent, radius: 60, showTitle: false),
                            PieChartSectionData(value: 19, color: Theme.of(context).colorScheme.secondary, radius: 60, showTitle: false),
                            PieChartSectionData(value: 15, color: Theme.of(context).colorScheme.success, radius: 60, showTitle: false),
                            PieChartSectionData(value: 15, color: Theme.of(context).colorScheme.divider, radius: 60, showTitle: false),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegendItem(context, "Chili (30%)", Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 16),
                        _buildLegendItem(context, "Wax (21%)", Theme.of(context).colorScheme.accent),
                        const SizedBox(width: 16),
                        _buildLegendItem(context, "Protein (19%)", Theme.of(context).colorScheme.secondary),
                      ],
                    ),
                  ],
                ),
              ),

              // Ingredient Breakdown
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "INGREDIENT BREAKDOWN",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          Text(
                            "8 ITEMS",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const CostRow(ingredient: "Fermented Calabrian Chili", function: "Heat / Umami", qty: "250", unit: "g", cost: "€4.50", unitPrice: "18.00"),
                    const CostRow(ingredient: "Sunflower Wax", function: "Structure", qty: "45", unit: "g", cost: "€3.15", unitPrice: "70.00"),
                    const CostRow(ingredient: "Koji-aged Soy Protein", function: "Protein Base", qty: "500", unit: "g", cost: "€2.80", unitPrice: "5.60"),
                    const CostRow(ingredient: "Deodorized Cocoa Butter", function: "Fat / Mouthfeel", qty: "150", unit: "g", cost: "€2.25", unitPrice: "15.00"),
                    const CostRow(ingredient: "Nutritional Yeast", function: "Umami", qty: "30", unit: "g", cost: "€0.90", unitPrice: "30.00"),
                    Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Show All Ingredients"),
                      ),
                    ),
                  ],
                ),
              ),

              // Margin & Pricing
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "MARGIN & PRICING",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 16),
                    MarginIndicator(label: "Current Margin", value: "72.4", progress: 0.72, color: Theme.of(context).colorScheme.success),
                    const SizedBox(height: 16),
                    MarginIndicator(label: "Target Margin", value: "75.0", progress: 0.75, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 16),
                    Divider(color: Theme.of(context).colorScheme.divider),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SUGGESTED RETAIL PRICE",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              "€54.00 / kg",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.accent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "OPTIMIZED",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool hasTrend;
  final String? trend;
  final bool? isPositive;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.hasTrend = false,
    this.trend,
    this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                if (hasTrend && trend != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    trend!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: (isPositive ?? true) ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CostRow extends StatelessWidget {
  final String ingredient;
  final String function;
  final String qty;
  final String unit;
  final String cost;
  final String unitPrice;

  const CostRow({
    super.key,
    required this.ingredient,
    required this.function,
    required this.qty,
    required this.unit,
    required this.cost,
    required this.unitPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Theme.of(context).colorScheme.divider),
                      ),
                      child: Text(
                        function,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$qty $unit",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.hint,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cost,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                "$unitPrice/kg",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.hint,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MarginIndicator extends StatelessWidget {
  final String label;
  final String value;
  final double progress;
  final Color color;

  const MarginIndicator({
    super.key,
    required this.label,
    required this.value,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Text(
              "$value%",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Theme.of(context).colorScheme.divider,
          color: color,
          minHeight: 4,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}
