import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelecteurReseau extends StatefulWidget {
  final void Function(String) onReseauChange;

  const SelecteurReseau({super.key, required this.onReseauChange});

  @override
  State<SelecteurReseau> createState() => _SelecteurReseauState();
}

class _SelecteurReseauState extends State<SelecteurReseau> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final agence = null; //////////////////////////////////////////////////////

    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: SizedBox(
          height: constraints.maxWidth * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: agence.reseaux.length,
            itemBuilder: (context, index) {
              final reseau = agence.reseaux[index];
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onReseauChange(reseau.type);
                },
                child: Container(
                  width: constraints.maxWidth * 0.3,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color.fromARGB(255, 67, 189, 189)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: constraints.maxWidth * 0.08,
                        child: Image.asset(reseau.imageFileName),
                      ),

                      SizedBox(height: 8),
                      Text(
                        reseau.description,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Color.fromARGB(255, 67, 189, 189),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
