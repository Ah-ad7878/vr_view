import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vr_view/bag_pack.dart';
import 'package:vr_view/banner_card.dart';
import 'package:vr_view/third_car.dart';

void main() {
  runApp(const NameBar());
}

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vr View',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? _controller;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      final controller = VideoPlayerController.asset('assets/video/video.mp4');
      _controller = controller;

      await controller.initialize();

      if (!mounted) return;

      await controller.setVolume(0.0);
      await controller.setLooping(true);
      await controller.play();

      setState(() {});
    } catch (e) {
      debugPrint("Video Error: $e");
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVideoReady =
        _controller != null && _controller!.value.isInitialized;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1C1A),
      body: Stack(
        children: [
          if (_hasError)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Video load nahi ho saki!\nError: $_errorMessage\n\nCheck karein ke pubspec.yaml mein path sahi hai.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            )
          else if (isVideoReady)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              ),
            )
          else
            Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),

          Container(color: Colors.black.withValues(alpha: 0.3)),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2825).withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      const StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.3,
                        child: BannerCard(),
                      ),

                      const StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.9,
                        child: BagPack(),
                      ),

                      const StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.4,
                        child: CollectionCard(
                          title: 'New Collection',
                          imagePath: 'assets/images/nike.png',
                        ),
                      ),

                      const StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.4,
                        child: CollectionCard(
                          title: 'Future By Nike',
                          imagePath: 'assets/images/foot.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
