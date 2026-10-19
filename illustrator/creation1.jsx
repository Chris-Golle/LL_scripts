#target photoshop
//@include ./json2.js
var resolution = 300; // px per inch
// stroke
var strokesize = 2; // size in px
// var strokeHex = "64b3b4"; // color
// filters
var sizePntl = 222; // pointillize 0 to 300
var sizeStng = 40; // stained glass 0 to 50
var patchworkSize = 9; // patchwork 0 to 10
var sizePntd = 45; // paint daubs 0 to 50
var sharpPntd = 5; // paint daubs 0 to 40

// bevel
var bevelHexH = "ffffff"; // highlight color
var bevelPcH = 50; // highlight % opacity
var bevelHexS = "000000"; // shadow color
var bevelPcS = 30; // shadow % opacity
var bevelDepth = 160; // depth
var bevelSize = 8; // size 12 for soft, 200 for hard
var bevelSoften = 9; // soften 5 for soft, 3 for hard

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
var textFile = new File(Path + "/name list1.txt");
var list = readText(textFile).split("\n");

// load system patterns
var patterns = [];

var patternFiles = patFolder.getFiles("*.pat");
for (i = 0; i < patternFiles.length; i++) {
    var patt = patFolder.getFiles("*.pat")[i];
    var concatenate = [].concat(patterns, getPatterns(patt));
    patterns = concatenate;
}

function getPatterns(file) {
    file.open("r");
    file.encoding = "BINARY";
    var str = file.read();
    file.close();
    var result = [];
    var re = /(\x00\w|\x00\d)(\x00\-|\x00\w|\x00\s|\x00\d)+\x00\x00\$[-a-z\d]+/g;
    var parts = str.match(re);
    for (var i = 0; i < parts.length; i++) {
        var p = parts[i];
        var sp = p.replace(/\x00/g, "").split("$");
        result.push({
            "name": sp[0].replace(/\s/g, ""),
            "path": file.name.replace(/%20/g, "").replace(/\./g, "_") + "/" + sp[0].replace(/\s/g, ""),
            "id": sp[1]
        });
        // if (sp[0].indexOf("ck Marble") != -1) {alert(sp[0].replace(/\s/g, "") + " - " + sp[1]);}
    }
    return result;
};

// alert(JSON.stringify(patterns[185]));
// alert(JSON.stringify(patterns[187]));

function searchPattern(patternName) {
    for (var i = 0; i < patterns.length; i++) {
        if (patterns[i].name === patternName) {
            return (i);
        }
    }
}

// used in the big loop
function createSmartObject(layer)
{
    var idnewPlacedLayer = stringIDToTypeID( "newPlacedLayer" );
    executeAction(idnewPlacedLayer, undefined, DialogModes.NO);
}

