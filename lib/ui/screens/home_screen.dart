import 'package:flutter/material.dart';
import 'package:project/services/api_service.dart';
import '../widgets/chat_input_widget.dart';
import 'inventory_screen.dart';
import 'package:get/get.dart';
import 'product_identification_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(),
    InventoryScreen(),
    ProductIdentificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Identify Product'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiServiceController());
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Container(height: 40, child: Image(image: AssetImage('assets/images and icon/logo_icon.png',))),SizedBox(width: 10,),Text('Market Mind',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),)],)
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Welcome Back, Nir',style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 100,),
                Placeholder(
                  fallbackHeight: 200,
                  child: Center(
                    child: Obx(() {
                      if (controller.responseMessage.isNotEmpty) {
                        return Text(controller.responseMessage.value, style: TextStyle(color: Colors.red));
                      }
                      if (controller.data.isEmpty) {
                        return Text('No data yet, send a query!');
                      }
                      return Text(controller.data["data"]["rows"][0][2].toString()?? 'Data received'); // ✅ Ensures UI updates
                    }),
                  ),
                ),


              ],
            ),
          ),
          ChatInputWidget(),
        ],
      ),
    );
  }
}
