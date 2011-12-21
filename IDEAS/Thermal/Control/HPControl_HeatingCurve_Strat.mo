within IDEAS.Thermal.Control;
model HPControl_HeatingCurve_Strat
  "Heating curve control for stratified storage tank"
  extends PartialHPControl;

 input Modelica.SIunits.Temperature TTankEmiOut
    "Tank temperature at outlet to emission";
 Modelica.SIunits.Temperature TTankEmiOutSet
    "Setpoint for the tank layer at outlet to emission";

equation
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  TTankEmiOutSet = heatingCurve.TSup + dTSafetyTop;
  THPSet = TTopSet + dTHPTankSet;

  if noEvent((TTankTop < TTopSet or TTankEmiOut < TTankEmiOutSet) and TTankBot < (TBotSet-dTSafetyBot)) then
    // top or emi-layer too cold, system MUST be on except if bottom is still very hot (temp inversion?)
    onOff = 1;
  elseif noEvent(TTankBot < TBotSet and onOff > 0.5) then
    // HP running, top is fine, bottom too cold: keep running
    onOff = 1;
  else
    // all other cases: shut down
    onOff = 0;
  end if;

  connect(heatingCurve.TSup, THeaCur) annotation (Line(
      points={{-33,60},{-8,60},{-8,-20},{106,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end HPControl_HeatingCurve_Strat;