// the big loop 
for (var i = 0; i < list.length; i++) {
    documents.add();
    var doc = activeDocument
    var row = list[i].split(";");
    var rowStrength = row[0];
    var rowLang = row[1];
    var rowNames = row[2].split("%");
    var rowColor = row[3];
    var rowBckColor = row[4];
        var strokeHex = rowBckColor;
    var filters = JSON.parse(row[5]);
    var patternType = parseInt(row[6]);
    var rowProfit = row[7];
    var rowFont = row[8];
    // var rowRTL = row[9];
    var output = rowNames[0];
    for (var j = 1; j < rowNames.length; j++) {
        output += "\r" + rowNames[j];
    }
    // bevelHexH = rowColor;
    // bevelHexS = rowBckColor;
    // app.backgroundColor.rgb.hexValue = "ffffff";
    backgroundColor.rgb.hexValue = "ffffff";    
    foregroundColor.rgb.hexValue = rowColor;

    var artLayerRef = doc.artLayers.add()
    artLayerRef.kind = LayerKind.TEXT;
    doc.resizeCanvas(UnitValue(35, "in"), UnitValue(12, "in"));
    var textItemRef = artLayerRef.textItem;
    textItemRef.contents = output;
    app.activeDocument.selection.stroked = true;  
    app.activeDocument.selection.strokeColor = rowBckColor; 

    artLayerRef.textItem.size = new UnitValue(200, "pt");
    artLayerRef.textItem.leading = new UnitValue("Auto");

    var c = new SolidColor();
    // app.backgroundColor.rgb.hexValue = "ffffff";
    backgroundColor.rgb.hexValue = "ffffff";    
    foregroundColor.rgb.hexValue = rowColor;
    c.rgb.hexValue = rowColor;
    textItemRef.color = c;
    switch (rowFont) {
        case "luci":
            artLayerRef.textItem.font = "LucidaHandwriting-Italic"; 
            break;
        case "sacra":
            artLayerRef.textItem.font = "Sacramento-Regular";
            break;
        case "dance":
            artLayerRef.textItem.font = "Dancing Script";
            break;
        case "school":
            artLayerRef.textItem.font = "Schoolbell";
            break;        
        case "did":
            artLayerRef.textItem.font = "Didot";
            break;
        case "tamil":
            artLayerRef.textItem.font = "Tamil MN";
            break;            
        case "paris":
            artLayerRef.textItem.font = "parisienne-regular";
            break;
        case "noto":
            artLayerRef.textItem.font = "NotoSerif-SemiCondensedSemiBoldItalic";
            break;
        
        case "jp":
            artLayerRef.textItem.font = "TTEditFont";
            break;
        case "ru":
            artLayerRef.textItem.font = "MarckScript-Regular";
            break;
        case "ko":
            artLayerRef.textItem.font = "SingleDay-Regular";
            break;
        case "cn":
            artLayerRef.textItem.font = "MaShanZheng-Regular";
            break;
        case "gr":
            artLayerRef.textItem.font = "GFSDidot-Regular";
            break;
        case "il":
            artLayerRef.textItem.font = "MPLUSRounded1c-Bold";
            break;
        case "kh":
            artLayerRef.textItem.font = "Fasthand-Regular";
            break;
        case "th":
            artLayerRef.textItem.font = "Mali-SemiBold";
            break;
        case "ar":
            artLayerRef.textItem.font = "BalooBhaijaan-Regular";
            break;
    }

    // pattern
    var patternBlend = charIDToTypeID("SftL"); // soft light
    var patternScale = 330;

    switch (patternType) {
        case 1:
            var patternPath = "RockPatterns_pat/BlackMarble=Black Marble";
            var patternId = patterns[searchPattern("BlackMarble")].id;
            break;
        case 2:
            var patternPath = "RockPatterns_pat/Stones=Stones";
            var patternId = patterns[searchPattern("Stones")].id;
            break;
        case 3:
            var patternPath = "RockPatterns_pat/Gravel=Gravel";
            var patternId = patterns[searchPattern("Gravel")].id;
            break;
        case 4:
            var patternPath = "RockPatterns_pat/RedRocks=Red Rocks";
            var patternId = patterns[searchPattern("RedRocks")].id;
            break;
        case 5:
            var patternPath = "TextureFill2_pat/Web=Web";
            var patternId = patterns[searchPattern("Web")].id;
            var patternBlend = stringIDToTypeID("blendDivide");
            break;
        case 6:
            var patternPath = "Web/Grid2=Grid 2";
            var patternId = patterns[searchPattern("Grid2")].id;
            var patternBlend = stringIDToTypeID("blendDivide");
            break;
        case 7:
            var patternPath = "Patterns_pat/WovenWide=Woven Wide";
            var patternId = patterns[searchPattern("WovenWide")].id;
            var patternScale = 35;
            break;
        case 8:
            var patternPath = "Patterns_pat/OpticalSquares=Optical Squares";
            var patternId = patterns[searchPattern("OpticalSquares")].id;
            break;
        case 9:
            var patternPath = "Patterns_pat/OpticalCheckerboard=Optical Checkerboard";
            var patternId = patterns[searchPattern("OpticalCheckerboard")].id;
            break;
        case 10:
            var patternPath = "Patterns_pat/MetalLandscape=Metal Landscape";
            var patternId = patterns[searchPattern("MetalLandscape")].id;
            break;
        case 11:
            var patternPath = "ColorPaper_pat/Leaf=Leaf";
            var patternId = patterns[searchPattern("Leaf")].id;
            var patternBlend = stringIDToTypeID("blendDivide");
            break;
        case 12:
            var patternPath = "ArtistsBrushesCanvas_pat/PrimedLinen=Primed Linen";
            var patternId = patterns[searchPattern("PrimedLinen")].id;
            break;
        case 13:
            var patternPath = "ArtistsBrushesCanvas_pat/N10ExtraHeavy=#10 Extra Heavy";
            var patternId = patterns[searchPattern("10ExtraHeavy")].id;
            break;
        case 14:
            var patternPath = "ArtistSurfaces_pat/HeavyWeave=Heavy Weave";
            var patternId = patterns[searchPattern("HeavyWeave")].id;
            break;
        // case 15:
        //     var patternPath = "ArtistSurfaces_pat/Granite=Granite";
        //     var patternId = patterns[searchPattern("Granite")].id;
        //     var patternBlend = stringIDToTypeID("blendDivide");
        //     break;
    }
    // alert(patternPath); // Patterns_pat/MetalLandscape=Metal Landscape
    // alert(patternId); // 2d61896b-58b7-11d4-b895-a898787104c1
    // doc.resizeImage(new UnitValue(12,"in"),null,null);

    // vars for all the effects
    var desc14 = new ActionDescriptor();
    var desc15 = new ActionDescriptor();
    var ref3 = new ActionReference();
    var idLefx = charIDToTypeID( "Lefx" );
    var idPrpr = charIDToTypeID( "Prpr" );
    var idsetd = charIDToTypeID( "setd" );
    var idnull = charIDToTypeID( "null" );
    var idLyr = charIDToTypeID("Lyr ");
    var idT = charIDToTypeID( "T   " );
    var idOrdn = charIDToTypeID("Ordn");
    var idTrgt = charIDToTypeID("Trgt");
    var idScl = charIDToTypeID( "Scl " );
    var idPrc = charIDToTypeID( "#Prc" );
    ref3.putProperty(idPrpr, idLefx);
    ref3.putEnumerated(idLyr, idOrdn, idTrgt);
    desc14.putReference(idnull, ref3);    
    desc15.putUnitDouble(idScl, idPrc, 416.666667);
    var idenab = charIDToTypeID( "enab" );
    var idpresent = stringIDToTypeID( "present" );
    var idshowInDialog = stringIDToTypeID( "showInDialog" );
    var idMd = charIDToTypeID( "Md  " );
    var idBlnM = charIDToTypeID( "BlnM" );
    var idOpct = charIDToTypeID( "Opct" );
    var idPrc = charIDToTypeID( "#Prc" );
    var idPxl = charIDToTypeID( "#Pxl" );
    var idSz = charIDToTypeID( "Sz  " );
    var idRd = charIDToTypeID( "Rd  " );
    var idGrn = charIDToTypeID( "Grn " );
    var idBl = charIDToTypeID( "Bl  " );
    var idClr = charIDToTypeID( "Clr " );
    var idRGBC = charIDToTypeID( "RGBC" );


    // stroke
    if (filters.stroke) {
    var desc853 = new ActionDescriptor();
        var ref189 = new ActionReference();
        ref189.putProperty( idPrpr, idLefx );
        ref189.putEnumerated( idLyr, idOrdn, idTrgt );
    desc853.putReference( idnull, ref189 );
        var desc854 = new ActionDescriptor();
        desc854.putUnitDouble( idScl, idPrc, 416.666667 );
        var idFrFX = charIDToTypeID( "FrFX" );
            var desc855 = new ActionDescriptor();
            desc855.putBoolean( idenab, true );
            desc855.putBoolean( idpresent, true );
            desc855.putBoolean( idshowInDialog, true );
            var idStyl = charIDToTypeID( "Styl" );
            var idFStl = charIDToTypeID( "FStl" );
            var idOutF = charIDToTypeID( "OutF" );
            desc855.putEnumerated( idStyl, idFStl, idOutF );
            var idPntT = charIDToTypeID( "PntT" );
            var idFrFl = charIDToTypeID( "FrFl" );
            var idSClr = charIDToTypeID( "SClr" );
            desc855.putEnumerated( idPntT, idFrFl, idSClr );
            var idNrml = charIDToTypeID( "Nrml" );
            desc855.putEnumerated( idMd, idBlnM, idNrml );
            desc855.putUnitDouble( idOpct, idPrc, 100.000000 );
            desc855.putUnitDouble( idSz, idPxl, strokesize );
                var desc856 = new ActionDescriptor();
                desc856.putDouble( idRd, hexToRgb(strokeHex).r );
                desc856.putDouble( idGrn, hexToRgb(strokeHex).g );
                desc856.putDouble( idBl, hexToRgb(strokeHex).b );
            desc855.putObject( idClr, idRGBC, desc856 );
            var idoverprint = stringIDToTypeID( "overprint" );
            desc855.putBoolean( idoverprint, false );
        var idFrFX = charIDToTypeID( "FrFX" );
        desc854.putObject( idFrFX, idFrFX, desc855 );
    desc853.putObject( idT, idLefx, desc854 );
executeAction( idsetd, desc853, DialogModes.NO );
    }

createSmartObject(artLayerRef);


    //oil
    if (filters.oil) {
        var idoilPaint = stringIDToTypeID( "oilPaint" );
        var desc873 = new ActionDescriptor();
        var idlightingOn = stringIDToTypeID( "lightingOn" );
        desc873.putBoolean( idlightingOn, true );
        var idstylization = stringIDToTypeID( "stylization" );
        desc873.putDouble( idstylization, 10 );
        var idbrushScale = stringIDToTypeID( "brushScale" );
        desc873.putDouble( idbrushScale, 10 );
        var idmicroBrush = stringIDToTypeID( "microBrush" );
        desc873.putDouble( idmicroBrush, 10 );
        var idLghD = charIDToTypeID( "LghD" );
        desc873.putInteger( idLghD, -69 );
        var idspecularity = stringIDToTypeID( "specularity" );
        desc873.putDouble( idspecularity, 2.100000 );
        var idcleanliness = stringIDToTypeID( "cleanliness" );
        desc873.putDouble( idcleanliness, 10 );
        executeAction( idoilPaint, desc873, DialogModes.NO );
    }

    doc.trim();
    // doc.resizeImage(UnitValue(3, "in"), undefined, resolution, undefined);
    doc.resizeImage(UnitValue(12, "in"), undefined, resolution, ResampleMethod.BICUBIC);
    doc.resizeCanvas(undefined, UnitValue(16, "in"));
    doAction("SetUp", "Lull");

    app.preferences.rulerUnits = Units.INCHES;    
    activeDocument.activeLayer.translate(0,-3);

    function hexToRgb(hex) {
        var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
        return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
        } : null;
    }

    // pointillize
    if (filters.pointillize) {
        backgroundColor.rgb.hexValue = rowBckColor;    
        var idPntl = charIDToTypeID("Pntl");
        var descPntl = new ActionDescriptor();
        var idClSz = charIDToTypeID("ClSz");
        descPntl.putInteger(idClSz, sizePntl);
        executeAction(idPntl, descPntl, DialogModes.NO);
    }

    // stained glass
    if (filters.stainedGlass) {
        var idStnG = charIDToTypeID("StnG");
        var desc2 = new ActionDescriptor();
        var idGEfk = charIDToTypeID("GEfk");
        var idGEft = charIDToTypeID("GEft");
        var idStnG = charIDToTypeID("StnG");
        desc2.putEnumerated(idGEfk, idGEft, idStnG);
        var idClSz = charIDToTypeID("ClSz");
        desc2.putInteger(idClSz, sizeStng);
        var idBrdT = charIDToTypeID("BrdT");
        desc2.putInteger(idBrdT, 1);
        var idLghI = charIDToTypeID("LghI");
        desc2.putInteger(idLghI, 0);
        executeAction(idStnG, desc2, DialogModes.NO);
    }

    // paint daubs
    if (filters.paintDaubs) {
        var idPntD = charIDToTypeID("PntD");
        var desc45 = new ActionDescriptor();
        var idGEfk = charIDToTypeID("GEfk");
        var idGEft = charIDToTypeID("GEft");
        var idPntD = charIDToTypeID("PntD");
        desc45.putEnumerated(idGEfk, idGEft, idPntD);
        desc45.putInteger(idSz, sizePntd);
        var idShrp = charIDToTypeID("Shrp");
        desc45.putInteger(idShrp, sharpPntd);
        var idBrsT = charIDToTypeID("BrsT");
        var idBrsT = charIDToTypeID("BrsT");
        var idBrbW = charIDToTypeID("BrbW");
        desc45.putEnumerated(idBrsT, idBrsT, idBrbW);
        executeAction(idPntD, desc45, DialogModes.NO);
    }

    // patchwork
    if (filters.patchwork) {
        var idPtch = charIDToTypeID("Ptch");
        var desc789 = new ActionDescriptor();
        var idGEfk = charIDToTypeID("GEfk");
        var idGEft = charIDToTypeID("GEft");
        var idPtch = charIDToTypeID("Ptch");
        desc789.putEnumerated(idGEfk, idGEft, idPtch);
        var idSqrS = charIDToTypeID("SqrS");
        desc789.putInteger(idSqrS, patchworkSize);
        var idRlf = charIDToTypeID("Rlf ");
        desc789.putInteger(idRlf, 0); // relief
        executeAction(idPtch, desc789, DialogModes.NO);
    }

    // accented edges
    if (filters.accentedEdges) {
        var idAccE = charIDToTypeID("AccE");
        var desc845 = new ActionDescriptor();
        var idGEfk = charIDToTypeID("GEfk");
        var idGEft = charIDToTypeID("GEft");
        var idAccE = charIDToTypeID("AccE");
        desc845.putEnumerated(idGEfk, idGEft, idAccE);
        var idEdgW = charIDToTypeID("EdgW");
        desc845.putInteger(idEdgW, 14);
        var idEdgB = charIDToTypeID("EdgB");
        desc845.putInteger(idEdgB, 36);
        var idSmth = charIDToTypeID("Smth");
        desc845.putInteger(idSmth, 15);
        executeAction(idAccE, desc845, DialogModes.NO);
    }


    // doc.resizeCanvas(UnitValue(3,"in"), UnitValue(4,"in"), AnchorPosition.MIDDLECENTER);

    // bevel
