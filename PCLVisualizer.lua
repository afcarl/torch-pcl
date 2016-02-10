local ffi = require 'ffi'
local torch = require 'torch'
local utils = require 'pcl.utils'
local pcl = require 'pcl.PointTypes'

local PCLVisualizer = torch.class('pcl.PCLVisualizer', pcl)

local func = {}
local func_by_type = {}

local function init()

  -- non template member functions
  local PCLVisualizer_method_names = {
    'new',
    'delete',
    'setFullScreen',
    'setWindowName',
    'setWindowBorders',
    'spin',
    'spinOnce',
    'addCoordinateSystem',
    'createViewPort',
    'createViewPortCamera',
    'setBackgroundColor',
    'removeAllPointClouds',
    'removeAllShapes',
    'removeAllCoordinateSystems',
    'addText1',
    'addText2',
    'addText3',
    'initCameraParameters',
    'setPointCloudRenderingProperties1',
    'setPointCloudRenderingProperties2',
    'wasStopped',
    'resetStoppedFlag',
    'close',
    'setShowFPS',
    'updateCamera',
    'resetCamera',
    'resetCameraViewpoint',
    'setCameraPosition',
    'setCameraClipDistances',
    'setCameraFieldOfView',
    'setCameraParameters_Tensor',
    'saveScreenshot',
    'saveCameraParameters',
    'loadCameraParameters',
    'getViewerPose',
    'addPlane_Coefficients',
    'addLine_Coefficients',
    'addSphere_Coefficients',
    'addCube_Coefficients',
    'addCylinder_Coefficients',
    'addCube',
    'setRepresentationToSurfaceForAllActors',
    'setRepresentationToPointsForAllActors',
    'setRepresentationToWireframeForAllActors',
    'registerKeyboardCallback',
    'registerMouseCallback',
    'registerPointPickingCallback',
    'registerAreaPickingCallback',
    'unregisterCallback',
    'deleteCallback'
  }

  func = utils.create_typed_methods("pcl_PCLVisualizer_", PCLVisualizer_method_names, '')
  
  -- create function table for template methods
  local PCLVisualizer_typed_method_names = {
    'addPointCloud',
    'addPointCloudWithColorHandler',
    'addPointCloudNormals',
    'addPointCloudNormals2',
    'updatePointCloud',
    'addLine',
    'addSphere',
    'updateSphere',
    'createColorHandlerRandom',
    'createColorHandlerCustom',
    'createColorHandlerGenericField',
    'deleteColorHandler'
  }
  for k,v in pairs(utils.type_key_map) do
    func_by_type[k] = utils.create_typed_methods("pcl_PCLVisualizer_TYPE_KEY_", PCLVisualizer_typed_method_names, v)
  end
end

pcl.RenderingProperties = {
  PCL_VISUALIZER_POINT_SIZE = 0,
  PCL_VISUALIZER_OPACITY = 1,
  PCL_VISUALIZER_LINE_WIDTH = 2,
  PCL_VISUALIZER_FONT_SIZE = 3,
  PCL_VISUALIZER_COLOR = 4,
  PCL_VISUALIZER_REPRESENTATION = 5,
  PCL_VISUALIZER_IMMEDIATE_RENDERING = 6,
  PCL_VISUALIZER_SHADING = 7
}

pcl.MouseEventType = {
  Move = 1,
  ButtonPress = 2,
  ButtonRelease = 3,
  ScrollDown = 4,
  ScrollUp = 5,
  DblClick = 6
}

pcl.MouseButton = {
  NoButton = 0,
  LeftButton = 1,
  MiddleButton = 2,
  RightButton = 3,
  VScroll = 4   --other buttons, scroll wheels etc. may follow
}

init()

function PCLVisualizer:__init(name, create_interactor)
  rawset(self, 'f', func)
  rawset(self, 'tf', func_by_type)  -- template functions
  self.o = self.f.new(name or '', create_interactor or true)
end

function PCLVisualizer:setFullScreen(mode)
  self.f.setFullScreen(self.o, mode)
end

function PCLVisualizer:setWindowName(name)
  self.f.setWindowName(self.o, name)
end

function PCLVisualizer:setWindowBorders(mode)
  self.f.setWindowBorders(self.o, mode)
end

function PCLVisualizer:spin()
  self.f.spin(self.o)
end

function PCLVisualizer:spinOnce(time, force_redraw)
  self.f.spinOnce(self.o, time or 1, force_redraw or false)
end

function PCLVisualizer:addCoordinateSystem(scale, id, viewport)
  self.f.addCoordinateSystem(self.o, scale or 1, id or 'reference', viewport or 0)
end

function PCLVisualizer:createViewPort(xmin, ymin, xmax, ymax)
  return self.f.createViewPort(self.o, xmin, ymin, xmax, ymax)
end

function PCLVisualizer:createViewPortCamera(viewport)
  self.f.createViewPortCamera(self.o, viewport)
end

function PCLVisualizer:setBackgroundColor(r, g, b, viewport)
  self.f.setBackgroundColor(self.o, r, g, b, viewport or 0)
