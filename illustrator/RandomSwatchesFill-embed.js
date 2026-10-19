function swatchesFill(layer, palette) {
mySelection = layer.pageItems; // select everything
// alert(mySelection.length)	
selSwatches = doc.swatchGroups.getByName(palette).getAllSwatches();
// selSwatches = doc.swatches;

	if(selSwatches.length != 0)
		for (i=0; i<mySelection.length; i++)
		{
			if(mySelection[i].typename == "PathItem" || mySelection[i].typename == "CompoundPathItem")
			{
				selItem = mySelection[i];
				selItem.filled = true;
				swatchIndex = Math.round( Math.random() * (selSwatches.length - 1 ));
				
				if(selItem.typename == "PathItem")
					selItem.fillColor = selSwatches[swatchIndex].color;
				else
					selItem.pathItems[0].fillColor = selSwatches[swatchIndex].color;
				
			}
		}
	}