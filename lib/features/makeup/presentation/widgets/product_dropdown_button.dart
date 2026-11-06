import 'package:flutter/material.dart';

class ProductDropdownButton extends StatefulWidget {
  const ProductDropdownButton({super.key});

  @override
  State<ProductDropdownButton> createState() => _ProductDropdownButtonState();
}

class _ProductDropdownButtonState extends State<ProductDropdownButton> {
  Map<String, bool> selectedProducts = {
    "All Products": false,
    "Cleansers": false,
    "Moisturizers": false,
    "Face Mask": false,
    "Eye Care": false,
    "Toners": false,
  };
  // دالة لتحديد النص الذي سيظهر داخل الزر بناءً على الاختيارات
  String getButtonText() {
    // جمع كل المفاتيح التي تم اختيارها (ما عدا All Products لو حابب)
    List<String> selectedKeys = selectedProducts.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedKeys.isEmpty ||
        (selectedKeys.length == 1 && selectedKeys.contains("All Products"))) {
      return "All Product";
    } else if (selectedKeys.length == 1) {
      return selectedKeys.first; // لو عنصر واحد، اظهر اسمه
    } else {
      return "${selectedKeys.length} Selected"; // لو أكثر من عنصر، اظهر العدد
      // أو يمكنك دمجهم هكذا: return selectedKeys.join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showCustomDropdown(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getButtonText(), // <--- هنا يتم تحديث النص ديناميكياً
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
          ],
        ),
      ),
    );
  }

  void _showCustomDropdown(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 150,
              left: 50,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 220,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: StatefulBuilder(
                    builder: (context, setStateModal) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: selectedProducts.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(
                              key,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            value: selectedProducts[key],
                            controlAffinity: ListTileControlAffinity.leading,
                            dense: true,
                            activeColor: Colors.grey.shade700,
                            onChanged: (bool? value) {
                              setStateModal(() {
                                selectedProducts[key] = value ?? false;
                              });
                              setState(
                                () {},
                              ); // <--- لتحديث واجهة الزر الرئيسي فوراً عند الضغط
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
