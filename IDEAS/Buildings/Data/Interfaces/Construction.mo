within IDEAS.Buildings.Data.Interfaces;
model Construction

  extends Modelica.Icons.MaterialProperty;

  parameter Integer nLay(min=1)
    "Number of layers of the construction, including gaps";
  parameter Integer locGain(min=1) = 1 "Location of possible embedded system";
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Insulation
    insulationType(final d=insulationTickness) constrainedby
    IDEAS.Buildings.Data.Interfaces.Insulation "Type of thermal insulation";
  parameter IDEAS.Buildings.Data.Interfaces.Material[nLay] mats
    "Array of materials";
  parameter Modelica.SIunits.Length insulationTickness=0
    "Thermal insulation thickness";

  annotation (Documentation(info="<html>
<h4><span style=\"color:#008000\">General description</span></h4>
<h5>Goal</h5>
<p>The <code>Construction.mo</code> partial describes the material data required for building construction modelling.</p>
<h4><span style=\"color:#008000\">Model use</span></h4>
<ul>
<li>The layers are built up from outside to inside (<a href=\"IDEAS.Buildings.Components.OuterWall\">outerwall</a>) or from port_b to port_a (<a href=\"IDEAS.Buildings.Components.InternalWall\">innerwall</a>)</li>
<li>Can be added directly by adding an <a href=\"IDEAS.Buildings.Data.Interfaces.Insulation\">insulation layer</a> as part of the layers or indirectly, by passing an insulationType, which can be completed in the wall itself.</li>
</ul>
<h4><span style=\"color:#008000\">Validation </span></h4>
<p>No validation required.</p>
</html>"));
end Construction;
