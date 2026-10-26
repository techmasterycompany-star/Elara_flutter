/// Top-level segments shown on the Bundle screen.
enum BundleSegment {
  all('All Product'),
  mackup('Mackup'),
  care('Care'),
  korean('Korean'),
  bundles('Bundles');

  const BundleSegment(this.label);

  final String label;
}