end

function PCLVisualizer:removeAllPointClouds(viewport)
  return self.f.removeAllPointClouds(self.o, viewport or 0)
end

function PCLVisualizer:removeAllShapes(viewport)
  return self.f.removeAllShapes(self.o, viewport or 0)
end

function PCLVisualizer:removeAllCoordinateSystems(viewport)
  return self.f.removeAllCoordinateSystems(self.o, viewport or 0)
end

function PCLVisualizer:addText1(text, xpos, ypos, id, viewport)
  return self.f.addText1(self.o, text, xpos, ypos, id or '', viewport or 0)
end

function PCLVisualizer:addText2(text, xpos, ypos, r, g, b, id, viewport)
  return self.f.addText2(self.o, text, xpos, ypos, r, g, b, id or '', viewport or 0)
end

function PCLVisualizer:addText3(text, xpos, ypos, r, g, b, fontsize, id, viewport)
  return self.f.addText3(self.o, text, xpos, ypos, fontsize, r, g, b, id, viewport)
end

function PCLVisualizer:initCameraParameters()
  self.f.initCameraParameters(self.o)
end

function PCLVisualizer:setPointCloudRenderingProperties1(property, value, id, viewport)
  return self.f.setPointCloudRenderingProperties1(self.o, property, value, id or 'cloud', viewport or 0)
end

function PCLVisualizer:setPointCloudRenderingProperties2(property, val1, val2, val3, id, viewport)
  return self.f.setPointCloudRenderingProperties2(self.o, property, val1, val2, val3, id or 'cloud', viewport or 0)
end

function PCLVisualizer:wasStopped()
  return self.f.wasStopped(self.o)
end

function PCLVisualizer:resetStoppedFlag()
  self.f.resetStoppedFlag(self.o)
end

function PCLVisualizer:close()
  self.f.close(self.o)
end

function PCLVisualizer:setShowFPS(show_fps)
  self.f.setShowFPS(self.o, show_fps)
end

function PCLVisualizer:updateCamera()
  self.f.updateCamera(self.o)
end

function PCLVisualizer:resetCamera()
  self.f.resetCamera(self.o)
end

function PCLVisualizer:resetCameraViewpoint(id)
  self.f.resetCameraViewpoint(self.o, id or 'cloud')
end

function PCLVisualizer:setCameraPosition(pos_x, pos_y, pos_z, view_x, view_y, view_z, up_x, up_y, up_z, viewport)
  self.f.setCameraPosition(self.o, pos_x, pos_y, pos_z, view_x, view_y, view_z, up_x, up_y, up_z, viewport or 0)
end

function PCLVisualizer:setCameraClipDistances(near, far, viewport)
  self.f.setCameraClipDistances(self.o, near, far, viewport or 0)
end

function PCLVisualizer:setCameraFieldOfView(fovy, viewport)
  self.f.setCameraFieldOfView(self.o, fovy, viewport or 0)
end

function PCLVisualizer:setCameraParameters_Tensor(intrinsics, extrinsics, viewport)
  self.f.setCameraParameters_Tensor(self.o, intrinsics:cdata(), extrinsics:cdata(), viewport or 0)
end

function PCLVisualizer:saveScreenshot(fn)
  self.f.saveScreenshot(self.o, fn)
end

function PCLVisualizer:saveCameraParameters(fn)
  self.f.saveCameraParameters(self.o, fn)
end

function PCLVisualizer:loadCameraParameters(fn)
  self.f.loadCameraParameters(self.o, fn)
end

function PCLVisualizer:getViewerPose(viewport, result)
  result = result or torch.FloatTensor()
  self.f.getViewerPose(self.o, viewport or 0, result:cdata())
  return result
end

local function ensureTensor(x)
  return torch.isTensor(x) and x or torch.FloatTensor(x)
end

function PCLVisualizer:addPlane_Coefficients(coefficients, x, y, z, id, viewport)
  coefficients = ensureTensor(coefficients)
  return self.f.addPlane_Coefficients(self.o, coefficients:cdata(), x or 0, y or 0, z or 0, id or 'plane', viewport or 0)
end

function PCLVisualizer:addLine_Coefficients(coefficients, id, viewport)
  coefficients = ensureTensor(coefficients)
  return self.f.addLine_Coefficients(self.o, coefficients:cdata(), id or 'line', viewport or 0)
end

function PCLVisualizer:addSphere_Coefficients(coefficients, id, viewport)
  coefficients = ensureTensor(coefficients)
  return self.f.addSphere_Coefficients(self.o, coefficients:cdata(), id or 'sphere', viewport or 0)
end

function PCLVisualizer:addCube_Coefficients(coefficients, id, viewport)
  coefficients = ensureTensor(coefficients)
  return self.f.addCube_Coefficients(self.o, coefficients:cdata(), id or 'cube', viewport or 0)
end

function PCLVisualizer:addCylinder_Coefficients(coefficients, id, viewport)
  coefficients = ensureTensor(coefficients)
  return self.f.addCylinder_Coefficients(self.o, coefficients:cdata(), id or 'cylinder', viewport or 0)
