within IDEAS.Fluid.HeatExchangers.Examples;
model FanCoilUnit "Test of the FCU"

  extends Modelica.Icons.Example;
  package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater;
  Radiators.FanCoilUnit fanCoilUnit(
    redeclare package Medium = Medium,
    fraRad=0,
    dp_nominal=1200,
    TInNom=323.15,
    TOutNom=313.15,
    TZoneNom=293.15)
    annotation (Placement(transformation(extent={{-4,4},{16,24}})));
  Sources.FixedBoundary bou(nPorts=1,
    redeclare package Medium = Medium,
    p=352000,
    T=323.15)
    annotation (Placement(transformation(extent={{-72,4},{-52,24}})));
  Sources.FixedBoundary bou1(
                            nPorts=1,
    redeclare package Medium = Medium,
    p=350000,
    T=313.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={66,14})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15)
    annotation (Placement(transformation(extent={{-44,56},{-24,76}})));
  Modelica.Blocks.Sources.Sine TSet(
    amplitude=3,
    startTime=0,
    offset=273.15 + 20,
    freqHz=0.0005)
    annotation (Placement(transformation(extent={{-66,-44},{-46,-24}})));
equation
  connect(bou.ports[1], fanCoilUnit.port_a) annotation (Line(
      points={{-52,14},{-4,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou1.ports[1], fanCoilUnit.port_b) annotation (Line(
      points={{56,14},{16,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(fixedTemperature.port, fanCoilUnit.heatPortCon) annotation (Line(
      points={{-24,66},{11,66},{11,24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedTemperature.port, fanCoilUnit.heatPortRad) annotation (Line(
      points={{-24,66},{15,66},{15,24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TSet.y, fanCoilUnit.TSet) annotation (Line(
      points={{-45,-34},{-36,-34},{-36,-32},{-26,-32},{-26,10},{-4.6,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end FanCoilUnit;
