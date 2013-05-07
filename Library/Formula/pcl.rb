require 'formula'

class Pcl < Formula
  url 'http://sourceforge.net/projects/pointclouds/files/1.6.0/PCL-1.6.0-Source.tar.bz2'
  homepage 'http://www.pointclouds.org/'
  sha1 '45a2e155d7faf5901abe609fd40d5f1659015e9e'
  head 'https://github.com/PointCloudLibrary/pcl.git'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'eigen'
  depends_on 'flann'
  depends_on 'cminpack'
  depends_on 'vtk'
  depends_on 'qhull'
  depends_on 'libusb'

  depends_on 'doxygen' if build.include? 'doc'
  depends_on 'sphinx' if build.include? 'doc'

  option 'apps', "Build apps"
  option 'doc', "Build documentation"
  option 'nofeatures', "Disable features module"
  option 'nofilters', "Disable filters module"
  option 'noio', "Disable io module"
  option 'nokdtree', "Disable kdtree module"
  option 'nokeypoints', "Disable keypoints module"
  option 'nooctree', "Disable octree module"
  option 'noproctor', "Disable proctor module"
  option 'nopython', "Disable Python bindings"
  option 'norangeimage', "Disable range image module"
  option 'noregistration', "Disable registration module"
  option 'nosac', "Disable sample consensus module"
  option 'nosearch', "Disable search module"
  option 'nosegmentation', "Disable segmentation module"
  option 'nosurface', "Disable surface module"
  option 'notools', "Disable tools module"
  option 'notracking', "Disable tracking module"
  option 'novis', "Disable visualisation module"

  def install
    args = std_cmake_args #.split

    if build.include? 'noapps'
      args << "-DBUILD_apps:BOOL=OFF"
    end
    if build.include? 'doc'
      args << "-DBUILD_documentation:BOOL=ON"
    else
      args << "-DBUILD_documentation:BOOL=OFF"
    end
    if build.include? 'nofeatures'
      args << "-DBUILD_features:BOOL=OFF"
    end
    if build.include? 'nofilters'
      args << "-DBUILD_filters:BOOL=OFF"
    end
    if build.include? 'noio'
      args << "-DBUILD_io:BOOL=OFF"
    end
    if build.include? 'nokdtree'
      args << "-DBUILD_kdtree:BOOL=OFF"
    end
    if build.include? 'nokeypoints'
      args << "-DBUILD_keypoints:BOOL=OFF"
    end
    if build.include? 'nooctree'
      args << "-DBUILD_octree:BOOL=OFF"
    end
    if build.include? 'noproctor'
      args << "-DBUILD_proctor:BOOL=OFF"
    end
    if build.include? 'nopython'
      args << "-DBUILD_python:BOOL=OFF"
    end
    if build.include? 'norangeimage'
      args << "-DBUILD_rangeimage:BOOL=OFF"
    end
    if build.include? 'noregistration'
      args << "-DBUILD_registration:BOOL=OFF"
    end
    if build.include? 'nosac'
      args << "-DBUILD_sac:BOOL=OFF"
    end
    if build.include? 'nosearch'
      args << "-DBUILD_search:BOOL=OFF"
    end
    if build.include? 'nosegmentation'
      args << "-DBUILD_segmentation:BOOL=OFF"
    end
    if build.include? 'nosurface'
      args << "-DBUILD_surface:BOOL=OFF"
    end
    if build.include? 'notools'
      args << "-DBUILD_tools:BOOL=OFF"
    end
    if build.include? 'notracking'
      args << "-DBUILD_tracking:BOOL=OFF"
    end
    if build.include? 'novis'
      args << "-DBUILD_visualization:BOOL=OFF"
    end

    system "mkdir build"
    args << ".."
    Dir.chdir 'build' do
      system "cmake", *args
      system "make install"
    end
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test pcl`. Remove this comment before submitting
    # your pull request!
    #system "false"
    system "bash -c 'echo ply end_header | pcl_plyheader'"

  end
end
