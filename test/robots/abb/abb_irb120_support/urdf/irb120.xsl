<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:ros="http://wiki.ros.org/rosxslt"
>
<xsl:include href="rospkg:rosxslt/test/robots/abb/abb_resources/common_materials.xsl"/>
<xsl:param name="prefix" select="''"/>
<xsl:param name="variant" select="'irb120'"/>

<xsl:template name="abb_irb120" match="/">
  <robot name="{$variant}">
    <!-- link list -->
    <link name="{$prefix}base_link">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/base_link.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/base_link.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_1">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_1.stl"/>
        </geometry>
        <material name="abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_1.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_2">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_2.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_2.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_3">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_3.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_3.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_4">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_4.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_4.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_5">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_5.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_orange"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_5.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}link_6">
      <visual>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/visual/link_6.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_dark_gray"/>
      </visual>
      <collision>
        <origin xyz="0 0 0" rpy="0 0 0"/>
        <geometry>
          <mesh filename="package://abb_irb120_support/meshes/irb120/collision/link_6.stl"/>
        </geometry>
        <xsl:copy-of select="$material_abb_yellow"/>
      </collision>
    </link>
    <link name="{$prefix}tool0"/>
    <!-- end of link list -->

    <!-- joint list -->
    <joint name="{$prefix}joint_1" type="revolute">
      <origin rpy="0 0 0" xyz="0 0 0"/>
      <parent link="{$prefix}base_link"/>
      <child link="{$prefix}link_1"/>
      <limit effort="0" lower="-2.87979" upper="2.87979" velocity="4.36332"/>
      <axis xyz="0 0 1"/>
    </joint>
    <joint name="{$prefix}joint_2" type="revolute">
      <origin rpy="0 0 0" xyz="0 0 0.29"/>
      <parent link="{$prefix}link_1"/>
      <child link="{$prefix}link_2"/>
      <limit effort="0" lower="-1.91986" upper="1.91986" velocity="4.36332"/>
      <axis xyz="0 1 0"/>
    </joint>
    <joint name="{$prefix}joint_3" type="revolute">
      <origin rpy="0 0 0" xyz="0 0 0.27"/>
      <parent link="{$prefix}link_2"/>
      <child link="{$prefix}link_3"/>
      <limit effort="0" lower="-1.91986" upper="1.22173" velocity="4.36332"/>
      <axis xyz="0 1 0"/>
    </joint>
    <joint name="{$prefix}joint_4" type="revolute">
      <origin rpy="0 0 0" xyz="0 0 0.07"/>
      <parent link="{$prefix}link_3"/>
      <child link="{$prefix}link_4"/>
      <xsl:choose>
        <xsl:when test="$variant='irb120'">
          <limit effort="0" lower="-2.79253" upper="2.79253" velocity="5.58505"/>
        </xsl:when>
        <xsl:when test="$variant='irb120t'">
          <limit effort="0" lower="-2.79253" upper="2.79253" velocity="7.33038"/>
        </xsl:when>
      </xsl:choose>
      <axis xyz="1 0 0"/>
    </joint>
    <joint name="{$prefix}joint_5" type="revolute">
      <origin rpy="0 0 0" xyz="0.302 0 0"/>
      <parent link="{$prefix}link_4"/>
      <child link="{$prefix}link_5"/>
      <xsl:choose>
        <xsl:when test="$variant='irb120'">
          <limit effort="0" lower="-2.094395" upper="2.094395" velocity="5.58505"/>
        </xsl:when>
        <xsl:when test="$variant='irb120t'">
          <limit effort="0" lower="-2.094395" upper="2.094395" velocity="10.29744"/>
        </xsl:when>
      </xsl:choose>
      <axis xyz="0 1 0"/>
    </joint>
    <joint name="{$prefix}joint_6" type="revolute">
      <origin rpy="0 0 0" xyz="0.072 0 0"/>
      <parent link="{$prefix}link_5"/>
      <child link="{$prefix}link_6"/>
      <xsl:choose>
        <xsl:when test="$variant='irb120'">
          <limit effort="0" lower="-6.98132" upper="6.98132" velocity="7.33038"/>
        </xsl:when>
        <xsl:when test="$variant='irb120t'">
          <limit effort="0" lower="-6.98132" upper="6.98132" velocity="10.471975"/>
        </xsl:when>
      </xsl:choose>

      <axis xyz="1 0 0"/>
    </joint>
    <joint name="{$prefix}joint6-tool0" type="fixed">
      <parent link="{$prefix}link_6"/>
      <child link="{$prefix}tool0"/>
      <origin rpy="0 1.57079632679 0" xyz="0 0 0"/>
    </joint>
    <!-- end of joint list -->

    <!-- ROS base_link to ABB World Coordinates transform -->
    <link name="{$prefix}base" />
    <joint name="{$prefix}base_link-base" type="fixed">
      <origin xyz="0 0 0" rpy="0 0 0"/>
      <parent link="{$prefix}base_link"/>
      <child link="{$prefix}base"/>
    </joint>
  </robot>
</xsl:template>
</xsl:stylesheet>
