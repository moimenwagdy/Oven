import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class ProductDetailsMediaSlider extends StatefulWidget {
  final List<String> imageUrls;
  final String? videoUrl;

  const ProductDetailsMediaSlider({
    super.key,
    required this.imageUrls,
    this.videoUrl,
  });

  @override
  State<ProductDetailsMediaSlider> createState() =>
      _ProductDetailsMediaSliderState();
}

class _ProductDetailsMediaSliderState extends State<ProductDetailsMediaSlider> {
  late final PageController _pageController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize video if provided
    if (widget.videoUrl != null) {
      _videoController = VideoPlayerController.asset(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasVideo = widget.videoUrl != null;
    final totalItems = widget.imageUrls.length + (hasVideo ? 1 : 0);

    if (totalItems == 1 && !hasVideo) {
      // Case 1: Single image only
      return _buildImage(widget.imageUrls.first);
    }

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: totalItems,
          onPageChanged: (index) => setState(() {
            _currentIndex = index;
            final lastIndex = widget.imageUrls.length;
            if (index != lastIndex) {
              _videoController?.pause();
            }
          }),
          itemBuilder: (context, index) {
            if (index < widget.imageUrls.length) {
              // Image pages
              return _buildImage(widget.imageUrls[index]);
            } else {
              // Last item = video
              return _buildVideo();
            }
          },
        ),
        // Dots indicator
        if (totalItems > 1)
          Positioned(
            bottom: 12,
            child: SizedBox(
              width: context.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalItems, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 10 : 6,
                    height: _currentIndex == index ? 10 : 6,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Center(child: Icon(Icons.broken_image, size: 40)),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(color: Colors.grey.shade300),
          );
        },
      ),
    );
  }

  Widget _buildVideo() {
    if (_videoController == null || !_videoController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_videoController!.value.isPlaying) {
            _videoController!.pause();
          } else {
            _videoController!.play();
          }
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              // aspectRatio: 1,
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            ),
            if (!_videoController!.value.isPlaying)
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 70),
          ],
        ),
      ),
    );
  }
}
