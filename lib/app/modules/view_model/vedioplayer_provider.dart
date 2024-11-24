import 'package:flutter/material.dart';
import 'package:lms_app/app/constents/const_text.dart';
import 'package:lms_app/app/modules/model/vedio_data_model.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';
import 'package:lms_app/app/widgets/custom_youtube_player.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioplayerProvider extends ChangeNotifier {
  Widget getPlayer(VedioDataModel vedioData, context) {
    try {
      switch (vedioData.videoType) {
        case 'YouTube':
          final id = YoutubePlayer.convertUrlToId(vedioData.videoUrl!);
          return CustomYoutubePlayer(id: id);

        case 'Vimeo':
          return const VimeoPlayer(
            videoId: '222018604',
          );

        default:
          return const CustomTextWidget(
            text: ConstText.errorVideo,
          );
      }
    } catch (e) {
      return const CustomTextWidget(
        text: ConstText.errorVideo,
      );
    }
  }
}