if (filters.bevel) {
    var idebbl = charIDToTypeID("ebbl");
    var desc16 = new ActionDescriptor();
    desc16.putBoolean(idenab, true);
    desc16.putBoolean(idpresent, true);
    desc16.putBoolean(idshowInDialog, true);
    var idhglM = charIDToTypeID("hglM");
    var idBlnM = charIDToTypeID("BlnM");
    var idScrn = charIDToTypeID("Scrn");
    desc16.putEnumerated(idhglM, idBlnM, idScrn);
    var idhglC = charIDToTypeID("hglC");
    var desc17 = new ActionDescriptor();
    var idRd = charIDToTypeID("Rd  ");
    desc17.putDouble(idRd, hexToRgb(bevelHexH).r);
    var idGrn = charIDToTypeID("Grn ");
    desc17.putDouble(idGrn, hexToRgb(bevelHexH).g);
    var idBl = charIDToTypeID("Bl  ");
    desc17.putDouble(idBl, hexToRgb(bevelHexH).b);
    desc16.putObject(idhglC, idRGBC, desc17);
    var idhglO = charIDToTypeID("hglO");
    var idPrc = charIDToTypeID("#Prc");
    desc16.putUnitDouble(idhglO, idPrc, bevelPcH);
    var idsdwM = charIDToTypeID("sdwM");
    var idBlnM = charIDToTypeID("BlnM");
    var idMltp = charIDToTypeID("Mltp");
    desc16.putEnumerated(idsdwM, idBlnM, idMltp);
    var idsdwC = charIDToTypeID("sdwC");
    var desc18 = new ActionDescriptor();
    desc18.putDouble(idRd, hexToRgb(bevelHexS).r);
    desc18.putDouble(idGrn, hexToRgb(bevelHexS).g);
    desc18.putDouble(idBl, hexToRgb(bevelHexS).b);
    desc16.putObject(idsdwC, idRGBC, desc18);
    var idsdwO = charIDToTypeID("sdwO");
    var idPrc = charIDToTypeID("#Prc");
    desc16.putUnitDouble(idsdwO, idPrc, bevelPcS);
    var idbvlT = charIDToTypeID("bvlT");
    var idbvlT = charIDToTypeID("bvlT");
    var idPrBL = charIDToTypeID("PrBL");
    desc16.putEnumerated(idbvlT, idbvlT, idPrBL);
    var idbvlS = charIDToTypeID("bvlS");
    var idBESl = charIDToTypeID("BESl");
    var idInrB = charIDToTypeID("InrB");
    desc16.putEnumerated(idbvlS, idBESl, idInrB);
    var iduglg = charIDToTypeID("uglg");
    desc16.putBoolean(iduglg, false);
    var idlagl = charIDToTypeID("lagl");
    var idAng = charIDToTypeID("#Ang");
    desc16.putUnitDouble(idlagl, idAng, 135);
    var idLald = charIDToTypeID("Lald");
    var idAng = charIDToTypeID("#Ang");
    desc16.putUnitDouble(idLald, idAng, 21);
    var idsrgR = charIDToTypeID("srgR");
    var idPrc = charIDToTypeID("#Prc");
    desc16.putUnitDouble(idsrgR, idPrc, bevelDepth); // depth
    var idblur = charIDToTypeID("blur");
    desc16.putUnitDouble(idblur, idPxl, bevelSize); // size
    var idbvlD = charIDToTypeID("bvlD");
    var idBESs = charIDToTypeID("BESs");
    var idIn = charIDToTypeID("In  ");
    desc16.putEnumerated(idbvlD, idBESs, idIn);
    var idTrnS = charIDToTypeID("TrnS");
    var desc19 = new ActionDescriptor();
    var idNm = charIDToTypeID("Nm  ");
    desc19.putString(idNm, "Gaussian");
    var idShpC = charIDToTypeID("ShpC");
    desc16.putObject(idTrnS, idShpC, desc19);
    var idantialiasGloss = stringIDToTypeID("antialiasGloss");
    desc16.putBoolean(idantialiasGloss, true);
    var idSftn = charIDToTypeID("Sftn");
    desc16.putUnitDouble(idSftn, idPxl, bevelSoften); // soften
    var iduseShape = stringIDToTypeID("useShape");
    desc16.putBoolean(iduseShape, false);
    var iduseTexture = stringIDToTypeID("useTexture");
    desc16.putBoolean(iduseTexture, false);
    var idebbl = charIDToTypeID("ebbl");
    desc15.putObject( idebbl, idebbl, desc16 ); // enable for bevel
}

    // inner glow
