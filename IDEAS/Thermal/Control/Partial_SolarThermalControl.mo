within IDEAS.Thermal.Control;
partial model Partial_SolarThermalControl
  "Partial for a solar thermal controller"

  /* 
  This partial class contains the temperature control algorithm. It has to be extended
  in order to be complete controller.  
  

  */

  parameter Modelica.SIunits.TemperatureDifference dTStart=10
    "Nominal dT for starting the pump";
  parameter Modelica.SIunits.TemperatureDifference dTStop=3
    "Nominal dT for stopping the pump";
  Modelica.Blocks.Interfaces.RealInput TSafety "Temperature not to be exceeded"
    annotation (Placement(transformation(extent={{-126,40},{-86,80}})));
  Modelica.Blocks.Interfaces.RealInput TCollector
    "Collector output temperature"
    annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
  Modelica.Blocks.Interfaces.RealInput TTankBot
    "Bottom (or near bottom) tank temperature"
    annotation (Placement(transformation(extent={{-126,-80},{-86,-40}})));
  parameter Modelica.SIunits.Temperature TSafetyMax
    "Maximum temperature for TSafety";

  Modelica.Blocks.Interfaces.RealOutput onOff(start=0) "onoff signal as Real"
    annotation (Placement(transformation(extent={{96,10},{116,30}})));
initial equation
  //der(onOff) = 0;

equation

                                       annotation(Evaluate=false,
             Icon(Bitmap(extent=[-90,90; 90,-90], name="Control.tif")),
      Diagram(graphics));
end Partial_SolarThermalControl;