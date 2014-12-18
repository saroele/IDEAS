within IDEAS.Fluid.Valves.Examples;
model CheckValve
  import IDEAS;
  extends Modelica.Icons.Example;
  package Medium = IDEAS.Media.Water.Simple
    annotation (__Dymola_choicesAllMatching=true);

  Sources.Boundary_pT bou(use_p_in=true,
    nPorts=2,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-90,6},{-70,26}})));
  Sources.Boundary_pT bou1(
    redeclare package Medium = Medium,
    use_p_in=false,
    nPorts=2,
    p=150000)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,18})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=0.01,
    amplitude=200000,
    offset=200000)
    annotation (Placement(transformation(extent={{-92,70},{-72,90}})));
  FixedResistances.FixedResistanceDpM res2(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=10000,
    linearized=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  IDEAS.Fluid.Valves.CheckValve checkValve(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=10000)
    annotation (Placement(transformation(extent={{-12,28},{8,48}})));
equation
  connect(sine.y, bou.p_in) annotation (Line(
      points={{-71,80},{-62,80},{-62,44},{-102,44},{-102,24},{-92,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bou.ports[1], res2.port_a) annotation (Line(
      points={{-70,18},{-58,18},{-58,0},{-10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(res2.port_b, bou1.ports[1]) annotation (Line(
      points={{10,0},{42,0},{42,16},{74,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[2], checkValve.port_a) annotation (Line(
      points={{-70,14},{-58,14},{-58,38},{-12,38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(checkValve.port_b, bou1.ports[2]) annotation (Line(
      points={{8,38},{42,38},{42,20},{74,20}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=150),
    __Dymola_experimentSetupOutput);
end CheckValve;
