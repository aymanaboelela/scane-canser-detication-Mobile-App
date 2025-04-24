import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<void> generateAndSavePDF({
  required String cancerName,
  required double probability,
  required String description,
  required String imagePath, // Asset image path
}) async {
  final pdf = pw.Document();

  try {
    // تحميل الصورة من assets
    final imageBytes = await rootBundle.load(imagePath);
    final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

    // إضافة صفحة PDF
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Image(image, height: 200),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Detection Result",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                "Cancer Type: $cancerName",
                style: pw.TextStyle(fontSize: 18),
              ),
              pw.Text(
                "Probability: ${probability.toStringAsFixed(1)}%",
                style: pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                "Description:",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              pw.Text(
                description,
                style: pw.TextStyle(fontSize: 14),
              ),
            ],
          );
        },
      ),
    );

    // 📥 Get path & save PDF in external storage (Downloads folder)
    final outputDir = await getExternalStorageDirectory();
    final filePath =
        "${outputDir?.path}/Download/re_cancer_result.pdf"; // Saving in Download folder
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // Optional: You can open it or show snackbar
    print("PDF saved at: $filePath");
  } catch (e) {
    print("Error generating PDF: $e");
  }
}