if (filters.glow) {
    var idIrGl = charIDToTypeID("IrGl");
    var desc129 = new ActionDescriptor();
    desc129.putBoolean(idenab, true);
    desc129.putBoolean(idpresent, true);
    desc129.putBoolean(idshowInDialog, true);
    var idScrn = charIDToTypeID("Scrn");
    desc129.putEnumerated(idMd, idBlnM, idScrn);
    var desc130 = new ActionDescriptor();
    desc130.putDouble(idRd, 210.000003);
    desc130.putDouble(idGrn, 83.178988);
    desc130.putDouble(idBl, 83.178988);
    desc129.putObject(idClr, idRGBC, desc130);
    desc129.putUnitDouble(idOpct, idPrc, 56.000000);
    var idGlwT = charIDToTypeID("GlwT");
    var idBETE = charIDToTypeID("BETE");
    var idSfBL = charIDToTypeID("SfBL");
    desc129.putEnumerated(idGlwT, idBETE, idSfBL);
    var idCkmt = charIDToTypeID("Ckmt");
    desc129.putUnitDouble(idCkmt, idPxl, 0.000000);
    var idblur = charIDToTypeID("blur");
    desc129.putUnitDouble(idblur, idPxl, 11.000000);
    var idNose = charIDToTypeID("Nose");
    var idPrc = charIDToTypeID("#Prc");
    desc129.putUnitDouble(idNose, idPrc, 0.000000);
    var idShdN = charIDToTypeID("ShdN");
    var idPrc = charIDToTypeID("#Prc");
    desc129.putUnitDouble(idShdN, idPrc, 0.000000);
    var idAntA = charIDToTypeID("AntA");
    desc129.putBoolean(idAntA, true);
    var idTrnS = charIDToTypeID("TrnS");
    var desc131 = new ActionDescriptor();
    var idNm = charIDToTypeID("Nm  ");
    desc131.putString(idNm, "$$$/Contours/Defaults/Linear=Linear");
    var idShpC = charIDToTypeID("ShpC");
    desc129.putObject(idTrnS, idShpC, desc131);
    var idInpr = charIDToTypeID("Inpr");
    var idPrc = charIDToTypeID("#Prc");
    desc129.putUnitDouble(idInpr, idPrc, 45.000000);
    var idglwS = charIDToTypeID("glwS");
    var idIGSr = charIDToTypeID("IGSr");
    var idSrcC = charIDToTypeID("SrcC");
    desc129.putEnumerated(idglwS, idIGSr, idSrcC);
    var idIrGl = charIDToTypeID("IrGl");
    desc15.putObject( idIrGl, idIrGl, desc129 ); // enable for glow
}
    // pattern overlay

