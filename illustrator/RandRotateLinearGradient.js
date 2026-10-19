aDoc = app.activeDocument;
aSel = aDoc.selection;
nSel = aSel.length;

for(i=0; i<nSel; i++)
{
    cObj = aSel[i];
    if(cObj.typename == "PathItem" || cObj.typename == "CompoundPathItem")      
    {
        checkPath = cObj;
        if(cObj.typename == "CompoundPathItem")
            checkPath = cObj.pathItems[0];
        if(checkPath.filled == true && checkPath.fillColor.typename == "GradientColor")
        {
            if(checkPath.fillColor.gradient.type == GradientType.LINEAR)
            {
                cObj.rotate(Math.random() * 360, 0,0,1,0);
            }
        }
    }
}