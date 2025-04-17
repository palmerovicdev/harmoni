```dart
final editor = VideoEditorBuilder(videoPath: '/path/to/video.mp4')
  // Trim video
  .trim(startTimeMs: 1000, endTimeMs: 6000)

  // Merge with another video
  .merge(otherVideoPaths: ['/path/to/second.mp4'])

  // Adjust speed
  .speed(speed: 1.5)

  // Compress video
  .compress(resolution: VideoResolution.p720)

  // Crop video
  .crop(aspectRatio: VideoAspectRatio.ratio16x9)

  // Rotate video
  .rotate(degree: RotationDegree.d90);

// Export the final video
final outputPath = await editor.export(
  outputPath: '/path/to/output.mp4' // Optional output path
);

// Extract audio
final audioPath = await editor.extractAudio(
  outputPath: '/path/to/output.m4a' // Optional output path, iOS outputs M4A format
);

// Generate thumbnail
final thumbnailPath = await editor.generateThumbnail(
  positionMs: 2000,
  quality: 85,
  width: 1280,    // optional
  height: 720,    // optional
  outputPath: '/path/to/thumbnail.jpg' // Optional output path
);

// Get video metadata
final metadata = await editor.getVideoMetadata();
print('Duration: ${metadata.duration} ms');
print('Dimensions: ${metadata.width}x${metadata.height}');
print('Orientation: ${metadata.rotation}°');
print('File size: ${metadata.fileSize} bytes');
```