end

function PCLVisualizer:addCube(x_min, x_max, y_min, y_max, z_min, z_max, r, g, b, id, viewport)
  return self.f.addCube(self.o, x_min, x_max, y_min, y_max, z_min, z_max, r or 0.5, g or 0.5, b or 0.5, id or 'cube', viewport or 0)
end

function PCLVisualizer:setRepresentationToSurfaceForAllActors()
  self.f.setRepresentationToSurfaceForAllActors(self.o)
end

function PCLVisualizer:setRepresentationToPointsForAllActors()
  self.f.setRepresentationToPointsForAllActors(self.o)
end

function PCLVisualizer:setRepresentationToWireframeForAllActors()
  self.f.setRepresentationToWireframeForAllActors(self.o)
end

function PCLVisualizer:addPointCloud(cloud, id, viewport)
  self.tf[cloud.pointType].addPointCloud(self.o, cloud:cdata(), id or 'cloud', viewport or 0)
end

function PCLVisualizer:addPointCloudWithColorHandler(cloud, color_handler, id, viewport)
  self.tf[cloud.pointType].addPointCloudWithColorHandler(self.o, cloud:cdata(), color_handler, id or 'cloud', viewport or 0)
end

function PCLVisualizer:addPointCloudNormals(cloud, level, scale, id, viewport)
  return self.tf[cloud.pointType].addPointCloudNormals(self.o, cloud:cdata(), level or 100, scale or 0.02, id or 'cloud', viewport or 0)
end

function PCLVisualizer:addPointCloudNormals2(cloud, normals, level, scale, id, viewport)
  return self.tf[cloud.pointType].addPointCloudNormals2(self.o, cloud:cdata(), normals:cdata(), level or 100, scale or 0.02, id or 'cloud', viewport or 0)
end

function PCLVisualizer:updatePointCloud(cloud, id)
  return self.tf[cloud.pointType].updatePointCloud(self.o, cloud:cdata(), id)
end

function PCLVisualizer:addLine(pt1, pt2, r, g, b, id, viewport)
  return self.tf[pt1.type].addLine(self.o, pt1, pt2, r or 0.5, g or 0.5, b or 0.5, id or 'line', viewport or 0) 
end

function PCLVisualizer:addSphere(center, radius, r, g, b, id, viewport)
  return self.tf[center.type].addSphere(self.o, center, radius, r or 0.5, g or 0.5, b or 0.5, id or 'sphere', viewport or 0)
end

function PCLVisualizer:updateSphere(center, radius, r, g, b, id)
  return self.tf[center.type].updateSphere(self.o, center, radius, r or 0.5, g or 0.5, b or 0.5, id or 'sphere')
end

function PCLVisualizer:createColorHandlerRandom(pointType)
  pointType = pcl.pointType(pointType)
  local h = self.tf[pointType].createColorHandlerRandom()
  ffi.gc(h, self.tf[pointType].deleteColorHandler)
  return h
end

function PCLVisualizer:createColorHandlerCustom(pointType, r, g, b)
  pointType = pcl.pointType(pointType)
  local h = self.tf[pointType].createColorHandlerCustom(r, g, b)
  ffi.gc(h, self.tf[pointType].deleteColorHandler)
  return h
end

function PCLVisualizer:createColorHandlerGenericField(pointType, field_name)
  pointType = pcl.pointType(pointType)
  local h = self.tf[pointType].createColorHandlerGenericField(field_name)
  ffi.gc(h, self.tf[pointType].deleteColorHandler)
  return h
end

local function createEventHandle(connection, cb, f)
  local unregister = f.unregisterCallback
  local handle = {
    connection = connection,
    cb = cb
  }
  function handle:disconnect()
    unregister(self.connection)
    self.cb:free()
  end
  ffi.gc(connection, f.deleteCallback)
  return handle
end

function PCLVisualizer:registerKeyboardCallback(fn)
  local cb = ffi.cast("KeyboardEventCallback", fn)
  local connection = self.f.registerKeyboardCallback(self.o, cb)
  return createEventHandle(connection, cb, self.f)
end

function PCLVisualizer:registerMouseCallback(fn)
  local cb = ffi.cast("MouseEventCallback", fn)
  local connection = self.f.registerMouseCallback(self.o, cb)
  return createEventHandle(connection, cb, self.f)
end

function PCLVisualizer:registerPointPickingCallback(fn)
  local cb = ffi.cast("PointPickingCallback", fn)
  local connection = self.f.registerPointPickingCallback(self.o, cb)
  return createEventHandle(connection, cb, self.f)
end

function PCLVisualizer:registerAreaPickingCallback(fn)
  local function IndicesWrapper(indices_ptr)
    fn(pcl.Indices.fromPtr(indices_ptr))
  end
  local cb = ffi.cast("AreaPickingCallback", IndicesWrapper)
  local connection = self.f.registerAreaPickingCallback(self.o, cb)
  return createEventHandle(connection, cb, self.f)
end
    