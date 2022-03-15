import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatefulWidget {
  List<String> links;
  YouTubePlayerWidget({required this.links, Key? key}) : super(key: key);

  @override
  _YouTubePlayerWidgetState createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  // bool? isMute;

  List<String> _ids = [];
  List<String> link = [];
  String videolink = '';
  int count = 0;
  // late String link;
  // late List<String> list;
  @override
  void initState() {
    super.initState();
    // _ids = widget.links;

    // list = _ids.split('=');
    for (int i = 0; i < widget.links.length; i++) {
      _ids.add(YoutubePlayer.convertUrlToId(widget.links[i]) ?? '');
      link.add(widget.links[i]);
      videolink = link[count];
      debugPrint("banner widget ichidamiza ${_ids[i]}");
    }
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        // topActions: const <Widget>[
        //   SizedBox(width: 8.0),
        //   Expanded(
        //     child: Text(
        //       '_controller.metadata.title',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 18.0,
        //       ),
        //       overflow: TextOverflow.ellipsis,
        //       maxLines: 1,
        //     ),
        //   ),
        // IconButton(
        //   icon: Icon(
        //     Icons.volume_up,
        //     color: Colors.white,
        //     size: 25.0,
        //   ),
        //   onPressed: () {
        // isMute == true ? isMute = true : false;
        // setState(() {});
        // debugPrint("volume tapped $isMute");
        // // log('Settings Tapped!');
        //   },
        // ),
        // ],

        bottomActions: [
          SizedBox(
            width: getWidth(290),
          ),
          InkWell(
            onTap: () async {
              debugPrint("ontap boldi");
              String url = videolink;
              debugPrint("link $url");
              if (await canLaunch(url)) {
                debugPrint("ifga kirdi");
                await launch(url, forceSafariVC: false);
              } else {
                debugPrint("else ga kirdi");
                throw 'Could not launch $url';
              }
            },
            child: const Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          if (link.length == count) {
            debugPrint(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaa on ended if ga kirdi $count");
            count = 0;
          } else {
            debugPrint(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaa on ended esle ga kirdi $count");

            count += 1;
            videolink = link[count];
          }
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          // _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'Youtube Player Flutter',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: ListView(
          children: [
            player,
          ],
        ),
      ),
    );
  }

  // void _showSnackBar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         message,
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.w300,
  //           fontSize: 16.0,
  //         ),
  //       ),
  //       backgroundColor: Colors.blueAccent,
  //       behavior: SnackBarBehavior.floating,
  //       elevation: 1.0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(50.0),
  //       ),
  //     ),
  //   );
  // }
}
