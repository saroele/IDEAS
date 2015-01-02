within IDEAS.Utilities.Math.Examples;
model SmoothLimit "Test model for smooth limit"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(freqHz=8)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  IDEAS.Utilities.Math.SmoothLimit smoLim(
    deltaX=0.001,
    upper=0.5,
    lower=0) "Smooth limit"
             annotation (Placement(transformation(extent={{0,0},{20,20}})));
equation

  connect(sine.y, smoLim.u)      annotation (Line(
      points={{-19,10},{-2,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(experiment(StopTime=1.0),
__Dymola_Commands(file="modelica://IDEAS/Resources/Scripts/Dymola/Utilities/Math/Examples/SmoothLimit.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This model tests the implementation of
<a href=\"modelica://IDEAS.Utilities.Math.SmoothLimit\">
IDEAS.Utilities.Math.SmoothLimit</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
July 14, 2010, by Wangda Zuo, Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end SmoothLimit;
