import 'package:flutter/material.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/ui/about_me_page.dart';
import 'package:tokokita/bloc/logout_bloc.dart';
import 'package:tokokita/ui/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuadrat Store'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List Produk'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProdukPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()))
                    });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/store_banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  color: Colors.black.withOpacity(0.3),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Kuadrat Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard(
                    'assets/images/product1.jpg',
                    'Realme Smart TV 50 Inch',
                    'Rp 9.000.000',
                  ),
                  _buildProductCard(
                    'assets/images/product2.jpg',
                    'Laptop Asus',
                    'Rp 8.000.000',
                  ),
                  _buildProductCard(
                    'assets/images/product3.jpg',
                    'Samsung Galaxy S7',
                    'Rp 9.000.000',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tentang Kuadrat Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Toko Kuadrat adalah tujuan utama Anda untuk mendapatkan produk terbaik di pasaran. Kami menawarkan berbagai macam produk berkualitas tinggi yang dirancang untuk memenuhi kebutuhan Anda dan melampaui harapan Anda. Di Toko Kuadrat, kami memahami bahwa setiap pelanggan memiliki kebutuhan yang unik, itulah sebabnya kami menyediakan pilihan produk yang sangat beragam. Mulai dari elektronik canggih, peralatan rumah tangga yang efisien, hingga gadget terbaru dan aksesori modis, semua tersedia di sini. Kami tidak hanya fokus pada kualitas produk, tetapi juga pada layanan pelanggan yang luar biasa. Tim kami selalu siap membantu Anda menemukan produk yang tepat dan memberikan saran yang berguna untuk memastikan Anda mendapatkan pengalaman belanja yang memuaskan. Jelajahi produk unggulan kami dan temukan pasangan sempurna Anda hari ini! Baik Anda mencari hadiah spesial untuk orang terkasih atau memperbarui perangkat sehari-hari Anda, Toko Kuadrat memiliki semua yang Anda butuhkan dan banyak lagi. Kami berkomitmen untuk memberikan yang terbaik bagi pelanggan kami dengan menyediakan produk-produk terkini dan berkualitas tinggi yang memenuhi standar internasional. Terima kasih telah memilih Toko Kuadrat sebagai mitra belanja Anda yang terpercaya.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String imagePath, String title, String price) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
