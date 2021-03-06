within IDEAS.Climate.Meteo.Solar.BaseClasses;
model solradExtraTerra

  extends Modelica.Blocks.Interfaces.BlockIcon;

  IDEAS.Climate.Meteo.Solar.BaseClasses.AngleDay angleDay;

  Modelica.Blocks.Interfaces.RealOutput sol
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
algorithm
  sol := 1366.1*(1 + 0.0033412*cos(angleDay.day));

  annotation (Icon(graphics));
end solradExtraTerra;
