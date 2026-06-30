import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens an external URL (or mailto:) in a new tab. Relative paths (e.g.
/// `assets/resume/...`) are resolved against the current page URL so they
/// work both in `flutter run -d chrome` and after deployment. Silently
/// no-ops on empty.
Future<void> openLink(String url) async {
  if (url.isEmpty) return;
  Uri uri = Uri.parse(url);
  if (!uri.hasScheme) {
    uri = Uri.base.resolveUri(uri);
  }
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// An icon button that opens [url] on tap, with a tooltip.
class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  final IconData icon;
  final String url;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => openLink(url),
      icon: Icon(icon),
      color: Colors.white70,
      hoverColor: Colors.transparent,
      splashRadius: 22,
    );
  }
}
