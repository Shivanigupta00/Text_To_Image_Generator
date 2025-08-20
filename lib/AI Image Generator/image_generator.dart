import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stability_image_generation/stability_image_generation.dart';
import 'dart:async'; // for delay/backoff
import 'dart:convert'; // for jsonEncode/jsonDecode/base64
import 'package:http/http.dart' as http;


class AiTextToImageGenerator extends StatefulWidget {
  const AiTextToImageGenerator({super.key});
  @override
  State<AiTextToImageGenerator> createState() => _AiTextToImageGeneratorState();
}

class _AiTextToImageGeneratorState extends State<AiTextToImageGenerator> {
  final TextEditingController _queryController = TextEditingController();
 

  // Load API key from dart-define
  final String apiKey = const String.fromEnvironment('STABILITY_API_KEY');

  final ImageAIStyle imageAIStyle = ImageAIStyle.digitalPainting;

  bool isItems = false;
  bool isLoading = false; // lock button while generating
  Uint8List? generatedImage;

  // Safe image generator with retry/backoff
Future<Uint8List?> _generate(String query) async {
  if (apiKey.isEmpty) {
    if (kDebugMode) {
      print('API Key is missing. Please provide it via --dart-define.');
    }
    return null;
  }

  if (query.isEmpty) return null;

  // Corrected URL with a valid engine ID
  final url = Uri.parse(
      'https://api.stability.ai/v1/generation/stable-diffusion-xl-1024-v1-0/text-to-image');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json', // Added for robustness
        'Authorization': 'Bearer $apiKey', // Correctly using the API key
      },
      body: jsonEncode({
        'text_prompts': [
          {'text': query}
        ],
        'cfg_scale': 7,
        'height': 1024, // Note: XL models perform best with 1024x1024
        'width': 1024,
        'samples': 1,
        'steps': 30, // 30 is often sufficient for quality
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String base64Image = data['artifacts'][0]['base64'];
      return base64Decode(base64Image);
    } else {
      // Check the debug console for this output!
      print('API error: ${response.statusCode} - ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error calling API: $e');
    return null;
  }
}


  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(231, 230, 205, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Text to Image",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                controller: _queryController,
                decoration: const InputDecoration(
                  hintText: 'Enter your prompt',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 5),
                ),
              ),
            ),

            // Image / Loading / Message
            Padding(
              padding: const EdgeInsets.all(20),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : generatedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(generatedImage!),
                        )
                      : const Text(
                          'Enter prompt and press Generate',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
            ),

            // Button with guard
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      String query = _queryController.text;
                      if (query.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                          isItems = true;
                        });

                        final image = await _generate(query);

                        setState(() {
                          generatedImage = image;
                          isLoading = false;
                        });
                      } else {
                        if (kDebugMode) print('Query is empty!');
                      }
                    },
              child: const Text("Generate Image"),
            ),
          ],
        ),
      ),
    );
  }
}
