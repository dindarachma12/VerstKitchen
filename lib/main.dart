import 'package:flutter/material.dart';

class WesternMenu {
  final String name;
  final String price;
  final String gambarUrl;
  final String deskripsi;
  final double rating;

  WesternMenu({required this.name, required this.price, required this.gambarUrl, required this.deskripsi, required this.rating});
}

List<WesternMenu> menuItems = [
  WesternMenu(name: 'Tenderloin Steak', price: '127.000', gambarUrl: 'https://i.pinimg.com/564x/61/b6/52/61b6520ca6f9d18b34f1072f10472b2e.jpg', deskripsi: 'Steak bagian tulang rusuk sapi',rating: 4.9),
  WesternMenu(name: 'Beef Lasagna', price: '55.000', gambarUrl: 'https://i.pinimg.com/564x/1b/aa/9b/1baa9bb1028eebcf9071192fa48225f5.jpg', deskripsi: 'Pasta berbentuk lembaran berisi daging sapi', rating: 4.8),
  WesternMenu(name: 'Chicken Cordon Bleu', price: '61.000', gambarUrl: 'https://i.pinimg.com/564x/f7/d8/44/f7d844445c3059ca8020e60d8f7f101f.jpg', deskripsi: 'Olahan daging ayam yang dibalut dengan keju', rating: 4.8),
  WesternMenu(name: 'Cheese Burger', price: '41.000', gambarUrl: 'https://i.pinimg.com/564x/a8/58/0a/a8580a315bd5ce41172efaabaae2b72d.jpg', deskripsi: 'Burger berisi keju', rating: 4.7),
  WesternMenu(name: 'Fish Chips', price: '36.000', gambarUrl: 'https://i.pinimg.com/564x/20/d3/ad/20d3ad09c151b0e1297b8d0b4c01065c.jpg', deskripsi: 'Berisi ikan dan kentang goreng', rating: 4.8),
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('VersKitchen'),
          titleTextStyle: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
          centerTitle: true,
          backgroundColor: Color.fromARGB(242, 64, 95, 100),
        ),
        body: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            WesternMenu item = menuItems[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              color: Color.fromARGB(241, 156, 212, 202),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(item.gambarUrl, fit: BoxFit.cover), 
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontSize: 18)),
                          SizedBox(height: 4),
                          Text(item.deskripsi, style: TextStyle(fontSize: 12)),
                          SizedBox(height: 4),
                          Text('Rp ${item.price}', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Row(
                            children: List.generate(5, (index) {
                              if (index < item.rating.toInt()) {
                                return Icon(Icons.star, color: Colors.yellow, size: 20);
                              } else {
                                return Icon(Icons.star_border, color: Colors.grey, size: 20);
                              }
                            }),
                          ),
                              SizedBox(width: 5),
                              Text('${item.rating}', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 