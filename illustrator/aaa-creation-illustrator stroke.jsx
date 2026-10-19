// #target Illustrator
#include "./json2.js"
#include "./CircleFill-embed.jsx"
#include "./RandomSwatchesFill-embed.js"

var saveFile = 1 // save the results
var shirtW = 10 // width - size 10x12 for women, 12x16 for men and unisex
var shirtH = 12 // height
var compression = 3 // png size 0 to 9
var translate = -2 // -2 ?
var printfulsize = 1 // if 0, keep trimmed version
var resolution = 300 // px per inch
var topMargin = 100
var stroke = 70
var strokeFirstCoeff = 2 // the higher, the thinner the 1st stroke
var strokeSecondCoeff = 4 // idem
var strokeDotsFirstCoeff = 6 // the higher, the thinner the 1st stroke
var strokeDotsSecondCoeff = 8 // idem
var circleFillMin = 2
var circleFillMax = 10
var circleFillDist = 20
// var palette = 'Earthtone 3'
var palette = 'Brights'
var opMax = 100 // max circles opacity 
var opMin = 60
var opDotMax = 100 // max dots opacity
var opDotMin = 50
var dotsCutoff = 6000 // smaller areas are considered dots
var cutoffCoeff = 1 // used in circleFill() to hide circles as height increases

docW = shirtW * 72;
docH = shirtH * 72;

var os = $.os.toLowerCase().indexOf("mac") >= 0 ? "mac" : "win";
if (os == "mac") {
    var Path = "/Users/chrisgolle/OneDrive/Desktop"
    // var patFolder = Folder("/Applications/Adobe Photoshop CC 2017/Presets/Patterns/");
} else {
    // var Path = Folder("C:\Users\chris\Downloads\vettori191\Sandbox\Adobe Illustrator CC 2019");
    var Path = Folder.desktop;
    // var patFolder = Folder("/C/Program Files/Adobe/Adobe Photoshop CC 2019/Presets/Patterns/");
    topMargin = -docH + topMargin;
}
var textFile = new File(Path + "/name list.txt");
var list = readText(textFile).split("\n");

