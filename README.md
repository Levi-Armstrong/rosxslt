# ROSXSLT

[ROS-Industrial][] ROSXSLT meta-package.

## Description

This is a [XSLT] (Extensible Stylesheet Language Transformation) wrapper for
ROS-Industrial as a new macro language capability.

## Usage

The XSLT is demonstrated on a ABB support package located in /test/robots. The
usage for rosxslt is below.

usage: rosxslt [-h] [-o OUTPUT] input [param [param ...]]

## Example

### Create URDF

Navigate to <path to rosxslt>/test/robots/abb_irb120_support/urdf,
then execute the code below.

rosrun rosxslt rosxslt -o irb120.urdf irb120.xsl variant:=irb_120

or

rosrun rosxslt rosxslt -o irb120t.urdf irb120.xsl variant:=irb_120t

### Used in launch file

Navigate to <path to rosxslt>/test/robots/abb_irb120_support/launch,
then execute the code below.

roslaunch test_irb120.launch

or

roslaunch test_irb120.launch

### How to use rospack commands

The example dimonstrating how to use rospack commands are found in
/test/rospack/urdf/test_rospack.xsl.

To test the file navigate to /test/rospack/urdf/ execute the command below.

rosrun rosxslt rosxslt test_rospack.xsl

[ROS-Industrial]: http://www.ros.org/wiki/Industrial
[XSLT]: http://www.w3schools.com/xsl/
