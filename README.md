# FirePlace_Builder
OpenSCAD project to parametrically build a fireplace mantel and visualize it in a room.  Useful when planning a fireplace install or makeover.

## Background
Ordered a gas fireplace for living room, now we have to figure out what to build around it. After a lot of back and forth on features, size and placement in the room it was clear that talking wasn't working. We needed a visualization. First, tried it in Blender but everytime there was a change it required some effort and time to adjust the model which was frustrating my wife. We needed a parametric model that could be adjusted easily and the results could be seen instantly. Using OpenSCAD as the modeling platform the FirePlace Builder was born.

## Commercial Use
If you want to use this for a commercial web site I have, in my past job, built WebGL based visualization.  I can recreate this as a WebGL app and even add textures. Drop an issue if you would like to talk about that.

## Fireplace Styles
The varity of fireplace configurations that can be modeled is impressive. There are some examples in the json file that is read in by the OpenSCAD customizer.  From flush to the wall clad in just tile to just a beam mantel over the firebox they are all in there.

## Future
I would love to recreate this in Blender and use Cycles to do some architectural renderings.  I have a library of molding profiles in another repo I want to add the ability to extrude the mouldings for the mantel which I did for a remodel of the room the fireplace is going in now. I could also add in a catalog of existing gas fireplace units so selection would be easier.  The Window placement isn't flexible so that should be fixed and the windows aren't windows.

### View of the UI
<img src="/assets/UI.png?raw=true" alt="drawing" width="100%"/>

## Customization
The Fireplace Builder has a menu of adjsutments that can made to the model. 

### The customization menu, as you can see, is extensive
<img src="/assets/Fireplace_customization.png?raw=true" alt="drawing" width="300"/>

Here are some images that will give you some clues to what the knobs are in the customization menu

### Fireplace Front Dimensions
<img src="/assets/Fireplace Diagrams-Fireplace Dimensions.png?raw=true" alt="drawing" width="100%"/>

### Fireplace Side Dimensions
<img src="/assets/Fireplace Diagrams-Mantel Side View Dimensions.png?raw=true" alt="drawing" width="300"/>

### Room Dimensions
<img src="/assets/Fireplace Diagrams-Room Dimensions.png?raw=true" alt="drawing" width="100%"/>







