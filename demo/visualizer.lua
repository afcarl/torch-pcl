local pcl = require 'pcl'

v = pcl.PCLVisualizer('demo', true)
v:addCoordinateSystem()

v:addCube(-2, -1, -2, -1, -1, 1, 0.5, 0.7, 01)
v:addText1('Hi, this is a little PCLVisualizer demo! :-)', 10, 30, 'greetings')
x = v:addPlane_Coefficients({0,0,10,30}, 0, 0, 0)
print(x)

v:addSphere(pcl.PointXYZ(3,3,3), 0.75, 0.1, 0.8, 0.3, 'sphere1')

v:addLine(pcl.PointXYZ(-5,-1,0), pcl.PointXYZ(5, 1, 0), 1, 1, 1, 'line1')

c = pcl.rand(1000)   -- create 1000 random points
v:addPointCloud(c)

function onMouseEvent(type, button, x, y, alt, ctrl, shift, selection_mode)
  print(string.format('mouse event! type: %d, x: %d, y: %d, button: %d', type, x, y, button))
end

function onKeyboardEvent(keydown, key_sym, key_code, alt, ctrl, shift)
  print('keyboard event!')
end

-- press shift + left mouse button for point picking
function onPointPickingEvent(idx1, idx2, x1, y1, z1, x2, y2, z2)
  print(string.format('point picking event! idx1: %d, idx2: %d, (%f, %f, %f) (%f, %f, %f)', idx1, idx2, x1, y1, z1, x2, y2, z2))
end

-- pres x to activa area selection
function onAreaPickingEvent(indices)
  print(string.format('area picking event! %d points selected', #indices))
end

h1 = v:registerKeyboardCallback(onKeyboardEvent)
h2 = v:registerMouseCallback(onMouseEvent)
h3 = v:registerPointPickingCallback(onPointPickingEvent)
h4 = v:registerAreaPickingCallback(onAreaPickingEvent)

v:spin()  -- run msg loop

h1:disconnect()
h2:disconnect()
h3:disconnect()
h4:disconnect()

