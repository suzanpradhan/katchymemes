class Notification {
  String coverImageUrl;
  String username;
  String notification;
  String timeDateText;

  Notification(
      {this.username,
      this.coverImageUrl,
      this.notification,
      this.timeDateText});
}

List<Notification> listOfNotification = <Notification>[
  Notification(
      username: "sujan_pradhan",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has followed you.",
      timeDateText: "25 minutes ago"),
  Notification(
      username: "pujan_shres",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has liked your post.",
      timeDateText: "25 minutes ago"),
  Notification(
      username: "bibek3948",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has commented in your post.",
      timeDateText: "25 minutes ago"),
  Notification(
      username: "duluwa_43",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has followed you.",
      timeDateText: "25 minutes ago"),
  Notification(
      username: "alex_brooker",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has followed you.",
      timeDateText: "25 minutes ago"),
  Notification(
      username: "suzan",
      coverImageUrl:
          "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      notification: "has followed you.",
      timeDateText: "25 minutes ago"),
];
