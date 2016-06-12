#### import the simple module from the paraview
from paraview.simple import *

# delete all sources
for s in GetSources().values():
    Delete(s)

#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cone'
cone1 = Cone()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [374, 526]

# show data in view
cone1Display = Show(cone1, renderView1)
# trace defaults for the display properties.
cone1Display.ColorArrayName = [None, '']
cone1Display.GlyphType = 'Arrow'
cone1Display.SetScaleArray = [None, '']
cone1Display.ScaleTransferFunction = 'PiecewiseFunction'
cone1Display.OpacityArray = [None, '']
cone1Display.OpacityTransferFunction = 'PiecewiseFunction'

# reset view to fit data
renderView1.ResetCamera()

# change solid color
cone1Display.DiffuseColor = [0.0, 0.0, 1.0]

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [0.0, 0.0, 4.43037269925063]
renderView1.CameraParallelScale = 1.166139459349895

#### uncomment the following to render all views
RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).