if (patternId) {
    var desc225 = new ActionDescriptor();
    var ref107 = new ActionReference();
    ref107.putProperty(idPrpr, idLefx);
    ref107.putEnumerated(idLyr, idOrdn, idTrgt);
    desc225.putReference(idnull, ref107);
    var idpatternFill = stringIDToTypeID("patternFill");
    var desc227 = new ActionDescriptor();
    desc227.putBoolean(idenab, true);
    desc227.putBoolean(idpresent, true);
    desc227.putBoolean(idshowInDialog, true);
    desc227.putEnumerated(idMd, idBlnM, patternBlend);
    desc227.putUnitDouble(idOpct, idPrc, 99.000000);
    var idPtrn = charIDToTypeID("Ptrn");
    var desc228 = new ActionDescriptor();
    var idNm = charIDToTypeID("Nm  ");
    desc228.putString(idNm, "$$$/Presets/Patterns/" + patternPath);
    var idIdnt = charIDToTypeID("Idnt");
    desc228.putString(idIdnt, patternId);
    var idPtrn = charIDToTypeID("Ptrn");
    desc227.putObject(idPtrn, idPtrn, desc228);
    desc227.putUnitDouble(idScl, idPrc, patternScale);
    var idAlgn = charIDToTypeID("Algn");
    desc227.putBoolean(idAlgn, true);
    var idphase = stringIDToTypeID("phase");
    var desc229 = new ActionDescriptor();
    var idHrzn = charIDToTypeID("Hrzn");
    desc229.putDouble(idHrzn, 0.000000);
    var idVrtc = charIDToTypeID("Vrtc");
    desc229.putDouble(idVrtc, 0.000000);
    var idPnt = charIDToTypeID("Pnt ");
    desc227.putObject(idphase, idPnt, desc229);
    var idpatternFill = stringIDToTypeID("patternFill");

    desc15.putObject(idpatternFill, idpatternFill, desc227);
}

if (desc14) {
    desc14.putObject(idT, idLefx, desc15);
    executeAction(idsetd, desc14, DialogModes.NO);
}

    var topLayerName = app.activeDocument.layers[0].name;
    // var Name = topLayerName;
    // var Name = decodeURI(app.activeDocument.name).replace(/\.[^\.]+$/, "");
    var Name = rowStrength + "-" + rowLang + "-" + rowProfit;
    var saveFile = File(Path + "/" + Name + ".png");
    sfwPNG24(saveFile);
    //Uncomment the line below if you want to close the document.  
    //app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);  
}

// save the images
function sfwPNG24(saveFile) {
    var pngOpts = new PNGSaveOptions;
    pngOpts.compression = 9;
    pngOpts.interlaced = false;
    // activeDocument.saveAs(saveFile, pngOpts, true, Extension.LOWERCASE);   
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