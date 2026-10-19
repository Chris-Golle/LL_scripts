#target Illustrator
#include "./json2.js";
#include "./smartAlign2.jsx"
var saveFile = 1; // save the results
var shirtW = 10; // width - size 10x12 for women, 12x16 for men and unisex
var shirtH = 12; // height
var compression = 3 // png size 0 to 9
var translate = -2; // -2 ?
var printfulsize = 1; // if 0, keep trimmed version
// app.preferences.rulerUnits = Units.INCHES;
var resolution = 300; // px per inch
// stroke
var strokesize = 6; // size in px
// var strokeHex = "64b3b4"; // color
// filters
var sizePntl = 300; // override further down, pointillize 0 to 300
var sizeStng = 40; // stained glass 0 to 50
var borderStng = 1; // stained glass border
var patchworkSize = 5; // patchwork 0 to 10
var sizePntd = 28; // override further down, paint daubs 0 to 50
var sharpPntd = 0; // paint daubs 0 to 40

// bevel
var bevelHexH = "ffffff"; // highlight color
var bevelPcH = 50; // highlight % opacity
var bevelHexS = "000000"; // shadow color
var bevelPcS = 20; // shadow % opacity
var bevelDepth = 100; // depth
var bevelSize = 3; // size 12 for soft, 200 for hard
var bevelSoften = 6; // soften 5 for soft, 3 for hard

// inner glow
var glowHex = "dbf5f7"; // color

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

// load system patterns
// var patterns = [];

// var patternFiles = patFolder.getFiles("*.pat");
// for (i = 0; i < patternFiles.length; i++) {
//     var patt = patFolder.getFiles("*.pat")[i];
//     var concatenate = [].concat(patterns, getPatterns(patt));
//     patterns = concatenate;
// }

// alert(JSON.stringify(patterns[185]));
// alert(JSON.stringify(patterns[187]));

