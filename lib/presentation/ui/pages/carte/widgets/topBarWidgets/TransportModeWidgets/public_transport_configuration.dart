import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicTransportConfiguration extends StatelessWidget {
  const PublicTransportConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Text(
          "Agence de transport",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context
              .watch<PublicTransportViewModel>()
              .agences
              .map((agence) {
                return Container(
                  decoration: BoxDecoration(
                    border:
                        context
                            .watch<PublicTransportViewModel>()
                            .selectedAgence.contains(agence)
                        ? Border.all(
                            color: const Color.fromARGB(255, 67, 189, 189),
                            width: 2.5,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      context
                          .read<PublicTransportViewModel>()
                          .selectAgence(agence);
                    },
                    child: Image.asset(
                      "assets/images/${agence.imageFileName}",
                      height: 80,
                    ),
                  ),
                );
              })
              .toList(),
        ),

        const Divider(
          height: 25,
          thickness: 1,
          color: Color.fromARGB(255, 232, 233, 237),
        ),
 
                Text(
          "Réseaux de transport",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: context
                .watch<PublicTransportViewModel>()
                .reseaux
                .map((reseau) {
                  return Container(
                    decoration: BoxDecoration(
                      border:
                          context
                              .read<PublicTransportViewModel>()
                              .selectedReseaux.contains(reseau)
                          ? Border.all(
                              color: const Color.fromARGB(255, 67, 189, 189),
                              width: 2.5,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {
                         context
                            .read<PublicTransportViewModel>()
                            .selectReseau(reseau);
                      },
                      child: Image.asset(
                        "assets/images/${reseau.imageFileName}",
                        height: 40,
                      ),
                    ),
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }
}
