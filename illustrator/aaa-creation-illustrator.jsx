// #target Illustrator
#include "./json2.js";
#include "./CircleFill-embed.jsx"
#include "RandomSwatchesFill-embed.js"

var saveFile = 1; // save the results
var shirtW = 10; // width - size 10x12 for women, 12x16 for men and unisex
var shirtH = 12; // height
var compression = 3 // png size 0 to 9
var translate = -2; // -2 ?
var printfulsize = 1; // if 0, keep trimmed version
var resolution = 300; // px per inch
var stroke = 50 // pt

var os = $.os.toLowerCase().indexOf("mac") >= 0 ? "mac" : "win";
if (os == "mac") {
    var Path = "/Users/chrisgolle/OneDrive/Desktop"
    var patFolder = Folder("/Applications/Adobe Photoshop CC 2017/Presets/Patterns/");
} else {
    var Path = Folder.desktop;
    var patFolder = Folder("/C/Program Files/Adobe/Adobe Photoshop CC 2019/Presets/Patterns/");
}
// var textFile = new File(Folder.desktop + "/name list1.txt");
var textFile = new File(Path + "/name list.txt");
var list = readText(textFile).split("\n");

// the big loop 
for (var i = 0; i < list.length; i++) {
    docW = shirtW * 72;
    docH = shirtH * 72;
    // var doc = app.documents.add(undefined, docW, docH);
    var file = File(Path + "/lull-template.ai")
    var doc = app.open(file)
    doc.outputResolution = resolution
    doc.width = docW
    doc.height = docH
    layerFill = doc.activeLayer
    layerFill.name = "fill"
    var layerStroke = doc.layers.add()
    doc.activeLayer.name = 'stroke'
    var layerCircles = doc.layers.add()
    doc.activeLayer.name = 'circles'

    var row = list[i].split(";");
    var rowStrength = row[0];
    var rowLang = row[1];
    var rowNames = row[2].split("%");
    var rowColor = row[3];
    var rowBckColor = row[4];
    var strokeHex = rowBckColor; // override further if patchwork
    var filters = JSON.parse(row[5]);
    var patternType = parseInt(row[6]);
    var rowProfit = row[7];
    var rowFont = row[8];
    // var rowRTL = row[9];
    var output = rowNames[0];
    for (var j = 1; j < rowNames.length; j++) {
        output += "\r" + rowNames[j];
    }

    var myTextFrame = doc.textFrames.add()
    myTextFrame.top = 20
    myTextFrame.contents = output

    switch (rowFont) {
        case "luci":
            fontName = "LucidaHandwriting-Italic";
            break;
        case "sacra":
            fontName = "Sacramento-Regular";
            break;
        case "dance":
            fontName = "DancingScript";
            break;
        case "school":
            fontName = "Schoolbell";
            break;
        case "did":
            fontName = "Didot";
            break;
        case "tamil":
            fontName = "TamilMN";
            break;
        case "paris":
            fontName = "Parisienne-Regular";
            break;
        case "noto":
            fontName = "NotoSerif-SemiCondensedSemiBoldItalic";
            break;
        case "notolight":
            fontName = "NotoSerif-Light";
            break;
        case "ja":
            fontName = "RoundedMplus1c-Bold";
            break;
        case "ru":
            fontName = "MarckScript-Regular";
            break;
        case "ko":
            fontName = "SingleDay-Regular";
            break;
        case "zh":
            fontName = "MaShanZheng-Regular";
            break;
        case "gr":
            fontName = "GFSDidot-Regular";
            break;
        case "il":
            fontName = "RoundedMplus1c-Bold";
            break;
        case "kh":
            fontName = "Fasthand-Regular";
            break;
        case "th":
            fontName = "Mali-SemiBold";
            break;
        case "ar":
            fontName = "BalooBhaijaan-Regular";
            break;
    }

    myTextFrame.textRange.characterAttributes.textFont = app.textFonts.getByName(fontName)
    myTextFrame.height = myTextFrame.height * docW / myTextFrame.width;
    myTextFrame.width = docW
    var lowerBound = myTextFrame.top - myTextFrame.height
    doc.pageItems.selected = true
    app.doScript("Explode", "Lullberry");

    // letters stroke
    var myPageItems = doc.pageItems;
    var nb = myPageItems.length
    var objectToFill = []
    for (var k = 0; k < nb; k++) {
        var artItem = myPageItems[k];
        artItem.stroked = true
        artItem.strokeWidth = stroke
    }

    // expand and reorganize objects
    app.executeMenuCommand("selectall");
    app.executeMenuCommand ('Live Outline Stroke');
    app.executeMenuCommand ('expandStyle');

    for (var k = 0; k < doc.groupItems.length; k++) {
        doc.groupItems[k].pageItems[1].move(layerFill, ElementPlacement.PLACEATBEGINNING)
        doc.groupItems[k].pageItems[0].move(layerCircles, ElementPlacement.PLACEATBEGINNING)
    }

    // sprinkle pathItems with circles, needs to happens twice because pageItems counts inside compoundPaths and returns higher nb
    objectToFill = []
    var nb = layerCircles.pathItems.length
    // alert('nb= ' + nb)
    for (var k = nb-1; k >=0; k--) {
        var artItem = layerCircles.pathItems[k];
        objectToFill[nb-1-k] = artItem
        artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
    }
    // alert('objectToFill ' + objectToFill.length)
    for (var k = 0; k < nb; k++) { // must be done in 2 steps, otherwise enters a loop
        // alert('we fill nb ' + k + ' of ' + nb)
        circleFill(objectToFill[k], 1, 20, 10) // min max distance
    }

    // sprinkle compoundPathItems with circles
    objectToFill = []
    var nb = layerCircles.compoundPathItems.length
    // alert('nb= ' + nb)
    for (var k = nb-1; k >=0; k--) {
        var artItem = layerCircles.compoundPathItems[k];
        objectToFill[nb-1-k] = artItem
        artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
    }
    // alert('objectToFill ' + objectToFill.length)
    for (var k = 0; k < nb; k++) { // must be done in 2 steps, otherwise enters a loop
        // alert('we fill nb ' + k + ' of ' + nb)
        circleFill(objectToFill[k], 1, 20, 10) // min max distance
    }

    // circles first stroke
    var nb = layerCircles.pageItems.length
    for (var k = 0; k < nb; k++) {
        var artItem = layerCircles.pageItems[k];
        artItem.stroked = true
        artItem.strokeWidth = artItem.width/3
    }
    app.executeMenuCommand("selectall");
    app.executeMenuCommand ('Live Outline Stroke');
    app.executeMenuCommand ('expandStyle');
    ungroup(layerCircles)

    // circles second stroke
    var nb = layerCircles.pageItems.length
    for (var k = 0; k < nb; k++) {
        var artItem = layerCircles.pageItems[k];
        artItem.stroked = true
        artItem.strokeWidth = artItem.width/6
    }
    app.executeMenuCommand("selectall");
    app.executeMenuCommand ('Live Outline Stroke');
    app.executeMenuCommand ('expandStyle');
    ungroup(layerCircles)

    // apply random opacity
    var opMax = 100
    var opMin = 30
    var nb = layerCircles.pageItems.length
    for (var k = 0; k < nb; k++) {
        var artItem = layerCircles.pageItems[k];
        // alert('artItem.top ' + artItem.top + 'lowerBound ' + lowerBound + 'myTextFrame.height' + myTextFrame.height)
        var coeff = (artItem.top - lowerBound + stroke) / (myTextFrame.height + 2*stroke) // 0 to 1, the higher it is, the lower the opacity
        // alert (coeff)
        artItem.opacity = (Math.floor(Math.random() * (opMax - opMin + 1)) + opMin) * (1-coeff) ; // random opacity / coeff
    }

    layerStroke.visible = false
    swatchesFill(layerStroke, 'Earthtone 1') // colorize randomly with palette
    swatchesFill(layerCircles, 'Earthtone 2') // colorize randomly with palette
    // var effectStr_2 = '<LiveEffect name="Adobe Deform"><Dict data="R DeformValue 0.45 R DeformVert 0 B Rotate 0 I DeformStyle 1 R DeformHoriz 0 "/></LiveEffect>';
    // myTextFrame.applyEffect(effectStr_2);

    var Name = rowStrength + "-" + rowLang + "-" + rowFont + "-" + rowProfit;
    var dest = File(Path + "/" + Name + "-std.png");
    sfwPNG24(dest);
    // activeDocument.activeLayer = activeDocument.layers.getByName("text"); // go back to our layer
    // flipLayer(0); // Flip text layer horizontally
    // activeDocument.activeLayer = activeDocument.layers.getByName("grid"); // go back to our layer
    // flipLayer(0); // Flip grid layer horizontally    
    var dest = File(Path + "/" + Name + "-mirror.png");
    // sfwPNG24(dest);
}

