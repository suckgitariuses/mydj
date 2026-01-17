import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydj/components/video_preview.dart';

enum MediaType { photo, video }

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;
  final Function(String path)? onMediaSelected;

  const MediaSelector({
    super.key,
    this.mediaType = MediaType.photo,
    this.onMediaSelected,
  });

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = '';

  Future<XFile?> _retrieveMedia(ImageSource source) async {
    final picker = ImagePicker();
    XFile? media;

    if (widget.mediaType == MediaType.photo) {
      media = await picker.pickImage(source: source);
    } else {
      media = await picker.pickVideo(source: source);
    }
    return media;
  }

  void _selectFromCamera() async {
    XFile? media = await _retrieveMedia(ImageSource.camera);
    if (media != null) {
      setState(() => _mediaPath = media.path);
      widget.onMediaSelected?.call(_mediaPath);
    }
  }

  void _selectFromGallery() async {
    XFile? media = await _retrieveMedia(ImageSource.gallery);
    if (media != null) {
      setState(() => _mediaPath = media.path);
      widget.onMediaSelected?.call(_mediaPath);
    }
  }

  void _deleteSelected() {
    setState(() => _mediaPath = '');
    widget.onMediaSelected?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _mediaPlaceholder(),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: _selectFromCamera,
                        child: const Icon(Icons.photo_camera),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        onPressed: _selectFromGallery,
                        child: const Icon(Icons.photo_library),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        onPressed: _deleteSelected,
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mediaPlaceholder() {
    Icon icon;
    String caption;
    Widget previewWidget;

    if (_mediaPath.isEmpty) {
      icon = widget.mediaType == MediaType.photo
          ? const Icon(Icons.image_not_supported, color: Colors.grey)
          : const Icon(Icons.videocam_off, color: Colors.grey);

      caption =
          widget.mediaType == MediaType.photo ? 'No photo' : 'No video';

      return SizedBox(
        height: 150,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(caption),
          ],
        ),
      );
    }

    // Jika media tersedia
    if (widget.mediaType == MediaType.photo) {
      previewWidget = Image.file(
        File(_mediaPath),
        width: double.infinity,
        fit: BoxFit.fitWidth,
      );
    } else {
      previewWidget = VideoPreview(path: _mediaPath);
    }

    return SizedBox(
      width: double.infinity,
      child: previewWidget,
    );
  }
}
