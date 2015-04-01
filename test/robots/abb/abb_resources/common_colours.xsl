<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Conversion were obtained from http://www.e-paint.co.uk/Lab_values.asp
       unless otherwise stated. -->

  <!-- Actual colors -->
  <!-- NCS 2070-Y60R orange, standard robot color 1974 - May 2014 -->
  <xsl:variable name="colour_abb_orange" select="'0.7372549 0.3490196 0.1607843 1'" />

  <!-- RAL 7035 light grey (abb graphite white), standard robot color May 2014 - current -->
  <xsl:variable name="colour_abb_graphite_white" select="'0.7725490 0.7803922 0.7686275 1'" />

  <!-- RAL 9003 signal white (abb white), cleanroom robot color -->
  <xsl:variable name="colour_abb_white" select="'0.9254902 0.9254902 0.9058824 1'" />

  <!-- RAL 7032 pebble gray, controller -->
  <xsl:variable name="colour_abb_pebble_gray" select="'0.7058823 0.6901961 0.6313725 1'" />

  <!-- RAL 7012 basalt gray (abb dark gray) , robot with dark link color -->
  <xsl:variable name="colour_abb_dark_gray" select="'0.3450980 0.3647059 0.3686275 1'" />

  <!-- Other robot colours availble, but not limited too. -->
  <!-- RAL 3001 signal red -->
  <xsl:variable name="colour_abb_signal_red" select="'0.5960784 0.1372549 0.1372549 1'" />

  <!-- RAL 3002 carmine red -->
  <xsl:variable name="colour_abb_carmine_red" select="'0.5960784 0.1333333 0.1333333 1'" />

  <!-- RAL 5002 ultramarine blue -->
  <xsl:variable name="colour_abb_ultramarine_blue" select="'0.1176471 0.2117647 0.4823529 1'" />

  <!-- RAL 5015 sky blue -->
  <xsl:variable name="colour_abb_sky_blue" select="'0.0431373 0.4823529 0.6901961 1'" />

  <!-- RAL 6002 leaf green -->
  <xsl:variable name="colour_abb_leaf_green" select="'0.1764706 0.3529412 0.1529412 1'" />

  <!-- RAL 9002 gray white -->
  <xsl:variable name="colour_abb_gray_white" select="'0.8392157 0.8352941 0.7921569 1'" />

  <!-- RAL 9010 pure white -->
  <xsl:variable name="colour_abb_pure_white" select="'0.9411765 0.9294118 0.8823529 1'" />

  <!-- approximations -->
  <!-- yellow, collision model -->
  <xsl:variable name="colour_abb_yellow" select="'1 1 0 1'" />
</xsl:stylesheet>