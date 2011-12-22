within IDEAS.Electric.DistributionGrid.Components;
model Con3PlusNTo3
  "Converts the 3 phases plus Neutrol to 3 phases representation to wich powers can be connected"

  IDEAS.Electric.BaseClasses.CPosPin
                  fourWire[4]
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  IDEAS.Electric.BaseClasses.CPosPin
                  threeWire[3]
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
/*if min(MCM.'abs'({(fourWire[i].v-fourWire[4].v) for i in 1:3}))<180 then
  for i in 1:3 loop
  0+MCM.j*0=threeWire[i].v;
  threeWire[i].i=0+MCM.j*0;

  end for;
    fourWire[4].i=0+MCM.j*0;
else*/
  for i in 1:3 loop
    fourWire[i].v-fourWire[4].v=threeWire[i].v;
    threeWire[i].i=-fourWire[i].i;
  end for;
  -fourWire[4].i=fourWire[1].i+fourWire[2].i+fourWire[3].i;
//end if;

  annotation (Icon(graphics={Line(
          points={{-80,30},{-20,30}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5), Line(
          points={{-80,10},{-20,10}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5),Line(
          points={{-80,-10},{-20,-10}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5), Line(
          points={{-80,-30},{-20,-30}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5), Line(
          points={{20,20},{80,20}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5), Line(
          points={{20,0},{80,0}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5), Line(
          points={{20,-20},{80,-20}},
          color={0,0,255},
          smooth=Smooth.None,thickness=0.5),
        Text(
          extent={{-58,-32},{-42,-42}},
          lineColor={0,0,255},
          textString="N"),
        Text(
          extent={{-60,20},{-44,10}},
          lineColor={0,0,255},
          textString="L2"),
        Text(
          extent={{-60,2},{-44,-8}},
          lineColor={0,0,255},
          textString="L3"),
        Text(
          extent={{44,30},{60,20}},
          lineColor={0,0,255},
          textString="P1"),
        Text(
          extent={{44,10},{60,0}},
          lineColor={0,0,255},
          textString="P2"),
        Text(
          extent={{44,-10},{60,-20}},
          lineColor={0,0,255},
          textString="P3"),
        Text(
          extent={{-60,40},{-44,30}},
          lineColor={0,0,255},
          textString="L1"),
        Text(
          extent={{-60,96},{60,36}},
          lineColor={0,0,255},
          textString="3 x L + N => 3 x P")}));
end Con3PlusNTo3;
