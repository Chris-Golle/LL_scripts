// #target Illustrator
#include "./json2.js"
#include "./CircleFill-embed.jsx"
#include "./RandomSwatchesFill-embed.js"
#include "./grass-embed.jsx"

var saveFile = 1 // save the results
var flip = 0 // save a flipped version, manually
var doCircles = 1 // you want circles?
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
var circleFillMin7 = 5 // .5 circles sizing for a 7 letters word
var circleFillMax7 = 25 // 4
var circleFillDist7 = 15 // 6
var starsMin = 5
var starsMax = 5
var starsDist = 50
var palette = 'Earthtone 4'
var opMax = 100 // max circles opacity 
var opMin = 60
var opDotMax = 100 // max dots opacity
var opDotMin = 50
var dotsCutoff = 1200 // smaller areas are considered dots
var cutoffCoeff = 99 // used in circleFill() to hide circles as height increases
var warp = -5 // angle of warp

docW = shirtW * 72
docH = shirtH * 72

// bg
var grassY = 100 // where the footer ends and the frame begins
var padding = 15 // frame padding
var point00 = [0+padding, grassY] // frame
var point01 = [0+padding,docH-padding]
var point11 = [docW-padding, docH-padding]
var point10 = [docW-padding, grassY]
var grassConf = {
    width : 2, // 2 base width
    height : 20, // 20 max height
    hfluc : 1, // 1 added or substracted to any height in %
    hrot : 6, // 6 top rotation in %
    bfluc : 2, // 2 starting depth
    hrate : .6, // .6 handle rate in % ?
    invert : true
};

var noColor = new NoColor();
var white = new RGBColor();
white.red = 255;
white.green = 255;
white.blue = 255;

var os = $.os.toLowerCase().indexOf("mac") >= 0 ? "mac" : "win";
if (os == "mac") {
    var Path = "/Users/chrisgolle/OneDrive/Desktop"
    // var patFolder = Folder("/Applications/Adobe Photoshop CC 2017/Presets/Patterns/");
} else {
    var Path = Folder("C:/Users/chris/Downloads/vettori191/Sandbox/Adobe Illustrator CC 2019");
    // var Path = Folder.desktop;
    // var patFolder = Folder("/C/Program Files/Adobe/Adobe Photoshop CC 2019/Presets/Patterns/");
    topMargin = -docH + topMargin;
}
var textFile = new File(Path + "/name list.txt");
var list = readText(textFile).split("\n");

