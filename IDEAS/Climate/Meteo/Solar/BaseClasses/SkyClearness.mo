within IDEAS.Climate.Meteo.Solar.BaseClasses;
block SkyClearness
  extends Modelica.Blocks.Interfaces.BlockIcon;
  Modelica.Blocks.Interfaces.RealInput angZen(
    quantity="Angle",
    unit="rad",
    displayUnit="degreeC") "zenith angle"
    annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealOutput skyCle "sky clearness"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  outer IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-80,72},{-60,92}})));

//  final parameter Real kappa=1.041 "original kappa of 1.014 but for degrees";
protected
  final parameter Real kappa = 5.534*10^(-6)
    "original kappa of 1.014 but for degrees";

  Real solDifHor "smoothed horizontal difuse radiation";
  Real angZenDeg = angZen*180/Modelica.Constants.pi;

equation
  solDifHor = IDEAS.Utilities.Math.Functions.smoothMax(
    sim.solDifHor,
    1e-4,
    1e-5);
  skyCle = IDEAS.Utilities.Math.Functions.spliceFunction(x=sim.solGloHor-1, pos=((sim.solGloHor)
    /solDifHor + kappa*angZenDeg^3)/(1 + kappa*angZenDeg^3), neg= 1, deltax=1);
  annotation (Diagram(graphics));
end SkyClearness;
