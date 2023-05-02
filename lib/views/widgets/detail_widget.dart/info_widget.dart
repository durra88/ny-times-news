import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/helper/helpers.dart';

class InfoWidget extends StatelessWidget {
  final String name, caption;

  const InfoWidget({
    super.key,
    required this.name,
    required this.caption,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 0),
              child: appText(
                name,
                textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: appText(
                caption,
                textStyle:
                    GoogleFonts.lora(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
