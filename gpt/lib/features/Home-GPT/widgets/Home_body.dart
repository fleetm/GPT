import 'package:flutter/material.dart';
import 'package:gpt/features/Home-GPT/widgets/open_ai_service.dart';

class HomeViewBody extends StatefulWidget {
  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _controller = TextEditingController();
  final OpenAIService _openAIService = OpenAIService(
      ''); // key here /////////////////////////////////////////////////////
  String _response = '';

  void _sendQuestion() async {
    final word = _controller.text;
    if (word.isNotEmpty) {
      try {
        // Asking the question
        final question =
            'Another word with the same meaning as $word?'; // you can change this queastion use the backend api so you can the one you need
        final response = await _openAIService.getAnswer(question);
        setState(() {
          _response = response;
        });
      } catch (e) {
        setState(() {
          _response = 'Error: ${e.toString()}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter OpenAI Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a word',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendQuestion,
              child: Text('Get Another Word with the Same Meaning'),
            ),
            SizedBox(height: 20),
            Text(_response),
          ],
        ),
      ),
    );
  }
}
