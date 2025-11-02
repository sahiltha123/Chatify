import 'dart:convert';

import 'package:http/http.dart' as http;

class AIService {
  static const String _apiKey =
      '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';

  // static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';
  static const String _baseUrl =
      'https://openrouter.ai/api/v1/chat/completions'; // Fixed: OpenRouter endpoint
  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
          // Optional: OpenRouter-specific header for better routing (add if needed)
          // 'HTTP-Referer': 'your-app-url.com',  // Replace with your app's URL
          // 'X-Title': 'Your App Name',
        },
        body: jsonEncode({
          'model': 'openai/gpt-5',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a helpful AI assistant. Be concise and friendly in your responses.',
            },
            {'role': 'user', 'content': message},
          ],
          'max_tokens': 1000,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].toString().trim();
      } else {
        // Improved error handling: Log details for debugging
        print('API Error - Status: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception(
          'Failed to load response from AI service: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Exception: $e'); // Log full error
      throw Exception('Error communicating with AI service: $e');
    }
  }
}

//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class AIService {
//   static const String _apiKey = 'sk-ijklmnopqrstuvwxijklmnopqrstuvwxijklmnop';
//   static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';
//
//   // Store conversation history per user
//   final Map<String, List<Map<String, String>>> _conversationHistory = {};
//
//   Future<String> sendMessage(String message, String userId) async {
//     try {
//       // Initialize conversation history if needed
//       if (!_conversationHistory.containsKey(userId)) {
//         _conversationHistory[userId] = [
//           {
//             'role': 'system',
//             'content': 'You are a helpful AI assistant integrated into a chat app. '
//                 'Be friendly, concise, and helpful. Use emojis sparingly to keep responses warm. '
//                 'Format responses with line breaks for readability when needed.'
//           }
//         ];
//       }
//
//       // Add user message to history
//       _conversationHistory[userId]!.add({
//         'role': 'user',
//         'content': message
//       });
//
//       // Keep only last 20 messages (10 exchanges) to manage token usage
//       if (_conversationHistory[userId]!.length > 21) {
//         _conversationHistory[userId] = [
//           _conversationHistory[userId]![0], // Keep system message
//           ..._conversationHistory[userId]!.sublist(_conversationHistory[userId]!.length - 20)
//         ];
//       }
//
//       final response = await http.post(
//           Uri.parse(_baseUrl),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer $_apiKey',
//           },
//           body: jsonEncode({
//             'model': 'gpt-4o',
//             'messages': _conversationHistory[userId],
//             'max_tokens': 1000,
//             'temperature': 0.7,
//           })
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final aiResponse = data['choices'][0]['message']['content'].toString().trim();
//
//         // Add AI response to history
//         _conversationHistory[userId]!.add({
//           'role': 'assistant',
//           'content': aiResponse
//         });
//
//         return aiResponse;
//       } else {
//         throw Exception('Failed to load response from AI service');
//       }
//     } catch (e) {
//       throw Exception('Error communicating with AI service: $e');
//     }
//   }
//
//   // Clear conversation history for a user
//   void clearHistory(String userId) {
//     _conversationHistory.remove(userId);
//   }
//
//   // Get conversation message count
//   int getMessageCount(String userId) {
//     return _conversationHistory[userId]?.length ?? 0;
//   }
// }
