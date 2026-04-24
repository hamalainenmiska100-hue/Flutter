import 'package:flutter/material.dart';

void main() {
  runApp(const MyWebsite());
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sivusto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oma Sivusto'),
        centerTitle: false,
        actions: isWide
            ? const [
                NavButton(text: 'Etusivu'),
                NavButton(text: 'Palvelut'),
                NavButton(text: 'Tietoa'),
                NavButton(text: 'Yhteys'),
                SizedBox(width: 16),
              ]
            : null,
      ),
      drawer: isWide
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    child: Text(
                      'Valikko',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ListTile(title: Text('Etusivu')),
                  ListTile(title: Text('Palvelut')),
                  ListTile(title: Text('Tietoa')),
                  ListTile(title: Text('Yhteys')),
                ],
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(isWide: isWide),
            const ServicesSection(),
            const AboutSection(),
            const ContactSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;

  const NavButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text),
    );
  }
}

class HeroSection extends StatelessWidget {
  final bool isWide;

  const HeroSection({
    super.key,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 100 : 60,
      ),
      color: Colors.blue.shade50,
      child: Flex(
        direction: isWide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isWide ? 1 : 0,
            child: Column(
              crossAxisAlignment:
                  isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Text(
                  'Tervetuloa sivustolleni',
                  textAlign: isWide ? TextAlign.left : TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Tämä on moderni Flutterilla tehty verkkosivu, joka toimii sekä mobiilissa että tietokoneella.',
                  textAlign: isWide ? TextAlign.left : TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Aloita tästä'),
                ),
              ],
            ),
          ),
          SizedBox(width: isWide ? 60 : 0, height: isWide ? 0 : 40),
          Expanded(
            flex: isWide ? 1 : 0,
            child: Icon(
              Icons.web,
              size: isWide ? 220 : 140,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.design_services,
        'title': 'Suunnittelu',
        'text': 'Tyylikäs ja selkeä ulkoasu.'
      },
      {
        'icon': Icons.phone_android,
        'title': 'Responsiivisuus',
        'text': 'Toimii puhelimella, tabletilla ja tietokoneella.'
      },
      {
        'icon': Icons.speed,
        'title': 'Nopeus',
        'text': 'Kevyt ja nopea käyttökokemus.'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Column(
        children: [
          Text(
            'Palvelut',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: services.map((service) {
              return ServiceCard(
                icon: service['icon'] as IconData,
                title: service['title'] as String,
                text: service['text'] as String,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Column(
        children: [
          Text(
            'Tietoa meistä',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800),
            child: Text(
              'Rakennamme moderneja, selkeitä ja käyttäjäystävällisiä digitaalisia ratkaisuja Flutterilla. '
              'Tätä pohjaa voi muokata helposti omalle yritykselle, portfoliolle tai projektisivulle.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Column(
        children: [
          Text(
            'Ota yhteyttä',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Text('Sähköposti: info@example.com'),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Lähetä viesti'),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      padding: const EdgeInsets.all(24),
      child: const Text(
        '© 2026 Oma Sivusto. Kaikki oikeudet pidätetään.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