// the big loop 
for (var rowLoop = 0; rowLoop < list.length; rowLoop++) {
    if (rowLoop == 1) {break;}
    // var doc = app.documents.add(undefined, docW, docH);
    var file = File(Path + "/lull-template.ait")
    var doc = app.open(file)
    // var savedState = doc.activeHistoryState
    doc.outputResolution = resolution
    doc.width = docW
    doc.height = docH
    var layerFill = doc.layers.add()
    layerFill.name = "fill"
    var layerDots = doc.layers.add()
    doc.activeLayer.name = 'dots'
    var layerStroke = doc.layers.add()
    doc.activeLayer.name = 'stroke'
    var layerCircles = doc.layers.add()
    doc.activeLayer.name = 'circles'

    var row = list[rowLoop].split(";");
    var rowStrength = row[0];
    var rowLang = row[1];
    var rowNames = row[2].split("%");
    var rowColor = row[3];
    var rowBckColor = row[4];
    var strokeHex = rowBckColor; // override further if patchwork 
    var filters = JSON.parse(row[5]);
    var palette = row[6];
    var rowProfit = row[7];
    var rowFont = row[8];
    // var rowRTL = row[9];
    var output = rowNames[0]; // strength with % separator
    var outputFlip = rowNames[0]; // flipped strength
    var outputL = rowNames[0].length; // max length of strength, will impact circles sizing
    // alert(outputL);
    for (var j = 1; j < rowNames.length; j++) {
        outputL = Math.max (outputL, rowNames[j].length);
        output += "\r" + rowNames[j];
        outputFlip += rowNames[j];
    }
    circleFillMin = circleFillMin7*7/outputL; 
    circleFillMax = circleFillMax7*7/outputL;
    circleFillDist = circleFillDist7*7/outputL;

    var myTextFrame = doc.textFrames.add()
    myTextFrame.contents = output;

    switch (rowFont) {
        case "arkh": fontName = "Arkhip-Regular"; break;
        case "audrey": fontName = "Audrey-Medium"; break;
        case "baloo": fontName = "BalooBhaijaan-Regular"; break;
        case "berk": fontName = "BerkshireSwash-Regular"; break;
        case "cav": fontName = "Cavorting"; break;
        case "dance": fontName = "DancingScript"; break;
        case "did": fontName = "Didot-HTF-B06-Bold"; break;
        case "ita": fontName = "Italianno-Regular"; break;
        case "kaush": fontName = "KaushanScript-Regular"; break;
        case "khmer": fontName = "KhmerOSfasthand"; break;
        case "kod": fontName = "Kodchasan-SemiBold"; break;
        case "super": fontName = "LeSuperSerif-SemiBold"; break;
        case "london": fontName = "London"; break;
        case "luci": fontName = "LucidaHandwriting-Italic"; break;
        case "ludi": fontName = "Ludicrous"; break;
        case "marck": fontName = "MarckScript-Regular"; break;
        case "meri": fontName = "Merienda-Bold"; break;
        case "might": fontName = "MightypeScript"; break;
        case "milo": fontName = "Milonga-Regular"; break;
        case "nick": fontName = "Nickainley-Normal"; break;
        case "paci": fontName = "Pacifico"; break;
        case "paris": fontName = "Parisienne-Regular"; break;
        case "play": fontName = "PlayfairDisplay-Regular"; break;
        case "poir": fontName = "PoiretOne-Regular"; break;
        case "dash": fontName = "QuicksandDash-Regular"; break;
        case "puff": fontName = "RoughPuff-Regular"; break;
        case "sacra": fontName = "Sacramento-Regular"; break;
        case "sail": fontName = "Sail-Regular"; break;
        case "scamp": fontName = "ScamperRegular-Regular"; break;
        case "school": fontName = "Schoolbell"; break;
        case "pony": fontName = "ShowponySans-Regular"; break;
        case "single": fontName = "SingleDay-Regular"; break;
        case "sofa": fontName = "SofadiOne-Regular"; break;
        case "two": fontName = "SprightlyTwo-Regular"; break;
        case "street": fontName = "Streetwear"; break;
        case "tange": fontName = "Tangerine-Bold"; break;
        case "undu": fontName = "Undulant-Regular"; break;
        case "dosis": fontName = "Dosis-Light"; break;
        case "euph": fontName = "EuphoriaScript-Regular"; break;
        case "fab": fontName = "FabfeltScript-Bold"; break;
        case "fahk": fontName = "Fahkwang-Light"; break;
        case "gag": fontName = "Gagalin-Regular"; break;
        default: fontName = 'Arial';
    }

    myTextFrame.textRange.characterAttributes.textFont = app.textFonts.getByName(fontName)
    myTextFrame.height = myTextFrame.height * docW / myTextFrame.width
    myTextFrame.width = docW
    myTextFrame.top = -topMargin
    doc.pageItems.selected = true

    app.doScript("Warp", "Lullberry"); // warp -5 deg
   
    app.executeMenuCommand("selectall");
    app.executeMenuCommand("Live Outline Stroke");
    app.executeMenuCommand("expandStyle");
    app.doScript("Explode", "Lullberry"); 

    // letters stroke
    var myPageItems = doc.pageItems;
    var nb = myPageItems.length
    var objectToFill = []
    // for (var k = 0; k < nb; k++) {
    //     var artItem = myPageItems[k];
    //     // alert('w ' + artItem.width + ' h ' + artItem.height + ' left ' + artItem.left + ' top ' + artItem.top)
    //     if (artItem.width * artItem.height > dotsCutoff) { // there is no area method for compound paths
    //         artItem.stroked = true
    //         artItem.strokeWidth = stroke
    //     }
    // }

    // expand and reorganize objects
    // app.executeMenuCommand("selectall");
    doc.pageItems.selected = true
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
        if ((artItem.width * artItem.height > dotsCutoff) || (Math.abs(artItem.width - artItem.height)/Math.min(artItem.width,artItem.height) > 1 )) {
            objectToFill.push(artItem)
            artItem.filled = true // in case we want to color the strokes later
            artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
        } else {
            artItem.name = 'dot'
            artItem.duplicate(layerDots)
            objectToFill.push(artItem)
            artItem.filled = true // in case we want to color the strokes later
            artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
        }
    }

    if (doCircles == 1) { 
        for (var k = 0; k < objectToFill.length; k++) { // must be done in 2 steps, otherwise enters a loop
            circleFill(objectToFill[k], circleFillMin, circleFillMax, circleFillDist) // min max distance
        }
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
            artItem.name = 'dot'
            artItem.duplicate(layerDots)
            objectToFill.push(artItem)
            artItem.filled = true // in case we want to color the strokes later
            artItem.move(layerStroke, ElementPlacement.PLACEATBEGINNING)
        }
    }

    if (doCircles == 1) { 
        for (var k = 0; k < objectToFill.length; k++) { // must be done in 2 steps, otherwise enters a loop
            circleFill(objectToFill[k], circleFillMin, circleFillMax, circleFillDist) // min max distance
        }
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
        // var nb = doc.pageItems.length
        // for (var k = nb-1; k >=0 ; k--) {
        //     var artItem = doc.pageItems[k];
        //     artItem.zOrder(ZOrderMethod.SENDTOBACK)
        // }
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
    layerStroke.visible = false;
    // layerStroke.remove();
    swatchesFill(layerDots.pageItems, palette) // colorize randomly with palette
    swatchesFill(layerCircles.pageItems, palette) // colorize randomly with palette
    // swatchesFill(layerFill.pageItems, palette) // colorize randomly with palette

    // footer
    var layerFooter = doc.layers.add()
    doc.activeLayer.name = 'footer'
    var myTextFlip = doc.textFrames.add()
    myTextFlip.contents = outputFlip;
    myTextFlip.resize(-100,100) // reverse 100% along x
    myTextFlip.textRange.characterAttributes.textFont = app.textFonts.getByName(fontName)
    myTextFlip.fillColor = doc.swatchGroups.getByName(palette).getAllSwatches()[2].color
    myTextFlip.width = 100 / myTextFlip.height * myTextFlip.width
    myTextFlip.height = 100
    myTextFlip.left = docW-80-myTextFlip.width //
    myTextFlip.top = 110 // taken from the bottom, oddly enough
  
    // ground stroke, grass
    var layerGrass = doc.layers.add()
    doc.activeLayer.name = 'grass'
    layerGrass.zOrder(ZOrderMethod.SENDTOBACK)

    // ground
    var groundPath = doc.pathItems.add();
    var groundPoint00 = groundPath.pathPoints.add()
    groundPoint00.anchor = point00 // adding the first point
    groundPoint00.rightDirection = [0+padding+30, grassY]
    var hillX  = 100 + Math.random()*(docW-200)
    var hillY = grassY+ 20+Math.random()*50 
    var pointHillForGround = groundPath.pathPoints.add() // adding the little hill in the middle
    var groundPoint10 = groundPath.pathPoints.add()
    groundPoint10.anchor = point10 // adding the last point
    groundPoint10.pointType = PointType.CORNER;
    groundPoint10.leftDirection = [docW-padding-30, grassY]
    pointHillForGround.anchor = [hillX, hillY]
    pointHillForGround.pointType = PointType.SMOOTH;
    pointHillForGround.leftDirection = [hillX-50,hillY]
    pointHillForGround.rightDirection = [hillX+50,hillY]
    groundPath.filled = false
      
    // bg
    var layerBg = doc.layers.add()
    doc.activeLayer.name = 'bg'

    // frame stroke
    var framePath = doc.pathItems.add();
    framePath.name = 'framePath'
    framePath.setEntirePath([point00, point01, point11, point10])
    framePath.strokeWidth = 30
    framePath.filled = false
    framePath.strokeColor = doc.swatchGroups.getByName(palette).getAllSwatches()[2].color
    var frameBrush = doc.brushes.getByName('Charcoal - Rounded');
    frameBrush.applyTo(framePath);

    // frame and ground inside fill
    var frameGroup = doc.groupItems.add();
    frameGroup.name = 'frameGroup'
    var fillPath = doc.pathItems.add();
    fillPath.name = 'fillPath'
    fillPath.moveToEnd( frameGroup );
    groundPath.moveToEnd( frameGroup );
    fillPath.setEntirePath([point10, point11, point01, point00])
    var pointHillForFill = fillPath.pathPoints.add() // adding the little hill in the middle
    pointHillForFill.anchor = [hillX, hillY]
    pointHillForFill.pointType = PointType.SMOOTH;
    pointHillForFill.leftDirection = [hillX-50,hillY]
    pointHillForFill.rightDirection = [hillX+50,hillY]
    app.executeMenuCommand("deselectall");
    frameGroup.selected = true 
    app.executeMenuCommand("Live Pathfinder Minus Back") // cut the fill at the grass limit

    // background stars
    // fillPathBg = fillPath.duplicate(layerGrass) // 
    fillPath.fillColor = doc.swatchGroups.getByName(palette).getAllSwatches()[2].color
    var starsGroup = doc.groupItems.add();
    starsGroup.name = 'starsGroup'
    fillPath.moveToEnd( starsGroup );
    starsGroup.selected = true
    circleFill(fillPath, starsMin, starsMax, starsDist) // min max distance
    // for (j=0; j<layerBg.pathItems.length; j++) { // move stars to their group, can't use 'move' with pageItems
    //         alert(layerBg.pathItems[j].name)
    //     if ( ['framePath'].join(",").indexOf(layerBg.pathItems[j].name) == -1) { // 'join' is needed in adobe javascript
    //         layerBg.pathItems[j].move(starsGroup)
    //     }
    // }
    swatchesFill(starsGroup.pageItems, 'Sunrise') // colorize randomly with palette
   
    // flowers
    app.executeMenuCommand("deselectall");
    var flowersGroup = doc.groupItems.add();
    flowersGroup.name = 'flowersGroup'
    var branchPath = []
    var flower = []
    for (j=0; j<8; j++) {
        branchX = j*docW/8 + Math.random()*(docW/8)
        branchY = grassY + 90+ Math.random()*200
        branchPath[j] = doc.pathItems.add();
        branchPath[j].name = 'Group: branch' + j
        branchPath[j].setEntirePath([[branchX-1,grassY],[branchX-1,branchY], [branchX+1,branchY], [branchX+1,grassY]])
        branchPath[j].fillColor = white
        flower[j] = new Array(2)
        manyFlowers = 3 + Math.floor(branchY/80)
        for (k=0; k<manyFlowers; k++) {
            flowerY = grassY + 30 + k*(branchY-grassY-30)/7 + Math.random()*(branchY-grassY-30)/7
            flowerD = 2+Math.random()*8
            if (k==0) {flowerY = branchY; flowerD = 5;} // the top flower, a bit smaller
            flower[j][k] = doc.pathItems.ellipse(flowerY,branchX-flowerD/2,flowerD,flowerD) // top, left, w, h
            flower[j][k].fillColor = white
            flower[j][k].moveToEnd( flowersGroup );
        }
        var tmpCutoutGroup = doc.groupItems.add();
        branchPath[j].moveToEnd( tmpCutoutGroup);
        fillPathTMP = fillPath.duplicate(tmpCutoutGroup, ElementPlacement.PLACEATEND)
        // doc.selection = null
        // app.redraw(); // otherwise deselectall not working in adobe illustrator 2019
        app.executeMenuCommand("deselectall");
        tmpCutoutGroup.selected = true
        app.executeMenuCommand("Live Pathfinder Intersect") // cutout the branch from the fill
        fillPathTMP.filled = false
        // fillPath.zOrder(ZOrderMethod.SENDTOBACK)    
        // doc.pageItems.selected.moveToEnd(flowersGroup)
    }
    
    // grass
    createGrass([groundPath],grassConf)
    layerCircles.zOrder(ZOrderMethod.BRINGTOFRONT)

    break;
    // app.doScript("Flatten", "Lullberry");

    var Name = rowStrength + "-" + rowLang + "-" + rowFont + "-" + "-" + shirtW + "x" + shirtH + "-" + "-" + palette;
    var dest = File(Path + "/" + Name + "-std.png");
    sfwPNG24(dest);
    if (flip == 1) { 
        var dest = File(Path + "/" + Name + "-" + circleFillMin + "-" + circleFillMax + "-" + circleFillDist + "-" + palette + "-mirror.png");
        // app.doScript("Flip", "Lullberry");
        app.executeMenuCommand("transformreflect");        
        sfwPNG24(dest);
    }
    // closing
    // doc.close(SaveOptions.DONOTSAVECHANGES);
}

// save the images

function sfwPNG24(dest) {
    var saveName = new File(dest);
    var exportOptions = new ExportOptionsPNG24();
    // pngOpts.compression = compression;
    // pngOpts.interlaced = false;
    if (dest != 0) {
        doc.exportFile(saveName, ExportType.PNG24, exportOptions);
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