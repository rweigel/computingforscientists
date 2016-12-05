#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cone'
cone1 = Cone()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [401, 526]

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

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [0.0, 0.0, 3.2036135254332487]
renderView1.CameraFocalPoint = [0.0, 0.0, -1e-20]
renderView1.CameraParallelScale = 0.8291561935301535

#### uncomment the following to render all views
RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).