// save the images
function sfwPNG24(dest) {
    var saveName = new File(dest);
    var exportOptions = new ExportOptionsPNG24();
    // pngOpts.compression = compression;
    // pngOpts.interlaced = false;
    if (dest != 0) {
        // doc.exportFile(saveName, ExportType.PNG24, exportOptions);
    }
}

function ungroup(theLayer) {
    var layer = theLayer
    var groups = layer.groupItems;
    for (d=0;d<groups.length;d++){
        layer.groupItems[d].selected = true
        app.executeMenuCommand ('ungroup');
        // var mygroups = groups;
        // for (k=mygroups.pageItems.length-1; k>=0; k--)
        //     mygroups.pageItems.move(layer, ElementPlacement.PLACEATBEGINNING);
     }
}

// function flipLayer(type) {
//     if(type == 0) pos ='Hrzn';
//     if(type == 1) pos ='Vrtc';
//      var desc = new ActionDescriptor();
//      desc.putEnumerated( charIDToTypeID('Axis'), charIDToTypeID('Ornt'), charIDToTypeID(pos) );
//     executeAction( charIDToTypeID('Flip'), desc, DialogModes.NO );
//  }; 

function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

function searchPattern(patternName) {
    for (var i = 0; i < patterns.length; i++) {
        if (patterns[i].name === patternName) {
            return (i);
        }
    }
}

