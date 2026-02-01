import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../nav.dart';

class RecipeBuilderPage extends StatelessWidget {
  const RecipeBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.search),
        label: const Text("Find Functional Ingredient"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_rounded, color: Theme.of(context).colorScheme.onSurface),
                          onPressed: () => context.pop(),
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(context).colorScheme.onSurface,
                                side: BorderSide(color: Theme.of(context).colorScheme.divider),
                              ),
                              child: const Text("Save Draft"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.success,
                                foregroundColor: Theme.of(context).colorScheme.onSurface, // Using onSurface as per design usually but check contrast. Design says "Publish V2.4" variant filled bg success
                              ),
                              child: const Text("Publish V2.4"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vegan Brioche R&D",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Iteration: Functional Fat Matrix Optimization",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Cost / Escandallo Summary
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Live Escandallo",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.accent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Target Margin: 75%",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface, // Contrast check
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CostMetric(label: "Cost per Kg", value: "€4.12", color: Theme.of(context).colorScheme.onSurface),
                        CostMetric(label: "Total Batch", value: "€12.36", color: Theme.of(context).colorScheme.onSurface),
                        CostMetric(label: "Impact vs V1", value: "-€0.45", color: Theme.of(context).colorScheme.success),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Progress bar
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          Expanded(flex: 40, child: Container(color: Theme.of(context).colorScheme.primary)),
                          Expanded(flex: 30, child: Container(color: Theme.of(context).colorScheme.accent)),
                          Expanded(flex: 20, child: Container(color: Theme.of(context).colorScheme.secondary)),
                          Expanded(flex: 10, child: Container(color: Theme.of(context).colorScheme.divider)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Culinary Functions Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Culinary Functions",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Select functional requirements to build your matrix",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FunctionChip(label: "Emulsifier", icon: Icons.opacity, active: true),
                        FunctionChip(label: "Fat Base", icon: Icons.water_drop, active: true),
                        FunctionChip(label: "Binder", icon: Icons.layers, active: false),
                        FunctionChip(label: "Aeration", icon: Icons.air, active: true),
                        FunctionChip(label: "Umami", icon: Icons.bakery_dining, active: false),
                        FunctionChip(label: "Structure", icon: Icons.foundation, active: true),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // Functional Ingredients List
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Functional Ingredients",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_rounded, color: Theme.of(context).colorScheme.accent),
                          label: Text(
                            "Add Function",
                            style: TextStyle(color: Theme.of(context).colorScheme.accent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    IngredientRowBuilder(
                      name: "Deodorized Cocoa Butter",
                      function: "Fat Base / Structure",
                      cost: "€1.80",
                      qty: "150g",
                      intensity: "5",
                      icon: Icons.medication_liquid,
                    ),
                    IngredientRowBuilder(
                      name: "Soy Lecithin (Liquid)",
                      function: "Emulsifier",
                      cost: "€0.22",
                      qty: "12g",
                      intensity: "4",
                      icon: Icons.science,
                    ),
                    IngredientRowBuilder(
                      name: "Aquafaba Concentrate",
                      function: "Aeration / Binder",
                      cost: "€0.45",
                      qty: "200g",
                      intensity: "3",
                      icon: Icons.waves,
                    ),

                    // Warning / Gap
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFFE0B2)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Color(0xFFF57C00)),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Functional Gap: Acidity",
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: const Color(0xFFE65100),
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "No ingredient currently provides PH balance for shelf stability.",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: const Color(0xFFE65100),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF57C00),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              minimumSize: const Size(0, 32),
                            ),
                            child: const Text("Fix"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Notes
              Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Theme.of(context).colorScheme.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chef's R&D Notes",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Describe the impact of this functional change...",
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
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
}

class CostMetric extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const CostMetric({
    super.key,
    required this.label,
    required this.value,
    required this.color,
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
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class FunctionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;

  const FunctionChip({
    super.key,
    required this.label,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface;
    final borderColor = active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.divider;
    final fgColor = active ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.secondary;
    final textFgColor = active ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: fgColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: textFgColor,
                ),
          ),
        ],
      ),
    );
  }
}

class IngredientRowBuilder extends StatelessWidget {
  final String name;
  final String function;
  final String cost;
  final String qty;
  final String intensity;
  final IconData icon;

  const IngredientRowBuilder({
    super.key,
    required this.name,
    required this.function,
    required this.cost,
    required this.qty,
    required this.intensity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.divider),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.science_rounded, size: 12, color: Theme.of(context).colorScheme.accent),
                        const SizedBox(width: 4),
                        Text(
                          function,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                    cost,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  Text(
                    qty,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.hint,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Theme.of(context).colorScheme.divider),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.speed_rounded, size: 14, color: Theme.of(context).colorScheme.accent),
                  const SizedBox(width: 4),
                  Text(
                    "Intensity: $intensity/5",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => context.push(AppRoutes.substitutionModal),
                icon: const Icon(Icons.swap_horiz_rounded, size: 16),
                label: const Text("Substitute"),
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
