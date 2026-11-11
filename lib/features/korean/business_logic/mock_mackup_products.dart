import '../data/models/skincare_product.dart';

/// Temporary sample makeup catalogue.
const List<SkincareProduct> mockMackupProducts = [
  SkincareProduct(
    id: 'm1',
    name: 'Glass Skin Cushion Foundation',
    category: 'Face',
    price: 32.00,
    stock: 18,
    rating: 4.7,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A lightweight cushion with buildable medium coverage and a natural, '
        'glass-like finish. The refillable case keeps the formula fresh and '
        'the included puff blends seamlessly without caking.',
  ),
  SkincareProduct(
    id: 'm2',
    name: 'Velvet Lip Tint',
    category: 'Lips',
    price: 18.50,
    stock: 64,
    rating: 4.8,
    imageUrl:
        'https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A soft-matte tint that stains the lips with a blurred, velvety finish. '
        'The watery texture glides on smoothly, layers without flaking and '
        'stays comfortable for hours.',
  ),
  SkincareProduct(
    id: 'm3',
    name: 'Micro Brow Pencil',
    category: 'Eyes',
    price: 12.00,
    stock: 5,
    rating: 4.4,
    imageUrl:
        'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'An ultra-fine 1.5 mm pencil for drawing hair-like strokes and filling '
        'sparse areas. The spoolie end blends the pigment for a natural, '
        'undone look.',
  ),
  SkincareProduct(
    id: 'm4',
    name: 'Long Lash Mascara',
    category: 'Eyes',
    price: 21.00,
    stock: 0,
    rating: 4.5,
    imageUrl:
        'https://images.unsplash.com/photo-1512207736890-6ffed8a84e8d?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A smudge-proof mascara with a tapered brush that separates and lifts '
        'every lash. The flexible formula adds length without clumps and '
        'removes easily with warm water.',
  ),
  SkincareProduct(
    id: 'm5',
    name: 'Peach Blur Blush',
    category: 'Face',
    price: 23.50,
    stock: 27,
    rating: 4.6,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A silky powder blush that melts into the skin for a soft-focus, '
        'peach flush. The finely milled pigment builds gradually and blurs '
        'pores for a smooth finish.',
  ),
  SkincareProduct(
    id: 'm6',
    name: 'Dewy Lip Balm',
    category: 'Lips',
    price: 14.90,
    stock: 90,
    rating: 4.7,
    imageUrl:
        'https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A tinted balm with shea butter and squalane that cushions dry lips '
        'while leaving a glossy, sheer wash of colour. Reapply as often as '
        'needed throughout the day.',
  ),
];
