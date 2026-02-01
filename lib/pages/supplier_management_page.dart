import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme.dart';
import '../nav.dart';

class SupplierManagementPage extends StatelessWidget {
  const SupplierManagementPage({super.key});

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
                        "Supplier Management",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Manage sourcing, purchase formats, and live ingredient costing",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text("Add Supplier"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Stats
              Row(
                children: [
                  _buildStatCard(context, "Active Suppliers", "12", Theme.of(context).colorScheme.onSurface, null, null),
                  const SizedBox(width: 16),
                  _buildStatCard(context, "Price Fluctuations", "+4.2%", Theme.of(context).colorScheme.error, Icons.trending_up, Theme.of(context).colorScheme.error),
                  const SizedBox(width: 16),
                  _buildStatCard(context, "Pending Quotes", "5", Theme.of(context).colorScheme.accent, null, null),
                ],
              ),
              const SizedBox(height: 24),

              // Search
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search suppliers or ingredients...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
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
                    alignment: Alignment.center,
                    child: Icon(Icons.filter_list, color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Supplier Cards
              SupplierCard(
                name: "GreenLeaf Organics",
                category: "Fresh Produce & Herbs",
                itemCount: "24",
                deliveryDays: "Mon, Wed, Fri",
                terms: "Net 15",
                children: [
                  FormatRow(icon: Icons.eco, ingredient: "Organic Firm Tofu", format: "10kg Bulk Crate", price: "€32.50", unitCost: "€3.25/kg"),
                  FormatRow(icon: Icons.local_dining, ingredient: "Nutritional Yeast", format: "5kg Bag", price: "€85.00", unitCost: "€17.00/kg"),
                ],
              ),

              SupplierCard(
                name: "V-Distributions Ltd",
                category: "Dry Goods & Emulsifiers",
                itemCount: "112",
                deliveryDays: "Daily",
                terms: "Net 30",
                children: [
                  FormatRow(icon: Icons.science, ingredient: "Xanthan Gum", format: "1kg Tub", price: "€42.00", unitCost: "€42.00/kg"),
                  FormatRow(icon: Icons.water_drop, ingredient: "Sunflower Lecithin", format: "5L Jerrycan", price: "€110.00", unitCost: "€22.00/L"),
                  FormatRow(icon: Icons.grain, ingredient: "Methylcellulose (S)", format: "500g Pack", price: "€68.00", unitCost: "€136.00/kg"),
                ],
              ),

              SupplierCard(
                name: "Mediterranean Oils Co.",
                category: "Fats & Oils",
                itemCount: "8",
                deliveryDays: "Tuesdays",
                terms: "Prepaid",
                children: [
                  FormatRow(icon: Icons.oil_barrel, ingredient: "Refined Coconut Oil", format: "20L Pail", price: "€94.00", unitCost: "€4.70/L"),
                  FormatRow(icon: Icons.opacity, ingredient: "Deodorized Cocoa Butter", format: "5kg Blocks", price: "€145.00", unitCost: "€29.00/kg"),
                ],
              ),

              const SizedBox(height: 24),

              // Cost Index Chart
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
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
                            Text(
                              "Average Ingredient Cost Index",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Last 6 months (weighted by usage)",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          icon: const Icon(Icons.download),
                          label: const Text("Export CSV"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const titles = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
                                  if (value.toInt() >= 0 && value.toInt() < titles.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        titles[value.toInt()],
                                        style: Theme.of(context).textTheme.labelSmall,
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
                              spots: const [
                                FlSpot(0, 4.2),
                                FlSpot(1, 4.35),
                                FlSpot(2, 4.3),
                                FlSpot(3, 4.55),
                                FlSpot(4, 4.8),
                                FlSpot(5, 4.75),
                              ],
                              isCurved: true,
                              color: Theme.of(context).colorScheme.primary,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildStatCard(BuildContext context, String label, String value, Color valueColor, IconData? trendIcon, Color? trendColor) {
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
              children: [
                if (trendIcon != null) ...[
                  Icon(trendIcon, size: 16, color: trendColor),
                  const SizedBox(width: 4),
                ],
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: valueColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SupplierCard extends StatelessWidget {
  final String name;
  final String category;
  final String itemCount;
  final String deliveryDays;
  final String terms;
  final List<Widget> children;

  const SupplierCard({
    super.key,
    required this.name,
    required this.category,
    required this.itemCount,
    required this.deliveryDays,
    required this.terms,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Row(
                      children: [
                        Icon(Icons.business_rounded, size: 14, color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(width: 4),
                        Text(
                          category,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Row(
                  children: [
                    Icon(Icons.inventory_2_outlined, size: 16, color: Theme.of(context).colorScheme.accent),
                    const SizedBox(width: 8),
                    Text(
                      "$itemCount Items",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
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
            "Recent Purchase Formats",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          ...children,
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_shipping_outlined, size: 16, color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 4),
                      Text(
                        deliveryDays,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Icon(Icons.payments_outlined, size: 16, color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 4),
                      Text(
                        terms,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text("Manage Sourcing"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FormatRow extends StatelessWidget {
  final IconData icon;
  final String ingredient;
  final String format;
  final String price;
  final String unitCost;

  const FormatRow({
    super.key,
    required this.icon,
    required this.ingredient,
    required this.format,
    required this.price,
    required this.unitCost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  format,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                unitCost,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.success,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
