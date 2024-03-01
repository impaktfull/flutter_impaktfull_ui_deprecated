class AssetUtil {
  static bool isIcon(String assetName) =>
      assetName.startsWith('assets/icons/') ||
      assetName.startsWith('assets/images/icons/');
}
