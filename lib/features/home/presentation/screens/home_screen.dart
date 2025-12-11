import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Add image URLs for preview cards
  final List<Map<String, String>> designInspirations = [
    {
      'title': 'Minimalist Living Room',
      'image': 'https://images.unsplash.com/photo-1558036117-15e82a2c9a9a?w=400&auto=format&fit=crop',
    },
    {
      'title': 'Cozy Bedroom',
      'image': 'https://images.unsplash.com/photo-1615873968403-89e068629265?w=400&auto=format&fit=crop',
    },
    {
      'title': 'Modern Kitchen',
      'image': 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&auto=format&fit=crop',
    },
    {
      'title': 'Industrial Loft',
      'image': 'https://images.unsplash.com/photo-1495433324511-bf8e92934d90?w=400&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Soft White
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'AI Interior Design',
          style: TextStyle(
            color: const Color(0xFF333333), // Charcoal
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF333333)),
            onPressed: () {
              // TODO: Implement logout logic
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              _buildWelcomeSection(),
              
              const SizedBox(height: 40),
              
              // Start Generating Button
              _buildStartButton(),
              
              const SizedBox(height: 40),
              
              // Recent Designs/Preview Section with REAL IMAGES
              _buildPreviewSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF333333).withOpacity(0.8),
          ),
        ),
        Text(
          'Designer!',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF333333),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Transform any room with AI-powered interior design.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF333333), // Charcoal
            Color(0xFF555555), // Darker gray
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF333333).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Navigate to style selection
            Navigator.pushNamed(context, '/style-selection');
          },
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Start Generating',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create your dream room in 3 steps',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Design Inspirations',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Examples of AI-generated designs',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var design in designInspirations)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _buildPreviewCard(design['title']!, design['image']!),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewCard(String title, String imageUrl) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ REAL IMAGE - No more placeholder
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFE0E0E0),
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Color(0xFF333333)),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE0E0E0),
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}