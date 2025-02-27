print("*** LOADING rwr.nas ... ***");

var lineWidth = 3;

RWRCanvas = {
    new: func (_ident, root, center, diameter) {
        var rwr = {parents: [RWRCanvas]};
        rwr.max_icons = 12;
        var radius = diameter/2;
        rwr.inner_radius = radius*0.30;
        rwr.outer_radius = radius*0.75;
        rwr.circle_radius_big = radius*0.5;
        rwr.circle_radius_small = radius*0.125;
        var tick_long = radius*0.25;
        var tick_short = tick_long*0.5;
        var font = int(0.08*diameter);
        var colorG = [0.3,1,0.3];
        var colorLG = [0,0.5,0];
        rwr.fadeTime = 7;#seconds
        rwr.rootCenter = root.createChild("group")
                .setTranslation(center[0],center[1]);
        var rootOffset = root.createChild("group")
                .setTranslation(center[0]-diameter/2,center[1]-diameter/2);
        
#        root.createChild("path")
#           .moveTo(0, diameter/2)
#           .arcSmallCW(diameter/2, diameter/2, 0, diameter, 0)
#           .arcSmallCW(diameter/2, diameter/2, 0, -diameter, 0)
#           .setStrokeLineWidth(lineWidth)
#           .setColor(1, 1, 1);
        rootOffset.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_small, diameter/2)
           .arcSmallCW(rwr.circle_radius_small, rwr.circle_radius_small, 0, rwr.circle_radius_small*2, 0)
           .arcSmallCW(rwr.circle_radius_small, rwr.circle_radius_small, 0, -rwr.circle_radius_small*2, 0)
           .setStrokeLineWidth(lineWidth)
           .setColor(colorLG);
        rootOffset.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_big, diameter/2)
           .arcSmallCW(rwr.circle_radius_big, rwr.circle_radius_big, 0, rwr.circle_radius_big*2, 0)
           .arcSmallCW(rwr.circle_radius_big, rwr.circle_radius_big, 0, -rwr.circle_radius_big*2, 0)
           .setStrokeLineWidth(lineWidth)
           .setColor(colorLG);
        rootOffset.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_small/2, diameter/2)
           .lineTo(diameter/2+rwr.circle_radius_small/2, diameter/2)
           .moveTo(diameter/2, diameter/2-rwr.circle_radius_small/2)
           .lineTo(diameter/2, diameter/2+rwr.circle_radius_small/2)
           .setStrokeLineWidth(lineWidth)
           .setColor(colorLG);
        rootOffset.createChild("path")
           .moveTo(0,diameter*0.5)
           .horiz(tick_long)
           .moveTo(diameter,diameter*0.5)
           .horiz(-tick_long)
           .moveTo(diameter*0.5,0)
           .vert(tick_long)
           .moveTo(diameter*0.5,diameter)
           .vert(-tick_long)
           .setStrokeLineWidth(lineWidth)
           .setColor(colorLG);
        rwr.rootCenter.createChild("path")
           .moveTo(radius*math.cos(30*D2R),radius*math.sin(-30*D2R))
           .lineTo((radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(-30*D2R))
           .moveTo(radius*math.cos(60*D2R),radius*math.sin(-60*D2R))
           .lineTo((radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(-60*D2R))
           .moveTo(radius*math.cos(30*D2R),radius*math.sin(30*D2R))
           .lineTo((radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(30*D2R))
           .moveTo(radius*math.cos(60*D2R),radius*math.sin(60*D2R))
           .lineTo((radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(60*D2R))

           .moveTo(-radius*math.cos(30*D2R),radius*math.sin(-30*D2R))
           .lineTo(-(radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(-30*D2R))
           .moveTo(-radius*math.cos(60*D2R),radius*math.sin(-60*D2R))
           .lineTo(-(radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(-60*D2R))
           .moveTo(-radius*math.cos(30*D2R),radius*math.sin(30*D2R))
           .lineTo(-(radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(30*D2R))
           .moveTo(-radius*math.cos(60*D2R),radius*math.sin(60*D2R))
           .lineTo(-(radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(60*D2R))
           .setStrokeLineWidth(lineWidth)
           .setColor(colorLG);
        rwr.texts = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.texts[i] = rwr.rootCenter.createChild("text")
                .setText("00")
                .setAlignment("center-center")
                .setColor(colorG)
                .setFontSize(font, 1.0)
                .hide();

        }
        rwr.symbol_hat = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_hat[i] = rwr.rootCenter.createChild("path")
                    .moveTo(0,-font)
                    .lineTo(font*0.7,-font*0.5)
                    .moveTo(0,-font)
                    .lineTo(-font*0.7,-font*0.5)
                    .setStrokeLineWidth(lineWidth)
                    .setColor(colorG)
                    .hide();
        }

 #       me.symbol_16_SAM = setsize([],max_icons);
#       for (var i = 0;i<max_icons;i+=1) {
 #          me.symbol_16_SAM[i] = me.rootCenter.createChild("path")
#                   .moveTo(-11, 7)
#                   .lineTo(-9, -7)
#                   .moveTo(-9, -7)
#                   .lineTo(-9, -4)
#                   .moveTo(-9, -8)
#                   .lineTo(-11, -4)
#                   .setStrokeLineWidth(lineWidth)
#                   .setColor(1,0,0)
#                   .hide();
#        }
        rwr.symbol_launch = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_launch[i] = rwr.rootCenter.createChild("path")
                    .moveTo(font*1.2, 0)
                    .arcSmallCW(font*1.2, font*1.2, 0, -font*2.4, 0)
                    .arcSmallCW(font*1.2, font*1.2, 0, font*2.4, 0)
                    .setStrokeLineWidth(lineWidth)
                    .setColor(colorG)
                    .hide();
        }
        rwr.symbol_new = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_new[i] = rwr.rootCenter.createChild("path")
                    .moveTo(font*1.2, 0)
                    .arcSmallCCW(font*1.2, font*1.2, 0, -font*2.4, 0)
                    .setStrokeLineWidth(lineWidth)
                    .setColor(colorG)
                    .hide();
        }
#        rwr.symbol_16_lethal = setsize([],max_icons);
#        for (var i = 0;i<max_icons;i+=1) {
#           rwr.symbol_16_lethal[i] = rwr.rootCenter.createChild("path")
#                   .moveTo(10, 10)
#                   .lineTo(10, -10)
#                   .lineTo(-10,-10)
#                   .lineTo(-10,10)
#                   .lineTo(10, 10)
#                   .setStrokeLineWidth(lineWidth)
#                   .setColor(1,0,0)
#                   .hide();
#        }
        rwr.symbol_priority = rwr.rootCenter.createChild("path")
                    .moveTo(0, font*1.2)
                    .lineTo(font*1.2, 0)
                    .lineTo(0,-font*1.2)
                    .lineTo(-font*1.2,0)
                    .lineTo(0, font*1.2)
                    .setStrokeLineWidth(lineWidth)
                    .setColor(colorG)
                    .hide();
        
#        rwr.symbol_16_air = setsize([],max_icons);
#        for (var i = 0;i<max_icons;i+=1) {
 #          rwr.symbol_16_air[i] = rwr.rootCenter.createChild("path")
#                   .moveTo(15, 0)
#                   .lineTo(0,-15)
#                   .lineTo(-15,0)
#                   .setStrokeLineWidth(lineWidth)
#                   .setColor(1,0,0)
#                   .hide();
#        }
# Threat list ID:
        #REVISION: 2023/06/08
        #OPRF Fleet
        rwr.AIRCRAFT_WARTHOG  = "10";
        rwr.AIRCRAFT_TOMCAT   = "14";
        rwr.AIRCRAFT_EAGLE    = "15";
        rwr.AIRCRAFT_FALCON   = "16";
        rwr.AIRCRAFT_FISHBED  = "21";
        rwr.AIRCRAFT_FLOGGER  = "23";
        rwr.AIRCRAFT_FLANKER  = "27";
        rwr.AIRCRAFT_FULCRUM  = "29";
        rwr.AIRCRAFT_VIGGEN   = "37";
        rwr.AIRCRAFT_BLACKBIRD = "71";
        rwr.AIRCRAFT_JAGUAR   = "JA";
        rwr.AIRCRAFT_MIRAGE   = "M2";
        rwr.AIRCRAFT_SEARCH   = "S";
        rwr.ASSET_AAA         = "A";
        rwr.ASSET_VOLGA       = "2";
        rwr.ASSET_DUBNA       = "5";
        rwr.ASSET_2K12        = "6";
        rwr.ASSET_BUK         = "11";
        rwr.ASSET_GARGOYLE    = "20"; # Other namings for tracking and radar: BB, CS.
        rwr.ASSET_PAC2        = "P";
        rwr.ASSET_FRIGATE     = "SH";
        rwr.SCENARIO_OPPONENT = "28";
        #MISC
        rwr.AIRCRAFT_FAGOT    = "MG";
        rwr.AIRCRAFT_FOXBAT   = "FB";
        rwr.AIRCRAFT_FULLBACK = "34";
        rwr.AIRCRAFT_PAKFA    = "57";
        rwr.AIRCRAFT_TYPHOON  = "EF";
        rwr.AIRCRAFT_HORNET   = "18";
        rwr.AIRCRAFT_FLAGON   = "SU";
        rwr.AIRCRAFT_PHANTOM  = "F4";
        rwr.AIRCRAFT_SKYHAWK  = "A4";
        rwr.AIRCRAFT_TIGER    = "F5";
        rwr.AIRCRAFT_TONKA    = "TO";
        rwr.AIRCRAFT_AARDVARK = "F1";
        rwr.AIRCRAFT_RAFALE   = "RF";
        rwr.AIRCRAFT_HARRIER  = "HA";
        rwr.AIRCRAFT_HARRIERII = "AV";
        rwr.AIRCRAFT_GINA     = "91";
        rwr.AIRCRAFT_MB339    = "M3";
        rwr.AIRCRAFT_ALPHAJET = "AJ";
        rwr.AIRCRAFT_INTRUDER = "A6";
        rwr.AIRCRAFT_PROWLER  = "E6";
        rwr.AIRCRAFT_FROGFOOT = "25";
        rwr.AIRCRAFT_NIGHTHAWK = "17";
        rwr.AIRCRAFT_RAPTOR   = "22";
        rwr.AIRCRAFT_JSF      = "35";
        rwr.AIRCRAFT_GRIPEN   = "39";
        rwr.AIRCRAFT_MITTEN   = "Y1";
        rwr.AIRCRAFT_ALCA     = "LC";
        rwr.AIRCRAFT_SPRETNDRD = "ET";
        rwr.AIRCRAFT_MIRAGEF1 = "M1";
        rwr.AIRCRAFT_UNKNOWN  = "U";
        rwr.AIRCRAFT_UFO      = "UK";
        rwr.ASSET_AI          = "AI";
        rwr.lookupType = {
        # OPRF fleet and related aircrafts:
                "f-14b":                    rwr.AIRCRAFT_TOMCAT,
                "F-14D":                    rwr.AIRCRAFT_TOMCAT,
                "F-15C":                    rwr.AIRCRAFT_EAGLE,
                "F-15D":                    rwr.AIRCRAFT_EAGLE,
                "F-16":                     rwr.AIRCRAFT_FALCON,
                "JA37-Viggen":              rwr.AIRCRAFT_VIGGEN,
                "AJ37-Viggen":              rwr.AIRCRAFT_VIGGEN,
                "AJS37-Viggen":             rwr.AIRCRAFT_VIGGEN,
                "JA37Di-Viggen":            rwr.AIRCRAFT_VIGGEN,
                "m2000-5":                  rwr.AIRCRAFT_MIRAGE,
                "m2000-5B":                 rwr.AIRCRAFT_MIRAGE,
                "MiG-21bis":                rwr.AIRCRAFT_FISHBED,
                "MiG-21MF-75":              rwr.AIRCRAFT_FISHBED,
                "MiG-23ML":                 rwr.AIRCRAFT_FLOGGER,
                "MiG-23MLD":                rwr.AIRCRAFT_FLOGGER,
                "MiG-29":                   rwr.AIRCRAFT_FULCRUM,
                "SU-27":                    rwr.AIRCRAFT_FLANKER,
                "EC-137R":                  rwr.AIRCRAFT_SEARCH,
                "E-3R":                     rwr.AIRCRAFT_SEARCH,
                "E-3":                      rwr.AIRCRAFT_SEARCH,
                "RC-137R":                  rwr.AIRCRAFT_SEARCH,
                "E-8R":                     rwr.AIRCRAFT_SEARCH,
                "EC-137D":                  rwr.AIRCRAFT_SEARCH,
                "gci":                      rwr.AIRCRAFT_SEARCH,
                "A-50":                     rwr.AIRCRAFT_SEARCH,
                "Blackbird-SR71A":          rwr.AIRCRAFT_BLACKBIRD,
                "Blackbird-SR71A-BigTail":  rwr.AIRCRAFT_BLACKBIRD,
                "Blackbird-SR71B":          rwr.AIRCRAFT_BLACKBIRD,
                "A-10":                     rwr.AIRCRAFT_WARTHOG,
                "A-10-model":               rwr.AIRCRAFT_WARTHOG,
                "Typhoon":                  rwr.AIRCRAFT_TYPHOON,
                "ZSU-23-4M":                rwr.ASSET_AAA,
                "S-75":                     rwr.ASSET_VOLGA,
                "buk-m2":                   rwr.ASSET_BUK,
                "SA-6":                     rwr.ASSET_2K12,
                "s-200":                    rwr.ASSET_DUBNA,
                "s-300":                    rwr.ASSET_GARGOYLE,
                "MIM104D":                  rwr.ASSET_PAC2,
                "missile_frigate":          rwr.ASSET_FRIGATE,
                "frigate":                  rwr.ASSET_FRIGATE,
                "fleet":                    rwr.ASSET_FRIGATE,
                "Mig-28":                   rwr.SCENARIO_OPPONENT,
                "Jaguar-GR1":               rwr.AIRCRAFT_JAGUAR,
        # Other threatening aircrafts (FGAddon, FGUK, etc.):
                "AI":                       rwr.ASSET_AI,
                "SU-37":                    rwr.AIRCRAFT_FLANKER,
                "J-11A":                    rwr.AIRCRAFT_FLANKER,
                "daVinci_SU-34":            rwr.AIRCRAFT_FULLBACK,
                "Su-34":                    rwr.AIRCRAFT_FULLBACK,
                "T-50":                     rwr.AIRCRAFT_PAKFA,
                "MiG-21Bison":              rwr.AIRCRAFT_FISHBED,
                "Mig-29":                   rwr.AIRCRAFT_FULCRUM,
                "EF2000":                   rwr.AIRCRAFT_TYPHOON,
                "F-15C_Eagle":              rwr.AIRCRAFT_EAGLE,
                "F-15J_ADTW":               rwr.AIRCRAFT_EAGLE,
                "F-15DJ_ADTW":              rwr.AIRCRAFT_EAGLE,
                "f16":                      rwr.AIRCRAFT_FALCON,
                "F-16CJ":                   rwr.AIRCRAFT_FALCON,
                "FA-18C_Hornet":            rwr.AIRCRAFT_HORNET,
                "FA-18D_Hornet":            rwr.AIRCRAFT_HORNET,
                "FA-18E_CVW5":              rwr.AIRCRAFT_HORNET,
                "FA-18":                    rwr.AIRCRAFT_HORNET,
                "f18":                      rwr.AIRCRAFT_HORNET,
                "F-111C":                   rwr.AIRCRAFT_AARDVARK,
                "daVinci_F-111G":           rwr.AIRCRAFT_AARDVARK,
                "A-10-modelB":              rwr.AIRCRAFT_WARTHOG,
                "Su-15":                    rwr.AIRCRAFT_FLAGON,
                "jaguar":                   rwr.AIRCRAFT_JAGUAR,
                "Jaguar-GR3":               rwr.AIRCRAFT_JAGUAR,
                "E3B":                      rwr.AIRCRAFT_SEARCH,
                "E-2C-Hawkeye":             rwr.AIRCRAFT_SEARCH,
                "onox-awacs":               rwr.AIRCRAFT_SEARCH,
                "u-2s":                     rwr.AIRCRAFT_SEARCH,
                "U-2S-model":               rwr.AIRCRAFT_SEARCH,
                "F-4C":                     rwr.AIRCRAFT_PHANTOM,
                "F-4D":                     rwr.AIRCRAFT_PHANTOM,
                "F-4E":                     rwr.AIRCRAFT_PHANTOM,
                "F-4EJ":                    rwr.AIRCRAFT_PHANTOM,
                "F-4EJ_ADTW":               rwr.AIRCRAFT_PHANTOM,
                "F-4F":                     rwr.AIRCRAFT_PHANTOM,
                "F-4J":                     rwr.AIRCRAFT_PHANTOM,
                "F4J":                      rwr.AIRCRAFT_PHANTOM,
                "F-4N":                     rwr.AIRCRAFT_PHANTOM,
                "F-4S":                     rwr.AIRCRAFT_PHANTOM,
                "FGR2":                     rwr.AIRCRAFT_PHANTOM,
                "FGR2-Phantom":             rwr.AIRCRAFT_PHANTOM,
                "a4f":                      rwr.AIRCRAFT_SKYHAWK,
                "A-4K":                     rwr.AIRCRAFT_SKYHAWK,
                "F-5E":                     rwr.AIRCRAFT_TIGER,
                "F-5E-TigerII":             rwr.AIRCRAFT_TIGER,
                "F-5ENinja":                rwr.AIRCRAFT_TIGER,
                "f-20A":                    rwr.AIRCRAFT_TIGER,
                "f-20C":                    rwr.AIRCRAFT_TIGER,
                "f-20prototype":            rwr.AIRCRAFT_TIGER,
                "f-20bmw":                  rwr.AIRCRAFT_TIGER,
                "f-20-dutchdemo":           rwr.AIRCRAFT_TIGER,
                "Tornado-GR4a":             rwr.AIRCRAFT_TONKA,
                "Tornado-IDS":              rwr.AIRCRAFT_TONKA,
                "Tornado-F3":               rwr.AIRCRAFT_TONKA,
                "Tornado-ADV":              rwr.AIRCRAFT_TONKA,
                "brsq":                     rwr.AIRCRAFT_RAFALE,
                "Harrier-GR1":              rwr.AIRCRAFT_HARRIER,
                "Harrier-GR3":              rwr.AIRCRAFT_HARRIER,
                "Harrier-GR5":              rwr.AIRCRAFT_HARRIER,
                "Harrier-GR9":              rwr.AIRCRAFT_HARRIER,
                "AV-8B":                    rwr.AIRCRAFT_HARRIERII,
                "G91-R1B":                  rwr.AIRCRAFT_GINA,
                "G91":                      rwr.AIRCRAFT_GINA,
                "g91":                      rwr.AIRCRAFT_GINA,
                "mb339":                    rwr.AIRCRAFT_MB339,
                "mb339pan":                 rwr.AIRCRAFT_MB339,
                "alphajet":                 rwr.AIRCRAFT_ALPHAJET,
                #"MiG-15bis":               rwr.AIRCRAFT_FAGOT,
                "Su-25":                    rwr.AIRCRAFT_FROGFOOT,
                "MiG-25":                   rwr.AIRCRAFT_FOXBAT,
                "A-6E-model":               rwr.AIRCRAFT_INTRUDER,
                "A-6E":                     rwr.AIRCRAFT_INTRUDER,
                "ea-6b":                    rwr.AIRCRAFT_PROWLER,
                "F-117":                    rwr.AIRCRAFT_NIGHTHAWK,
                "F-22-Raptor":              rwr.AIRCRAFT_RAPTOR,
                "F-35A":                    rwr.AIRCRAFT_JSF,
                "F-35B":                    rwr.AIRCRAFT_JSF,
                "F-35C":                    rwr.AIRCRAFT_JSF,
                "daVinci_F-35A":            rwr.AIRCRAFT_JSF,
                "daVinci_F-35B":            rwr.AIRCRAFT_JSF,
                "JAS-39C_Gripen":           rwr.AIRCRAFT_GRIPEN,
                "gripen":                   rwr.AIRCRAFT_GRIPEN,
                "Yak-130":                  rwr.AIRCRAFT_MITTEN,
                "L-159":                    rwr.AIRCRAFT_ALCA,
                "super-etendard":           rwr.AIRCRAFT_SPRETNDRD,
                "Mirage_F1-model":          rwr.AIRCRAFT_MIRAGEF1,
                "USS-NORMANDY":             rwr.ASSET_FRIGATE,
                "USS-LakeChamplain":        rwr.ASSET_FRIGATE,
                "USS-OliverPerry":          rwr.ASSET_FRIGATE,
                "USS-SanAntonio":           rwr.ASSET_FRIGATE,
                "mp-nimitz":                rwr.ASSET_FRIGATE,
                "mp-eisenhower":            rwr.ASSET_FRIGATE,
                "mp-vinson":                rwr.ASSET_FRIGATE,
                "mp-clemenceau":            rwr.ASSET_FRIGATE,
                "ufo":                      rwr.AIRCRAFT_UFO,
                "bluebird-osg":             rwr.AIRCRAFT_UFO,
                "Vostok-1":                 rwr.AIRCRAFT_UFO,
                "V-1":                      rwr.AIRCRAFT_UFO,
                "SpaceShuttle":             rwr.AIRCRAFT_UFO,
                "F-23C_BlackWidow-II":      rwr.AIRCRAFT_UFO,
        };
        rwr.shownList = [];
        #
        # recipient that will be registered on the global transmitter and connect this
        # subsystem to allow subsystem notifications to be received
        rwr.recipient = emesary.Recipient.new(_ident);
        rwr.recipient.parent_obj = rwr;

        rwr.recipient.Receive = func(notification)
        {
            if (notification.NotificationType == "FrameNotification")
            {
                #
                # Link16 wingmen only visible when no other threats. So check the size of this list
                # first and if populated use it.
                if (notification["rwrList"] != nil and size(notification.rwrList)>0)
                  me.parent_obj.update(notification.rwrList, "normal");
                else if (notification["rwrList16"] != nil)
                  me.parent_obj.update(notification.rwrList16, "link16");
                return emesary.Transmitter.ReceiptStatus_OK;
            }
            return emesary.Transmitter.ReceiptStatus_NotProcessed;
        };
        emesary.GlobalTransmitter.Register(rwr.recipient);

        return rwr;
    },
    update: func (list, type) {
        #printf("list %d", size(list));
        me.elapsed = getprop("sim/time/elapsed-sec");
        var sorter = func(a, b) {
            if(a[1] > b[1]){
                return -1; # A should before b in the returned vector
            }elsif(a[1] == b[1]){
                return 0; # A is equivalent to b 
            }else{
                return 1; # A should after b in the returned vector
            }
        }
        me.sortedlist = sort(list, sorter);
        me.newList = [];
        me.i = 0;
        me.prio = 0;
        me.newsound = 0;
        me.unk = 0;
        foreach(me.contact; me.sortedlist) {
            me.typ=me.lookupType[me.contact[0].get_model()];
            if (me.i > me.max_icons-1) {
                break;
            }
            if (me.typ == nil) {
                if (me.contact[0].propNode.getName() != "multiplayer") {
                    # AI planes are allowed to be unknowns
                    me.typ = me.AIRCRAFT_UNKNOWN;
                    me.unk = 1;
                } else {
                    continue;
                }
            }
            #print("show "~me.i~" "~me.typ~" "~contact[0].get_model()~"  "~contact[1]);
            me.threat = me.contact[1];#print(me.threat);
            
            if (me.threat > 0.5 and me.typ != me.AIRCRAFT_UNKNOWN and me.typ != me.ASSET_AI) {
                me.threat = me.inner_radius;# inner circle
            } elsif (me.threat > 0) {
                me.threat = me.outer_radius;# outer circle
            } else {
                continue;
            }
            if (me.contact[0].get_range() > 170) {
                continue;
            }
            me.dev = -geo.normdeg180(me.contact[0].get_bearing()-getprop("orientation/heading-deg"))+90;
            me.x = math.cos(me.dev*D2R)*me.threat;
            me.y = -math.sin(me.dev*D2R)*me.threat;
            me.texts[me.i].setTranslation(me.x,me.y);
            me.texts[me.i].setText(me.typ);
            me.texts[me.i].show();
            if (me.prio == 0 and me.typ != me.ASSET_AI and me.typ != me.AIRCRAFT_UNKNOWN) {# 
                me.symbol_priority.setTranslation(me.x,me.y);
                me.symbol_priority.show();
                me.prio = 1;
            }
            if (!(me.typ == me.ASSET_GARGOYLE or me.typ == me.ASSET_AAA or me.typ == me.ASSET_VOLGA or me.typ == me.ASSET_2K12 or me.typ == me.ASSET_BUK or me.typ == me.ASSET_PAC2 or me.typ == me.ASSET_FRIGATE) and me.contact[0].get_Speed()>60) {
                #air-borne
                me.symbol_hat[me.i].setTranslation(me.x,me.y);
                me.symbol_hat[me.i].show();
            } else {
                me.symbol_hat[me.i].hide();
            }
            if (me.contact[0].get_Callsign()==getprop("sound/rwr-launch") and 10*(me.elapsed-int(me.elapsed))>5) {#blink 2Hz
                me.symbol_launch[me.i].setTranslation(me.x,me.y);
                me.symbol_launch[me.i].show();
            } else {
                me.symbol_launch[me.i].hide();
            }
            me.popupNew = me.elapsed;
            foreach(me.old; me.shownList) {
                if(me.old[0].getUnique()==me.contact[0].getUnique()) {
                    me.popupNew = me.old[1];
                    break;
                }
            }
            if (me.popupNew == me.elapsed) {
                me.newsound = 1;
            }
            if (me.popupNew > me.elapsed-me.fadeTime) {
                me.symbol_new[me.i].setTranslation(me.x,me.y);
                me.symbol_new[me.i].show();
                me.symbol_new[me.i].update();
            } else {
                me.symbol_new[me.i].hide();
            }
            #printf("display %s %d",contact[0].get_Callsign(), me.threat);
            append(me.newList, [me.contact[0],me.popupNew]);
            me.i += 1;
        }
        me.shownList = me.newList;
        if (me.newsound == 1) setprop("sound/rwr-new", !getprop("sound/rwr-new"));
        for (;me.i<me.max_icons;me.i+=1) {
            me.texts[me.i].hide();
            me.symbol_hat[me.i].hide();
            me.symbol_new[me.i].hide();
            me.symbol_launch[me.i].hide();
        }
        if (me.prio == 0) {
            me.symbol_priority.hide();
        }
        setprop("sound/rwr-pri", me.prio);
        setprop("sound/rwr-unk", me.unk);
    },
};
var rwr = nil;
var cv = nil;
# var main_init_listener = setlistener("sim/signals/fdm-initialized", func {
#   if (getprop("sim/signals/fdm-initialized") == 1) {
#      var diam = 256;
#      cv = canvas.new({
#         "name": "Rwr",
#         "size": [diam,diam], 
#         "view": [diam,diam],
#         "mipmapping": 1
#     });  

# # #   cv.addPlacement({"node": "bkg", "texture":"rwr-bkg.png"});
#     cv.setColorBackground(0, 0.20, 0);
#     var root = cv.createGroup();
#     rwr = RWRCanvas.new(root, [diam/2,diam/2],diam);
#      removelistener(main_init_listener);
#   }
#  }, 0, 0);

var openDialog = func(){
    return;
   var diam = 256;
     cv = canvas.new({
        "name": "Rwr",
        "size": [diam,diam], 
        "view": [diam,diam],
        "mipmapping": 1
      });  
        
    cv.setColorBackground(0, 0.20, 0);
    var root = cv.createGroup();
    
    rwr = RWRCanvas.new(root, [diam/2,diam/2],diam);
  
  
  var window = canvas.Window.new([256,256],"Rwr");
  window.setCanvas(cv);
}

var setGroup = func (root) {
    root.createChild("path").horiz(768).vert(576).horiz(-768).vert(-576).setColorFill(0,0,0).setColor(0,0,0);
    rwr = RWRCanvas.new("RWRCanvas",root, [768/2,576/2],576);
};
