import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';
import '../../nav.dart';

class FunctionsMapPage extends StatelessWidget {
  const FunctionsMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("New Ingredient"),
        backgroundColor: Theme.of(context).colorScheme.accent,
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // Design says primary_text which is dark on light mode usually.
      ),
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
                        "Culinary Functions Map",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "V-Lab Internal Reference / Vegan R&D",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.accent,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Theme.of(context).colorScheme.divider),
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.search_rounded, color: Theme.of(context).colorScheme.onSurface, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Stats
              Row(
                children: [
                  _buildStatCard(context, "Active Functions", "12", Theme.of(context).colorScheme.onSurface),
                  const SizedBox(width: 16),
                  _buildStatCard(context, "Tested Ingredients", "148", Theme.of(context).colorScheme.onSurface),
                  const SizedBox(width: 16),
                  _buildStatCard(context, "Complexity Index", "High", Theme.of(context).colorScheme.error),
                ],
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Icon(Icons.filter_list_rounded, color: Theme.of(context).colorScheme.secondary, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "Functional Categories",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Cards
              FunctionCard(
                name: "Emulsifying",
                description: "Combining fat and water phases into a stable matrix.",
                count: 8,
                stability: "High",
                intensity: "Variable",
                children: [
                  IngredientTag(name: "Soy Lecithin", potencyColor: Theme.of(context).colorScheme.accent),
                  IngredientTag(name: "Xanthan Gum", potencyColor: Theme.of(context).colorScheme.success),
                  IngredientTag(name: "Mustard Powder", potencyColor: const Color(0xFFFB923C)),
                  IngredientTag(name: "Aquafaba", potencyColor: Theme.of(context).colorScheme.accent),
                  IngredientTag(name: "Methylcellulose", potencyColor: Theme.of(context).colorScheme.success),
                ],
              ),

              FunctionCard(
                name: "Umami / Depth",
                description: "Providing savory 'meatiness' and glutamic acid profile.",
                count: 14,
                stability: "N/A",
                intensity: "High",
                children: [
                  IngredientTag(name: "Nutritional Yeast", potencyColor: Theme.of(context).colorScheme.success),
                  IngredientTag(name: "Shiitake Powder", potencyColor: Theme.of(context).colorScheme.success),
                  IngredientTag(name: "Miso Paste", potencyColor: const Color(0xFFFB923C)),
                  IngredientTag(name: "Kombu Extract", potencyColor: Theme.of(context).colorScheme.accent),
                  IngredientTag(name: "Liquid Aminos", potencyColor: Theme.of(context).colorScheme.accent),
                ],
              ),

              FunctionCard(
                name: "Fat / Mouthfeel",
                description: "Mimicking animal fat melting points and coating properties.",
                count: 6,
                stability: "Medium",
                intensity: "High",
                children: [
                  IngredientTag(name: "Refined Coconut Oil", potencyColor: Theme.of(context).colorScheme.success),
                  IngredientTag(name: "Cocoa Butter", potencyColor: Theme.of(context).colorScheme.accent),
                  IngredientTag(name: "Sunflower Wax", potencyColor: const Color(0xFFFB923C)),
                  IngredientTag(name: "Shea Butter", potencyColor: Theme.of(context).colorScheme.success),
                ],
              ),

              FunctionCard(
                name: "Binding / Structure",
                description: "Creating bite and preventing separation during thermal processing.",
                count: 12,
                stability: "Very High",
                intensity: "Medium",
                children: [
                  IngredientTag(name: "Wheat Gluten", potencyColor: Theme.of(context).colorScheme.accent),
                  IngredientTag(name: "Pea Protein Isolate", potencyColor: Theme.of(context).colorScheme.success),
                  IngredientTag(name: "Potato Starch", potencyColor: const Color(0xFFFB923C)),
                  IngredientTag(name: "Carrageenan (Kappa)", potencyColor: Theme.of(context).colorScheme.success),
                ],
              ),

              const SizedBox(height: 24),

              // Missing Function
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.accent),
                  // Dotted border isn't standard in Flutter without package or custom paint. I'll stick to solid or dashed if I implement custom painter.
                  // For simplicity, standard border.
                ),
                child: Column(
                  children: [
                    Text(
                      "Missing a function?",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Define a new culinary function to start mapping ingredient chemical properties.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.accent,
                        side: BorderSide(color: Theme.of(context).colorScheme.accent),
                        minimumSize: const Size.fromHeight(48),
                      ),
                      icon: const Icon(Icons.add_rounded),
                      label: const Text("Add New Function"),
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

  Widget _buildStatCard(BuildContext context, String label, String value, Color valueColor) {
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
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class FunctionCard extends StatelessWidget {
  final String name;
  final String description;
  final int count;
  final String stability;
  final String intensity;
  final List<Widget> children;

  const FunctionCard({
    super.key,
    required this.name,
    required this.description,
    required this.count,
    required this.stability,
    required this.intensity,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Row(
                  children: [
                    Icon(Icons.science_rounded, size: 14, color: Theme.of(context).colorScheme.accent),
                    const SizedBox(width: 8),
                    Text(
                      "$count Ingredients",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: children,
          ),
          const SizedBox(height: 16),
          Divider(color: Theme.of(context).colorScheme.divider),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stability",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      Text(
                        stability,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Intensity",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      Text(
                        intensity,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.accent,
                ),
                child: const Text("View Lab Notes"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IngredientTag extends StatelessWidget {
  final String name;
  final Color potencyColor;

  const IngredientTag({
    super.key,
    required this.name,
    required this.potencyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Theme.of(context).colorScheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: potencyColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