// the big loop 
for (var i = 0; i < list.length; i++) {
    docW = 12*72;
    docH = 16*72;
    var doc = app.documents.add(undefined, docW, docH);
    doc.activeLayer.name = "text"

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
    // backgroundColor.rgb.hexValue = "ffffff";
    // foregroundColor.rgb.hexValue = rowColor;

    if (filters.patchwork) { // 
        sizePntl = 10;
        strokesize = 20;
        strokeHex = "ffffff";
    }

    if (filters.oil) {
        sizePntl = 110;  
        sizeStng = 10;
        borderStng = 6; 
        // sizePntd = 28;
    }

    if (filters.pixel) {
        sizePntl = 50;  
    }

var myTextFrame = doc.textFrames.add()
myTextFrame.position = [0,200]
myTextFrame.contents = output  
break;
// app.doScript("Explode","Lullberry");


var effectStr_2 = '<LiveEffect name="Adobe Deform"><Dict data="R DeformValue 0.45 R DeformVert 0 B Rotate 0 I DeformStyle 1 R DeformHoriz 0 "/></LiveEffect>';
myTextFrame.applyEffect(effectStr_2);
myTextFrame.width = docW
break;
    // app.activeDocument.selection.strokeColor = rowBckColor;

    // artLayerRef.textItem.size = new UnitValue(200, "pt");
    // artLayerRef.textItem.leading = new UnitValue("Auto");

    // var c = new SolidColor();
    // app.backgroundColor.rgb.hexValue = "ffffff";
    // backgroundColor.rgb.hexValue = "ffffff";
    // foregroundColor.rgb.hexValue = rowColor;
    // c.rgb.hexValue = rowColor;
    // textItemRef.color = c;

    textArtRange = app.activeDocument.textFrames[0].textRange;

    switch (rowFont) {
        case "luci":
            textArtRange.characterAttributes.textFont = app.textFonts["LucidaHandwriting-Italic"];
            break;
        case "sacra":
            textArtRange.characterAttributes.textFont = app.textFonts["Sacramento-Regular"];
            break;
        case "dance":
            textArtRange.characterAttributes.textFont = app.textFonts["DancingScript"];
            break;
        case "school":
            textArtRange.characterAttributes.textFont = app.textFonts["Schoolbell"];
            break;
        case "did":
            textArtRange.characterAttributes.textFont = app.textFonts["Didot"];
            break;
        case "tamil":
            textArtRange.characterAttributes.textFont = app.textFonts["TamilMN"];
            break;
        case "paris":
            textArtRange.characterAttributes.textFont = app.textFonts["Parisienne-Regular"];
            break;
        case "noto":
            textArtRange.characterAttributes.textFont = app.textFonts["NotoSerif-SemiCondensedSemiBoldItalic"];
            break;
        case "notolight":
            textArtRange.characterAttributes.textFont = app.textFonts["NotoSerif-Light"];
            break;
        case "ja":
            // textArtRange.characterAttributes.textFont = app.textFonts["TTEditFont"];
            textArtRange.characterAttributes.textFont = app.textFonts["RoundedMplus1c-Bold"];
            break;
        case "ru":
            textArtRange.characterAttributes.textFont = app.textFonts["MarckScript-Regular"];
            break;
        case "ko":
            textArtRange.characterAttributes.textFont = app.textFonts["SingleDay-Regular"];
            break;
        case "zh":
            textArtRange.characterAttributes.textFont = app.textFonts["MaShanZheng-Regular"];
            break;
        case "gr":
            textArtRange.characterAttributes.textFont = app.textFonts["GFSDidot-Regular"];
            break;
        case "il":
            textArtRange.characterAttributes.textFont = app.textFonts["RoundedMplus1c-Bold"];
            break;
        case "kh":
            textArtRange.characterAttributes.textFont = app.textFonts["Fasthand-Regular"];
            break;
        case "th":
            textArtRange.characterAttributes.textFont = app.textFonts["Mali-SemiBold"];
            break;
        case "ar":
            textArtRange.characterAttributes.textFont = app.textFonts["BalooBhaijaan-Regular"];
            break;
    }
    // activeDocument.activeLayer.translate(0, 1); // 5 inches down to prevent cutting the top

    // pattern

    // stroke


    // doc.trim();
    // createSmartObject(artLayerRef);

    // pointillize - before resizing, to widen the pointillized areas


    // if (printfulsize != 0) {
    //     doc.resizeImage(UnitValue(shirtW, "in"), undefined, resolution, ResampleMethod.BICUBIC);
    //     doc.resizeCanvas(undefined, UnitValue(shirtH, "in"));
    //     activeDocument.activeLayer.translate(0, translate);
    // }

    // doAction("SetUp", "Lull"); // warp

    // stained glass


    // paint daubs


    // patchwork


    // accented edges


    //oil


    // bevel


    // inner glow

    // pattern overlay


    if (filters.pixel) { // pixel
        // doAction("pixel", "Lull"); // 
    }

    // var topLayerName = app.activeDocument.layers[0].name;
    // var Name = topLayerName;
    // var Name = decodeURI(app.activeDocument.name).replace(/\.[^\.]+$/, "");
    // doAction("Hide background", "Lull"); // rasterize and erase white
    var Name = rowStrength + "-" + rowLang + "-" + rowFont + "-" + rowProfit;
    var saveFile = File(Path + "/" + Name + "-std.png");
    // sfwPNG24(saveFile);
    activeDocument.activeLayer = activeDocument.layers.getByName("text"); // go back to our layer
    // flipLayer(0); // Flip text layer horizontally
    // activeDocument.activeLayer = activeDocument.layers.getByName("grid"); // go back to our layer
    // flipLayer(0); // Flip grid layer horizontally    
    var saveFile = File(Path + "/" + Name + "-mirror.png");
    // sfwPNG24(saveFile);
    //Uncomment the line below if you want to close the document.  
    //app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);  
}

// save the images
function sfwPNG24(saveFile) {
    var pngOpts = new PNGSaveOptions;
    pngOpts.compression = compression;
    pngOpts.interlaced = false;
    if (saveFile != 0) {
        activeDocument.saveAs(saveFile, pngOpts, true, Extension.LOWERCASE);
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