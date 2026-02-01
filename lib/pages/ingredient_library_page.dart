import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../nav.dart';

class IngredientLibraryPage extends StatelessWidget {
  const IngredientLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
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
                            "V-LAB INGREDIENTS",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: 'JetBrains Mono', // Falling back to default monospace if not available or just rely on theme if not loaded
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Culinary Library",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Theme.of(context).colorScheme.divider),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.tune),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text("New Ingredient"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search by function, name or allergen...",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.background,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 140,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Theme.of(context).colorScheme.divider),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TOTAL: ",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              "142",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Filters
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              color: Theme.of(context).colorScheme.surface,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.divider)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip(context, "All Ingredients", true),
                    const SizedBox(width: 8),
                    _buildFilterChip(context, "Emulsifiers", false),
                    const SizedBox(width: 8),
                    _buildFilterChip(context, "Proteins", false),
                    const SizedBox(width: 8),
                    _buildFilterChip(context, "Fats & Oils", false),
                    const SizedBox(width: 8),
                    _buildFilterChip(context, "Thickeners", false),
                    const SizedBox(width: 8),
                    _buildFilterChip(context, "High Cost (>€20)", false, isError: true),
                  ],
                ),
              ),
            ),

            // List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  IngredientCard(
                    name: "Soy Lecithin Powder",
                    code: "EMU-01",
                    supplier: "BioVegan Pro",
                    costKg: 12.5,
                    date: "20 Oct",
                    isFat: false,
                    isProtein: false,
                    isBinder: false,
                    soy: true,
                    gluten: false,
                    nuts: false,
                    tags: const [
                      FunctionTag(label: "Emulsifier", color: Color(0xFF22D3EE)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                  IngredientCard(
                    name: "Xanthan Gum",
                    code: "TEX-04",
                    supplier: "Modernist Pantry",
                    costKg: 45.2,
                    date: "18 Oct",
                    isFat: false,
                    isProtein: false,
                    isBinder: true,
                    soy: false,
                    gluten: false,
                    nuts: false,
                    tags: const [
                      FunctionTag(label: "Binder", color: Color(0xFF4ADE80)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                  IngredientCard(
                    name: "Deodorized Coconut Oil",
                    code: "FAT-09",
                    supplier: "Global Oils Ltd",
                    costKg: 8.9,
                    date: "22 Oct",
                    isFat: true,
                    isProtein: false,
                    isBinder: false,
                    soy: false,
                    gluten: false,
                    nuts: false,
                    tags: const [
                      FunctionTag(label: "Fat Base", color: Color(0xFFFB923C)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                  IngredientCard(
                    name: "Pea Protein Isolate 80%",
                    code: "PRO-02",
                    supplier: "Green Lab",
                    costKg: 18.4,
                    date: "15 Oct",
                    isFat: false,
                    isProtein: true,
                    isBinder: true,
                    soy: false,
                    gluten: false,
                    nuts: false,
                    tags: const [
                      FunctionTag(label: "Protein", color: Color(0xFFF472B6)),
                      FunctionTag(label: "Binder", color: Color(0xFF4ADE80)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                  IngredientCard(
                    name: "Cashew Paste (Fine)",
                    code: "BAS-12",
                    supplier: "NutriBulk",
                    costKg: 22.1,
                    date: "21 Oct",
                    isFat: true,
                    isProtein: true,
                    isBinder: false,
                    soy: false,
                    gluten: false,
                    nuts: true,
                    tags: const [
                      FunctionTag(label: "Fat Base", color: Color(0xFFFB923C)),
                      FunctionTag(label: "Protein", color: Color(0xFFF472B6)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                  IngredientCard(
                    name: "Methylcellulose (F50)",
                    code: "TEX-11",
                    supplier: "Modernist Pantry",
                    costKg: 62.0,
                    date: "10 Oct",
                    isFat: false,
                    isProtein: false,
                    isBinder: true,
                    soy: false,
                    gluten: false,
                    nuts: false,
                    tags: const [
                      FunctionTag(label: "Binder", color: Color(0xFF4ADE80)),
                    ],
                    onTap: () => context.push(AppRoutes.ingredientDetail),
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              color: const Color(0xFF0F172A),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.success,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Database Online",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF94A3B8),
                            ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Last Sync: 14:02:11",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF64748B),
                            ),
                      ),
                    ],
                  ),
                  Text(
                    "V-LAB v2.4.0-STABLE",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0xFF475569),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool selected, {bool isError = false}) {
    final bgColor = selected
        ? Theme.of(context).colorScheme.primaryText
        : (isError ? Theme.of(context).colorScheme.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface);
    final textColor = selected
        ? Theme.of(context).colorScheme.background
        : (isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.onSurface);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.divider,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class FunctionTag extends StatelessWidget {
  final String label;
  final Color color;

  const FunctionTag({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFFE2E8F0),
                ),
          ),
        ],
      ),
    );
  }
}

class AllergenIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const AllergenIcon({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Theme.of(context).colorScheme.divider),
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 14, color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final String name;
  final String code;
  final String supplier;
  final double costKg;
  final String date;
  final bool isFat;
  final bool isProtein;
  final bool isBinder;
  final bool soy;
  final bool gluten;
  final bool nuts;
  final List<FunctionTag> tags;
  final VoidCallback? onTap;

  const IngredientCard({
    super.key,
    required this.name,
    required this.code,
    required this.supplier,
    required this.costKg,
    required this.date,
    required this.isFat,
    required this.isProtein,
    required this.isBinder,
    required this.soy,
    required this.gluten,
    required this.nuts,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
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
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F172A),
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Theme.of(context).colorScheme.primary),
                          ),
                          child: Text(
                            code,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      supplier,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                    "€$costKg/kg",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: costKg > 15 ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.success,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Last update: $date",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.hint,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags,
          ),
          const SizedBox(height: 16),
          Divider(color: Theme.of(context).colorScheme.divider, thickness: 0.5),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (soy) ...[
                    const AllergenIcon(icon: Icons.warning_amber, label: "Soy"),
                    const SizedBox(width: 4),
                  ],
                  if (gluten) ...[
                    const AllergenIcon(icon: Icons.grain, label: "Gluten"),
                    const SizedBox(width: 4),
                  ],
                  if (nuts) ...[
                    const AllergenIcon(icon: Icons.bakery_dining, label: "Nuts"),
                    const SizedBox(width: 4),
                  ],
                ],
              ),
              TextButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text("View Details"),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
