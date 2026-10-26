import 'package:elara_flutter/core/models/product.dart';

/// Temporary sample catalogue.
const List<Product> mockSkincareProducts = [
  Product(
    id: '1',
    name: 'Aqua Boost Essence Toner',
    category: 'Toners',
    price: 24.50,
    stock: 42,
    rating: 4.6,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A watery first-step toner with triple hyaluronic acid and panthenol. '
        'It sinks in fast and preps the skin for the rest of your routine '
        'without any sticky residue. Use after cleansing, morning and night.',
  ),
  Product(
    id: '2',
    name: 'Snail Repair Serum',
    category: 'Moisturizers',
    price: 32.00,
    stock: 8,
    rating: 4.8,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A lightweight serum with 92% snail secretion filtrate to help calm '
        'redness and strengthen a damaged barrier. Two to three drops are '
        'enough for the whole face.',
  ),
  Product(
    id: '3',
    name: 'Ceramide Barrier Cream',
    category: 'Moisturizers',
    price: 28.90,
    stock: 0,
    rating: 4.5,
    imageUrl:
        'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A rich yet non-greasy cream that combines five ceramides with '
        'cholesterol to lock moisture in for up to 48 hours. Ideal for dry '
        'and sensitised skin.',
  ),
  Product(
    id: '4',
    name: 'Rice Bright Cleansing Foam',
    category: 'Cleansers',
    price: 15.00,
    stock: 120,
    rating: 4.3,
    imageUrl:
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A soft, low-pH foam cleanser made with rice bran extract. It lifts '
        'away sunscreen and daily grime while keeping the skin comfortable '
        'after rinsing.',
  ),
  Product(
    id: '5',
    name: 'Green Tea Clay Mask',
    category: 'Mask',
    price: 19.90,
    stock: 3,
    rating: 4.7,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A kaolin and matcha mask that draws out congestion in ten minutes '
        'without over-drying. Apply a thin layer twice a week, avoiding the '
        'eye area.',
  ),
  Product(
    id: '6',
    name: 'SPF 50+ Daily Sunscreen',
    category: 'Sunscreen',
    price: 22.00,
    stock: 25,
    rating: 4.9,
    imageUrl:
        'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A broad-spectrum chemical sunscreen with a weightless, no-white-cast '
        'finish. Reapply every two hours when you are outdoors or sweating.',
  ),
];
