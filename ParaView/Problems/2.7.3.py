#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cylinder'
cylinder1 = Cylinder()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [374, 526]

# show data in view
cylinder1Display = Show(cylinder1, renderView1)
# trace defaults for the display properties.
cylinder1Display.ColorArrayName = [None, '']
cylinder1Display.GlyphType = 'Arrow'
cylinder1Display.SetScaleArray = [None, '']
cylinder1Display.ScaleTransferFunction = 'PiecewiseFunction'
cylinder1Display.OpacityArray = [None, '']
cylinder1Display.OpacityTransferFunction = 'PiecewiseFunction'

# reset view to fit data
renderView1.ResetCamera()

# change solid color
cylinder1Display.DiffuseColor = [0.0, 0.0, 1.0]

# create a new 'Sphere'
sphere1 = Sphere()

# show data in view
sphere1Display = Show(sphere1, renderView1)
# trace defaults for the display properties.
sphere1Display.ColorArrayName = [None, '']
sphere1Display.GlyphType = 'Arrow'
sphere1Display.SetScaleArray = [None, '']
sphere1Display.ScaleTransferFunction = 'PiecewiseFunction'
sphere1Display.OpacityArray = [None, '']
sphere1Display.OpacityTransferFunction = 'PiecewiseFunction'

# Properties modified on sphere1
sphere1.Center = [0.0, 1.0, 0.0]

# change solid color
sphere1Display.DiffuseColor = [1.0, 0.0, 0.0]

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [0.0, 0.0, 4.43037269925063]
renderView1.CameraParallelScale = 1.166139459349895

#### uncomment the following to render all views
RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).