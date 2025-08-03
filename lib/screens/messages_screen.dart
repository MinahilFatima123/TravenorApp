import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/search_widget.dart';
import '../widgets/messages_listtile.dart';
import '../data/messsages_data.dart';
import '../models/messages_model.dart';
import '../screens/message_details.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatModel> filtered = chatList;

  void _search(String query) {
    setState(() {
      filtered = chatList
          .where((d) => d.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedIndex = 2;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Messages',
        trailing: GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/png/Ellipse 674.png',
                width: 44,
                height: 44,
                color: Colors.grey.shade100,
              ),
              Image.asset(
                'assets/png/Menu_messages.png',
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(
                    'assets/png/Edit_messages.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              SizedBox(height: 0.02956 * screenHeight),
              SearchPlaces(
                controller: _controller,
                onChanged: _search,
                onSubmitted: _search,
                showMic: false,
                hintText: 'Search for chats & messages',
              ),
              SizedBox(height: 0.02956 * screenHeight),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.text.isEmpty
                    ? chatList.length
                    : filtered.length,
                itemBuilder: (context, index) {
                  final chatitem = _controller.text.isEmpty
                      ? chatList[index]
                      : filtered[index];
                  return ChatTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MessageDetailScreen(),
                        ),
                      );
                    },
                    chat: chatitem,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }
}
