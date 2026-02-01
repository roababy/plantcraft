import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../nav.dart';

class RecipeLayersPage extends StatelessWidget {
  const RecipeLayersPage({super.key});

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
                        IconButton(
                          icon: Icon(Icons.close_rounded, color: Theme.of(context).colorScheme.onSurface),
                          onPressed: () => context.pop(),
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Compare"),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              ),
                              child: const Text("Save Iteration"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "RECIPE R&D",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "v2.4.0",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Vegan Smoked 'Salmon' Base",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),

              // Stats Row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildStat(context, "TOTAL COST", "€4.12/kg", Theme.of(context).colorScheme.success),
                        const SizedBox(width: 24),
                        _buildStat(context, "EST. MARGIN", "74.2%", Theme.of(context).colorScheme.success),
                        const SizedBox(width: 24),
                        _buildStat(context, "BATCH YIELD", "2.45 kg", Theme.of(context).colorScheme.onSurface),
                      ],
                    ),
                    Icon(Icons.trending_up_rounded, color: Theme.of(context).colorScheme.success, size: 24),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Warning
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFFFFE0B2)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.warning_rounded, color: Color(0xFFF57C00)),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Missing Culinary Function: Acidity",
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: const Color(0xFFE65100),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "The recipe lacks an acid component to balance the fat profile.",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: const Color(0xFFE65100),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFFE65100),
                            ),
                            child: const Text("Fix Now"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Structural Layers
                    Text(
                      "Structural Layers",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 16),
                    LayerCard(
                      title: "Protein & Texture Base",
                      cost: "1.85",
                      children: [
                        IngredientRowLayer(
                          name: "Organic Soy Curd",
                          function: "Structure",
                          qty: "400g",
                          price: "€0.92",
                          functionColor: const Color(0xFF22D3EE),
                        ),
                        IngredientRowLayer(
                          name: "Koji Protein",
                          function: "Umami / Texture",
                          qty: "150g",
                          price: "€0.65",
                          functionColor: const Color(0xFFF472B6),
                        ),
                        IngredientRowLayer(
                          name: "Methylcellulose",
                          function: "Binder",
                          qty: "12g",
                          price: "€0.28",
                          functionColor: const Color(0xFF4ADE80),
                        ),
                      ],
                    ),
                    LayerCard(
                      title: "Fat & Emulsion System",
                      cost: "2.27",
                      children: [
                        IngredientRowLayer(
                          name: "Refined Coconut Oil",
                          function: "Fat Mouthfeel",
                          qty: "200g",
                          price: "€1.10",
                          functionColor: const Color(0xFFFB923C),
                        ),
                        IngredientRowLayer(
                          name: "Sunflower Lecithin",
                          function: "Emulsifier",
                          qty: "8g",
                          price: "€0.45",
                          functionColor: const Color(0xFF4ADE80),
                        ),
                        IngredientRowLayer(
                          name: "Algal Oil (DHA)",
                          function: "Oceanic Flavor",
                          qty: "15g",
                          price: "€0.72",
                          functionColor: const Color(0xFF22D3EE),
                        ),
                      ],
                    ),
                    
                    Divider(color: Theme.of(context).colorScheme.divider),
                    const SizedBox(height: 24),

                    // Process Steps
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Process Steps",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                          label: Text(
                            "Add Step",
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ProcessStep(
                      stepNum: "1",
                      title: "Hydration & Binding",
                      description: "Combine Soy Curd with Methylcellulose. Mix at high speed for 3 minutes until a tacky paste forms.",
                      time: "3m",
                      temp: "4°C",
                      notLast: true,
                    ),
                    ProcessStep(
                      stepNum: "2",
                      title: "Fat Integration",
                      description: "Slowly stream in melted coconut oil and lecithin to create a stable emulsion. Maintain low temperature to prevent breakage.",
                      time: "8m",
                      temp: "35°C",
                      notLast: true,
                    ),
                    ProcessStep(
                      stepNum: "3",
                      title: "Curing / Setting",
                      description: "Vacuum seal the mixture and steam at low temperature to activate binding agents without denaturing proteins.",
                      time: "45m",
                      temp: "65°C",
                      notLast: false,
                    ),
                  ],
                ),
              ),

              // Footer
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(top: BorderSide(color: Theme.of(context).colorScheme.divider)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text("Finalize Version"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    _buildIconBtn(context, Icons.print_rounded),
                    const SizedBox(width: 16),
                    _buildIconBtn(context, Icons.share_rounded),
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

  Widget _buildIconBtn(BuildContext context, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.divider),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        onPressed: () {},
      ),
    );
  }
}

class LayerCard extends StatelessWidget {
  final String title;
  final String cost;
  final List<Widget> children;

  const LayerCard({
    super.key,
    required this.title,
    required this.cost,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.layers_rounded, size: 18, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "€$cost / kg",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.drag_indicator, size: 18, color: Theme.of(context).colorScheme.hint),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: children,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border(top: BorderSide(color: Theme.of(context).colorScheme.divider)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  "Add Functional Ingredient",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientRowLayer extends StatelessWidget {
  final String name;
  final String function;
  final String qty;
  final String price;
  final Color functionColor;

  const IngredientRowLayer({
    super.key,
    required this.name,
    required this.function,
    required this.qty,
    required this.price,
    required this.functionColor,
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
            decoration: BoxDecoration(
              color: functionColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      function,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text("•", style: TextStyle(color: Theme.of(context).colorScheme.hint)),
                    ),
                    Text(
                      qty,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

class ProcessStep extends StatelessWidget {
  final String stepNum;
  final String title;
  final String description;
  final String time;
  final String temp;
  final bool notLast;

  const ProcessStep({
    super.key,
    required this.stepNum,
    required this.title,
    required this.description,
    required this.time,
    required this.temp,
    required this.notLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: Text(
                  stepNum,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (notLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(context).colorScheme.divider,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildChip(context, time, Icons.timer_rounded),
                      const SizedBox(width: 8),
                      _buildChip(context, temp, Icons.thermostat_rounded),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }
}