// the big loop 
for (var i = 0; i < list.length; i++) {
    var doc = app.documents.add(undefined, docW, docH);
    var file = File(Path + "/lull-template.ai")
    // var doc = app.open(file)
    doc.outputResolution = resolution
    doc.width = docW
    doc.height = docH
    layerFill = doc.activeLayer
    layerFill.name = "fill"
    var layerDots = doc.layers.add()
    doc.activeLayer.name = 'dots'
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
        default:
        fontName = 'Arial';
    }

    // myTextFrame.textRange.characterAttributes.textFont = app.textFonts.getByName(fontName)
    myTextFrame.height = myTextFrame.height * docW / myTextFrame.width;
    myTextFrame.width = docW
    myTextFrame.top = -topMargin
    doc.pageItems.selected = true
    app.doScript("Explode", "Lullberry");

    // letters stroke
    var myPageItems = doc.pageItems;
    var nb = myPageItems.length
    var objectToFill = []
    for (var k = 0; k < nb; k++) {
        var artItem = myPageItems[k];
        // alert('w ' + artItem.width + ' h ' + artItem.height + ' left ' + artItem.left + ' top ' + artItem.top)
        if (artItem.width * artItem.height > dotsCutoff) { // there is no area method for compound paths
            artItem.stroked = true
            artItem.strokeWidth = stroke
        }
    }

    // expand and reorganize objects
    app.executeMenuCommand("selectall");
    app.executeMenuCommand('Live Outline Stroke');
    app.executeMenuCommand('expandStyle');

    for (var k = 0; k < layerCircles.groupItems.length; k++) { // small areas elements (fills) stay with the strokes in the layerCircles 
        layerCircles.groupItems[k].pageItems[1].move(layerFill, ElementPlacement.PLACEATBEGINNING)
        layerCircles.groupItems[k].pageItems[0].move(layerCircles, ElementPlacement.PLACEATBEGINNING)
    }

    // first calculation to send it to circleFill
    var upperBound = doc.geometricBounds[1]
    var lowerBound = doc.geometricBounds[3]
    var artH = upperBound - lowerBound // height of visible art

    // sprinkle pathItems with circles, needs to happens twice because pageItems counts inside compoundPaths and returns higher nb
    objectToFill = []
    var nb = layerCircles.pathItems.length
    for (var k = nb - 1; k >= 0; k--) {
        var artItem = layerCircles.pathItems[k];
        if (artItem.width * artItem.height > dotsCutoff) {
            objectToFill.push(artItem)
            artItem.filled = true // in case we want to color the strokes later
            artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
        } else {
            // artItem.name = 'dot'
            artItem.move(layerDots, ElementPlacement.PLACEATBEGINNING)
        }
    }

    for (var k = 0; k < objectToFill.length; k++) { // must be done in 2 steps, otherwise enters a loop
        circleFill(objectToFill[k], circleFillMin, circleFillMax, circleFillDist) // min max distance
    }

    // sprinkle compoundPathItems with circles
    objectToFill = []
    var nb = layerCircles.compoundPathItems.length
    for (var k = nb - 1; k >= 0; k--) {
        var artItem = layerCircles.compoundPathItems[k];
        if (artItem.width * artItem.height > dotsCutoff) {
            objectToFill.push(artItem)
            artItem.filled = true // in case we want to color the strokes later
            artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
        } else {
            // artItem.name = 'dot'
            artItem.move(layerDots, ElementPlacement.PLACEATBEGINNING)
        }
    }

    for (var k = 0; k < objectToFill.length; k++) { // must be done in 2 steps, otherwise enters a loop
        circleFill(objectToFill[k], circleFillMin, circleFillMax, circleFillDist) // min max distance
    }

    // circles first stroke
    var nb = layerCircles.pageItems.length
    for (var k = 0; k < nb; k++) {
        var artItem = layerCircles.pageItems[k];
        artItem.stroked = true
        artItem.strokeWidth = artItem.width / strokeFirstCoeff
    }
    app.executeMenuCommand("selectall");
    app.executeMenuCommand('Live Outline Stroke');
    app.executeMenuCommand('expandStyle');
    ungroup(layerCircles)

    // circles second stroke
    var nb = layerCircles.pageItems.length
    for (var k = 0; k < nb; k++) {
        var artItem = layerCircles.pageItems[k];
        artItem.stroked = true
        artItem.strokeWidth = artItem.width / strokeSecondCoeff
    }
    app.executeMenuCommand("selectall");
    app.executeMenuCommand('Live Outline Stroke');
    app.executeMenuCommand('expandStyle');
    ungroup(layerCircles)

    // does not work: computed offset can't be expanded like handmade ones
    // var offsetvalue = 5;
    // var jointype = 2;
    // var miterlimitvalue = 4;
    // xmlstring = '<LiveEffect name="Adobe Offset Path"><Dict data="R mlim '+miterlimitvalue + ' R ofst ' + offsetvalue + ' I jntp ' + jointype + '"/></LiveEffect>'
    // artItem.applyEffect(xmlstring);

        // dots that are path: first stroke
        var nb = layerDots.pathItems.length
        for (var k = 0; k < nb; k++) {
            var artItem = layerDots.pathItems[k];
            artItem.stroked = true
            artItem.strokeWidth = artItem.width / strokeDotsFirstCoeff
        }
        // dots that are compoundpath: first and second stroke
        var nbCompound = layerDots.compoundPathItems.length
        for (var j = nbCompound-1; j >=0 ; j--) {
            var artPaths = layerDots.compoundPathItems[j];
            app.redraw(); // otherwise deselectall not working in adobe illustrator 2019
            app.executeMenuCommand("deselectall");
            artPaths.selected = true;
            app.doScript("OffsetPath+5", "Lullberry");
            // app.doScript("OffsetPath-5", "Lullberry");
        }
        app.executeMenuCommand("selectall");
        app.executeMenuCommand('Live Outline Stroke');
        app.executeMenuCommand('expandStyle');
        ungroup(layerDots)
    
        // dots that are path and compound path: second stroke
        var nb = layerDots.pageItems.length
        for (var k = 0; k < nb; k++) {
            var artItem = layerDots.pageItems[k];
            artItem.stroked = true
            artItem.strokeWidth = artItem.width / strokeDotsSecondCoeff
        }        
        app.executeMenuCommand("selectall");
        app.executeMenuCommand('Live Outline Stroke');
        app.executeMenuCommand('expandStyle');
        ungroup(layerDots)

        // reverse order so that smaller circles appear in front of larger stroked ones
        var nb = doc.pageItems.length
        for (var k = nb-1; k >=0 ; k--) {
            var artItem = doc.pageItems[k];
            artItem.zOrder(ZOrderMethod.SENDTOBACK)
        }  
        // recalculate to include strokes
    var upperBound = doc.geometricBounds[1]
    var lowerBound = doc.geometricBounds[3]
    var artH = upperBound - lowerBound // height of visible art

    // apply random opacity to circles
    var nb = layerCircles.pageItems.length
    if (nb != 0) {
        for (var k = 0; k < nb; k++) {
            var artItem = layerCircles.pageItems[k];
            var coeff = (artItem.top - artItem.height - lowerBound) / artH // 0 to 1, rises with y coordinate
            try {
                    opMin *= (1-coeff)
                    artItem.opacity = Math.round((Math.floor(Math.random() * (opMax - opMin + 1)) + opMin)) // * (1 - coeff) ^ .5;
                } // random opacity 
             catch (err) {
                alert(err + ' at circle nb ' + k + '  ' + coeff + '  ' + artItem.top + '  ' + lowerBound + '  ' + artH + ' opmin ' + opMin + ' opa  ' + (Math.floor(Math.random() * (opMax - opMin + 1)) + opMin))
                break;
            }
        }
    }
    // apply random opacity to dots
    var nb = layerDots.pageItems.length
    if (nb != 0) {
        for (var k = 0; k < nb; k++) {
            var artItem = layerDots.pageItems[k];
            try {
                artItem.opacity = (Math.floor(Math.random() * (opDotMax - opDotMin + 1)) + opDotMin);
            } // random opacity 
             catch (err) {
                alert(err + '  ' + coeff + '  ' + artItem.top + '  ' + lowerBound + '  ' + artH)
                break;
            }
        }
    }

    layerStroke.visible = false
    // swatchesFill(layerStroke, palette) // colorize randomly with palette
    swatchesFill(layerDots, palette) // colorize randomly with palette
    swatchesFill(layerCircles, palette) // colorize randomly with palette
    swatchesFill(layerFill, palette) // colorize randomly with palette
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
    for (d = 0; d < groups.length; d++) {
        layer.groupItems[d].selected = true
        app.executeMenuCommand('ungroup');
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