{
  "$GMSequence":"",
  "%Name":"seq_fade_in",
  "autoRecord":true,
  "backdropHeight":1080,
  "backdropImageOpacity":0.5,
  "backdropImagePath":"",
  "backdropWidth":1920,
  "backdropXOffset":0.0,
  "backdropYOffset":0.0,
  "events":{
    "$KeyframeStore<MessageEventKeyframe>":"",
    "Keyframes":[],
    "resourceType":"KeyframeStore<MessageEventKeyframe>",
    "resourceVersion":"2.0",
  },
  "eventStubScript":null,
  "eventToFunction":{},
  "length":60.0,
  "lockOrigin":false,
  "moments":{
    "$KeyframeStore<MomentsEventKeyframe>":"",
    "Keyframes":[
      {"$Keyframe<MomentsEventKeyframe>":"","Channels":{
          "0":{"$MomentsEventKeyframe":"","Events":[
              "finish_transition",
            ],"resourceType":"MomentsEventKeyframe","resourceVersion":"2.0",},
        },"Disabled":false,"id":"dd7aea90-9ef2-4325-88df-aeb9bb3b8427","IsCreationKey":false,"Key":59.9999,"Length":1.0,"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"2.0","Stretch":false,},
    ],
    "resourceType":"KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion":"2.0",
  },
  "name":"seq_fade_in",
  "parent":{
    "name":"Sequences",
    "path":"folders/Sequences.yy",
  },
  "playback":0,
  "playbackSpeed":60.0,
  "playbackSpeedType":0,
  "resourceType":"GMSequence",
  "resourceVersion":"2.0",
  "showBackdrop":true,
  "showBackdropImage":false,
  "spriteId":null,
  "timeUnits":1,
  "tracks":[
    {"$GMGraphicTrack":"","%Name":"spr_unit_pixel","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<AssetSpriteKeyframe>":"","Keyframes":[
          {"$Keyframe<AssetSpriteKeyframe>":"","Channels":{
              "0":{"$AssetSpriteKeyframe":"","Id":{"name":"spr_unit_pixel","path":"sprites/spr_unit_pixel/spr_unit_pixel.yy",},"resourceType":"AssetSpriteKeyframe","resourceVersion":"2.0",},
            },"Disabled":false,"id":"bbdb62f3-5aa1-4552-8b9b-d33d4133f7ab","IsCreationKey":false,"Key":0.0,"Length":60.0,"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"2.0","Stretch":false,},
        ],"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"spr_unit_pixel","resourceType":"GMGraphicTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[
        {"$GMColourTrack":"","%Name":"blend_multiply","builtinName":10,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<ColourKeyframe>":"","Keyframes":[
              {"$Keyframe<ColourKeyframe>":"","Channels":{
                  "0":{"$ColourKeyframe":"","AnimCurveId":null,"Colour":4278190080,"EmbeddedAnimCurve":null,"resourceType":"ColourKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"4f56c2b9-6ca3-45d7-84ad-1f4bc4fab68a","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"2.0","Stretch":false,},
              {"$Keyframe<ColourKeyframe>":"","Channels":{
                  "0":{"$ColourKeyframe":"","AnimCurveId":null,"Colour":0,"EmbeddedAnimCurve":null,"resourceType":"ColourKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"cc00819b-611b-4c7a-9509-609207d02cad","IsCreationKey":false,"Key":50.0,"Length":1.0,"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<ColourKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"blend_multiply","resourceType":"GMColourTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"0a829cf2-4a91-4f3b-ab06-f327d1134f46","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"origin","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-1393.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-745.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"4f118e66-1446-475b-a797-beb9c361d6e9","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"position","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"3a11e7b1-8a3a-4705-bb98-a5feefc132e6","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"rotation","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":2786.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1490.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"2da3bae7-3fcc-41b9-bcc0-fa5147ee48bd","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"scale","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294093896,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange":null,
  "volume":1.0,
  "xorigin":-960,
  "yorigin":-540,
}