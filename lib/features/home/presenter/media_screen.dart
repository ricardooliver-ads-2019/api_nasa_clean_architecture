// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, avoid_print, sized_box_for_whitespace

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_clean_arch/features/home/presenter/cubitController/cubit_controller.dart';
import 'package:nasa_clean_arch/features/home/presenter/widgets/custom_video_player.dart';
import 'package:nasa_clean_arch/features/home/presenter/widgets/image_network_with_loader.dart';
import 'package:nasa_clean_arch/features/home/presenter/widgets/screen_erro.dart';

import 'widgets/description_bottom_sheet.dart';
import 'widgets/page_slider_up.dart';

class MediaScreen extends StatefulWidget {
  final DateTime dateSelected;

  MediaScreen({ Key? key,required this.dateSelected}) : super(key: key);

  // MediaScreen.fromArgs(dynamic arguments){
  //   dateSelected = arguments['dateSelected'];
  // }

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}


class _MediaScreenState extends State<MediaScreen> {
  @override
  void initState(){
    super.initState();
    final _cubit = BlocProvider.of<CubitController>(context);
    _cubit.getSpaceMediaFromDate(widget.dateSelected);
  
  }

 

   @override
   Widget build(BuildContext context) {
    return BlocConsumer<CubitController, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state){
        
      },
      
      builder: (context, state){

        switch(state.status){
          case HomeStatus.error:
            //AsukaSnackbar.alert('${state.error!.message}').show();
            return ScreenErro( message: state.error!.message);
          case HomeStatus.loading:
            return const Center(child: CircularProgressIndicator());

          default:
            return Scaffold(
            body: Container(
            height: MediaQuery.of(context).size.height,
            child: state.spaceMediaModel == null 
            
              ? Container(
                child: const Center(
                  child: Text('Humm! Tivemos um probleminha', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
          
              : Column(
                children: [
                  PageSliderUp(
                      onSlideUp: () => showDescriptionBottomSheet(
                        context: context,
                        title: state.spaceMediaModel!.title,
                        description: state.spaceMediaModel!.description,
                        
                      ),
                      child: state.spaceMediaModel!.mediaType == 'video' && state.spaceMediaModel!.mediaUrl != null
                          ? CustomVideoPlayer(state.spaceMediaModel!)
                          : state.spaceMediaModel!.mediaType == 'image' && state.spaceMediaModel!.mediaUrl != null
                              ? ImageNetworkWithLoader(state.spaceMediaModel!.mediaUrl!)
                              : Container(),
                  )
                ]
              ),
            )
          );
        }
        
          

      }
    );
  }
}