// used in the big loop
// function createSmartObject(layer) {
//     var idnewPlacedLayer = stringIDToTypeID("newPlacedLayer");
//     executeAction(idnewPlacedLayer, undefined, DialogModes.NO);
// }

// function getPatterns(file) {
//     file.open("r");
//     file.encoding = "BINARY";
//     var str = file.read();
//     file.close();
//     var result = [];
//     var re = /(\x00\w|\x00\d)(\x00\-|\x00\w|\x00\s|\x00\d)+\x00\x00\$[-a-z\d]+/g;
//     var parts = str.match(re);
//     for (var i = 0; i < parts.length; i++) {
//         var p = parts[i];
//         var sp = p.replace(/\x00/g, "").split("$");
//         result.push({
//             "name": sp[0].replace(/\s/g, ""),
//             "path": file.name.replace(/%20/g, "").replace(/\./g, "_") + "/" + sp[0].replace(/\s/g, ""),
//             "id": sp[1]
//         });
//         // if (sp[0].indexOf("ck Marble") != -1) {alert(sp[0].replace(/\s/g, "") + " - " + sp[1]);}
//     }
//     return result;
// };

// read the .txt
function readText(file) {
    if (textFile.exists) {
        textFile.encoding = "UTF8";
        textFile.lineFeed = "unix";
        textFile.open("r", "TEXT", "????");
        var str = textFile.read();
        textFile.close();
        return str;
    }
}