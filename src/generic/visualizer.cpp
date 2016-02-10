#include <pcl/visualization/pcl_visualizer.h>

#define PCLVisualizer_ptr pcl::visualization::PCLVisualizer::Ptr
#define PointCloud_ptr pcl::PointCloud<_PointT>::Ptr
#define PointCloudColorHandler_ptr pcl::visualization::PointCloudColorHandler<_PointT>::Ptr

PCLIMP(bool, PCLVisualizer, addPointCloud)(PCLVisualizer_ptr *self, PointCloud_ptr *cloud, const char *id = "cloud", int viewport = 0)
{
  (*self)->addPointCloud<_PointT>(*cloud, id, viewport);
}

PCLIMP(bool, PCLVisualizer, addPointCloudWithColorHandler)(PCLVisualizer_ptr *self, PointCloud_ptr *cloud, PointCloudColorHandler_ptr *color_handler, const char *id = "cloud", int viewport = 0)
{
  printf("%s\n", (*color_handler)->getName().c_str());
  return (*self)->addPointCloud<_PointT>(*cloud, **color_handler, id, viewport);
}

#ifdef _PointT_HAS_NORMALS

PCLIMP(bool, PCLVisualizer, addPointCloudNormals)(PCLVisualizer_ptr *self, PointCloud_ptr *cloud, int level = 100, float scale = 0.02f, const char *id = "cloud", int viewport = 0)
{
  return (*self)->addPointCloudNormals<_PointT>(*cloud, level, scale, id, viewport);
}

#endif

PCLIMP(bool, PCLVisualizer, addPointCloudNormals2)(PCLVisualizer_ptr *self, PointCloud_ptr *cloud, Normals_ptr *normals, int level = 100, float scale = 0.02f, const char *id = "cloud", int viewport = 0)
{
  return (*self)->addPointCloudNormals<_PointT, pcl::Normal>(*cloud, *normals, level, scale, id, viewport);
}

PCLIMP(bool, PCLVisualizer, updatePointCloud)(PCLVisualizer_ptr *self, PointCloud_ptr *cloud, const char *id)
{
  return (*self)->updatePointCloud<_PointT>(*cloud, id);
}

PCLIMP(bool, PCLVisualizer, addLine)(PCLVisualizer_ptr *self, const _PointT &pt1, const _PointT &pt2, 
  double r, double g, double b, const char *id = "line", int viewport = 0)
{
  (*self)->addLine(pt1, pt2, r, g, b, id, viewport);
}
                 
PCLIMP(bool, PCLVisualizer, addSphere)(PCLVisualizer_ptr *self, const _PointT &center, double radius, double r, double g, double b,
  const char *id = "sphere", int viewport = 0)
{
  (*self)->addSphere(center, radius, r, g, b, id, viewport);
}

PCLIMP(bool, PCLVisualizer, updateSphere)(PCLVisualizer_ptr *self, const _PointT &center, double radius, double r, double g, double b, 
  const char *id = "sphere")
{
  (*self)->updateSphere(center, radius, r, g, b, id);
}

// PointCloud color handler factories
PCLIMP(PointCloudColorHandler_ptr *, PCLVisualizer, createColorHandlerRandom)()
{
  return new PointCloudColorHandler_ptr(
    new pcl::visualization::PointCloudColorHandlerRandom<_PointT>()
  );
}

PCLIMP(PointCloudColorHandler_ptr *, PCLVisualizer, createColorHandlerCustom)(double r, double g, double b)
{
  return new PointCloudColorHandler_ptr(
    new pcl::visualization::PointCloudColorHandlerCustom<_PointT>(r, g, b)
  );
}

PCLIMP(PointCloudColorHandler_ptr *, PCLVisualizer, createColorHandlerGenericField)(const char *field_name)
{
  return new PointCloudColorHandler_ptr(
    new pcl::visualization::PointCloudColorHandlerGenericField<_PointT>(field_name)
  );
}

PCLIMP(void, PCLVisualizer, deleteColorHandler)(pcl::visualization::PointCloudColorHandler<_PointT>::Ptr *handler)
{
  delete handler;
}

#undef PCLVisualizer_ptr
#undef PointCloud_ptr
#undef PointCloudColorHandler_ptr
