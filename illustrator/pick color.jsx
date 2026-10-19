#target Illustrator
#include "RandomSwatchesFill-embed.js"

var os = $.os.toLowerCase().indexOf("mac") >= 0 ? "mac" : "win";
if (os == "mac") {
    var Path = "/Users/chrisgolle/OneDrive/Desktop"
    var patFolder = Folder("/Applications/Adobe Photoshop CC 2017/Presets/Patterns/");
} else {
    var Path = Folder.desktop;
    var patFolder = Folder("/C/Program Files/Adobe/Adobe Photoshop CC 2019/Presets/Patterns/");
}

    var file = File(Path + "/curiosity2.ai")
    for (var i = 0; i < 3; i++) {
        var doc = app.open(file)
        var mySelection = doc.pageItems;
    swatchesFill()
    var saveOpts
    var saveName = 'color' + i
    var originalInteractionLevel = userInteractionLevel;
    userInteractionLevel = UserInteractionLevel.DONTDISPLAYALERTS;
    doc.saveAs( saveName, saveOpts );
    userInteractionLevel = originalInteractionLevel;
    }
