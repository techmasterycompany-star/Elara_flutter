import '../data/models/skincare_product.dart';

/// Temporary sample catalogue.
///
/// Used until the skincare endpoint is connected. Delete this file once
/// [SkincareProductRepository] talks to the real API.
const List<SkincareProduct> mockSkincareProducts = [
  SkincareProduct(
    id: '1',
    name: 'Aqua Boost Essence Toner',
    category: 'Essence',
    price: 24.50,
    stock: 42,
    rating: 4.6,
    isNew: true,
    productInfo:
        'A watery first-step toner with triple hyaluronic acid and panthenol. '
        'It sinks in fast and preps the skin for the rest of your routine '
        'without any sticky residue. Use after cleansing, morning and night.',
  ),
  SkincareProduct(
    id: '2',
    name: 'Snail Repair Serum',
    category: 'Serum',
    price: 32.00,
    stock: 8,
    rating: 4.8,
    isNew: true,
    productInfo:
        'A lightweight serum with 92% snail secretion filtrate to help calm '
        'redness and strengthen a damaged barrier. Two to three drops are '
        'enough for the whole face.',
  ),
  SkincareProduct(
    id: '3',
    name: 'Ceramide Barrier Cream',
    category: 'Cream',
    price: 28.90,
    stock: 0,
    rating: 4.5,
    productInfo:
        'A rich yet non-greasy cream that combines five ceramides with '
        'cholesterol to lock moisture in for up to 48 hours. Ideal for dry '
        'and sensitised skin.',
  ),
  SkincareProduct(
    id: '4',
    name: 'Rice Bright Cleansing Foam',
    category: 'Cleanser',
    price: 15.00,
    stock: 120,
    rating: 4.3,
    productInfo:
        'A soft, low-pH foam cleanser made with rice bran extract. It lifts '
        'away sunscreen and daily grime while keeping the skin comfortable '
        'after rinsing.',
  ),
  SkincareProduct(
    id: '5',
    name: 'Green Tea Clay Mask',
    category: 'Mask',
    price: 19.90,
    stock: 3,
    rating: 4.7,
    isNew: true,
    productInfo:
        'A kaolin and matcha mask that draws out congestion in ten minutes '
        'without over-drying. Apply a thin layer twice a week, avoiding the '
        'eye area.',
  ),
  SkincareProduct(
    id: '6',
    name: 'SPF 50+ Daily Sunscreen',
    category: 'Sunscreen',
    price: 22.00,
    stock: 25,
    rating: 4.9,
    productInfo:
        'A broad-spectrum chemical sunscreen with a weightless, no-white-cast '
        'finish. Reapply every two hours when you are outdoors or sweating.',
  ),
];
