import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/features/bundle/data/models/bundle_product.dart';
import 'package:elara_flutter/features/bundle/data/models/bundle_segment.dart';
import 'package:elara_flutter/features/korean/business_logic/mock_mackup_products.dart';
import 'package:elara_flutter/features/korean/business_logic/mock_skincare_products.dart';

/// Temporary bundle catalogue.
///
/// Reuses the Korean skincare/makeup catalogue for the Care and Mackup
/// segments and adds dedicated Korean and bundle-only products.
final List<BundleProduct> mockBundleProducts = <BundleProduct>[
  for (final product in mockSkincareProducts)
    BundleProduct(product: product, segment: BundleSegment.care),
  for (final product in mockMackupProducts)
    BundleProduct(product: product, segment: BundleSegment.mackup),
  for (final product in _koreanProducts)
    BundleProduct(product: product, segment: BundleSegment.korean),
  for (final product in _bundleProducts)
    BundleProduct(product: product, segment: BundleSegment.bundles),
];

const List<Product> _koreanProducts = [
  Product(
    id: 'k1',
    name: 'Ginseng Essence Toner',
    category: 'Korean',
    price: 29.00,
    stock: 35,
    rating: 4.8,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A nourishing essence toner made with red ginseng extract. It softens '
        'the skin, adds a healthy glow and preps the face for the rest of your '
        'routine. Pat in two layers morning and night.',
  ),
  Product(
    id: 'k2',
    name: 'Rice Water Cleansing Balm',
    category: 'Korean',
    price: 21.50,
    stock: 48,
    rating: 4.6,
    imageUrl:
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A sherbet cleansing balm with fermented rice water that melts away '
        'makeup and sunscreen without stripping the skin. Emulsify with warm '
        'water and massage gently before rinsing.',
  ),
  Product(
    id: 'k3',
    name: 'Mugwort Calming Cream',
    category: 'Korean',
    price: 26.00,
    stock: 6,
    rating: 4.7,
    imageUrl:
        'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A lightweight cream with mugwort extract and madecassoside to calm '
        'redness and soothe sensitised skin. It absorbs quickly and layers '
        'well under sunscreen.',
  ),
  Product(
    id: 'k4',
    name: 'Honey Lip Sleeping Mask',
    category: 'Korean',
    price: 16.00,
    stock: 70,
    rating: 4.9,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'An overnight lip mask with honey and shea butter that repairs dry, '
        'flaky lips while you sleep. Apply a thick layer before bed and gently '
        'wipe away any excess in the morning.',
  ),
];

const List<Product> _bundleProducts = [
  Product(
    id: 'b1',
    name: 'Glass Skin Starter Bundle',
    category: 'Bundles',
    price: 59.00,
    stock: 14,
    rating: 4.9,
    isNew: true,
    imageUrl:
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A four-step routine for hydrated, glass-like skin: cleansing balm, '
        'essence toner, barrier cream and daily sunscreen. Everything you need '
        'to start a Korean skincare routine, at a bundle price.',
  ),
  Product(
    id: 'b2',
    name: '10-Step Routine Bundle',
    category: 'Bundles',
    price: 89.00,
    stock: 9,
    rating: 4.8,
    imageUrl:
        'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'The complete Korean routine in one box: oil cleanser, foam cleanser, '
        'exfoliator, toner, essence, serum, sheet mask, eye cream, moisturiser '
        'and sunscreen. Save more than buying each step separately.',
  ),
  Product(
    id: 'b3',
    name: 'Makeup Essentials Bundle',
    category: 'Bundles',
    price: 69.00,
    stock: 21,
    rating: 4.6,
    imageUrl:
        'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'A curated makeup set with cushion foundation, velvet lip tint, brow '
        'pencil and mascara. The everyday essentials for a fresh, natural look '
        'in one convenient bundle.',
  ),
  Product(
    id: 'b4',
    name: 'Night Repair Bundle',
    category: 'Bundles',
    price: 74.00,
    stock: 0,
    rating: 4.7,
    imageUrl:
        'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    productInfo:
        'An overnight recovery set with snail repair serum, mugwort calming '
        'cream and honey lip mask. Wake up to skin that looks rested, plump and '
        'calm.',
  ),
];
