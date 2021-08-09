const GOOGLE_API_KEY = 'AIzaSyCkDfxHHrhwHBwPK8D7IRAcXfTNkhOWN-s';

class LocationHelper {
  static String generateLocationPreviewImg(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$GOOGLE_API_KEY';
  }
}
