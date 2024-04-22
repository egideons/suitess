import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';

import '../../../../../src/constants/consts.dart';
import '../../content/kyc_add_location_page_header.dart';

class KycAddLocationCupertinoScaffold
    extends GetView<KycAddLocationController> {
  const KycAddLocationCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final kycAddLocationController = KycAddLocationController.instance;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycAddLocationPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Form(
              key: kycAddLocationController.formKey,
              child: Column(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      // showKYCChooseCountryCupertinoPopup(
                      //   context,
                      //   media,
                      //   kycAddLocationController,
                      // );
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: media.height * 0.2,
                            child: CupertinoPicker(
                              itemExtent: 60,
                              onSelectedItemChanged: (index) {
                                // setState(() {
                                //   _selectedIndex = index;
                                // });
                              },
                              children: List.generate(
                                kycAddLocationController.countries.length,
                                (index) {
                                  return Center(
                                    child: Text(
                                      kycAddLocationController.countries[index],
                                      style: defaultTextStyle(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: formFieldContainer(
                      colorScheme,
                      media,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose Country",
                              style: defaultTextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.caretDown,
                              color: colorScheme.primary,
                              size: 16,
                            )
                          ],
                        ),
                      ),
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
}
