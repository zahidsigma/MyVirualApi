// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';

// class PDFGenerator {
//   static Future<String> createPDF(Map<String, dynamic> reportData) async {
//     try {
//       final pdf = pw.Document();

//       pdf.addPage(
//         pw.Page(
//           build: (pw.Context context) {
//             return pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 pw.Text("Person Report",
//                     style: pw.TextStyle(
//                         fontSize: 24, fontWeight: pw.FontWeight.bold)),
//                 pw.SizedBox(height: 10),
//                 pw.Text("Name: ${reportData['name'] ?? 'Unknown'}"),
//                 pw.Text("Age: ${reportData['age'] ?? 'N/A'}"),
//                 pw.Text("Email: ${reportData['email'] ?? 'N/A'}"),
//                 pw.Text("Phone: ${reportData['phone'] ?? 'N/A'}"),
//                 pw.SizedBox(height: 10),
//                 pw.Text("Additional Details:",
//                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                 pw.Text(reportData['details'] ?? "No details available."),
//               ],
//             );
//           },
//         ),
//       );

//       final output = await getApplicationDocumentsDirectory();
//       final filePath = "${output.path}/full_report.pdf";
//       final file = File(filePath);

//       await file.writeAsBytes(await pdf.save());

//       print("✅ PDF saved at: $filePath"); // Debug print
//       return filePath; // Return the PDF path
//     } catch (e) {
//       print("❌ Error generating PDF: $e");
//       return "";
//     }
//   }
// }

import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PDFGenerator {
  static Future<String> createPDF(Map<String, dynamic> reportData) async {
    try {
      print("📌 Raw Report Data: $reportData"); // Debugging step

      if (reportData['persons'] == null || reportData['persons'].isEmpty) {
        print("❌ No person data available");
        return "";
      }

      // Extract first person from list
      Map<String, dynamic> person = reportData['persons'][0];

      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Title
                pw.Text("Person Report",
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),

                // Basic Information
                _buildText("Tahoe ID", person['tahoeId']),
                _buildText("Full Name", _getFullName(person['name'])),
                _buildText("Age", person['age']),
                _buildText("DOB", person['dob']),
                _buildText("Public Profile",
                    person['isPublic'] == true ? "Yes" : "No"),
                _buildText(
                    "Opted Out", person['isOptedOut'] == true ? "Yes" : "No"),
                _buildText(
                    "Premium User", person['isPremium'] == true ? "Yes" : "No"),
                _buildText("DOB First Seen", person['dobFirstSeen']),
                _buildText("DOB Last Seen", person['dobLastSeen']),
                _buildText(
                    "Is Deceased",
                    person['deathRecords']['isDeceased'] == true
                        ? "Yes"
                        : "No"),

                pw.SizedBox(height: 10),

                // Known Aliases (AKAs)
                pw.Text("Aliases (AKAs):",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                _buildList(_extractNames(person['akas'])),

                pw.SizedBox(height: 10),
              ],
            );
          },
        ),
      );

      final output = await getApplicationDocumentsDirectory();
      final filePath = "${output.path}/full_report.pdf";
      final file = File(filePath);

      await file.writeAsBytes(await pdf.save());

      print("✅ PDF saved at: $filePath");
      return filePath;
    } catch (e) {
      print("❌ Error generating PDF: $e");
      return "";
    }
  }

  // Helper function to format text
  static pw.Widget _buildText(String label, dynamic value) {
    if (value == null) {
      print("⚠️ Missing Key: $label"); // Debugging step
    }
    return pw.Text("$label: ${value ?? 'N/A'}");
  }

  // Helper function to format lists (e.g., aliases)
  static pw.Widget _buildList(List<String> items) {
    if (items.isEmpty) {
      return pw.Text("N/A");
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: items.map((item) => pw.Text("- $item")).toList(),
    );
  }

  // Extract full name from name object
  static String _getFullName(Map<String, dynamic>? name) {
    if (name == null) return "N/A";
    return "${name['firstName'] ?? ''} ${name['middleName'] ?? ''} ${name['lastName'] ?? ''}"
        .trim();
  }

  // Extract aliases (AKAs) from list
  static List<String> _extractNames(List<dynamic>? akas) {
    if (akas == null || akas.isEmpty) return [];
    return akas.map((aka) => _getFullName(aka)).toList();
  }
}
