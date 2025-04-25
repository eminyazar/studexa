import 'package:flutter/material.dart';
import 'package:studexa/core/services/openai_service.dart';



class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  void _submitLearningRequest() async {
    String topic = _controller.text.trim();
    if (topic.isEmpty) return;

    setState(() {
      _isLoading = true;
      _response = '';
    });

    String result = await OpenAIService.getChatResponse(topic);

    setState(() {
      _isLoading = false;
      _response = result;
     });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studexa Learning'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'What do you want to learn today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Ex: AI, Flutter, Dart...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitLearningRequest,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
            if (_response.isNotEmpty)
                            Text(
                              _response,
                              style: const TextStyle(fontSize: 16),
                            ),
          ],
        ),
      ),
    );
  }
}
